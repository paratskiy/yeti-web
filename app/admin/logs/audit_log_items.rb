# frozen_string_literal: true

ActiveAdmin.register AuditLogItem do
  menu parent: 'Logs', priority: 10, label: 'Audit log'
  config.batch_actions = false
  actions :index, :show

  filter :item_type, input_html: { class: 'chosen' }
  filter :item_id_eq
  filter :event, as: :select, collection: [%w[create create], %w[destroy destroy], %w[update update]]
  filter :whodunnit
  filter :created_at, as: :date_time_range
  filter :ip
  filter :txid

  controller do
    def scoped_collection
      super.includes(:item)
    end
  end

  show do |version|
    attributes_table do
      row :id
      row :item_type
      row :item
      row :event
      row :whodunnit
      row :date do
        version.created_at
      end
      row :txid
      row :ip
    end

    unless version.reify.nil?
      panel 'Values before event' do
        obj = version.reify
        attributes_table_for obj do
          row :id
          obj.class.content_columns.each do |col|
            row col.name.to_sym
          end
        end
      end
    end

    if version.changeset.any?
      panel 'Changes' do
        attributes_table_for version.changeset do
          version.changeset.each_key do |key|
            next unless version.changeset[key].reject(&:blank?).any?

            row key do
              text_node version.changeset[key][0]
              text_node ' -> '
              text_node version.changeset[key][1]
            end
          end
        end
      end
    end
  end

  index do
    id_column
    column :item_type
    column 'Item', sortable: :item_id do |v|
      text = []
      text << v.item_id.to_s
      url = smart_url_for(v.item, version: v.id)
      if v.item.present? && v.item.respond_to?(:display_name) && url
        text << link_to(v.item.display_name, url)
      elsif v.item.present? && v.item.respond_to?(:display_name)
        text << v.item.display_name
      end
      raw text.join(' ')
    end

    column :event
    column :created_at
    column :txid
    column('Who Id', sortable: 'whodunnit', &:whodunnit)

    column('Who', sortable: 'whodunnit') do |version|
      whodunit_link(version.whodunnit)
    end

    column :ip
  end
end
