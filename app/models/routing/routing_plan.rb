# frozen_string_literal: true

# == Schema Information
#
# Table name: routing_plans
#
#  id                     :integer          not null, primary key
#  name                   :string           not null
#  sorting_id             :integer          default(1), not null
#  rate_delta_max         :decimal(, )      default(0.0), not null
#  use_lnp                :boolean          default(FALSE), not null
#  max_rerouting_attempts :integer          default(10), not null
#

class Routing::RoutingPlan < Yeti::ActiveRecord
  has_and_belongs_to_many :routing_groups, join_table: 'class4.routing_plan_groups', class_name: 'RoutingGroup'
  has_many :customers_auths, class_name: 'CustomersAuth', foreign_key: :routing_plan_id, dependent: :restrict_with_error
  has_many :static_routes, class_name: 'Routing::RoutingPlanStaticRoute',
                           foreign_key: :routing_plan_id, dependent: :delete_all

  has_many :lnp_rules, class_name: 'Lnp::RoutingPlanLnpRule', foreign_key: :routing_plan_id, dependent: :delete_all
  belongs_to :sorting

  has_paper_trail class_name: 'AuditLogItem'

  validates :name, :max_rerouting_attempts, presence: true
  validates :name, uniqueness: { allow_blank: false }
  validates :max_rerouting_attempts, numericality: { greater_than: 0, less_than_or_equal_to: 10, allow_nil: false, only_integer: true }

  scope :having_static_routes, -> { joins(:sorting).merge(Sorting.with_static_routes) }

  def display_name
    "#{name} | #{id}"
  end

  # #todo: remove this
  # def use_lnp_sym
  #   self.use_lnp ?  :true : :false
  # end

  delegate :use_static_routes?, to: :sorting

  def have_routing_groups?
    routing_groups.count > 0
  end

  #  after_update :delete_static_routes, if: proc {|obj| obj.sorting_id_changed? }

  private

  def delete_static_routes
    static_routes.delete_all
  end
end
