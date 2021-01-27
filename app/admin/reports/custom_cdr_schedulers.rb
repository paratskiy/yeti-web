# frozen_string_literal: true

ActiveAdmin.register Report::CustomCdrScheduler, as: 'CustomCdrScheduler' do
  menu false
  config.batch_actions = false
  actions :index, :destroy, :create, :new

  permit_params :period_id,
                :customer_id,
                :filter,
                :group_by,
                send_to: [],
                group_by: []

  controller do
    def scoped_collection
      super.preload(:period, :customer)
    end
  end

  for_report Report::CustomCdr

  index do
    selectable_column
    id_column
    actions
    column :created_at
    column :period
    column :customer
    column :filter
    column :group_by
    column :send_to do |r|
      r.contacts.map(&:email).sort.join(', ')
    end
    column :last_run_at
    column :next_run_at
  end

  form do |f|
    f.inputs do
      f.input :period
      f.input :customer, as: :select, input_html: { class: 'chosen' }
      f.input :filter
      f.input :group_by, as: :select, input_html: { class: 'chosen-sortable', multiple: true }, collection: Report::CustomCdr::CDR_COLUMNS.map { |a| [a, a] }
      f.input :send_to, as: :select, input_html: { class: 'chosen-sortable', multiple: true }, collection: Billing::Contact.collection, hint: f.object.send_to_hint
    end
    f.actions
  end

  filter :id
  filter :period
  filter :customer,
         input_html: { class: 'chosen-ajax', 'data-path': '/contractors/search?q[customer_eq]=true' },
         collection: proc {
           resource_id = params.fetch(:q, {})[:customer_id_eq]
           resource_id ? Contractor.where(id: resource_id) : []
         }
end
