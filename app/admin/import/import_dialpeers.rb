# frozen_string_literal: true

ActiveAdmin.register Importing::Dialpeer, as: 'Dialpeer Imports' do
  filter :o_id
  filter :prefix
  boolean_filter :enabled
  filter :vendor,
         input_html: { class: 'chosen-ajax', 'data-path': '/contractors/search?q[vendor_eq]=true' },
         collection: proc {
           resource_id = params.fetch(:q, {})[:vendor_id_eq]
           resource_id ? Contractor.where(id: resource_id) : []
         }

  filter :account,
         input_html: { class: 'chosen-ajax', 'data-path': '/accounts/search' },
         collection: proc {
           resource_id = params.fetch(:q, {})[:account_id_eq]
           resource_id ? Account.where(id: resource_id) : []
         }

  filter :gateway,
         input_html: { class: 'chosen-ajax', 'data-path': '/gateways/search' },
         collection: proc {
           resource_id = params.fetch(:q, {})[:gateway_id_eq]
           resource_id ? Gateway.where(id: resource_id) : []
         }

  filter :routing_group, input_html: { class: 'chosen' }
  filter :routeset_discriminator, input_html: { class: 'chosen' }
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

    column :prefix
    column :enabled
    column :priority
    column :force_hit_rate
    column :initial_interval
    column :initial_rate
    column :next_interval
    column :next_rate
    column :connect_fee
    column :reverse_billing
    column :lcr_rate_multiplier
    column :gateway, sortable: :gateway_name
    column :gateway_group, sortable: :gateway_group_name
    column :routing_group, sortable: :routing_group_name
    column :routing_tag_ids
    column :routing_tag_mode, sortable: :routing_tag_mode_name
    column :vendor, sortable: :vendor_name
    column :account, sortable: :account_name
    column :routeset_discriminator, sortable: :routeset_discriminator_name
    column :valid_from
    column :valid_till
    column :acd_limit
    column :asr_limit
    column :short_calls_limit
    column :capacity
    column :src_rewrite_rule
    column :src_rewrite_result
    column :dst_rewrite_rule
    column :dst_rewrite_result
  end
end
