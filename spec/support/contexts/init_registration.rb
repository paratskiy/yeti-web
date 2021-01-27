# frozen_string_literal: true

shared_context :init_registration do |args|
  args ||= {}

  before do
    fields = {
      name: 'Com-REG',
      enabled: false,
      pop_id: @pop.id,
      node_id: @node.id,
      domain: '172.12.11.1',
      username: '78978986555',
      display_username: '',
      auth_user: '68768987876786',
      contact: 'sip:8789789798@10.9.0.82:5060',
      auth_password: 'hjkhjhkl',
      force_expire: false
    }.merge(args)

    @registration = FactoryBot.create(:registration, fields)
  end
end
