# frozen_string_literal: true

RSpec.describe 'Sip Options Probers index page', js: true do
  include_context :login_as_admin

  subject do
    visit sip_options_probers_path
  end

  before do
    stub_jrpc_request('options_prober.show.probers', nodes.first.rpc_endpoint, { logger: be_present })
      .and_return([record_attributes.first.stringify_keys])
    stub_jrpc_request('options_prober.show.probers', nodes.second.rpc_endpoint, { logger: be_present })
      .and_return([record_attributes.second.stringify_keys])
  end

  let!(:nodes) { create_list(:node, 2) }
  let(:record_attributes) do
    [
      FactoryBot.attributes_for(:sip_options_prober, :filled),
      FactoryBot.attributes_for(:sip_options_prober, :filled)
    ]
  end

  it 'returns correct Sip Options Probers' do
    subject

    expect(page).to have_table
    expect(page).to have_table_row count: nodes.size
    nodes.each { |node| expect(page).to have_link(node.name, href: node_path(node.id)) }
    record_attributes.each do |record_attribute|
      expect(page).to have_link(record_attribute[:name], href: equipment_sip_options_prober_path(record_attribute[:id]))
    end
    record_attributes.each { |record_attribute| expect(page).to have_table_cell column: 'Id', text: record_attribute[:id] }
  end
end
