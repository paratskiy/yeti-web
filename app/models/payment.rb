# frozen_string_literal: true

# == Schema Information
#
# Table name: payments
#
#  account_id :integer          not null
#  amount     :decimal(, )      not null
#  notes      :string
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#

class Payment < Yeti::ActiveRecord
  belongs_to :account

  has_paper_trail class_name: 'AuditLogItem'

  validates :amount, numericality: true
  validates :account, presence: true

  before_create do
    account.lock! # will generate SELECT FOR UPDATE SQL statement
    account.balance += amount
    throw(:abort) unless account.save
  end

  scope :today, -> { where('created_at >= ? ', Time.now.at_beginning_of_day) }
  scope :yesterday, -> { where('created_at >= ? and created_at < ?', 1.day.ago.at_beginning_of_day, Time.now.at_beginning_of_day) }
end
