# frozen_string_literal: true

# == Schema Information
#
# Table name: stats.active_call_term_gateways_hourly
#
#  id         :bigint(8)        not null, primary key
#  avg_count  :float            not null
#  calls_time :datetime         not null
#  max_count  :integer(4)       not null
#  min_count  :integer(4)       not null
#  created_at :datetime         not null
#  gateway_id :integer(4)       not null
#

class Stats::AggActiveCallTermGateway < Stats::Base
  self.table_name = 'stats.active_call_term_gateways_hourly'
  include ::AggChart
  self.chart_entity_column = :gateway_id
end
