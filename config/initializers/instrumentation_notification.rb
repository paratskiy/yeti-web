# frozen_string_literal: true

module ActionController
  # Adds instrumentation to several ends in ActionController::Base. It also provides
  # some hooks related with process_action, this allows an ORM like Active Record
  # and/or DataMapper to plug in ActionController and show related information.
  #
  # Check ActiveRecord::Railties::ControllerRuntime for an example.
  module Instrumentation
    def append_info_to_raw_payload(raw_payload)
      # nothing
    end

    def process_action(*args)
      raw_payload = {
        controller: self.class.name,
        action: action_name,
        params: request.filtered_parameters,
        format: request.format.try(:ref),
        method: request.method,
        path: (begin
                      request.fullpath
               rescue StandardError
                 'unknown'
                    end)
      }
      append_info_to_raw_payload(raw_payload)

      ActiveSupport::Notifications.instrument('start_processing.action_controller', raw_payload.dup)

      ActiveSupport::Notifications.instrument('process_action.action_controller', raw_payload) do |payload|
        result = super
        payload[:status] = response.status
        append_info_to_payload(payload)
        result
      end
    end
  end
end

ActiveSupport::Notifications.subscribe 'process_action.action_controller' do |_name, start, finish, _id, payload|
  if payload[:path].start_with? '/api/'

    Log::ApiLog.create do |api_request|
      debug_mode = payload[:debug_mode]

      if payload[:status].nil? && payload[:exception].present?
        payload[:status] = ActionDispatch::ExceptionWrapper.status_code_for_exception(payload[:exception].class)
      end

      api_request.path = payload[:path].to_s.split('?').first
      api_request.page_duration = (finish - start) * 1000
      api_request.db_duration = payload[:db_runtime]
      api_request.method = payload[:method]
      api_request.status = payload[:status]
      api_request.controller = payload[:controller]
      api_request.action = payload[:action]
      api_request.params = payload[:params].to_yaml
      if debug_mode
        request_headers = payload[:request].headers.select { |key, _val| key.match('^HTTP.*') }
        api_request.request_headers = Hash[*request_headers.flatten(1)].map { |k, v| "#{k}=#{v}" }.join("\n\r")
        api_request.request_body = payload[:request].body.read
        api_request.response_body = payload[:response].try(:body)
        api_request.response_headers = (payload[:response].try(:headers) || {}).map { |k, v| "#{k}=#{v}" }.join("\n\r")
      end
    end
  end
end
