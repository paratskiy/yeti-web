# frozen_string_literal: true

RSpec.describe 'Filter Destination records', :js do
  subject do
    visit destinations_path
    filter_records
    within_filters { click_submit('Filter') }
  end

  include_context :login_as_admin

  let!(:other_destinations_list) { create_list :destination, 2 }

  describe 'filter by tagged' do
    let(:filter_records) do
      within_filters do
        fill_in_chosen 'Tagged', with: filter_value
      end
    end

    let!(:tag) { create :routing_tag, :ua }
    let!(:customers_auth_tagged) { create :destination, routing_tag_ids: [tag.id] }

    context 'with filter by tagged' do
      let(:filter_value) { 'Yes' }

      it 'returns records with any tag' do
        subject

        expect(page).to have_table
        expect(page).to have_table_row count: 1
        expect(page).to have_table_cell column: 'Id', text: customers_auth_tagged.id
        within_filters do
          expect(page).to have_field_chosen('Tagged', with: filter_value)
        end
      end
    end

    context 'with filter by not tagged' do
      let(:filter_value) { 'No' }

      it 'returns record without any tag' do
        subject

        expect(page).to have_table
        expect(page).to have_table_row count: other_destinations_list.count
        other_destinations_list.each { |d| expect(page).to have_table_cell column: 'Id', text: d.id }
        within_filters do
          expect(page).to have_field_chosen('Tagged', with: filter_value)
        end
      end
    end

    describe 'filter by routing tag ids contains' do
      let(:filter_records) do
        within_filters do
          fill_in_chosen 'Routing Tag IDs Contains', with: tags.first.name, multiple: true
          fill_in_chosen 'Routing Tag IDs Contains', with: tags.second.name, multiple: true
          expect(page).to have_field_chosen('Routing Tag IDs Contains', with: tags.first.name, exact: false)
          expect(page).to have_field_chosen('Routing Tag IDs Contains', with: tags.second.name, exact: false)
        end
      end

      context '"ROUTING TAG IDS CONTAINS"' do
        let(:tags) { create_list(:routing_tag, 2) }
        let!(:destinations_tag_contains) { create :destination, routing_tag_ids: [tags.first.id, tags.second.id] }

        it 'returns one record with routing_tag only' do
          subject

          expect(page).to have_table
          expect(page).to have_table_row count: 1
          expect(page).to have_table_cell column: 'Id', text: destinations_tag_contains.id
        end
      end
    end
  end
end
