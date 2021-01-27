# frozen_string_literal: true

# == Schema Information
#
# Table name: gateway_groups
#
#  id                :integer          not null, primary key
#  vendor_id         :integer          not null
#  name              :string           not null
#  prefer_same_pop   :boolean          default(TRUE), not null
#  balancing_mode_id :integer          default(1), not null
#

class GatewayGroup < ActiveRecord::Base
  belongs_to :vendor, class_name: 'Contractor'
  belongs_to :balancing_mode, class_name: 'Equipment::GatewayGroupBalancingMode', foreign_key: :balancing_mode_id

  has_many :gateways, dependent: :restrict_with_error
  has_many :dialpeers, dependent: :restrict_with_error

  has_paper_trail class_name: 'AuditLogItem'

  validates :name, presence: true
  validates :name, uniqueness: { allow_blank: false }
  validates :vendor, :balancing_mode, presence: true

  validate :contractor_is_vendor
  validate :vendor_can_be_changed

  def display_name
    "#{name} | #{id}"
  end

  def have_valid_gateways?
    gateways.where('enabled and allow_termination').count > 0
  end

  protected

  def contractor_is_vendor
    errors.add(:vendor, 'Is not vendor') unless vendor&.vendor
  end

  def vendor_can_be_changed
    if vendor_id_changed?
      errors.add(:vendor, "can't be changed because Gateway Group contain gateways") if gateways.any?
      errors.add(:vendor, "can't be changed because Gateway Group belongs to dialpeers") if dialpeers.any?
    end
  end
end
