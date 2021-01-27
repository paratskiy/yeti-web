# frozen_string_literal: true

# == Schema Information
#
# Table name: sys.load_balancers
#
#  id            :integer(2)       not null, primary key
#  name          :string           not null
#  signalling_ip :string           not null
#
# Indexes
#
#  load_balancers_name_key           (name) UNIQUE
#  load_balancers_signalling_ip_key  (signalling_ip) UNIQUE
#

class System::LoadBalancer < Yeti::ActiveRecord
  self.table_name = 'sys.load_balancers'

  has_paper_trail class_name: 'AuditLogItem'

  validates :name, :signalling_ip, presence: true
  validates :name, :signalling_ip, uniqueness: true
end
