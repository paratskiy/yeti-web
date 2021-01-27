# frozen_string_literal: true

# == Schema Information
#
# Table name: disconnect_initiators
#
#  id   :integer          not null, primary key
#  name :string
#

class DisconnectInitiator < ActiveRecord::Base
  ID_TRAFFIC_MANAGER = 0
  ID_TRAFFIC_SWITCH = 1
  ID_DESTINATION = 2
  ID_ORIGINATION = 3
end
