# frozen_string_literal: true

ActiveAdmin.register GatewayGroup do
  menu parent: 'Equipment', priority: 70

  acts_as_audit
  acts_as_clone
  acts_as_safe_destroy
  acts_as_async_destroy('GatewayGroup')
  acts_as_async_update BatchUpdateForm::GatewayGroup

  acts_as_delayed_job_lock

  acts_as_export  :id,
                  :name,
                  [:vendor_name, proc { |row| row.vendor.try(:name) }],
                  [:balancing_mode_name, proc { |row| row.balancing_mode.try(:name) }]

  acts_as_import resource_class: Importing::GatewayGroup

  decorate_with GatewayGroupDecorator

  permit_params :vendor_id, :name, :balancing_mode_id

  controller do
    def scoped_collection
      super.eager_load(:vendor, :balancing_mode)
    end
  end

  collection_action :with_contractor do
    @gr = Contractor.find(params[:contractor_id]).gateway_groups
    render plain: view_context.options_from_collection_for_select(@gr, :id, :display_name)
  end

  index do
    selectable_column
    id_column
    actions
    column :name
    column :vendor do |c|
      auto_link(c.vendor, c.vendor.decorated_display_name)
    end
    column :balancing_mode
  end

  filter :id
  filter :name
  filter :vendor,
         input_html: { class: 'chosen-ajax', 'data-path': '/contractors/search?q[vendor_eq]=true' },
         collection: proc {
           resource_id = params.fetch(:q, {})[:vendor_id_eq]
           resource_id ? Contractor.where(id: resource_id) : []
         }

  filter :balancing_mode

  show do |s|
    attributes_table do
      row :id
      row :name
      row :vendor do
        auto_link(s.vendor, s.vendor.decorated_display_name)
      end
      row :balancing_mode
    end
    panel('Gateways in group') do
      table_for resource.gateways do |_g|
        column :id
        column :name
        column :host
        column :port
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs form_title do
      f.input :name
      f.input :vendor, input_html: { class: 'chosen' }, collection: Contractor.vendors
      f.input :balancing_mode, as: :select, include_blank: false
    end
    f.actions
  end
end
