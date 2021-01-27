# frozen_string_literal: true

# == Schema Information
#
# Table name: cdr.cdr
#
#  id                              :bigint(8)        not null, primary key
#  audio_recorded                  :boolean
#  auth_orig_ip                    :inet
#  auth_orig_port                  :integer(4)
#  core_version                    :string
#  customer_acc_vat                :decimal(, )
#  customer_account_check_balance  :boolean
#  customer_auth_name              :string
#  customer_duration               :integer(4)
#  customer_price                  :decimal(, )
#  customer_price_no_vat           :decimal(, )
#  destination_fee                 :decimal(, )
#  destination_initial_interval    :integer(4)
#  destination_initial_rate        :decimal(, )
#  destination_next_interval       :integer(4)
#  destination_next_rate           :decimal(, )
#  destination_prefix              :string
#  destination_reverse_billing     :boolean
#  dialpeer_fee                    :decimal(, )
#  dialpeer_initial_interval       :integer(4)
#  dialpeer_initial_rate           :decimal(, )
#  dialpeer_next_interval          :integer(4)
#  dialpeer_next_rate              :decimal(, )
#  dialpeer_prefix                 :string
#  dialpeer_reverse_billing        :boolean
#  diversion_in                    :string
#  diversion_out                   :string
#  dst_prefix_in                   :string
#  dst_prefix_out                  :string
#  dst_prefix_routing              :string
#  duration                        :integer(4)
#  early_media_present             :boolean
#  from_domain                     :string
#  global_tag                      :string
#  internal_disconnect_code        :integer(4)
#  internal_disconnect_reason      :string
#  is_last_cdr                     :boolean
#  is_redirected                   :boolean
#  lega_disconnect_code            :integer(4)
#  lega_disconnect_reason          :string
#  lega_rx_bytes                   :integer(4)
#  lega_rx_decode_errs             :integer(4)
#  lega_rx_no_buf_errs             :integer(4)
#  lega_rx_parse_errs              :integer(4)
#  lega_rx_payloads                :string
#  lega_tx_bytes                   :integer(4)
#  lega_tx_payloads                :string
#  lega_user_agent                 :string
#  legb_disconnect_code            :integer(4)
#  legb_disconnect_reason          :string
#  legb_local_tag                  :string
#  legb_outbound_proxy             :string
#  legb_ruri                       :string
#  legb_rx_bytes                   :integer(4)
#  legb_rx_decode_errs             :integer(4)
#  legb_rx_no_buf_errs             :integer(4)
#  legb_rx_parse_errs              :integer(4)
#  legb_rx_payloads                :string
#  legb_tx_bytes                   :integer(4)
#  legb_tx_payloads                :string
#  legb_user_agent                 :string
#  local_tag                       :string
#  lrn                             :string
#  p_charge_info_in                :string
#  pai_in                          :string
#  pai_out                         :string
#  pdd                             :float
#  ppi_in                          :string
#  ppi_out                         :string
#  privacy_in                      :string
#  privacy_out                     :string
#  profit                          :decimal(, )
#  routing_attempt                 :integer(4)
#  routing_delay                   :float
#  routing_tag_ids                 :integer(2)       is an Array
#  rpid_in                         :string
#  rpid_out                        :string
#  rpid_privacy_in                 :string
#  rpid_privacy_out                :string
#  rtt                             :float
#  ruri_domain                     :string
#  sign_orig_ip                    :string
#  sign_orig_local_ip              :string
#  sign_orig_local_port            :integer(4)
#  sign_orig_port                  :integer(4)
#  sign_term_ip                    :string
#  sign_term_local_ip              :string
#  sign_term_local_port            :integer(4)
#  sign_term_port                  :integer(4)
#  src_name_in                     :string
#  src_name_out                    :string
#  src_prefix_in                   :string
#  src_prefix_out                  :string
#  src_prefix_routing              :string
#  success                         :boolean
#  time_connect                    :datetime
#  time_end                        :datetime
#  time_limit                      :string
#  time_start                      :datetime         not null
#  to_domain                       :string
#  uuid                            :uuid
#  vendor_duration                 :integer(4)
#  vendor_price                    :decimal(, )
#  yeti_version                    :string
#  auth_orig_transport_protocol_id :integer(2)
#  customer_acc_external_id        :bigint(8)
#  customer_acc_id                 :integer(4)
#  customer_auth_external_id       :bigint(8)
#  customer_auth_id                :integer(4)
#  customer_external_id            :bigint(8)
#  customer_id                     :integer(4)
#  customer_invoice_id             :integer(4)
#  destination_id                  :integer(4)
#  destination_rate_policy_id      :integer(4)
#  dialpeer_id                     :integer(4)
#  disconnect_initiator_id         :integer(4)
#  dst_area_id                     :integer(4)
#  dst_country_id                  :integer(4)
#  dst_network_id                  :integer(4)
#  dump_level_id                   :integer(4)       default(0), not null
#  failed_resource_id              :bigint(8)
#  failed_resource_type_id         :integer(2)
#  lnp_database_id                 :integer(2)
#  node_id                         :integer(4)
#  orig_call_id                    :string
#  orig_gw_external_id             :bigint(8)
#  orig_gw_id                      :integer(4)
#  pop_id                          :integer(4)
#  rateplan_id                     :integer(4)
#  routing_group_id                :integer(4)
#  routing_plan_id                 :integer(4)
#  sign_orig_transport_protocol_id :integer(2)
#  sign_term_transport_protocol_id :integer(2)
#  src_area_id                     :integer(4)
#  term_call_id                    :string
#  term_gw_external_id             :bigint(8)
#  term_gw_id                      :integer(4)
#  vendor_acc_external_id          :bigint(8)
#  vendor_acc_id                   :integer(4)
#  vendor_external_id              :bigint(8)
#  vendor_id                       :integer(4)
#  vendor_invoice_id               :integer(4)
#

class Cdr::Cdr < Cdr::Base
  self.table_name = 'cdr.cdr'
  self.primary_key = :id

  ADMIN_PRELOAD_LIST = %i[
    dialpeer routing_group destination disconnect_initiator
    auth_orig_transport_protocol sign_orig_transport_protocol
    dst_network destination_rate_policy routing_plan vendor
    term_gw orig_gw customer_auth vendor_acc customer_acc
    dst_area customer rateplan pop src_area lnp_database
    dump_level dst_country node sign_term_transport_protocol
  ].freeze

  include Partitionable
  self.pg_partition_name = 'PgPartition::Cdr'

  belongs_to :rateplan, class_name: 'Routing::Rateplan', foreign_key: :rateplan_id
  belongs_to :routing_group
  belongs_to :src_area, class_name: 'Routing::Area', foreign_key: :src_area_id
  belongs_to :dst_area, class_name: 'Routing::Area', foreign_key: :dst_area_id
  belongs_to :routing_plan, class_name: 'Routing::RoutingPlan', foreign_key: :routing_plan_id
  belongs_to :orig_gw, class_name: 'Gateway', foreign_key: :orig_gw_id
  belongs_to :term_gw, class_name: 'Gateway', foreign_key: :term_gw_id
  belongs_to :destination, class_name: 'Routing::Destination'
  belongs_to :destination_rate_policy, class_name: 'Routing::DestinationRatePolicy', foreign_key: :destination_rate_policy_id
  belongs_to :dialpeer
  belongs_to :customer_auth, class_name: 'CustomersAuth', foreign_key: :customer_auth_id
  belongs_to :vendor_acc, class_name: 'Account', foreign_key: :vendor_acc_id
  belongs_to :customer_acc, class_name: 'Account', foreign_key: :customer_acc_id
  belongs_to :vendor, class_name: 'Contractor', foreign_key: :vendor_id # ,:conditions => {:vendor => true}
  belongs_to :customer, class_name: 'Contractor', foreign_key: :customer_id # ,  :conditions => {:customer => true}
  belongs_to :disconnect_initiator
  belongs_to :vendor_invoice, class_name: 'Billing::Invoice', foreign_key: :vendor_invoice_id
  belongs_to :customer_invoice, class_name: 'Billing::Invoice', foreign_key: :customer_invoice_id
  belongs_to :node, class_name: 'Node', foreign_key: :node_id
  belongs_to :pop, class_name: 'Pop', foreign_key: :pop_id
  belongs_to :dump_level
  belongs_to :dst_network, class_name: 'System::Network', foreign_key: :dst_network_id
  belongs_to :dst_country, class_name: 'System::Country', foreign_key: :dst_country_id
  belongs_to :lnp_database, class_name: 'Lnp::Database', foreign_key: :lnp_database_id
  belongs_to :auth_orig_transport_protocol, class_name: 'Equipment::TransportProtocol', foreign_key: :auth_orig_transport_protocol_id
  belongs_to :sign_orig_transport_protocol, class_name: 'Equipment::TransportProtocol', foreign_key: :sign_orig_transport_protocol_id
  belongs_to :sign_term_transport_protocol, class_name: 'Equipment::TransportProtocol', foreign_key: :sign_term_transport_protocol_id

  scope :success, -> { where success: true }
  scope :failure, -> { where success: false }
  scope :routing_tag_ids_include, lambda { |id|
    where('? = ANY(routing_tag_ids)', id)
  }

  ##### metasearch override filters ##########

  scope :disconnect_code_eq, ->(code) { where('disconnect_code = ?', code) }
  # scope :vendor_acc_id_contains, lambda {|vendor_acc_id|where('vendor_acc_id = ?',vendor_acc_id )  }
  # scope :customer_acc_id_contains, lambda {|customer_acc_id|where('customer_acc_id = ?',customer_acc_id )  }

  scope :short_calls, -> { where('success AND duration<=?', GuiConfig.short_call_length) }
  scope :successful_calls, -> { where('success') }
  scope :rerouted_calls, -> { where('(NOT is_last_cdr) OR routing_attempt>1') }
  scope :no_rtp, -> { where('success AND (lega_tx_bytes=0 OR lega_rx_bytes=0 OR legb_tx_bytes=0 OR legb_rx_bytes=0)') }
  scope :not_authorized, -> { where('customer_auth_id is null') }
  scope :bad_routing, -> { where('customer_auth_id is not null AND disconnect_initiator_id=0') }
  scope :with_trace, -> { where('dump_level_id > 0') }

  scope :account_id_eq, ->(account_id) { where('vendor_acc_id =? OR customer_acc_id =?', account_id, account_id) }

  scope :where_customer, ->(id) { where(customer_id: id) }
  scope :where_account, ->(id) { where(customer_acc_id: id) } # OR vendor_acc_id ???

  scope :status_eq, lambda { |success|
    if success.is_a?(String)
      success = begin
                  success.to_bool
                rescue StandardError
                  nil
                end
    end

    where('success = ?', success) if [true, false].include? success
  }

  #### end override filters ##############

  def status_sym
    success ? :success : :failure
  end

  def display_name
    id.to_s
  end

  # TODO: use DisconnectInitiator#display_name instead
  # Why in was cached this way? `DISCONNECTORS = DisconnectInitiator.all.index_by(&:id)`
  def disconnect_initiator_name
    disconnect_initiator.try(:name)
  end

  def has_dump?
    log_level_name.present?
  end

  def log_level_name
    if log_full?
      :Full
    elsif log_rtp?
      :RTP
    elsif log_sip?
      :SIP
    end
  end

  def log_full?
    log_rtp? && log_sip?
  end

  delegate :log_rtp?, to: :dump_level

  delegate :log_sip?, to: :dump_level

  def dump_filename
    if local_tag.present? && node_id.present?
      "/dump/#{local_tag}_#{node_id}.pcap"
    end
  end

  def call_record_filename_lega
    "/record/#{local_tag}_legA.mp3" if local_tag.present? && node_id.present?
  end

  def call_record_filename_legb
    "/record/#{local_tag}_legB.mp3" if local_tag.present? && node_id.present?
  end

  def attempts
    if local_tag.blank?
      self.class.where('cdr.id=?', id)
    else
      self.class.where(time_start: time_start).where(local_tag: local_tag).order('routing_attempt desc')
    end
  end

  def self.scoped_stat
    select("
    count(nullif(is_last_cdr,false)) as originated_calls_count,
    count(nullif(routing_attempt=2,false)) as rerouted_calls_count,
    100*count(nullif(routing_attempt=2,false))::real/nullif(count(nullif(is_last_cdr,false)),0)::real as rerouted_calls_percent,
    count(id) as termination_attempts_count,
    coalesce(sum(duration),0) as calls_duration,
    sum(duration)::float/nullif(count(nullif(success,false)),0)::float as ACD,
    count(nullif(success,false))::float/nullif(count(nullif(is_last_cdr,false)),0)::float as origination_asr,
    count(nullif(success,false))::float/nullif(count(id),0)::float as termination_asr,
    sum(profit) as profit,
    sum(customer_price) as customer_price,
    sum(vendor_price) as vendor_price").to_a[0]
  end

  def self.provisioning_info
    OpenStruct.new(
      new_events: new_events,
      pending_events: pending_events
    )
  end

  def self.new_events
    SqlCaller::Cdr.select_value("select ev_new from pgq.get_queue_info('cdr_billing')")
  end

  def self.pending_events
    SqlCaller::Cdr.select_value("select pending_events from pgq.get_consumer_info('cdr_billing', 'cdr_billing')")
  end

  private

  def self.ransackable_scopes(_auth_object = nil)
    %i[
      disconnect_code_eq
      status_eq
      account_id_eq
      routing_tag_ids_include
    ]
  end
end
