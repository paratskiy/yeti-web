# frozen_string_literal: true

workers 2
threads 2, 8

directory '/opt/yeti-web'
daemonize

bind 'unix:///run/yeti/yeti-unicorn.sock'

worker_timeout 1200

state_path '/run/yeti/yeti-web-puma.state'

stdout_redirect '/opt/yeti-web/log/puma.stdout.log', '/opt/yeti-web/log/puma.stderr.log', true

preload_app!

# Set the timeout for worker shutdown
worker_shutdown_timeout(120)

# Set Timestamp
log_formatter do |str|
  "[#{Process.pid}] #{Time.now}: #{str}"
end

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

  if Rails.configuration.yeti_web['prometheus']['enabled']
    require 'prometheus_exporter/client'
    require 'prometheus_exporter/instrumentation'
    PrometheusExporter::Instrumentation::Puma.start
  end
end

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
    SecondBase::Base.establish_connection
  end

  if Rails.configuration.yeti_web['prometheus']['enabled']
    require 'prometheus_exporter/instrumentation'
    PrometheusExporter::Instrumentation::Process.start(
      type: 'web',
      labels: Rails.configuration.yeti_web['prometheus']['default_labels']
    )
  end
end
