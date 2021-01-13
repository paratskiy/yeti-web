RSpec.describe Api::Rest::Admin::CustomersAuthsController, type: :request do
  include_context :json_api_admin_helpers, type: :'customers-auths'

  describe 'GET /api/rest/admin/customers-auths' do
    subject do
      get json_api_request_path, params: request_params, headers: json_api_request_headers
    end

    let!(:customers_auths) do
      FactoryBot.create_list(:customers_auth, 2) # only Contact with customers_auth
    end
    let(:request_params) { nil }

    include_examples :returns_json_api_collection do
      let(:json_api_collection_ids) do
        customers_auths.map { |r| r.id.to_s }
      end
    end

    context 'with filter by customer.id' do
      let!(:customer) { create(:customer) }
      let!(:other_customer) { create(:customer) }
      let!(:customers_auths) { create_list(:customers_auth, 3, customer: customer) }
      before { create(:customers_auth, customer: other_customer) }

      let(:request_params) do
        { filter: { 'customer.id': customer.id } }
      end

      it 'returns filtered gateways by customer.id' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |r| r[:id] }
        expect(actual_ids).to match_array customers_auths.map(&:id).map(&:to_s)
      end
    end

    context 'with filter by rateplan.id' do
      let!(:rateplan) { create(:rateplan) }
      let!(:other_rateplan) { create(:rateplan) }
      let!(:customers_auths) { create_list(:customers_auth, 3, rateplan: rateplan) }
      before { create(:customers_auth, rateplan: other_rateplan) }

      let(:request_params) do
        { filter: { 'rateplan.id': rateplan.id } }
      end

      it 'returns filtered gateways by rateplan.id' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |r| r[:id] }
        expect(actual_ids).to match_array customers_auths.map(&:id).map(&:to_s)
      end
    end

    context 'with filter by routing_plan.id' do
      let!(:routing_plan) { create(:routing_plan) }
      let!(:other_routing_plan) { create(:routing_plan) }
      let!(:customers_auths) { create_list(:customers_auth, 3, routing_plan: routing_plan) }
      before { create(:customers_auth, routing_plan: other_routing_plan) }

      let(:request_params) do
        { filter: { 'routing_plan.id': routing_plan.id } }
      end

      it 'returns filtered gateways by routing_plan.id' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |r| r[:id] }
        expect(actual_ids).to match_array customers_auths.map(&:id).map(&:to_s)
      end
    end

    context 'with filter by gateway.id' do
      let!(:gateway) { create(:gateway) }
      let!(:other_gateway) { create(:gateway) }
      let!(:customers_auths) { create_list(:customers_auth, 3, gateway: gateway) }
      before { create(:customers_auth, gateway: other_gateway) }

      let(:request_params) do
        { filter: { 'gateway.id': gateway.id } }
      end

      it 'returns filtered gateways by gateway.id' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |r| r[:id] }
        expect(actual_ids).to match_array customers_auths.map(&:id).map(&:to_s)
      end
    end

    context 'with filter by account.id' do
      let!(:account) { create(:account) }
      let!(:other_account) { create(:account) }
      let!(:customers_auths) { create_list(:customers_auth, 3, account: account) }
      before { create(:customers_auth, account: other_account) }

      let(:request_params) do
        { filter: { 'account.id': account.id } }
      end

      it 'returns filtered gateways by account.id' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |r| r[:id] }
        expect(actual_ids).to match_array customers_auths.map(&:id).map(&:to_s)
      end
    end

    context 'with filter by dump_level.id' do
      let!(:dump_level) { DumpLevel.first }
      let!(:other_dump_level) { DumpLevel.second }
      let!(:customers_auths) { create_list(:customers_auth, 3, dump_level: dump_level) }
      before { create(:customers_auth, dump_level: other_dump_level) }

      let(:request_params) do
        { filter: { 'dump_level.id': dump_level.id } }
      end

      it 'returns filtered gateways by dump_level.id' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |r| r[:id] }
        expect(actual_ids).to match_array customers_auths.map(&:id).map(&:to_s)
      end
    end

    context 'with filter by diversion_policy.id' do
      let!(:diversion_policy) { DiversionPolicy.first }
      let!(:other_diversion_policy) { DiversionPolicy.create!(id: 2, name: 'Test') }
      let!(:customers_auths) { create_list(:customers_auth, 3, diversion_policy: diversion_policy) }
      before { create(:customers_auth, diversion_policy: other_diversion_policy) }

      let(:request_params) do
        { filter: { 'diversion_policy.id': diversion_policy.id } }
      end

      it 'returns filtered gateways by diversion_policy.id' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |r| r[:id] }
        expect(actual_ids).to match_array customers_auths.map(&:id).map(&:to_s)
      end
    end

    context 'with filter by pop.id' do
      let!(:pop) { create(:pop) }
      let!(:other_pop) { create(:pop) }
      let!(:customers_auths) { create_list(:customers_auth, 3, pop: pop) }
      before { create(:customers_auth, pop: other_pop) }

      let(:request_params) do
        { filter: { 'pop.id': pop.id } }
      end

      it 'returns filtered gateways by pop.id' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |r| r[:id] }
        expect(actual_ids).to match_array customers_auths.map(&:id).map(&:to_s)
      end
    end

    context 'with filter by dst_numberlist.id' do
      let!(:dst_numberlist) { Routing::Numberlist.first }
      let!(:other_dst_numberlist) { Routing::Numberlist.second }
      let!(:customers_auths) { create_list(:customers_auth, 3, dst_numberlist: dst_numberlist) }
      before { create(:customers_auth, dst_numberlist: other_dst_numberlist) }

      let(:request_params) do
        { filter: { 'dst_numberlist.id': dst_numberlist.id } }
      end

      it 'returns filtered gateways by dst_numberlist.id' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |r| r[:id] }
        expect(actual_ids).to match_array customers_auths.map(&:id).map(&:to_s)
      end
    end

    context 'with filter by src_numberlist.id' do
      let!(:src_numberlist) { Routing::Numberlist.first }
      let!(:other_src_numberlist) { Routing::Numberlist.second }
      let!(:customers_auths) { create_list(:customers_auth, 3, src_numberlist: src_numberlist) }
      before { create(:customers_auth, src_numberlist: other_src_numberlist) }

      let(:request_params) do
        { filter: { 'src_numberlist.id': src_numberlist.id } }
      end

      it 'returns filtered gateways by src_numberlist.id' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |r| r[:id] }
        expect(actual_ids).to match_array customers_auths.map(&:id).map(&:to_s)
      end
    end

    context 'with filter by tag_action.id' do
      let!(:tag_action) { Routing::TagAction.first }
      let!(:other_tag_action) { Routing::TagAction.second }
      let!(:customers_auths) { create_list(:customers_auth, 3, tag_action: tag_action) }
      before { create(:customers_auth, tag_action: other_tag_action, tag_action_value: [other_tag_action.id]) }

      let(:request_params) do
        { filter: { 'tag_action.id': tag_action.id } }
      end

      it 'returns filtered gateways by tag_action.id' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |r| r[:id] }
        expect(actual_ids).to match_array customers_auths.map(&:id).map(&:to_s)
      end
    end

    context 'with filter by radius_auth_profile.id' do
      let!(:radius_auth_profile) { Equipment::Radius::AuthProfile.first }
      let!(:other_radius_auth_profile) { Equipment::Radius::AuthProfile.second }
      let!(:customers_auths) { create_list(:customers_auth, 3, radius_auth_profile: radius_auth_profile) }
      before { create(:customers_auth, radius_auth_profile: other_radius_auth_profile) }

      let(:request_params) do
        { filter: { 'radius_auth_profile.id': radius_auth_profile.id } }
      end

      it 'returns filtered gateways by radius_auth_profile.id' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |r| r[:id] }
        expect(actual_ids).to match_array customers_auths.map(&:id).map(&:to_s)
      end
    end

    context 'with filter by radius_accounting_profile.id' do
      let!(:radius_accounting_profile) { Equipment::Radius::AccountingProfile.first }
      let!(:other_radius_accounting_profile) { Equipment::Radius::AccountingProfile.second }
      let!(:customers_auths) { create_list(:customers_auth, 3, radius_accounting_profile: radius_accounting_profile) }
      before { create(:customers_auth, radius_accounting_profile: other_radius_accounting_profile) }

      let(:request_params) do
        { filter: { 'radius_accounting_profile.id': radius_accounting_profile.id } }
      end

      it 'returns filtered gateways by radius_accounting_profile.id' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |r| r[:id] }
        expect(actual_ids).to match_array customers_auths.map(&:id).map(&:to_s)
      end
    end

    context 'with filter by transport_protocol.id' do
      let!(:transport_protocol) { Equipment::TransportProtocol.first }
      let!(:other_transport_protocol) { Equipment::TransportProtocol.second }
      let!(:customers_auths) { create_list(:customers_auth, 3, transport_protocol: transport_protocol) }
      before { create(:customers_auth, transport_protocol: other_transport_protocol) }

      let(:request_params) do
        { filter: { 'transport_protocol.id': transport_protocol.id } }
      end

      it 'returns filtered gateways by transport_protocol.id' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |r| r[:id] }
        expect(actual_ids).to match_array customers_auths.map(&:id).map(&:to_s)
      end
    end
  end
end
