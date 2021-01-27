# frozen_string_literal: true

# == Schema Information
#
# Table name: data_import.import_numberlists
#
#  id                         :integer(4)       not null, primary key
#  default_action_name        :string
#  default_dst_rewrite_result :string
#  default_dst_rewrite_rule   :string
#  default_src_rewrite_result :string
#  default_src_rewrite_rule   :string
#  error_string               :string
#  is_changed                 :boolean
#  lua_script_name            :string
#  mode_name                  :string
#  name                       :string
#  tag_action_name            :string
#  tag_action_value           :integer(2)       default([]), not null, is an Array
#  tag_action_value_names     :string
#  default_action_id          :integer(4)
#  lua_script_id              :integer(2)
#  mode_id                    :integer(4)
#  o_id                       :integer(2)
#  tag_action_id              :integer(4)
#

class Importing::Numberlist < Importing::Base
  self.table_name = 'data_import.import_numberlists'
  attr_accessor :file

  belongs_to :mode, class_name: 'Routing::NumberlistMode'
  belongs_to :default_action, class_name: 'Routing::NumberlistAction'
  belongs_to :tag_action, class_name: 'Routing::TagAction'
  belongs_to :lua_script, class_name: 'System::LuaScript', foreign_key: :lua_script_id

  import_for ::Routing::Numberlist

  self.import_attributes = %w[name mode_id default_action_id
                              default_src_rewrite_rule default_src_rewrite_result
                              default_dst_rewrite_rule default_dst_rewrite_result
                              tag_action_id tag_action_value lua_script_id]

  def self.after_import_hook
    resolve_array_of_tags('tag_action_value', 'tag_action_value_names')
    super
  end
end
