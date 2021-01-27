# frozen_string_literal: true

ActiveAdmin.register Report::VendorTrafficScheduler, as: 'VendorTrafficScheduler' do
  menu false
  config.batch_actions = false
  actions :index, :destroy, :create, :new, :show

  permit_params :vendor_id, :period_id, send_to: []

  controller do
    def scoped_collection
      super.preload(:vendor, :period)
    end
  end

  for_report Report::VendorTraffic

  index do
    selectable_column
    id_column
    actions
    column :created_at
    column :period
    column :vendor
    column :send_to do |r|
      r.contacts.map(&:email).sort.join(', ')
    end
    column :last_run_at
    column :next_run_at
  end

  form do |f|
    f.inputs do
      f.input :period
      f.input :vendor, as: :select, input_html: { class: 'chosen' }, collection: Contractor.where(vendor: true)
      f.input :send_to, as: :select, input_html: { class: 'chosen', multiple: true }, collection: Billing::Contact.collection, hint: f.object.send_to_hint
    end
    f.actions
  end

  filter :id
  filter :created_at, as: :date_time_range
  filter :vendor,
         input_html: { class: 'chosen-ajax', 'data-path': '/contractors/search?q[vendor_eq]=true' },
         collection: proc {
           resource_id = params.fetch(:q, {})[:vendor_id_eq]
           resource_id ? Contractor.where(id: resource_id) : []
         }

  show do |_s|
    attributes_table do
      row :id
      row :created_at
      row :period
      row :vendor
      row :send_to do |r|
        r.contacts.map(&:email).sort.join(', ')
      end
      row :last_run_at
      row :next_run_at
    end
  end
end
