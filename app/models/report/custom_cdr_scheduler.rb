# frozen_string_literal: true

# == Schema Information
#
# Table name: reports.cdr_custom_report_schedulers
#
#  id          :integer(4)       not null, primary key
#  filter      :string
#  group_by    :string           is an Array
#  last_run_at :datetime
#  next_run_at :datetime
#  send_to     :integer(4)       is an Array
#  created_at  :datetime
#  customer_id :integer(4)
#  period_id   :integer(4)       not null
#
# Foreign Keys
#
#  cdr_custom_report_schedulers_period_id_fkey  (period_id => scheduler_periods.id)
#

class Report::CustomCdrScheduler < Cdr::Base
  self.table_name = 'reports.cdr_custom_report_schedulers'
  belongs_to :period, class_name: 'Report::SchedulerPeriod', foreign_key: :period_id
  belongs_to :customer, class_name: 'Contractor', foreign_key: :customer_id
  validates :group_by, :period, presence: true

  include Hints

  def contacts
    @contacts ||= Billing::Contact.where(id: send_to)
  end

  before_create do
    self.next_run_at = reschedule(Time.now).next_run_at
  end

  def reschedule(time_now)
    period.time_data(time_now)
  end

  validate do
    if send_to.present? && send_to.any?
      errors.add(:send_to, :invalid) if contacts.count != send_to.count
    end
    if group_by.present? && group_by.any?
      # TODO: validation for group by
    end
  end

  def send_to=(send_to_ids)
    self[:send_to] = send_to_ids.reject(&:blank?)
  end

  def group_by=(group_by_fields)
    self[:group_by] = group_by_fields.reject(&:blank?)
  end
end
