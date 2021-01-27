# frozen_string_literal: true

ActiveAdmin.register Node do
  includes :pop
  menu parent: %w[System Components], priotity: 30
  config.batch_actions = false

  acts_as_clone

  permit_params :id, :pop_id, :rpc_endpoint, :name

  filter :pop, input_html: { class: 'chosen' }
  filter :name

  member_action :clear_cache, method: :post do
    resource.clear_cache
    flash[:notice] = 'Cleared!'
    redirect_to action: :index
  end

  action_item :clear_cache, only: :show do
    link_to('Clear Cache', clear_cache_node_path(id: params[:id]), method: :post)
  end

  controller do
    def destroy
      destroy!
    rescue ActiveRecord::ActiveRecordError => e
      flash[:error] = e.message
      redirect_back fallback_location: root_path
    end
  end

  index do
    selectable_column
    id_column
    actions
    column :name
    column :pop
    column :rpc_endpoint
  end

  form do |f|
    f.inputs do
      f.input :id
      f.input :name
      f.input :pop
      f.input :rpc_endpoint
    end
    f.actions
  end

  show do |_node|
    tabs do
      tab :details do
        attributes_table do
          row :id
          row :name
          row :pop
          row :rpc_endpoint
        end
      end
      tab :active_calls_chart do
        panel '24 hours' do
          render partial: 'charts/node'
        end
        panel '1 month' do
          render partial: 'charts/node_agg'
        end
      end

      tab :comments do
        active_admin_comments
      end
    end
  end
end
