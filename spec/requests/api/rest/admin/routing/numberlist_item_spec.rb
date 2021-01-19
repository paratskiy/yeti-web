# frozen_string_literal: true

class Api::Rest::Admin::Routing::NumberlistItemResource < ::BaseResource
  model_name 'Routing::NumberlistItem'

  attributes :key,
             :src_rewrite_rule, :src_rewrite_result,
             :dst_rewrite_rule, :dst_rewrite_result,
             :tag_action_value

  has_one :action, class_name: 'NumberlistAction'
  has_one :numberlist, class_name: 'Numberlist'
  has_one :tag_action, class_name: 'TagAction'

  filter :key # DEPRECATED

  ransack_filter :key, type: :string
  ransack_filter :created_at, type: :datetime
  ransack_filter :updated_at, type: :datetime
  ransack_filter :src_rewrite_rule, type: :string
  ransack_filter :src_rewrite_result, type: :string
  ransack_filter :dst_rewrite_rule, type: :string
  ransack_filter :dst_rewrite_result, type: :string
  ransack_filter :number_min_length, type: :number
  ransack_filter :number_max_length, type: :number
end
