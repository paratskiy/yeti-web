# frozen_string_literal: true

workers ENV.fetch('WEB_CONCURRENCY') { 1 }

max_threads_count = ENV.fetch('RAILS_MAX_THREADS') { 8 }
min_threads_count = ENV.fetch('RAILS_MIN_THREADS') { 2 }
threads min_threads_count, max_threads_count

port ENV.fetch('PORT') { 3000 }

environment ENV.fetch('RAILS_ENV') { 'development' }

# directory '/opt/yeti-web'
# daemonize

# bind '/run/yeti/yeti-unicorn.sock'

worker_timeout 1200

# pidfile '/run/yeti/yeti-web-puma.pid'
# state_path '/run/yeti/yeti-web-puma.state'

# stdout_redirect '/opt/yeti-web/log/puma.stdout.log', '/opt/yeti-web/log/puma.stderr.log', true

preload_app!

before_fork do
  ActiveRecord::Base.connection.disconnect!
  Cdr::Base.connection.disconnect!

  require 'puma_worker_killer'

  PumaWorkerKiller.config do |config|
    config.ram           = 2048 # mb
    config.frequency     = 5    # seconds
    config.percent_usage = 0.98
    config.rolling_restart_frequency = 3 * 3600 # 12 hours in seconds, or 12.hours if using Rails
    config.reaper_status_logs = true # setting this to false will not log lines like:
    config.pre_term = ->(worker) { warn "Worker #{worker.inspect} being killed" }
  end
  PumaWorkerKiller.start

  if PrometheusConfig.enabled?
    require 'prometheus_exporter/client'
    require 'prometheus_exporter/instrumentation'
    require 'pgq_prometheus'
    require 'pgq_prometheus/processor'
    require 'pgq_prometheus/sql_caller/active_record'
    require 'prometheus/pgq_prometheus_config'
    require 'prometheus/yeti_processor'
    PgqPrometheus::Processor.tap do |processor|
      processor.sql_caller = PgqPrometheus::SqlCaller::ActiveRecord.new('Cdr::Base')
      processor.logger = Rails.logger
      processor.on_error = proc do |e|
        CaptureError.capture(e, tags: { component: 'Prometheus', processor_class: processor })
      end
      processor.before_collect = proc do
        processor.logger.info { "Collection metrics for #{processor}..." }
      end
      processor.after_collect = proc do
        processor.logger.info { "Metrics collected for #{processor}." }
      end
    end

    PrometheusExporter::Instrumentation::Puma.start
    PrometheusExporter::Instrumentation::Process.start(type: 'master')
    PgqPrometheus::Processor.start
    YetiProcessor.start
  end
end

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
    SecondBase::Base.establish_connection
  end

  if PrometheusConfig.enabled?
    require 'prometheus_exporter/instrumentation'
    PrometheusExporter::Instrumentation::Process.start(type: 'web')
  end
end
