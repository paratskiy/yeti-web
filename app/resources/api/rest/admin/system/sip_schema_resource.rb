# frozen_string_literal: true

class Api::Rest::Admin::System::SipSchemaResource < JSONAPI::Resource
  immutable
  model_name 'System::SipSchema'
  attributes :name
  paginator :paged
  filter :name
end
