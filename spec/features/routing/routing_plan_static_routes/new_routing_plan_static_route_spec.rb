# frozen_string_literal: true

RSpec.describe 'Create new Routing Plan Static Route', type: :feature, js: true do
  subject do
    aa_form.submit
  end

  active_admin_form_for Routing::RoutingPlanStaticRoute, 'new'
  include_context :login_as_admin

  let!(:vendor) { FactoryBot.create(:vendor) }
  let!(:routing_plan) { FactoryBot.create(:routing_plan, :with_static_routes) }
  before do
    FactoryBot.create(:vendor)
    FactoryBot.create(:routing_plan, :with_static_routes)
    FactoryBot.create(:routing_plan)

    visit new_static_route_path

    aa_form.select_chosen 'Vendor', vendor.name
    aa_form.search_chosen 'Routing plan', routing_plan.display_name, ajax: true
  end

  it 'creates record' do
    subject
    record = Routing::RoutingPlanStaticRoute.last
    expect(record).to be_present
    expect(record).to have_attributes(
      vendor_id: vendor.id,
      routing_plan_id: routing_plan.id,
      prefix: '',
      priority: 100,
      weight: 100,
      network_prefix_id: nil
    )
  end

  include_examples :changes_records_qty_of, Routing::RoutingPlanStaticRoute, by: 1
  include_examples :shows_flash_message, :notice, 'Routing plan static route was successfully created.'
end
