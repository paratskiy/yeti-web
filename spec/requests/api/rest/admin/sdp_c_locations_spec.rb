# frozen_string_literal: true

RSpec.describe Api::Rest::Admin::SdpCLocationsController, type: :request do
  include_context :json_api_admin_helpers, type: :'sdp-c-locations'

  describe 'GET /api/rest/admin/sdp-c-locations' do
    subject do
      get json_api_request_path, params: nil, headers: json_api_request_headers
    end

    let!(:sdp_c_locations) do
      SdpCLocation.all
    end

    include_examples :jsonapi_responds_with_pagination_links
    include_examples :returns_json_api_collection do
      let(:json_api_collection_ids) do
        sdp_c_locations.map { |r| r.id.to_s }
      end
    end
  end
end
