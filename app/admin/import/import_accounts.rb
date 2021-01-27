# frozen_string_literal: true

ActiveAdmin.register Importing::Account do
  filter :contractor,
         input_html: { class: 'chosen-ajax', 'data-path': '/contractors/search' },
         collection: proc {
           resource_id = params.fetch(:q, {})[:contractor_id_eq]
           resource_id ? Contractor.where(id: resource_id) : []
         }

  filter :name
  filter :balance
  boolean_filter :is_changed

  acts_as_import_preview

  controller do
    def resource_params
      return [{}] if request.get?

      [params[active_admin_config.resource_class.model_name.param_key.to_sym].permit!]
    end
  end

  index do
    selectable_column
    actions
    id_column
    column :error_string
    column :o_id
    column :is_changed

    column :contractor, sortable: :contractor_name
    column :name
    column :balance
    column :vat
    column :min_balance
    column :max_balance
    column :balance_low_threshold
    column :balance_high_threshold
    column :destination_rate_limit
    column :origination_capacity
    column :termination_capacity
    column :total_capacity
  end
end
