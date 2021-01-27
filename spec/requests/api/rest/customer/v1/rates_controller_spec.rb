# frozen_string_literal: true

RSpec.describe Api::Rest::Customer::V1::RatesController, type: :request do
  include_context :json_api_customer_v1_helpers, type: :rates
  # Rates for the other customer
  before { create_list(:customers_auth, 2) }

  before(:each, :with_rateplan_with_customer) do
    create(:customers_auth, customer_id: customer.id)
  end

  before(:each, :with_rateplans_with_accounts) do
    accounts.each do |account|
      create(:customers_auth, customer_id: customer.id, account_id: account.id)
    end
  end

  describe 'GET /api/rest/customer/v1/rates' do
    subject do
      get json_api_request_path, params: json_api_request_query, headers: json_api_request_headers
    end

    let(:json_api_request_query) { nil }

    it_behaves_like :json_api_check_authorization

    context 'account_ids is empty', :with_rateplan_with_customer do
      before { create_list(:rate, 2) }
      let(:records_qty) { 2 }
      let!(:rates) { create_list(:rate, records_qty, rate_group: create(:rate_group, rateplans: [customer.rateplans.first])) }

      it_behaves_like :json_api_check_pagination do
        let(:records_ids) { rates.map { |r| r.reload.uuid } }
      end

      it 'returns records of this customer' do
        subject
        expect(response.status).to eq(200)
        expect(response_json[:data]).to match_array(
          [
            hash_including(id: rates.first.reload.uuid),
            hash_including(id: rates.second.reload.uuid)
          ]
        )
      end
    end

    context 'with account_ids', :with_rateplans_with_accounts do
      let(:accounts) { create_list :account, 4, contractor: customer }
      let(:allowed_accounts) { accounts.slice(0, 2) }

      before do
        api_access.update!(account_ids: allowed_accounts.map(&:id))
      end

      let!(:rates) { create_list(:rate, 2, rate_group: create(:rate_group, rateplans: [Routing::Rateplan.where_account(allowed_accounts.first.id).first])) }

      before do
        create_list(:rate, 2) # other customer
      end

      it 'returns Rates connected to allowed_accounts' do
        subject
        expect(response_json[:data]).to match_array(
          [
            hash_including(id: CustomersAuth.find_by(account_id: allowed_accounts.first).destinations.first.uuid),
            hash_including(id: CustomersAuth.find_by(account_id: allowed_accounts.first).destinations.last.uuid)
          ]
        )
      end
    end
  end

  describe 'GET show' do
    subject do
      get json_api_request_path, params: nil, headers: json_api_request_headers
    end

    let(:json_api_request_path) { "#{super()}/#{record_id}" }
    let(:record_id) { rate.reload.uuid }

    let!(:customers_auth) { create(:customers_auth, customer_id: customer.id) }

    let(:rateplan) { customers_auth.rateplan.reload }

    let!(:rate_group) { create(:rate_group, rateplans: [rateplan]) }
    let!(:rate) { create(:rate, rate_group: rate_group) }

    it_behaves_like :json_api_check_authorization

    context 'when record exists' do
      it 'returns record with expected attributes' do
        subject
        expect(response_json[:data]).to match(
          id: rate.reload.uuid,
          'type': 'rates',
          'links': anything,
          'attributes': {
            'prefix': rate.prefix,
            'initial-rate': rate.initial_rate.to_s,
            'initial-interval': rate.initial_interval,
            'next-rate': rate.next_rate.to_s,
            'next-interval': rate.next_interval,
            'connect-fee': rate.connect_fee.to_s,
            'reject-calls': rate.reject_calls,
            'valid-from': rate.valid_from.iso8601(3),
            'valid-till': rate.valid_till.iso8601(3),
            'network-prefix-id': rate.network_prefix_id
          }
        )
      end
    end

    context 'request rate not listed in allowed_ids' do
      let!(:allowed_account) { create(:account, contractor: customer) }

      before { api_access.update!(account_ids: [allowed_account.id]) }

      include_examples :responds_with_status, 404
    end
  end
end
