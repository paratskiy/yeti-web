# frozen_string_literal: true

class Routing::RoutingGroupDuplicatorForm < ApplicationForm
  attribute :name
  attribute :id

  validates :name, :id, presence: true

  validate do
    errors.add(:name, :invalid) unless RoutingGroup.exists?(id)
    errors.add(:name, :taken) if RoutingGroup.exists?(name: name)
  end

  # Required by activeadmin https://github.com/activeadmin/activeadmin/pull/5253#discussion_r155525109
  def self.inheritance_column
    nil
  end

  private

  def _save
    dst = RoutingGroup.create!(
      name: name
    )
    src = RoutingGroup.find(id)
    src.dialpeers.includes(:dialpeer_next_rates).find_each do |n|
      x = n.dup
      x.routing_group_id = dst.id
      x.save!
      n.dialpeer_next_rates.each do |nn|
        xx = nn.dup
        xx.dialpeer_id = x.id
        xx.save!
      end
    end
  end
end
