SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: billing; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA billing;


--
-- Name: class4; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA class4;


--
-- Name: data_import; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA data_import;


--
-- Name: gui; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA gui;


--
-- Name: lnp; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA lnp;


--
-- Name: logs; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA logs;


--
-- Name: notifications; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA notifications;


--
-- Name: pgq; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgq WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION pgq; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgq IS 'Generic queue for PostgreSQL';


--
-- Name: pgq_ext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgq_ext WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION pgq_ext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgq_ext IS 'Target-side batch tracking infrastructure';


--
-- Name: runtime_stats; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA runtime_stats;


--
-- Name: switch18; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA switch18;


--
-- Name: switch19; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA switch19;


--
-- Name: sys; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA sys;


--
-- Name: yeti_ext; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA yeti_ext;


--
-- Name: pllua; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pllua WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION pllua; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pllua IS 'Lua as a procedural language';


--
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: prefix; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS prefix WITH SCHEMA public;


--
-- Name: EXTENSION prefix; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION prefix IS 'Prefix Range module for PostgreSQL';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: yeti; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS yeti WITH SCHEMA yeti_ext;


--
-- Name: EXTENSION yeti; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION yeti IS 'helper functions for YETI project';


--
-- Name: cdr_v1; Type: TYPE; Schema: billing; Owner: -
--

CREATE TYPE billing.cdr_v1 AS (
	id bigint,
	customer_id integer,
	vendor_id integer,
	customer_acc_id integer,
	vendor_acc_id integer,
	customer_auth_id integer,
	destination_id integer,
	dialpeer_id integer,
	orig_gw_id integer,
	term_gw_id integer,
	routing_group_id integer,
	rateplan_id integer,
	destination_next_rate numeric,
	destination_fee numeric,
	dialpeer_next_rate numeric,
	dialpeer_fee numeric,
	time_limit character varying,
	internal_disconnect_code integer,
	internal_disconnect_reason character varying,
	disconnect_initiator_id integer,
	customer_price numeric,
	vendor_price numeric,
	duration integer,
	success boolean,
	vendor_billed boolean,
	customer_billed boolean,
	profit numeric,
	dst_prefix_in character varying,
	dst_prefix_out character varying,
	src_prefix_in character varying,
	src_prefix_out character varying,
	time_start timestamp without time zone,
	time_connect timestamp without time zone,
	time_end timestamp without time zone,
	sign_orig_ip character varying,
	sign_orig_port integer,
	sign_orig_local_ip character varying,
	sign_orig_local_port integer,
	sign_term_ip character varying,
	sign_term_port integer,
	sign_term_local_ip character varying,
	sign_term_local_port integer,
	orig_call_id character varying,
	term_call_id character varying,
	vendor_invoice_id integer,
	customer_invoice_id integer,
	local_tag character varying,
	dump_file character varying,
	destination_initial_rate numeric,
	dialpeer_initial_rate numeric,
	destination_initial_interval integer,
	destination_next_interval integer,
	dialpeer_initial_interval integer,
	dialpeer_next_interval integer,
	destination_rate_policy_id integer,
	routing_attempt integer,
	is_last_cdr boolean,
	lega_disconnect_code integer,
	lega_disconnect_reason character varying,
	pop_id integer,
	node_id integer,
	src_name_in character varying,
	src_name_out character varying,
	diversion_in character varying,
	diversion_out character varying,
	lega_rx_payloads character varying,
	lega_tx_payloads character varying,
	legb_rx_payloads character varying,
	legb_tx_payloads character varying,
	legb_disconnect_code integer,
	legb_disconnect_reason character varying,
	dump_level_id integer,
	auth_orig_ip inet,
	auth_orig_port integer,
	lega_rx_bytes integer,
	lega_tx_bytes integer,
	legb_rx_bytes integer,
	legb_tx_bytes integer,
	global_tag character varying
);


--
-- Name: cdr_v2; Type: TYPE; Schema: billing; Owner: -
--

CREATE TYPE billing.cdr_v2 AS (
	id bigint,
	customer_id integer,
	vendor_id integer,
	customer_acc_id integer,
	vendor_acc_id integer,
	customer_auth_id integer,
	destination_id integer,
	dialpeer_id integer,
	orig_gw_id integer,
	term_gw_id integer,
	routing_group_id integer,
	rateplan_id integer,
	destination_next_rate numeric,
	destination_fee numeric,
	dialpeer_next_rate numeric,
	dialpeer_fee numeric,
	internal_disconnect_code integer,
	internal_disconnect_reason character varying,
	disconnect_initiator_id integer,
	customer_price numeric,
	vendor_price numeric,
	duration integer,
	success boolean,
	profit numeric,
	time_start timestamp without time zone,
	time_connect timestamp without time zone,
	time_end timestamp without time zone,
	lega_disconnect_code integer,
	lega_disconnect_reason character varying,
	legb_disconnect_code integer,
	legb_disconnect_reason character varying,
	src_prefix_in character varying,
	src_prefix_out character varying,
	dst_prefix_in character varying,
	dst_prefix_out character varying,
	destination_initial_interval integer,
	destination_next_interval integer,
	destination_initial_rate numeric,
	orig_call_id character varying,
	term_call_id character varying,
	local_tag character varying,
	from_domain character varying,
	destination_reverse_billing boolean,
	dialpeer_reverse_billing boolean
);


--
-- Name: callprofile62_ty; Type: TYPE; Schema: switch18; Owner: -
--

CREATE TYPE switch18.callprofile62_ty AS (
	ruri character varying,
	bleg_transport_protocol_id smallint,
	"from" character varying,
	"to" character varying,
	call_id character varying,
	dlg_nat_handling boolean,
	force_outbound_proxy boolean,
	outbound_proxy character varying,
	bleg_outbound_proxy_transport_protocol_id smallint,
	aleg_force_outbound_proxy boolean,
	aleg_outbound_proxy character varying,
	aleg_outbound_proxy_transport_protocol_id smallint,
	next_hop character varying,
	next_hop_1st_req boolean,
	aleg_next_hop character varying,
	sdp_filter_type_id integer,
	sdp_filter_list character varying,
	sdp_alines_filter_type_id integer,
	sdp_alines_filter_list character varying,
	enable_session_timer boolean,
	enable_aleg_session_timer boolean,
	session_expires integer,
	minimum_timer integer,
	maximum_timer integer,
	session_refresh_method_id integer,
	accept_501_reply character varying,
	aleg_session_expires integer,
	aleg_minimum_timer integer,
	aleg_maximum_timer integer,
	aleg_session_refresh_method_id integer,
	aleg_accept_501_reply character varying,
	enable_auth boolean,
	auth_user character varying,
	auth_pwd character varying,
	enable_aleg_auth boolean,
	auth_aleg_user character varying,
	auth_aleg_pwd character varying,
	append_headers character varying,
	append_headers_req character varying,
	aleg_append_headers_req character varying,
	disconnect_code_id integer,
	enable_rtprelay boolean,
	rtprelay_interface character varying,
	aleg_rtprelay_interface character varying,
	outbound_interface character varying,
	aleg_outbound_interface character varying,
	contact_displayname character varying,
	contact_user character varying,
	contact_host character varying,
	contact_port smallint,
	try_avoid_transcoding boolean,
	rtprelay_dtmf_filtering boolean,
	rtprelay_dtmf_detection boolean,
	dump_level_id integer,
	time_limit integer,
	resources character varying,
	cache_time integer,
	reply_translations character varying,
	aleg_policy_id integer,
	bleg_policy_id integer,
	aleg_codecs_group_id integer,
	bleg_codecs_group_id integer,
	aleg_single_codec_in_200ok boolean,
	bleg_single_codec_in_200ok boolean,
	ringing_timeout integer,
	global_tag character varying,
	patch_ruri_next_hop boolean,
	rtprelay_force_dtmf_relay boolean,
	aleg_force_symmetric_rtp boolean,
	bleg_force_symmetric_rtp boolean,
	aleg_symmetric_rtp_nonstop boolean,
	bleg_symmetric_rtp_nonstop boolean,
	aleg_symmetric_rtp_ignore_rtcp boolean,
	bleg_symmetric_rtp_ignore_rtcp boolean,
	aleg_rtp_ping boolean,
	bleg_rtp_ping boolean,
	aleg_relay_options boolean,
	bleg_relay_options boolean,
	filter_noaudio_streams boolean,
	aleg_relay_reinvite boolean,
	bleg_relay_reinvite boolean,
	aleg_relay_hold boolean,
	bleg_relay_hold boolean,
	aleg_relay_prack boolean,
	bleg_relay_prack boolean,
	aleg_sdp_c_location_id integer,
	bleg_sdp_c_location_id integer,
	trusted_hdrs_gw boolean,
	aleg_append_headers_reply character varying,
	bleg_sdp_alines_filter_list character varying,
	bleg_sdp_alines_filter_type_id integer,
	dead_rtp_time integer,
	rtp_relay_timestamp_aligning boolean,
	allow_1xx_wo2tag boolean,
	invite_timeout integer,
	srv_failover_timeout integer,
	rtp_force_relay_cn boolean,
	aleg_sensor_id smallint,
	aleg_sensor_level_id smallint,
	bleg_sensor_id smallint,
	bleg_sensor_level_id smallint,
	aleg_dtmf_send_mode_id integer,
	bleg_dtmf_send_mode_id integer,
	aleg_dtmf_recv_modes integer,
	bleg_dtmf_recv_modes integer,
	suppress_early_media boolean,
	aleg_relay_update boolean,
	bleg_relay_update boolean,
	force_one_way_early_media boolean,
	radius_auth_profile_id smallint,
	record_audio boolean,
	aleg_radius_acc_profile_id smallint,
	bleg_radius_acc_profile_id smallint,
	transit_headers_a2b character varying,
	transit_headers_b2a character varying,
	src_number_radius character varying,
	dst_number_radius character varying,
	orig_gw_name character varying,
	customer_auth_name character varying,
	customer_name character varying,
	customer_account_name character varying,
	term_gw_name character varying,
	fake_180_timer smallint,
	aleg_rel100_mode_id smallint,
	bleg_rel100_mode_id smallint,
	bleg_max_30x_redirects smallint,
	bleg_max_transfers smallint,
	aleg_auth_required boolean,
	aleg_rtp_filter_inband_dtmf boolean,
	bleg_rtp_filter_inband_dtmf boolean,
	registration_auth_id integer,
	bleg_protocol_priority_id smallint,
	aleg_media_encryption_mode_id smallint,
	bleg_media_encryption_mode_id smallint,
	aleg_sip_acl character varying[],
	aleg_rtp_acl character varying[],
	bleg_sip_acl character varying[],
	bleg_rtp_acl character varying[],
	registered_aor_id integer,
	customer_id integer,
	vendor_id integer,
	customer_acc_id integer,
	vendor_acc_id integer,
	customer_auth_id integer,
	destination_id bigint,
	destination_prefix character varying,
	dialpeer_id bigint,
	dialpeer_prefix character varying,
	orig_gw_id integer,
	term_gw_id integer,
	routing_group_id integer,
	rateplan_id integer,
	destination_initial_rate numeric,
	destination_next_rate numeric,
	destination_initial_interval integer,
	destination_next_interval integer,
	destination_rate_policy_id smallint,
	dialpeer_initial_interval integer,
	dialpeer_next_interval integer,
	dialpeer_next_rate numeric,
	destination_fee numeric,
	dialpeer_initial_rate numeric,
	dialpeer_fee numeric,
	dst_prefix_in character varying,
	dst_prefix_out character varying,
	src_prefix_in character varying,
	src_prefix_out character varying,
	src_name_in character varying,
	src_name_out character varying,
	diversion_in character varying,
	diversion_out character varying,
	auth_orig_protocol_id smallint,
	auth_orig_ip inet,
	auth_orig_port integer,
	dst_country_id integer,
	dst_network_id integer,
	dst_prefix_routing character varying,
	src_prefix_routing character varying,
	routing_plan_id integer,
	lrn character varying,
	lnp_database_id smallint,
	from_domain character varying,
	to_domain character varying,
	ruri_domain character varying,
	src_area_id integer,
	dst_area_id integer,
	routing_tag_ids smallint[],
	pai_in character varying,
	ppi_in character varying,
	privacy_in character varying,
	rpid_in character varying,
	rpid_privacy_in character varying,
	pai_out character varying,
	ppi_out character varying,
	privacy_out character varying,
	rpid_out character varying,
	rpid_privacy_out character varying,
	customer_acc_check_balance boolean,
	destination_reverse_billing boolean,
	dialpeer_reverse_billing boolean,
	customer_auth_external_id bigint,
	customer_external_id bigint,
	vendor_external_id bigint,
	customer_acc_external_id bigint,
	vendor_acc_external_id bigint,
	orig_gw_external_id bigint,
	term_gw_external_id bigint,
	customer_acc_vat numeric
);


--
-- Name: lnp_resolve; Type: TYPE; Schema: switch18; Owner: -
--

CREATE TYPE switch18.lnp_resolve AS (
	lrn text,
	tag text
);


--
-- Name: lua_call_context; Type: TYPE; Schema: switch18; Owner: -
--

CREATE TYPE switch18.lua_call_context AS (
	src_name_in character varying,
	src_number_in character varying,
	dst_number_in character varying,
	src_name_out character varying,
	src_number_out character varying,
	dst_number_out character varying,
	src_name_routing character varying,
	src_number_routing character varying,
	dst_number_routing character varying,
	diversion_in character varying[],
	diversion_routing character varying[],
	diversion_out character varying[]
);


--
-- Name: callprofile_ty; Type: TYPE; Schema: switch19; Owner: -
--

CREATE TYPE switch19.callprofile_ty AS (
	ruri character varying,
	bleg_transport_protocol_id smallint,
	"from" character varying,
	"to" character varying,
	call_id character varying,
	dlg_nat_handling boolean,
	force_outbound_proxy boolean,
	outbound_proxy character varying,
	bleg_outbound_proxy_transport_protocol_id smallint,
	aleg_force_outbound_proxy boolean,
	aleg_outbound_proxy character varying,
	aleg_outbound_proxy_transport_protocol_id smallint,
	next_hop character varying,
	next_hop_1st_req boolean,
	aleg_next_hop character varying,
	sdp_filter_type_id integer,
	sdp_filter_list character varying,
	sdp_alines_filter_type_id integer,
	sdp_alines_filter_list character varying,
	enable_session_timer boolean,
	enable_aleg_session_timer boolean,
	session_expires integer,
	minimum_timer integer,
	maximum_timer integer,
	session_refresh_method_id integer,
	accept_501_reply character varying,
	aleg_session_expires integer,
	aleg_minimum_timer integer,
	aleg_maximum_timer integer,
	aleg_session_refresh_method_id integer,
	aleg_accept_501_reply character varying,
	enable_auth boolean,
	auth_user character varying,
	auth_pwd character varying,
	enable_aleg_auth boolean,
	auth_aleg_user character varying,
	auth_aleg_pwd character varying,
	append_headers character varying,
	append_headers_req character varying,
	aleg_append_headers_req character varying,
	disconnect_code_id integer,
	enable_rtprelay boolean,
	rtprelay_interface character varying,
	aleg_rtprelay_interface character varying,
	outbound_interface character varying,
	aleg_outbound_interface character varying,
	contact_displayname character varying,
	contact_user character varying,
	contact_host character varying,
	contact_port smallint,
	try_avoid_transcoding boolean,
	rtprelay_dtmf_filtering boolean,
	rtprelay_dtmf_detection boolean,
	dump_level_id integer,
	time_limit integer,
	resources character varying,
	cache_time integer,
	reply_translations character varying,
	aleg_policy_id integer,
	bleg_policy_id integer,
	aleg_codecs_group_id integer,
	bleg_codecs_group_id integer,
	aleg_single_codec_in_200ok boolean,
	bleg_single_codec_in_200ok boolean,
	ringing_timeout integer,
	global_tag character varying,
	patch_ruri_next_hop boolean,
	rtprelay_force_dtmf_relay boolean,
	aleg_force_symmetric_rtp boolean,
	bleg_force_symmetric_rtp boolean,
	aleg_symmetric_rtp_nonstop boolean,
	bleg_symmetric_rtp_nonstop boolean,
	aleg_symmetric_rtp_ignore_rtcp boolean,
	bleg_symmetric_rtp_ignore_rtcp boolean,
	aleg_rtp_ping boolean,
	bleg_rtp_ping boolean,
	aleg_relay_options boolean,
	bleg_relay_options boolean,
	filter_noaudio_streams boolean,
	aleg_relay_reinvite boolean,
	bleg_relay_reinvite boolean,
	aleg_relay_hold boolean,
	bleg_relay_hold boolean,
	aleg_relay_prack boolean,
	bleg_relay_prack boolean,
	aleg_sdp_c_location_id integer,
	bleg_sdp_c_location_id integer,
	trusted_hdrs_gw boolean,
	aleg_append_headers_reply character varying,
	bleg_sdp_alines_filter_list character varying,
	bleg_sdp_alines_filter_type_id integer,
	dead_rtp_time integer,
	rtp_relay_timestamp_aligning boolean,
	allow_1xx_wo2tag boolean,
	invite_timeout integer,
	srv_failover_timeout integer,
	rtp_force_relay_cn boolean,
	aleg_sensor_id smallint,
	aleg_sensor_level_id smallint,
	bleg_sensor_id smallint,
	bleg_sensor_level_id smallint,
	aleg_dtmf_send_mode_id integer,
	bleg_dtmf_send_mode_id integer,
	aleg_dtmf_recv_modes integer,
	bleg_dtmf_recv_modes integer,
	suppress_early_media boolean,
	aleg_relay_update boolean,
	bleg_relay_update boolean,
	force_one_way_early_media boolean,
	radius_auth_profile_id smallint,
	record_audio boolean,
	aleg_radius_acc_profile_id smallint,
	bleg_radius_acc_profile_id smallint,
	transit_headers_a2b character varying,
	transit_headers_b2a character varying,
	src_number_radius character varying,
	dst_number_radius character varying,
	orig_gw_name character varying,
	customer_auth_name character varying,
	customer_name character varying,
	customer_account_name character varying,
	term_gw_name character varying,
	fake_180_timer smallint,
	aleg_rel100_mode_id smallint,
	bleg_rel100_mode_id smallint,
	bleg_max_30x_redirects smallint,
	bleg_max_transfers smallint,
	aleg_auth_required boolean,
	aleg_rtp_filter_inband_dtmf boolean,
	bleg_rtp_filter_inband_dtmf boolean,
	registration_auth_id integer,
	bleg_protocol_priority_id smallint,
	aleg_media_encryption_mode_id smallint,
	bleg_media_encryption_mode_id smallint,
	aleg_sip_acl character varying[],
	aleg_rtp_acl character varying[],
	bleg_sip_acl character varying[],
	bleg_rtp_acl character varying[],
	registered_aor_id integer,
	customer_id integer,
	vendor_id integer,
	customer_acc_id integer,
	vendor_acc_id integer,
	customer_auth_id integer,
	destination_id bigint,
	destination_prefix character varying,
	dialpeer_id bigint,
	dialpeer_prefix character varying,
	orig_gw_id integer,
	term_gw_id integer,
	routing_group_id integer,
	rateplan_id integer,
	destination_initial_rate numeric,
	destination_next_rate numeric,
	destination_initial_interval integer,
	destination_next_interval integer,
	destination_rate_policy_id smallint,
	dialpeer_initial_interval integer,
	dialpeer_next_interval integer,
	dialpeer_next_rate numeric,
	destination_fee numeric,
	dialpeer_initial_rate numeric,
	dialpeer_fee numeric,
	dst_prefix_in character varying,
	dst_prefix_out character varying,
	src_prefix_in character varying,
	src_prefix_out character varying,
	src_name_in character varying,
	src_name_out character varying,
	diversion_in character varying,
	diversion_out character varying,
	auth_orig_protocol_id smallint,
	auth_orig_ip inet,
	auth_orig_port integer,
	src_network_id integer,
	src_country_id integer,
	dst_country_id integer,
	dst_network_id integer,
	dst_prefix_routing character varying,
	src_prefix_routing character varying,
	routing_plan_id integer,
	lrn character varying,
	lnp_database_id smallint,
	from_domain character varying,
	to_domain character varying,
	ruri_domain character varying,
	src_area_id integer,
	dst_area_id integer,
	routing_tag_ids smallint[],
	pai_in character varying,
	ppi_in character varying,
	privacy_in character varying,
	rpid_in character varying,
	rpid_privacy_in character varying,
	pai_out character varying,
	ppi_out character varying,
	privacy_out character varying,
	rpid_out character varying,
	rpid_privacy_out character varying,
	customer_acc_check_balance boolean,
	destination_reverse_billing boolean,
	dialpeer_reverse_billing boolean,
	customer_auth_external_id bigint,
	customer_external_id bigint,
	vendor_external_id bigint,
	customer_acc_external_id bigint,
	vendor_acc_external_id bigint,
	orig_gw_external_id bigint,
	term_gw_external_id bigint,
	customer_acc_vat numeric
);


--
-- Name: lnp_resolve; Type: TYPE; Schema: switch19; Owner: -
--

CREATE TYPE switch19.lnp_resolve AS (
	lrn text,
	tag text
);


--
-- Name: lua_call_context; Type: TYPE; Schema: switch19; Owner: -
--

CREATE TYPE switch19.lua_call_context AS (
	src_name_in character varying,
	src_number_in character varying,
	dst_number_in character varying,
	src_name_out character varying,
	src_number_out character varying,
	dst_number_out character varying,
	src_name_routing character varying,
	src_number_routing character varying,
	dst_number_routing character varying,
	diversion_in character varying[],
	diversion_routing character varying[],
	diversion_out character varying[]
);


--
-- Name: account_change_iu_tgf(); Type: FUNCTION; Schema: billing; Owner: -
--

CREATE FUNCTION billing.account_change_iu_tgf() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
if TG_OP='UPDATE' then
    if (new.balance_high_threshold is not null and (new.balance > new.balance_high_threshold)) and NOT
        (old.balance_high_threshold is not null AND (old.balance > old.balance_high_threshold)) then
        -- fire high balance
        perform billing.balance_notify('high', 'fire', new);
    end if;

    if (new.balance_low_threshold is not null and (new.balance < new.balance_low_threshold)) and NOT
        (old.balance_low_threshold is not null AND (old.balance < old.balance_low_threshold)) then
        -- fire low balance
        perform billing.balance_notify('low', 'fire', new);
    end if;

    if (new.balance_high_threshold is null OR (new.balance <= new.balance_high_threshold)) and NOT
        (old.balance_high_threshold is null OR (old.balance <= old.balance_high_threshold)) then
        -- clear high balance
        perform billing.balance_notify('high', 'clear', new);
    end if;

    if (new.balance_low_threshold is null OR (new.balance >= new.balance_low_threshold)) and NOT
        (old.balance_low_threshold is null OR (old.balance >= old.balance_low_threshold)) then
        -- clear low balance
        perform billing.balance_notify('low', 'clear', new);
    end if;

elsif TG_OP='INSERT' THEN
    if new.balance_high_threshold is not null and (new.balance > new.balance_high_threshold) then
        -- fire high balance
        perform billing.balance_notify('high', 'fire', new);
    end if;

    if new.balance_low_threshold is not null and (new.balance < new.balance_low_threshold) then
        -- fire low balance
        perform billing.balance_notify('low', 'fire', new);
    end if;
END IF;

return new;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts; Type: TABLE; Schema: billing; Owner: -
--

CREATE TABLE billing.accounts (
    id integer NOT NULL,
    contractor_id integer NOT NULL,
    balance numeric NOT NULL,
    min_balance numeric NOT NULL,
    max_balance numeric NOT NULL,
    name character varying NOT NULL,
    origination_capacity smallint,
    termination_capacity smallint,
    customer_invoice_period_id smallint,
    customer_invoice_template_id integer,
    vendor_invoice_template_id integer,
    next_customer_invoice_at timestamp with time zone,
    next_vendor_invoice_at timestamp with time zone,
    vendor_invoice_period_id smallint,
    send_invoices_to integer[],
    timezone_id integer DEFAULT 1 NOT NULL,
    next_customer_invoice_type_id smallint,
    next_vendor_invoice_type_id smallint,
    balance_high_threshold numeric,
    balance_low_threshold numeric,
    send_balance_notifications_to integer[],
    uuid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    external_id bigint,
    vat numeric DEFAULT 0 NOT NULL,
    total_capacity smallint,
    destination_rate_limit numeric,
    max_call_duration integer,
    CONSTRAINT positive_max_call_duration CHECK ((max_call_duration > 0)),
    CONSTRAINT positive_origination_capacity CHECK ((origination_capacity > 0)),
    CONSTRAINT positive_termination_capacity CHECK ((termination_capacity > 0)),
    CONSTRAINT positive_total_capacity CHECK ((total_capacity > 0))
);


--
-- Name: balance_notify(character varying, character varying, billing.accounts); Type: FUNCTION; Schema: billing; Owner: -
--

CREATE FUNCTION billing.balance_notify(i_type character varying, i_action character varying, i_account billing.accounts) RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
    insert into logs.balance_notifications(direction,action,data) values(i_type,i_action,row_to_json(i_account));
    return;
END;
$$;


--
-- Name: bill_account(integer, numeric); Type: FUNCTION; Schema: billing; Owner: -
--

CREATE FUNCTION billing.bill_account(i_account_id integer, i_amount numeric) RETURNS boolean
    LANGUAGE plpgsql COST 10
    AS $$

DECLARE
i integer;
v_id bigint;
BEGIN
        UPDATE billing.accounts SET balance=balance-i_amount WHERE id=i_account_id;
        RETURN FOUND;
END;
$$;


--
-- Name: bill_cdr(billing.cdr_v2); Type: FUNCTION; Schema: billing; Owner: -
--

CREATE FUNCTION billing.bill_cdr(i_cdr billing.cdr_v2) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER COST 10
    AS $$
DECLARE
BEGIN
    if i_cdr.dialpeer_reverse_billing is not null and i_cdr.dialpeer_reverse_billing=true then
      UPDATE billing.accounts SET balance=balance-i_cdr.vendor_price WHERE id=i_cdr.vendor_acc_id;
    else
      UPDATE billing.accounts SET balance=balance+i_cdr.vendor_price WHERE id=i_cdr.vendor_acc_id;
    end if;

    if i_cdr.destination_reverse_billing is not null and i_cdr.destination_reverse_billing=true then
      UPDATE billing.accounts SET balance=balance+i_cdr.customer_price WHERE id=i_cdr.customer_acc_id;
    else
      UPDATE billing.accounts SET balance=balance-i_cdr.customer_price WHERE id=i_cdr.customer_acc_id;
    end if;

    return;
END;
$$;


--
-- Name: bill_cdr_batch(bigint, text, integer); Type: FUNCTION; Schema: billing; Owner: -
--

CREATE FUNCTION billing.bill_cdr_batch(i_batch_id bigint, i_data text, i_data_version integer DEFAULT 2) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER COST 10
    AS $$
DECLARE
    v_batch_data billing.cdr_v2;
    v_batch_id bigint;
    _j_data json;
BEGIN
    begin
        _j_data:=i_data::json;
    exception
        when others then
            RAISE exception 'billing.bill_cdr_batch: Invalid json payload';
    end;
    
    BEGIN
        insert into billing.cdr_batches(id,size,raw_data) values( i_batch_id, json_array_length(_j_data),i_data) returning id into v_batch_id;
    exception
        WHEN unique_violation then
            RAISE WARNING 'billing.bill_cdr_batch:  Data batch % already billed. Skip it.',i_batch_id;
            return; -- batch already processed;
    end ;

    if i_data_version=2 then
        --- ok;
    else
        RAISE EXCEPTION 'billing.bill_cdr_batch: No logic for this data version';
    end if;
    
    for v_batch_data IN select * from json_populate_recordset(null::billing.cdr_v2,_j_data) LOOP
        if v_batch_data.customer_price >0  or v_batch_data.vendor_price>0 then
            perform billing.bill_cdr(v_batch_data);
        end if;
        -- update runtime statistics

        perform runtime_stats.update_dp(v_batch_data.destination_id,v_batch_data.dialpeer_id,
            v_batch_data.success,v_batch_data.duration
            );
            
        perform runtime_stats.update_gw(v_batch_data.orig_gw_id,v_batch_data.term_gw_id,
            v_batch_data.success,v_batch_data.duration
            );
        
       
    end LOOp;
END;
$$;


--
-- Name: clean_cdr_batch(); Type: FUNCTION; Schema: billing; Owner: -
--

CREATE FUNCTION billing.clean_cdr_batch() RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER COST 10
    AS $$
DECLARE
BEGIN
    DELETE FROM billing.cdr_batches where id not in (SELECT id from billing.cdr_batches order by id desc limit 50);
    return;
END;
$$;


--
-- Name: unbill_cdr(bigint); Type: FUNCTION; Schema: billing; Owner: -
--

CREATE FUNCTION billing.unbill_cdr(i_cdr_id bigint) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER COST 10
    AS $$
DECLARE
    v_cdr class4.cdrs%rowtype;
BEGIN
        SELECT into v_cdr * from class4.cdrs WHERE id=i_cdr_id;
        PERFORM billing.bill_account(v_cdr.vendor_acc_id, +v_cdr.vendor_price::numeric);
        PERFORM billing.bill_account(v_cdr.customer_acc_id, -v_cdr.customer_price::numeric);
        delete from class4.cdrs where id=i_cdr_id;
END;
$$;


--
-- Name: cdrs_i_tgf(); Type: FUNCTION; Schema: class4; Owner: -
--

CREATE FUNCTION class4.cdrs_i_tgf() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
BEGIN  IF ( NEW.time_start >= DATE '2013-01-01' AND NEW.time_start < DATE '2013-02-01' ) THEN INSERT INTO class4.cdrs_201301 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2013-02-01' AND NEW.time_start < DATE '2013-03-01' ) THEN INSERT INTO class4.cdrs_201302 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2013-03-01' AND NEW.time_start < DATE '2013-04-01' ) THEN INSERT INTO class4.cdrs_201303 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2013-06-01' AND NEW.time_start < DATE '2013-07-01' ) THEN INSERT INTO class4.cdrs_201306 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2013-07-01' AND NEW.time_start < DATE '2013-08-01' ) THEN INSERT INTO class4.cdrs_201307 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2013-08-01' AND NEW.time_start < DATE '2013-09-01' ) THEN INSERT INTO class4.cdrs_201308 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2013-09-01' AND NEW.time_start < DATE '2013-10-01' ) THEN INSERT INTO class4.cdrs_201309 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2013-10-01' AND NEW.time_start < DATE '2013-11-01' ) THEN INSERT INTO class4.cdrs_201310 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2013-11-01' AND NEW.time_start < DATE '2013-12-01' ) THEN INSERT INTO class4.cdrs_201311 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2013-12-01' AND NEW.time_start < DATE '2014-01-01' ) THEN INSERT INTO class4.cdrs_201312 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2014-01-01' AND NEW.time_start < DATE '2014-02-01' ) THEN INSERT INTO class4.cdrs_201401 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2014-02-01' AND NEW.time_start < DATE '2014-03-01' ) THEN INSERT INTO class4.cdrs_201402 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2014-03-01' AND NEW.time_start < DATE '2014-04-01' ) THEN INSERT INTO class4.cdrs_201403 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2014-04-01' AND NEW.time_start < DATE '2014-05-01' ) THEN INSERT INTO class4.cdrs_201404 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2014-05-01' AND NEW.time_start < DATE '2014-06-01' ) THEN INSERT INTO class4.cdrs_201405 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2014-06-01' AND NEW.time_start < DATE '2014-07-01' ) THEN INSERT INTO class4.cdrs_201406 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2014-07-01' AND NEW.time_start < DATE '2014-08-01' ) THEN INSERT INTO class4.cdrs_201407 VALUES (NEW.*);
ELSIF ( NEW.time_start >= DATE '2014-08-01' AND NEW.time_start < DATE '2014-09-01' ) THEN INSERT INTO class4.cdrs_201408 VALUES (NEW.*);
 ELSE 
 RAISE EXCEPTION 'class4.cdrs_i_tg: time_start out of range.'; 
 END IF;  
RETURN NULL; 
END; $$;


--
-- Name: accounts_handler(character varying[]); Type: FUNCTION; Schema: data_import; Owner: -
--

CREATE FUNCTION data_import.accounts_handler(i_uf character varying[]) RETURNS void
    LANGUAGE plpgsql COST 6000
    AS $$
DECLARE
BEGIN
    UPDATE data_import.import_accounts as ta 
        SET contractor_id=tb.id
    from public.contractors tb 
    WHERE ta.contractor_name=tb.name;
    
    PERFORM data_import.resolve_object_id('billing.accounts','data_import.import_accounts',i_uf);
END;
$$;


--
-- Name: contractors_handler(character varying[]); Type: FUNCTION; Schema: data_import; Owner: -
--

CREATE FUNCTION data_import.contractors_handler(i_uf character varying[]) RETURNS void
    LANGUAGE plpgsql COST 6000
    AS $$
DECLARE
BEGIN
    PERFORM data_import.resolve_object_id('public.contractors','data_import.import_contractors',i_uf);
END;
$$;


--
-- Name: customers_auth_handler(character varying[]); Type: FUNCTION; Schema: data_import; Owner: -
--

CREATE FUNCTION data_import.customers_auth_handler(i_uf character varying[]) RETURNS void
    LANGUAGE plpgsql COST 6000
    AS $$
DECLARE
BEGIN
UPDATE data_import.import_customers_auth as ta 
    SET routing_group_id=tb.id
    from class4.routing_groups tb 
    WHERE ta.routing_group_name=tb.name;

UPDATE data_import.import_customers_auth as ta 
    SET rateplan_id=tb.id
    from class4.rateplans tb 
    WHERE ta.rateplan_name=tb.name;

UPDATE data_import.import_customers_auth as ta 
    SET gateway_id=tb.id
    from class4.gateways tb 
    WHERE ta.gateway_name=tb.name;
    
UPDATE data_import.import_customers_auth as ta 
    SET account_id=tb.id,
        customer_id=tb.contractor_id
    from billing.accounts tb 
    WHERE ta.account_name=tb.name;

UPDATE data_import.import_customers_auth as ta 
    SET dump_level_id=tb.id
    from class4.dump_level tb 
    WHERE ta.dump_level_name=tb.name;

UPDATE data_import.import_customers_auth as ta 
    SET pop_id=tb.id
    from sys.pops tb 
    WHERE ta.pop_name=tb.name;

UPDATE data_import.import_customers_auth as ta 
    SET diversion_policy_id=tb.id
    from class4.diversion_policy tb 
    WHERE ta.diversion_policy_name=tb.name;
    

UPDATE data_import.import_customers_auth SET src_prefix='' WHERE src_prefix IS NULL;
UPDATE data_import.import_customers_auth SET dst_prefix='' WHERE dst_prefix IS NULL;

PERFORM data_import.resolve_object_id('customers_auth',i_uf);

END;
$$;


--
-- Name: destinations_handler(character varying[]); Type: FUNCTION; Schema: data_import; Owner: -
--

CREATE FUNCTION data_import.destinations_handler(i_uf character varying[]) RETURNS void
    LANGUAGE plpgsql COST 6000
    AS $$
DECLARE
BEGIN
UPDATE data_import.import_destinations as ta 
    SET rateplan_id=tb.id
    from class4.rateplans tb 
    WHERE ta.rateplan_name=tb.name;

UPDATE data_import.import_destinations as ta 
    SET rate_policy_id=tb.id
    from class4.destination_rate_policy tb 
    WHERE ta.rate_policy_name=tb.name;

PERFORM data_import.resolve_object_id('destinations',i_uf);
END;
$$;


--
-- Name: dialpeers_handler(character varying[]); Type: FUNCTION; Schema: data_import; Owner: -
--

CREATE FUNCTION data_import.dialpeers_handler(i_uf character varying[]) RETURNS void
    LANGUAGE plpgsql COST 6000
    AS $$
DECLARE
BEGIN

UPDATE data_import.import_dialpeers as ta 
    SET routing_group_id=tb.id
    from class4.routing_groups tb 
    WHERE ta.routing_group_name=tb.name;

UPDATE data_import.import_dialpeers as ta 
    SET gateway_id=tb.id
    from class4.gateways tb 
    WHERE ta.gateway_name=tb.name;

UPDATE data_import.import_dialpeers as ta 
    SET account_id=tb.id,
        vendor_id=tb.contractor_id
    from billing.accounts tb 
    WHERE ta.account_name=tb.name;

UPDATE data_import.import_dialpeers SET asr_limit=0 WHERE asr_limit IS NULL;
--UPDATE data_import.import_dialpeers SET acd_prefix='' WHERE dst_prefix IS NULL;

PERFORM data_import.resolve_object_id('dialpeers',i_uf);

END;
$$;


--
-- Name: disconnect_policies_handler(character varying[]); Type: FUNCTION; Schema: data_import; Owner: -
--

CREATE FUNCTION data_import.disconnect_policies_handler(i_uf character varying[]) RETURNS void
    LANGUAGE plpgsql COST 6000
    AS $$
DECLARE
BEGIN
    PERFORM data_import.resolve_object_id('class4.disconnect_policy','data_import.import_disconnect_policies',i_uf);
END;
$$;


--
-- Name: gateway_groups_handler(character varying[]); Type: FUNCTION; Schema: data_import; Owner: -
--

CREATE FUNCTION data_import.gateway_groups_handler(i_uf character varying[]) RETURNS void
    LANGUAGE plpgsql COST 6000
    AS $$
DECLARE
BEGIN
    UPDATE data_import.import_gateway_groups as ta 
        SET vendor_id=tb.id
    from public.contractors tb 
    WHERE ta.vendor_name=tb.name;
    
    PERFORM data_import.resolve_object_id('class4.gateway_groups','data_import.import_gateway_groups',i_uf);
END;
$$;


--
-- Name: gateways_handler(character varying[]); Type: FUNCTION; Schema: data_import; Owner: -
--

CREATE FUNCTION data_import.gateways_handler(i_uf character varying[]) RETURNS void
    LANGUAGE plpgsql COST 6000
    AS $$
DECLARE

BEGIN

    UPDATE data_import.import_gateways as ta 
        SET contractor_id=tb.id
    from public.contractors tb 
    WHERE ta.contractor_name=tb.name;

    UPDATE data_import.import_gateways as ta 
        SET session_refresh_method_id=tb.id
    from class4.session_refresh_methods tb 
    WHERE ta.session_refresh_method_name=tb.name;

    UPDATE data_import.import_gateways as ta 
        SET pop_id=tb.id
    from sys.pops tb 
    WHERE ta.pop_name=tb.name;

    UPDATE data_import.import_gateways as ta 
        SET gateway_group_id=tb.id
    from class4.gateway_groups tb 
    WHERE ta.gateway_group_name=tb.name;


    PERFORM data_import.resolve_object_id('class4.gateways','data_import.import_gateways',i_uf);

END;
$$;


--
-- Name: rateplans_handler(character varying[]); Type: FUNCTION; Schema: data_import; Owner: -
--

CREATE FUNCTION data_import.rateplans_handler(i_uf character varying[]) RETURNS void
    LANGUAGE plpgsql COST 6000
    AS $$
DECLARE
BEGIN
PERFORM data_import.resolve_object_id('rateplans',i_uf);
END;
$$;


--
-- Name: registrations_handler(character varying[]); Type: FUNCTION; Schema: data_import; Owner: -
--

CREATE FUNCTION data_import.registrations_handler(i_uf character varying[]) RETURNS void
    LANGUAGE plpgsql COST 6000
    AS $$
DECLARE
BEGIN

UPDATE data_import.import_registrations as ta 
    SET pop_id=tb.id
    from sys.pops tb 
    WHERE ta.pop_name=tb.name;

UPDATE data_import.import_registrations as ta 
    SET node_id=tb.id
    from sys.nodes tb 
    WHERE ta.node_name=tb.name;

PERFORM data_import.resolve_object_id('class4.registrations','data_import.import_registrations',i_uf);

END;
$$;


--
-- Name: resolve_object_id(character varying, character varying[]); Type: FUNCTION; Schema: data_import; Owner: -
--

CREATE FUNCTION data_import.resolve_object_id(i_table_name character varying, i_unique_fields character varying[]) RETURNS void
    LANGUAGE plpgsql COST 6000
    AS $$
DECLARE
v_uf VARCHAR;
v_sql VARCHAR;
v_sql_where VARCHAR := '';
BEGIN
    --check for existence if object id  was set
    v_sql:='UPDATE data_import.import_'||i_table_name||' ta SET o_id = NULL WHERE o_id IS NOT NULL AND o_id NOT IN (SELECT id FROM class4.'||i_table_name||')';
    RAISE NOTICE 'sql = "%"',v_sql;
    EXECUTE v_sql;

    IF array_length(i_unique_fields,1)=0 THEN
        RAISE WARNING 'got empty unique fields array. so return';
        RETURN;
    END IF;
    
    --resolve object id  using given unique fields list
    FOR v_uf IN SELECT * FROM unnest(i_unique_fields)
    LOOP
        v_uf:=trim(both '''' from v_uf);
        IF v_uf = '' THEN
            RAISE WARNING 'empty unique field name. skip it';
            CONTINUE;
        END IF;
        v_sql_where:=v_sql_where||'ta.'||v_uf||'=tb.'||v_uf||' AND ';
    END LOOP;
    v_sql_where:=left(v_sql_where,-5);

    v_sql:= 'UPDATE data_import.import_'||i_table_name||' ta SET o_id = tb.id FROM class4.'||i_table_name||' tb WHERE '||v_sql_where;
    RAISE NOTICE 'sql = "%"',v_sql;
    EXECUTE v_sql;
END;
$$;


--
-- Name: resolve_object_id(character varying, character varying, character varying[]); Type: FUNCTION; Schema: data_import; Owner: -
--

CREATE FUNCTION data_import.resolve_object_id(i_from_table character varying, i_to_table character varying, i_unique_fields character varying[]) RETURNS void
    LANGUAGE plpgsql COST 6000
    AS $$
DECLARE
v_uf VARCHAR;
v_sql VARCHAR;
v_sql_where VARCHAR := '';
BEGIN
    --check for existence if object id  was set
    v_sql:='UPDATE '||i_to_table||' ta SET o_id = NULL WHERE o_id IS NOT NULL AND o_id NOT IN (SELECT id FROM '||i_from_table||')';
    RAISE NOTICE 'sql = "%"',v_sql;
    EXECUTE v_sql;

    IF array_length(i_unique_fields,1)=0 THEN
        RAISE WARNING 'got empty unique fields array. so return';
        RETURN;
    END IF;
    
    --resolve object id  using given unique fields list
    FOR v_uf IN SELECT * FROM unnest(i_unique_fields)
    LOOP
        v_uf:=trim(both '''' from v_uf);
        IF v_uf = '' THEN
            RAISE WARNING 'empty unique field name. skip it';
            CONTINUE;
        END IF;
        v_sql_where:=v_sql_where||'ta.'||v_uf||'=tb.'||v_uf||' AND ';
    END LOOP;
    v_sql_where:=left(v_sql_where,-5);

    v_sql:= 'UPDATE '||i_to_table||' ta SET o_id = tb.id FROM '||i_from_table||' tb WHERE '||v_sql_where;
    RAISE NOTICE 'sql = "%"',v_sql;
    EXECUTE v_sql;
END;
$$;


--
-- Name: routing_groups_handler(character varying[]); Type: FUNCTION; Schema: data_import; Owner: -
--

CREATE FUNCTION data_import.routing_groups_handler(i_uf character varying[]) RETURNS void
    LANGUAGE plpgsql COST 6000
    AS $$
DECLARE
BEGIN
    UPDATE data_import.import_routing_groups as ta 
    SET sorting_id=tb.id
    from class4.sortings tb
    WHERE ta.sorting_name=tb.name;

    PERFORM data_import.resolve_object_id('class4.routing_groups','data_import.import_routing_groups',i_uf);
END;
$$;


--
-- Name: cache_lnp_data(smallint, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: lnp; Owner: -
--

CREATE FUNCTION lnp.cache_lnp_data(i_database_id smallint, i_dst character varying, i_lrn character varying, i_tag character varying, i_data character varying) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
      declare
        v_ttl integer;
        v_expire timestamptz;
      BEGIN
        select into v_ttl lnp_cache_ttl from sys.guiconfig;
        v_expire=now()+v_ttl*'1 minute'::interval;
        begin
          insert into class4.lnp_cache(dst,lrn,created_at,updated_at,expires_at,database_id,data,tag) values( i_dst, i_lrn, now(),now(),v_expire,i_database_id,i_data,i_tag);
        Exception
          when unique_violation then
            update class4.lnp_cache set lrn=i_lrn, updated_at=now(), expires_at=v_expire, data=i_data, tag=i_tag WHERE dst=i_dst and database_id=i_database_id;
        end;
      END;
    $$;


--
-- Name: load_lnp_databases(); Type: FUNCTION; Schema: lnp; Owner: -
--

CREATE FUNCTION lnp.load_lnp_databases() RETURNS TABLE(id smallint, name character varying, database_type character varying, parameters json)
    LANGUAGE plpgsql COST 10
    AS $$
      BEGIN
        RETURN QUERY
          SELECT
            db.id,
            db.name,
            db.database_type,
            params.data
          from class4.lnp_databases db
          join (
            SELECT t.id, 'Lnp::DatabaseThinq' as type, row_to_json(t.*) as data from class4.lnp_databases_thinq t
            UNION ALL
            SELECT t.id, 'Lnp::DatabaseSipRedirect' as type, row_to_json(t.*) as data from class4.lnp_databases_30x_redirect t
            UNION ALL
            SELECT t.id, 'Lnp::DatabaseCsv' as type, row_to_json(t.*) as data from class4.lnp_databases_csv t
            UNION ALL
            SELECT t.id, 'Lnp::DatabaseAlcazar' as type, row_to_json(t.*) as data from class4.lnp_databases_alcazar t
            UNION ALL
            SELECT t.id, 'Lnp::DatabaseCoureAnq' as type, row_to_json(t.*) as data from class4.lnp_databases_coure_anq t
            ) params ON db.database_id=params.id AND db.database_type=params.type;
      END;
      $$;


--
-- Name: rewrite_dst(character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.rewrite_dst(i_dst character varying) RETURNS character varying
    LANGUAGE sql
    AS $_$
        SELECT CASE
                WHEN $1 like 'sip:SKYPE%'
                        THEN regexp_replace($1,'^sip:SKYPE(.*)@(.*)',E'Skype: \\1','i')
                WHEN $1 like 'sip:GTALK%'
                        THEN regexp_replace($1,'^sip:GTALK(.*)@(.*)',E'Gtalk: \\1','i')
                WHEN $1 like 'sip:IAX%'
                        THEN 'IAX'::varchar
                WHEN $1 like 'sip:H323%'
                        THEN 'H323'
                WHEN $1 like 'tel:%'
                        THEN regexp_replace($1,'^tel:(.*)',E'PSTN: \\1','i')
                WHEN $1 like '%@sip.didreseller.com'
                        THEN 'ACF'
                ELSE    $1
                END;
$_$;


--
-- Name: rtest(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.rtest() RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
declare
i INTEGER;
begin
for i in select * from generate_series(1,10)
loop
return next i;
end loop;
return;
end
$$;


--
-- Name: update_dp(bigint, bigint, boolean, integer); Type: FUNCTION; Schema: runtime_stats; Owner: -
--

CREATE FUNCTION runtime_stats.update_dp(i_destination_id bigint, i_dialpeer_id bigint, i_success boolean, i_duration integer) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$

DECLARE
i integer;
v_id bigint;
v_success integer;
v_duration integer;
BEGIN
        if i_destination_id is null or i_dialpeer_id is null or i_destination_id=0 or i_dialpeer_id =0 then
            return;
        end if;

        v_success=i_success::integer;
        IF i_success THEN
                v_duration=i_duration;
        ELSE
                v_duration=0;
        END IF;
        UPDATE runtime_stats.dialpeers_stats SET
                calls=calls+1,calls_success=calls_success+v_success,calls_fail=calls_fail+(1-v_success),
                total_duration=total_duration+v_duration,
                acd=(total_duration+v_duration)::real/(calls+1)::real,
                asr=(calls_success+v_success)::real/(calls+1)::real
        WHERE dialpeer_id=i_dialpeer_id;
        IF NOT FOUND THEN
                -- we can get lost update in this case if row deleted in concurrent transaction. but this is minor issue;
                BEGIN
                        INSERT into runtime_stats.dialpeers_stats(dialpeer_id,calls,calls_success,calls_fail,total_duration,acd,asr)
                        VALUES(i_dialpeer_id,1,v_success,1-v_success,v_duration,v_duration::real/1,v_success::real/1);
                EXCEPTION
                        WHEN unique_violation THEN
                                UPDATE runtime_stats.dialpeers_stats SET
                                calls=calls+1,calls_success=calls_success+v_success,calls_fail=calls_fail+(1-v_success),
                                total_duration=total_duration+v_duration,
                                acd=(total_duration+v_duration)::real/(calls+1)::real,
                                asr=(calls_success+v_success)::real/(calls+1)::real
                                WHERE dialpeer_id=i_dialpeer_id;
                END;
        END IF;
END;
$$;


--
-- Name: update_gw(integer, integer, boolean, integer); Type: FUNCTION; Schema: runtime_stats; Owner: -
--

CREATE FUNCTION runtime_stats.update_gw(i_orig_gw_id integer, i_term_gw_id integer, i_success boolean, i_duration integer) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$

DECLARE
i integer;
v_id bigint;
v_success integer;
v_duration integer;
BEGIN
    if i_term_gw_id is null or i_term_gw_id is null then
        return;
    end if;
        v_success=i_success::integer;
        IF i_success THEN
                v_duration=i_duration;
        ELSE
                v_duration=0;
        END IF;
        UPDATE runtime_stats.gateways_stats SET
                calls=calls+1,calls_success=calls_success+v_success,calls_fail=calls_fail+(1-v_success),
                total_duration=total_duration+v_duration,
                acd=(total_duration+v_duration)::real/(calls+1)::real,
                asr=(calls_success+v_success)::real/(calls+1)::real
        WHERE gateway_id=i_term_gw_id;
        IF NOT FOUND THEN
                -- we can get lost update in this case if row deleted in concurrent transaction. but this is minor issue;
                BEGIN
                        INSERT into runtime_stats.gateways_stats(gateway_id,calls,calls_success,calls_fail,total_duration,acd,asr)
                        VALUES(i_term_gw_id,1,v_success,1-v_success,v_duration,v_duration::real/1,v_success::real/1);
                EXCEPTION
                        WHEN unique_violation THEN
                                UPDATE runtime_stats.gateways_stats SET
                                calls=calls+1,calls_success=calls_success+v_success,calls_fail=calls_fail+(1-v_success),
                                total_duration=total_duration+v_duration,
                                acd=(total_duration+v_duration)::real/(calls+1)::real,
                                asr=(calls_success+v_success)::real/(calls+1)::real
                                WHERE gateway_id=i_term_gw_id;
                END;
        END IF;

END;
$$;


--
-- Name: check_event(integer); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.check_event(i_event_id integer) RETURNS boolean
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  PERFORM id from sys.events where id=i_event_id;
  return FOUND;
END;
$$;


--
-- Name: network_prefixes; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.network_prefixes (
    id integer NOT NULL,
    prefix character varying NOT NULL,
    network_id integer NOT NULL,
    country_id integer,
    number_min_length smallint DEFAULT 0 NOT NULL,
    number_max_length smallint DEFAULT 100 NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v1() NOT NULL
);


--
-- Name: detect_network(character varying); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.detect_network(i_dst character varying) RETURNS sys.network_prefixes
    LANGUAGE plpgsql COST 10
    AS $$
declare
  v_ret sys.network_prefixes%rowtype;
BEGIN

  select into v_ret *
  from sys.network_prefixes
  where prefix_range(prefix)@>prefix_range(i_dst)
  order by length(prefix_range(prefix)) desc
  limit 1;

  return v_ret;
END;
$$;


--
-- Name: init(integer, integer); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.init(i_node_id integer, i_pop_id integer) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
declare
  v_lnp_sockets text[];
  v_timeout integer:=1000;
BEGIN
  select into v_lnp_sockets array_agg('tcp://'||address||':'||port::varchar) from sys.lnp_resolvers;-- where 0=1;
  RAISE WARNING 'Adding LNP resolvers sockets: %. Resolver timeout: %ms', v_lnp_sockets, v_timeout;
  perform yeti_ext.lnp_endpoints_set(ARRAY[]::text[]);
  perform yeti_ext.lnp_endpoints_set(v_lnp_sockets);
  perform yeti_ext.lnp_set_timeout(v_timeout);
  RETURN;
end;
$$;


--
-- Name: lnp_resolve(smallint, character varying); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.lnp_resolve(i_database_id smallint, i_dst character varying) RETURNS character varying
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  return lrn from yeti_ext.lnp_resolve_tagged(i_database_id::int, i_dst);
END;
$$;


--
-- Name: lnp_resolve_tagged(smallint, character varying); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.lnp_resolve_tagged(i_database_id smallint, i_dst character varying) RETURNS switch18.lnp_resolve
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  return yeti_ext.lnp_resolve_tagged(i_database_id::int, i_dst);
END;
$$;


--
-- Name: load_codecs(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_codecs() RETURNS TABLE(o_id integer, o_codec_group_id integer, o_codec_name character varying, o_priority integer, o_dynamic_payload_id integer, o_format_params character varying)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN
  QUERY SELECT
          cgc.id,
          cgc.codec_group_id,
          c.name ,
          cgc.priority,
          cgc.dynamic_payload_type,
          cgc.format_parameters
        from class4.codec_group_codecs cgc
          JOIN class4.codecs c ON c.id=cgc.codec_id
        order by cgc.codec_group_id,cgc.priority desc ,c.name;
END;
$$;


--
-- Name: disconnect_code_namespace; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.disconnect_code_namespace (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: load_disconnect_code_namespace(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_disconnect_code_namespace() RETURNS SETOF class4.disconnect_code_namespace
    LANGUAGE plpgsql COST 10
    AS $$

BEGIN
  RETURN QUERY SELECT * from class4.disconnect_code_namespace order by id;
END;
$$;


--
-- Name: load_disconnect_code_refuse(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_disconnect_code_refuse() RETURNS TABLE(o_id integer, o_code integer, o_reason character varying, o_rewrited_code integer, o_rewrited_reason character varying, o_store_cdr boolean, o_silently_drop boolean)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN
  QUERY SELECT id,code,reason,rewrited_code,rewrited_reason,store_cdr,silently_drop
        from class4.disconnect_code
        where namespace_id=0 or namespace_id=1 OR namespace_id=3 /* radius */
        order by id;
END;
$$;


--
-- Name: load_disconnect_code_refuse_overrides(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_disconnect_code_refuse_overrides() RETURNS TABLE(o_policy_id integer, o_id integer, o_code integer, o_reason character varying, o_rewrited_code integer, o_rewrited_reason character varying, o_store_cdr boolean, o_silently_drop boolean)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN
  QUERY SELECT
            dpc.policy_id,
            dc.id,
            dc.code,
            dc.reason,
            dpc.rewrited_code,
            dpc.rewrited_reason,
            dc.store_cdr,
            dc.silently_drop
        from class4.disconnect_policy_code dpc
          JOIN class4.disconnect_code dc
            ON dc.id=dpc.code_id
        where namespace_id=0 or namespace_id=1 OR namespace_id=3 /* radius */
        order by dpc.id;
END;
$$;


--
-- Name: load_disconnect_code_rerouting(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_disconnect_code_rerouting() RETURNS TABLE(received_code integer, stop_rerouting boolean)
    LANGUAGE plpgsql COST 10
    AS $$

BEGIN
  RETURN QUERY SELECT code,stop_hunting
               from class4.disconnect_code
               WHERE namespace_id=2
               order by id;
END;
$$;


--
-- Name: load_disconnect_code_rerouting_overrides(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_disconnect_code_rerouting_overrides() RETURNS TABLE(policy_id integer, received_code integer, stop_rerouting boolean)
    LANGUAGE plpgsql COST 10
    AS $$

BEGIN
  RETURN QUERY SELECT dpc.policy_id,dc.code,dpc.stop_hunting
               from class4.disconnect_policy_code dpc
                 join class4.disconnect_code dc
                   ON dpc.code_id=dc.id
               WHERE dc.namespace_id=2 -- SIP ONLY
               order by dpc.id;
END;
$$;


--
-- Name: load_disconnect_code_rewrite(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_disconnect_code_rewrite() RETURNS TABLE(o_code integer, o_reason character varying, o_pass_reason_to_originator boolean, o_rewrited_code integer, o_rewrited_reason character varying)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN
  QUERY SELECT code,reason,pass_reason_to_originator,rewrited_code,rewrited_reason
        from class4.disconnect_code
        where namespace_id=2
        order by id;
END;
$$;


--
-- Name: load_disconnect_code_rewrite_overrides(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_disconnect_code_rewrite_overrides() RETURNS TABLE(o_policy_id integer, o_code integer, o_reason character varying, o_pass_reason_to_originator boolean, o_rewrited_code integer, o_rewrited_reason character varying)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN
  QUERY SELECT dpc.policy_id,dc.code,dc.reason,dpc.pass_reason_to_originator,dpc.rewrited_code,dpc.rewrited_reason
        from class4.disconnect_policy_code dpc
          JOIN class4.disconnect_code dc
            ON dc.id=dpc.code_id
        where dc.namespace_id=2 -- ONLY SIP
        order by dpc.id;
END;
$$;


--
-- Name: load_incoming_auth(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_incoming_auth() RETURNS TABLE(id integer, username character varying, password character varying)
    LANGUAGE plpgsql COST 10 ROWS 10
    AS $$
BEGIN
  RETURN QUERY
    SELECT
      gw.id,
      gw.incoming_auth_username,
      gw.incoming_auth_password
    from class4.gateways gw
    where
      gw.enabled and
      gw.incoming_auth_username is not null and gw.incoming_auth_password is not null and
      gw.incoming_auth_username !='' and gw.incoming_auth_password !='';
END;
$$;


--
-- Name: load_interface_in(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_interface_in() RETURNS TABLE(varname character varying, vartype character varying, varformat character varying, varhashkey boolean, varparam character varying)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN QUERY SELECT "name","type","format","hashkey","param" from switch_interface_in order by rank asc;
END;
$$;


--
-- Name: load_interface_out(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_interface_out() RETURNS TABLE(varname character varying, vartype character varying, forcdr boolean, forradius boolean)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN QUERY SELECT "name","type","custom","for_radius" from switch18.switch_interface_out order by rank asc;
END;
$$;


--
-- Name: load_radius_accounting_profiles(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_radius_accounting_profiles() RETURNS TABLE(id smallint, name character varying, server character varying, port integer, secret character varying, timeout smallint, attempts smallint, enable_start_accounting boolean, enable_interim_accounting boolean, enable_stop_accounting boolean, interim_accounting_interval smallint, start_avps json, interim_avps json, stop_avps json)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN QUERY
  SELECT
    p.id,
    p.name,
    p.server,
    p.port,
    p.secret,
    p.timeout,
    p.attempts,
    p.enable_start_accounting,
    p.enable_interim_accounting,
    p.enable_stop_accounting,
    p.interim_accounting_interval,
    (select json_agg(d.*) from class4.radius_accounting_profile_start_attributes d where profile_id=p.id),
    (select json_agg(d.*) from class4.radius_accounting_profile_interim_attributes d where profile_id=p.id),
    (select json_agg(d.*) from class4.radius_accounting_profile_stop_attributes d where profile_id=p.id)
  from class4.radius_accounting_profiles p
  order by p.id;
END;
$$;


--
-- Name: load_radius_profiles(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_radius_profiles() RETURNS TABLE(id smallint, name character varying, server character varying, port integer, secret character varying, reject_on_error boolean, timeout smallint, attempts smallint, avps json)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN QUERY SELECT p.id, p.name, p.server, p.port, p.secret, p.reject_on_error, p.timeout, p.attempts, json_agg(a.*)
               from class4.radius_auth_profiles p
                 JOIN class4.radius_auth_profile_attributes a ON p.id=a.profile_id
               GROUP by p.id, p.name, p.server, p.port, p.secret
               order by p.id;
END;
$$;


--
-- Name: load_registrations_out(integer, integer, integer); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_registrations_out(i_pop_id integer, i_node_id integer, i_registration_id integer DEFAULT NULL::integer) RETURNS TABLE(o_id integer, o_transport_protocol_id smallint, o_domain character varying, o_user character varying, o_display_name character varying, o_auth_user character varying, o_auth_password character varying, o_proxy character varying, o_proxy_transport_protocol_id smallint, o_contact character varying, o_expire integer, o_force_expire boolean, o_retry_delay smallint, o_max_attempts smallint, o_scheme_id smallint)
    LANGUAGE plpgsql COST 10 ROWS 100
    AS $$
BEGIN
  RETURN QUERY
  SELECT
    id,
    transport_protocol_id,
    "domain",
    "username",
    "display_username",
    auth_user,
    auth_password,
    proxy,
    proxy_transport_protocol_id,
    contact,
    expire,
    force_expire,
    retry_delay,
    max_attempts,
    sip_schema_id
  FROM class4.registrations r
  WHERE
    r.enabled and
    (r.pop_id=i_pop_id OR r.pop_id is null) AND
    (r.node_id=i_node_id OR r.node_id IS NULL) AND
    (i_registration_id is null OR id=i_registration_id);

end;
$$;


--
-- Name: resource_type; Type: TABLE; Schema: switch18; Owner: -
--

CREATE TABLE switch18.resource_type (
    id integer NOT NULL,
    name character varying NOT NULL,
    internal_code_id integer NOT NULL,
    action_id integer DEFAULT 1 NOT NULL
);


--
-- Name: load_resource_types(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_resource_types() RETURNS SETOF switch18.resource_type
    LANGUAGE plpgsql COST 10 ROWS 10
    AS $$

BEGIN
  RETURN QUERY SELECT * from resource_type;
END;
$$;


--
-- Name: load_sensor(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_sensor() RETURNS TABLE(o_id smallint, o_name character varying, o_mode_id integer, o_source_interface character varying, o_target_mac macaddr, o_use_routing boolean, o_target_ip inet, o_target_port integer, o_hep_capture_id integer, o_source_ip inet)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN
  QUERY SELECT
          id,
          name,
          mode_id,
          source_interface,
          target_mac macaddr,
          use_routing,
          target_ip,
          target_port,
          hep_capture_id,
          source_ip from sys.sensors;
END;
$$;


--
-- Name: load_sip_options_probers(integer, integer); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_sip_options_probers(i_node_id integer, i_registration_id integer DEFAULT NULL::integer) RETURNS TABLE(id integer, name character varying, ruri_domain character varying, ruri_username character varying, transport_protocol_id smallint, sip_schema_id smallint, from_uri character varying, to_uri character varying, contact_uri character varying, proxy character varying, proxy_transport_protocol_id smallint, "interval" smallint, append_headers character varying, sip_interface_name character varying, auth_username character varying, auth_password character varying, created_at timestamp with time zone, updated_at timestamp with time zone)
    LANGUAGE plpgsql COST 10 ROWS 100
    AS $$
BEGIN
  RETURN QUERY
  SELECT
        o.id,
        o.name,
        o.ruri_domain,
        o.ruri_username,
        o.transport_protocol_id,
        o.sip_schema_id,
        o.from_uri,
        o.to_uri,
        o.contact_uri,
        o.proxy,
        o.proxy_transport_protocol_id,
        o.interval,
        o.append_headers,
        o.sip_interface_name,
        o.auth_username,
        o.auth_password,
        o.created_at,
        o.updated_at
  FROM
    class4.sip_options_probers o
  WHERE
    o.enabled AND
    (
      (o.pop_id is null and o.node_id is null) OR
      (o.pop_id is not null and o.node_id is null and o.pop_id in (select n.pop_id from sys.nodes n where n.id=i_node_id)) OR
      (o.node_id is not null and o.node_id=i_node_id )
    ) AND
    (i_registration_id is null OR o.id=i_registration_id);
end;
$$;


--
-- Name: load_trusted_headers(integer); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.load_trusted_headers(i_node_id integer) RETURNS TABLE(o_name character varying)
    LANGUAGE plpgsql COST 10 ROWS 100
    AS $$
BEGIN
  RETURN QUERY    SELECT "name" from trusted_headers order by rank asc;
end;
$$;


--
-- Name: lua_clear_cache(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.lua_clear_cache() RETURNS void
    LANGUAGE pllua
    AS $$
        if shared.functions_cache ~= nil then
          for k in pairs(shared.functions_cache) do
            shared.functions_cache[k] = nil
          end
        end
      $$;


--
-- Name: lua_exec(integer, switch18.lua_call_context); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.lua_exec(function_id integer, arg switch18.lua_call_context) RETURNS switch18.lua_call_context
    LANGUAGE pllua
    AS $_$
        local ttl = 5 --seconds
        if shared.functions_cache == nil then
          setshared('functions_cache',{})
        end

        local cached_entry = shared.functions_cache[function_id]

        if cached_entry ~= nil then
          if os.time() < cached_entry.expire_at then
            -- execute cached function
            return cached_entry.func()(arg)
          end
          -- clear cache entry because of expired ttl
          shared.functions_cache[function_id] = nil
        end

        -- try to fetch and compile function
        if shared.prepared_user_function_query == nil then
          -- prepare and cache query
          setshared(
            'prepared_user_function_query',
             server.prepare('SELECT source FROM sys.lua_scripts WHERE id=$1',{"integer"}):save()
          )
        end

        local c = shared.prepared_user_function_query:getcursor({function_id}, true)
        local r = c:fetch(1)
        if r == nil then
          error("no user function with id: "..function_id)
        end

        shared.functions_cache[function_id] = {
          func = assert(load('return function(arg) ' .. r[1].source .. ' end')),
          expire_at = os.time()+ttl
        }
        return shared.functions_cache[function_id].func()(arg)

      $_$;


--
-- Name: new_profile(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.new_profile() RETURNS switch18.callprofile62_ty
    LANGUAGE plpgsql COST 10
    AS $_$
DECLARE
  v_ret switch18.callprofile62_ty;
BEGIN
  --v_ret.append_headers:='Max-Forwards: 70\r\n';
  v_ret.enable_auth:=false;
  v_ret.auth_user:='';
  v_ret.auth_pwd:='';
  v_ret.enable_aleg_auth:=false;
  v_ret.auth_aleg_user:='';
  v_ret.auth_aleg_pwd:='';
  v_ret.call_id:='$ci_leg43';
  --    v_ret.contact:='<sip:$Ri>';
  v_ret."from":='$f';
  v_ret."to":='$t';
  v_ret.ruri:='$r';
  v_ret.force_outbound_proxy:=false;
  v_ret.outbound_proxy:='';
  v_ret.next_hop:='';
  --    v_ret.next_hop_for_replies:='';
  v_ret.next_hop_1st_req:=false;

  v_ret.sdp_filter_type_id:=0; -- transparent
  v_ret.sdp_filter_list:='';
  v_ret.sdp_alines_filter_type_id:=0; -- transparent
  v_ret.sdp_alines_filter_list:='';

  v_ret.enable_session_timer:=false;
  v_ret.session_expires ='150';
  v_ret.minimum_timer:='30';
  v_ret.minimum_timer:='60';
  v_ret.session_refresh_method_id:=1;
  v_ret.accept_501_reply:=true;
  v_ret.enable_aleg_session_timer=false;
  v_ret.aleg_session_expires:='180';
  v_ret.aleg_minimum_timer:='30';
  v_ret.aleg_maximum_timer:='60';
  v_ret.aleg_session_refresh_method_id:=1;
  v_ret.aleg_accept_501_reply:='';
  v_ret.reply_translations:='';

  v_ret.enable_rtprelay:=false;

  v_ret.rtprelay_interface:='';
  v_ret.aleg_rtprelay_interface:='';
  v_ret.outbound_interface:='';

  v_ret.try_avoid_transcoding:=FALSE;

  v_ret.rtprelay_dtmf_filtering:=TRUE;
  v_ret.rtprelay_dtmf_detection:=TRUE;
  v_ret.rtprelay_force_dtmf_relay:=FALSE;

  v_ret.patch_ruri_next_hop:=FALSE;

  v_ret.aleg_force_symmetric_rtp:=TRUE;
  v_ret.bleg_force_symmetric_rtp:=TRUE;

  v_ret.aleg_symmetric_rtp_nonstop:=FALSE;
  v_ret.bleg_symmetric_rtp_nonstop:=FALSE;

  v_ret.aleg_symmetric_rtp_ignore_rtcp:=TRUE;
  v_ret.bleg_symmetric_rtp_ignore_rtcp:=TRUE;

  v_ret.aleg_rtp_ping:=FALSE;
  v_ret.bleg_rtp_ping:=FALSE;

  v_ret.aleg_relay_options:=FALSE;
  v_ret.bleg_relay_options:=FALSE;

  v_ret.filter_noaudio_streams:=FALSE;

  /* enum conn_location {
   *   BOTH = 0,
   *   SESSION_ONLY,
   *   MEDIA_ONLY
   * } */
  v_ret.aleg_sdp_c_location_id:=0; --BOTH
  v_ret.bleg_sdp_c_location_id:=0; --BOTH

  v_ret.trusted_hdrs_gw:=FALSE;

  --v_ret.aleg_append_headers_reply:='';
  --v_ret.aleg_append_headers_reply=E'X-VND-INIT-INT:60\r\nX-VND-NEXT-INT:60\r\nX-VND-INIT-RATE:0\r\nX-VND-NEXT-RATE:0\r\nX-VND-CF:0';


  /*
   *  #define FILTER_TYPE_TRANSPARENT     0
   *  #define FILTER_TYPE_BLACKLIST       1
   *  #define FILTER_TYPE_WHITELIST       2
   */
  v_ret.bleg_sdp_alines_filter_list:='';
  v_ret.bleg_sdp_alines_filter_type_id:=0; --FILTER_TYPE_TRANSPARENT

  RETURN v_ret;
END;
$_$;


--
-- Name: preprocess(character varying, character varying, boolean); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.preprocess(i_namespace character varying, i_funcname character varying, i_comment boolean) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
DECLARE
  v_sql VARCHAR;
  v_sql_debug VARCHAR;
  v_sql_release VARCHAR;
  v_dbg_suffix VARCHAR = '_debug';
  v_rel_suffix VARCHAR = '_release';
BEGIN

  -- get function oiriginal definition
  SELECT INTO v_sql
    pg_get_functiondef(p.oid)
  FROM pg_proc p
    JOIN pg_namespace n
      ON p.pronamespace = n.oid
  WHERE n.nspname = i_namespace AND p.proname = i_funcname;

  IF v_sql IS NULL THEN
    RAISE EXCEPTION 'no such fucntion';
  END IF;

  --change function name for debug
  SELECT into v_sql_debug regexp_replace(v_sql,'(CREATE OR REPLACE FUNCTION '||i_namespace||')\.('||i_funcname||')','\1.'||i_funcname||v_dbg_suffix);
  --change function name for release
  SELECT into v_sql_release regexp_replace(v_sql,'(CREATE OR REPLACE FUNCTION '||i_namespace||')\.('||i_funcname||')','\1.'||i_funcname||v_rel_suffix);

  IF i_comment THEN
    --comment debug stuff in release code
    SELECT into v_sql_release regexp_replace(v_sql_release,'(/\*dbg{\*/)(.*?)(/\*}dbg\*/)','\1/*\2*/\3','g');
    --comment release stuff in debug code
    SELECT into v_sql_debug regexp_replace(v_sql_debug,'(/\*rel{\*/)(.*?)(/\*}rel\*/)','\1/*\2*/\3','g');
  ELSE
    --remove debug stuff from release code
    SELECT into v_sql_release regexp_replace(v_sql_release,'/\*dbg{\*/.*?/\*}dbg\*/','','g');
    --remove release stuff from debug code
    SELECT into v_sql_debug regexp_replace(v_sql_debug,'/\*rel{\*/.*?/\*}rel\*/','','g');
  END IF;

  --RAISE NOTICE 'v_sql = "%"', v_sql;
  --RAISE NOTICE 'v_sql_debug = "%"', v_sql_debug;
  --RAISE NOTICE 'v_sql_release = "%"', v_sql_release;

  -- CREATE OR REPLACE FUNCTION  debug version
  EXECUTE v_sql_debug;
  -- CREATE OR REPLACE FUNCTION  release version
  EXECUTE v_sql_release;

END;
$$;


--
-- Name: preprocess_all(); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.preprocess_all() RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
DECLARE
  v_sql VARCHAR;
  v_sql_debug VARCHAR;
  v_sql_release VARCHAR;
  v_dbg_suffix VARCHAR = '_debug';
  v_rel_suffix VARCHAR = '_release';
BEGIN
  PERFORM preprocess('switch18','route',false);
  PERFORM preprocess('switch18','process_dp',false);
  PERFORM preprocess('switch18','process_gw',false);
END;
$$;


--
-- Name: destinations; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.destinations (
    id bigint NOT NULL,
    enabled boolean NOT NULL,
    prefix character varying NOT NULL,
    rate_group_id integer NOT NULL,
    next_rate numeric NOT NULL,
    connect_fee numeric DEFAULT 0.0,
    initial_interval integer DEFAULT 1 NOT NULL,
    next_interval integer DEFAULT 1 NOT NULL,
    dp_margin_fixed numeric DEFAULT 0 NOT NULL,
    dp_margin_percent numeric DEFAULT 0 NOT NULL,
    rate_policy_id integer DEFAULT 1 NOT NULL,
    initial_rate numeric NOT NULL,
    reject_calls boolean DEFAULT false NOT NULL,
    use_dp_intervals boolean DEFAULT false NOT NULL,
    valid_from timestamp with time zone NOT NULL,
    valid_till timestamp with time zone NOT NULL,
    profit_control_mode_id smallint,
    network_prefix_id integer,
    external_id bigint,
    asr_limit real DEFAULT 0 NOT NULL,
    acd_limit real DEFAULT 0 NOT NULL,
    short_calls_limit real DEFAULT 0 NOT NULL,
    quality_alarm boolean DEFAULT false NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    dst_number_min_length smallint DEFAULT 0 NOT NULL,
    dst_number_max_length smallint DEFAULT 100 NOT NULL,
    reverse_billing boolean DEFAULT false NOT NULL,
    routing_tag_ids smallint[] DEFAULT '{}'::smallint[] NOT NULL,
    routing_tag_mode_id smallint DEFAULT 0 NOT NULL,
    CONSTRAINT destinations_dst_number_max_length CHECK ((dst_number_max_length >= 0)),
    CONSTRAINT destinations_dst_number_min_length CHECK ((dst_number_min_length >= 0)),
    CONSTRAINT destinations_non_zero_initial_interval CHECK ((initial_interval > 0)),
    CONSTRAINT destinations_non_zero_next_interval CHECK ((next_interval > 0))
);


--
-- Name: dialpeers; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.dialpeers (
    id bigint NOT NULL,
    enabled boolean NOT NULL,
    prefix character varying NOT NULL,
    src_rewrite_rule character varying,
    dst_rewrite_rule character varying,
    acd_limit real DEFAULT 0 NOT NULL,
    asr_limit real DEFAULT 0.0 NOT NULL,
    gateway_id integer,
    routing_group_id integer NOT NULL,
    next_rate numeric NOT NULL,
    connect_fee numeric DEFAULT 0.0 NOT NULL,
    vendor_id integer NOT NULL,
    account_id integer NOT NULL,
    src_rewrite_result character varying,
    dst_rewrite_result character varying,
    locked boolean DEFAULT false NOT NULL,
    priority integer DEFAULT 100 NOT NULL,
    capacity smallint,
    lcr_rate_multiplier numeric DEFAULT 1 NOT NULL,
    initial_rate numeric NOT NULL,
    initial_interval integer DEFAULT 1 NOT NULL,
    next_interval integer DEFAULT 1 NOT NULL,
    valid_from timestamp with time zone NOT NULL,
    valid_till timestamp with time zone NOT NULL,
    gateway_group_id integer,
    force_hit_rate double precision,
    network_prefix_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    short_calls_limit real DEFAULT 1 NOT NULL,
    current_rate_id bigint,
    external_id bigint,
    src_name_rewrite_rule character varying,
    src_name_rewrite_result character varying,
    exclusive_route boolean DEFAULT false NOT NULL,
    dst_number_min_length smallint DEFAULT 0 NOT NULL,
    dst_number_max_length smallint DEFAULT 100 NOT NULL,
    reverse_billing boolean DEFAULT false NOT NULL,
    routing_tag_ids smallint[] DEFAULT '{}'::smallint[] NOT NULL,
    routing_tag_mode_id smallint DEFAULT 0 NOT NULL,
    routeset_discriminator_id smallint DEFAULT 1 NOT NULL,
    CONSTRAINT dialpeers_dst_number_max_length CHECK ((dst_number_max_length >= 0)),
    CONSTRAINT dialpeers_dst_number_min_length CHECK ((dst_number_min_length >= 0)),
    CONSTRAINT dialpeers_non_zero_initial_interval CHECK ((initial_interval > 0)),
    CONSTRAINT dialpeers_non_zero_next_interval CHECK ((next_interval > 0))
);


--
-- Name: gateways; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.gateways (
    id integer NOT NULL,
    host character varying,
    port integer,
    src_rewrite_rule character varying,
    dst_rewrite_rule character varying,
    acd_limit real DEFAULT 0 NOT NULL,
    asr_limit real DEFAULT 0 NOT NULL,
    enabled boolean NOT NULL,
    name character varying NOT NULL,
    auth_enabled boolean DEFAULT false NOT NULL,
    auth_user character varying,
    auth_password character varying,
    term_outbound_proxy character varying,
    term_next_hop_for_replies boolean DEFAULT false NOT NULL,
    term_use_outbound_proxy boolean DEFAULT false NOT NULL,
    contractor_id integer NOT NULL,
    allow_termination boolean DEFAULT true NOT NULL,
    allow_origination boolean DEFAULT true NOT NULL,
    anonymize_sdp boolean DEFAULT true NOT NULL,
    proxy_media boolean DEFAULT true NOT NULL,
    transparent_seqno boolean DEFAULT false NOT NULL,
    transparent_ssrc boolean DEFAULT false NOT NULL,
    sst_enabled boolean DEFAULT false,
    sst_minimum_timer integer DEFAULT 50 NOT NULL,
    sst_maximum_timer integer DEFAULT 50 NOT NULL,
    sst_accept501 boolean DEFAULT true NOT NULL,
    session_refresh_method_id integer DEFAULT 3 NOT NULL,
    sst_session_expires integer DEFAULT 50,
    term_force_outbound_proxy boolean DEFAULT false NOT NULL,
    locked boolean DEFAULT false NOT NULL,
    codecs_payload_order character varying DEFAULT ''::character varying,
    codecs_prefer_transcoding_for character varying DEFAULT ''::character varying,
    src_rewrite_result character varying,
    dst_rewrite_result character varying,
    termination_capacity smallint,
    term_next_hop character varying,
    orig_next_hop character varying,
    orig_append_headers_req character varying,
    term_append_headers_req character varying,
    dialog_nat_handling boolean DEFAULT true NOT NULL,
    orig_force_outbound_proxy boolean DEFAULT false NOT NULL,
    orig_use_outbound_proxy boolean DEFAULT false NOT NULL,
    orig_outbound_proxy character varying,
    prefer_existing_codecs boolean DEFAULT true NOT NULL,
    force_symmetric_rtp boolean DEFAULT true NOT NULL,
    transparent_dialog_id boolean DEFAULT false NOT NULL,
    sdp_alines_filter_type_id integer DEFAULT 0 NOT NULL,
    sdp_alines_filter_list character varying,
    gateway_group_id integer,
    orig_disconnect_policy_id integer,
    term_disconnect_policy_id integer,
    diversion_policy_id integer DEFAULT 1 NOT NULL,
    diversion_rewrite_rule character varying,
    diversion_rewrite_result character varying,
    src_name_rewrite_rule character varying,
    src_name_rewrite_result character varying,
    priority integer DEFAULT 100 NOT NULL,
    pop_id integer,
    codec_group_id integer DEFAULT 1 NOT NULL,
    single_codec_in_200ok boolean DEFAULT false NOT NULL,
    ringing_timeout integer,
    symmetric_rtp_nonstop boolean DEFAULT false NOT NULL,
    symmetric_rtp_ignore_rtcp boolean DEFAULT false NOT NULL,
    resolve_ruri boolean DEFAULT false NOT NULL,
    force_dtmf_relay boolean DEFAULT false NOT NULL,
    relay_options boolean DEFAULT false NOT NULL,
    rtp_ping boolean DEFAULT false NOT NULL,
    filter_noaudio_streams boolean DEFAULT false NOT NULL,
    relay_reinvite boolean DEFAULT false NOT NULL,
    sdp_c_location_id integer DEFAULT 2 NOT NULL,
    auth_from_user character varying,
    auth_from_domain character varying,
    relay_hold boolean DEFAULT false NOT NULL,
    rtp_timeout integer DEFAULT 30 NOT NULL,
    relay_prack boolean DEFAULT false NOT NULL,
    rtp_relay_timestamp_aligning boolean DEFAULT false NOT NULL,
    allow_1xx_without_to_tag boolean DEFAULT false NOT NULL,
    sip_timer_b integer DEFAULT 8000 NOT NULL,
    dns_srv_failover_timer integer DEFAULT 2000 NOT NULL,
    rtp_force_relay_cn boolean DEFAULT true NOT NULL,
    sensor_id smallint,
    sensor_level_id smallint DEFAULT 1 NOT NULL,
    dtmf_send_mode_id smallint DEFAULT 1 NOT NULL,
    dtmf_receive_mode_id smallint DEFAULT 1 NOT NULL,
    relay_update boolean DEFAULT false NOT NULL,
    suppress_early_media boolean DEFAULT false NOT NULL,
    send_lnp_information boolean DEFAULT false NOT NULL,
    short_calls_limit real DEFAULT 1 NOT NULL,
    origination_capacity smallint,
    force_one_way_early_media boolean DEFAULT false NOT NULL,
    radius_accounting_profile_id smallint,
    transit_headers_from_origination character varying,
    transit_headers_from_termination character varying,
    external_id bigint,
    fake_180_timer smallint,
    sip_interface_name character varying,
    rtp_interface_name character varying,
    transport_protocol_id smallint DEFAULT 1 NOT NULL,
    term_proxy_transport_protocol_id smallint DEFAULT 1 NOT NULL,
    orig_proxy_transport_protocol_id smallint DEFAULT 1 NOT NULL,
    rel100_mode_id smallint DEFAULT 4 NOT NULL,
    is_shared boolean DEFAULT false NOT NULL,
    max_30x_redirects smallint DEFAULT 0 NOT NULL,
    max_transfers smallint DEFAULT 0 NOT NULL,
    incoming_auth_username character varying,
    incoming_auth_password character varying,
    rx_inband_dtmf_filtering_mode_id smallint DEFAULT 1 NOT NULL,
    tx_inband_dtmf_filtering_mode_id smallint DEFAULT 1 NOT NULL,
    weight smallint DEFAULT 100 NOT NULL,
    sip_schema_id smallint DEFAULT 1 NOT NULL,
    network_protocol_priority_id smallint DEFAULT 0 NOT NULL,
    media_encryption_mode_id smallint DEFAULT 0 NOT NULL,
    preserve_anonymous_from_domain boolean DEFAULT false NOT NULL,
    termination_src_numberlist_id smallint,
    termination_dst_numberlist_id smallint,
    lua_script_id smallint,
    use_registered_aor boolean DEFAULT false NOT NULL
);


--
-- Name: process_dp(switch18.callprofile62_ty, class4.destinations, class4.dialpeers, billing.accounts, class4.gateways, billing.accounts, integer, boolean, integer); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.process_dp(i_profile switch18.callprofile62_ty, i_destination class4.destinations, i_dp class4.dialpeers, i_customer_acc billing.accounts, i_customer_gw class4.gateways, i_vendor_acc billing.accounts, i_pop_id integer, i_send_billing_information boolean, i_max_call_length integer) RETURNS SETOF switch18.callprofile62_ty
    LANGUAGE plpgsql STABLE SECURITY DEFINER COST 10000
    AS $$
DECLARE
  /*dbg{*/
  v_start timestamp;
  v_end timestamp;
  /*}dbg*/
  v_gw class4.gateways%rowtype;
  v_gateway_group class4.gateway_groups%rowtype;
BEGIN
  /*dbg{*/
  v_start:=now();
  --RAISE NOTICE 'process_dp in: %',i_profile;5
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> process-DP. Found dialpeer: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(i_dp,true);
  /*}dbg*/

  --RAISE NOTICE 'process_dp dst: %',i_destination;
  if i_dp.gateway_id is null then /* termination to gw group */
    select into v_gateway_group * from  class4.gateway_groups where id=i_dp.gateway_group_id;
    IF v_gateway_group.balancing_mode_id=2 THEN
      /*rel{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id and
          cg.contractor_id=i_dp.vendor_id and
          cg.enabled
        ORDER BY
          cg.pop_id=i_pop_id desc,
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
        LOOP
        return query select * from process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,
                                                      i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}rel*/
      /*dbg{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id AND
          cg.enabled
        ORDER BY
          cg.pop_id=i_pop_id desc,
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
        IF v_gw.contractor_id!=i_dp.vendor_id THEN
          RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Skip gateway';
          continue;
        end if;
        return query select * from process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,
                                                    i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}dbg*/
    elsif v_gateway_group.balancing_mode_id=1 then
      /*rel{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id AND
          cg.contractor_id=i_dp.vendor_id AND
          cg.enabled
        ORDER BY
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
        return query select * from process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,
                                                      i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}rel*/
      /*dbg{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id and
          cg.enabled
        ORDER BY
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
        IF v_gw.contractor_id!=i_dp.vendor_id AND NOT v_gw.is_shared THEN
          RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Skip gateway';
          continue;
        end if;
        return query select * from process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,
                                                    i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}dbg*/

    elsif v_gateway_group.balancing_mode_id=3 THEN
      /*rel{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
	  (cg.pop_id is null OR cg.pop_id=i_pop_id) and
          cg.gateway_group_id=i_dp.gateway_group_id and
          cg.contractor_id=i_dp.vendor_id and
          cg.enabled
        ORDER BY
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
        LOOP
        return query select * from process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,
                                                      i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}rel*/
      /*dbg{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id AND
          cg.enabled
        ORDER BY
          cg.pop_id=i_pop_id desc,
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
	IF v_gw.pop_id is not null and v_gw.pop_id!=i_pop_id THEN
          RAISE WARNING 'process_dp: Gateway POP is %, call pop %, skipping.',v_gw.pop_id, i_pop_id;
          continue;
        end if;
        IF v_gw.contractor_id!=i_dp.vendor_id THEN
          RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Skip gateway';
          continue;
        end if;
        return query select * from process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,
                                                    i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}dbg*/
    end if;
  else
    select into v_gw * from class4.gateways cg where cg.id=i_dp.gateway_id and cg.enabled;
    if FOUND THEN
      IF v_gw.contractor_id!=i_dp.vendor_id AND NOT v_gw.is_shared THEN
        RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Stop processing';
        return;
      end if;

      /*rel{*/
      return query select * from
          process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,i_customer_gw, i_vendor_acc, v_gw, i_send_billing_information,i_max_call_length);
      /*}rel*/
      /*dbg{*/
      return query select * from
          process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,i_customer_gw, i_vendor_acc, v_gw, i_send_billing_information,i_max_call_length);
      /*}dbg*/
    else
      return;
    end if;
  end if;
END;
$$;


--
-- Name: process_dp_debug(switch18.callprofile62_ty, class4.destinations, class4.dialpeers, billing.accounts, class4.gateways, billing.accounts, integer, boolean, integer); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.process_dp_debug(i_profile switch18.callprofile62_ty, i_destination class4.destinations, i_dp class4.dialpeers, i_customer_acc billing.accounts, i_customer_gw class4.gateways, i_vendor_acc billing.accounts, i_pop_id integer, i_send_billing_information boolean, i_max_call_length integer) RETURNS SETOF switch18.callprofile62_ty
    LANGUAGE plpgsql STABLE SECURITY DEFINER COST 10000
    AS $$
DECLARE
  /*dbg{*/
  v_start timestamp;
  v_end timestamp;
  /*}dbg*/
  v_gw class4.gateways%rowtype;
  v_gateway_group class4.gateway_groups%rowtype;
BEGIN
  /*dbg{*/
  v_start:=now();
  --RAISE NOTICE 'process_dp in: %',i_profile;5
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> process-DP. Found dialpeer: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(i_dp,true);
  /*}dbg*/

  --RAISE NOTICE 'process_dp dst: %',i_destination;
  if i_dp.gateway_id is null then /* termination to gw group */
    select into v_gateway_group * from  class4.gateway_groups where id=i_dp.gateway_group_id;
    IF v_gateway_group.balancing_mode_id=2 THEN
      
      /*dbg{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id AND
          cg.enabled
        ORDER BY
          cg.pop_id=i_pop_id desc,
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
        IF v_gw.contractor_id!=i_dp.vendor_id THEN
          RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Skip gateway';
          continue;
        end if;
        return query select * from process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,
                                                    i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}dbg*/
    elsif v_gateway_group.balancing_mode_id=1 then
      
      /*dbg{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id and
          cg.enabled
        ORDER BY
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
        IF v_gw.contractor_id!=i_dp.vendor_id AND NOT v_gw.is_shared THEN
          RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Skip gateway';
          continue;
        end if;
        return query select * from process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,
                                                    i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}dbg*/

    elsif v_gateway_group.balancing_mode_id=3 THEN
      
      /*dbg{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id AND
          cg.enabled
        ORDER BY
          cg.pop_id=i_pop_id desc,
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
	IF v_gw.pop_id is not null and v_gw.pop_id!=i_pop_id THEN
          RAISE WARNING 'process_dp: Gateway POP is %, call pop %, skipping.',v_gw.pop_id, i_pop_id;
          continue;
        end if;
        IF v_gw.contractor_id!=i_dp.vendor_id THEN
          RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Skip gateway';
          continue;
        end if;
        return query select * from process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,
                                                    i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}dbg*/
    end if;
  else
    select into v_gw * from class4.gateways cg where cg.id=i_dp.gateway_id and cg.enabled;
    if FOUND THEN
      IF v_gw.contractor_id!=i_dp.vendor_id AND NOT v_gw.is_shared THEN
        RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Stop processing';
        return;
      end if;

      
      /*dbg{*/
      return query select * from
          process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,i_customer_gw, i_vendor_acc, v_gw, i_send_billing_information,i_max_call_length);
      /*}dbg*/
    else
      return;
    end if;
  end if;
END;
$$;


--
-- Name: process_dp_release(switch18.callprofile62_ty, class4.destinations, class4.dialpeers, billing.accounts, class4.gateways, billing.accounts, integer, boolean, integer); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.process_dp_release(i_profile switch18.callprofile62_ty, i_destination class4.destinations, i_dp class4.dialpeers, i_customer_acc billing.accounts, i_customer_gw class4.gateways, i_vendor_acc billing.accounts, i_pop_id integer, i_send_billing_information boolean, i_max_call_length integer) RETURNS SETOF switch18.callprofile62_ty
    LANGUAGE plpgsql STABLE SECURITY DEFINER COST 10000
    AS $$
DECLARE
  
  v_gw class4.gateways%rowtype;
  v_gateway_group class4.gateway_groups%rowtype;
BEGIN
  

  --RAISE NOTICE 'process_dp dst: %',i_destination;
  if i_dp.gateway_id is null then /* termination to gw group */
    select into v_gateway_group * from  class4.gateway_groups where id=i_dp.gateway_group_id;
    IF v_gateway_group.balancing_mode_id=2 THEN
      /*rel{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id and
          cg.contractor_id=i_dp.vendor_id and
          cg.enabled
        ORDER BY
          cg.pop_id=i_pop_id desc,
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
        LOOP
        return query select * from process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,
                                                      i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}rel*/
      
    elsif v_gateway_group.balancing_mode_id=1 then
      /*rel{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id AND
          cg.contractor_id=i_dp.vendor_id AND
          cg.enabled
        ORDER BY
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
        return query select * from process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,
                                                      i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}rel*/
      

    elsif v_gateway_group.balancing_mode_id=3 THEN
      /*rel{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
	  (cg.pop_id is null OR cg.pop_id=i_pop_id) and
          cg.gateway_group_id=i_dp.gateway_group_id and
          cg.contractor_id=i_dp.vendor_id and
          cg.enabled
        ORDER BY
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
        LOOP
        return query select * from process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,
                                                      i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}rel*/
      
    end if;
  else
    select into v_gw * from class4.gateways cg where cg.id=i_dp.gateway_id and cg.enabled;
    if FOUND THEN
      IF v_gw.contractor_id!=i_dp.vendor_id AND NOT v_gw.is_shared THEN
        RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Stop processing';
        return;
      end if;

      /*rel{*/
      return query select * from
          process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,i_customer_gw, i_vendor_acc, v_gw, i_send_billing_information,i_max_call_length);
      /*}rel*/
      
    else
      return;
    end if;
  end if;
END;
$$;


--
-- Name: process_gw(switch18.callprofile62_ty, class4.destinations, class4.dialpeers, billing.accounts, class4.gateways, billing.accounts, class4.gateways, boolean, integer); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.process_gw(i_profile switch18.callprofile62_ty, i_destination class4.destinations, i_dp class4.dialpeers, i_customer_acc billing.accounts, i_customer_gw class4.gateways, i_vendor_acc billing.accounts, i_vendor_gw class4.gateways, i_send_billing_information boolean, i_max_call_length integer) RETURNS switch18.callprofile62_ty
    LANGUAGE plpgsql STABLE SECURITY DEFINER COST 100000
    AS $_$
DECLARE
  i integer;
  v_customer_allowtime real;
  v_vendor_allowtime real;
  v_route_found boolean:=false;
  v_from_user varchar;
  v_from_domain varchar;
  v_schema varchar;
  v_termination_numberlist class4.numberlists%rowtype;
  v_termination_numberlist_item class4.numberlist_items%rowtype;
  v_termination_numberlist_size integer;
  /*dbg{*/
  v_start timestamp;
  v_end timestamp;
  /*}dbg*/
BEGIN
  /*dbg{*/
  v_start:=now();
  --RAISE NOTICE 'process_dp in: %',i_profile;
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. Found dialpeer: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(i_dp,true);
  /*}dbg*/

  --RAISE NOTICE 'process_dp dst: %',i_destination;

  i_profile.destination_id:=i_destination.id;
  --    i_profile.destination_initial_interval:=i_destination.initial_interval;
  i_profile.destination_fee:=i_destination.connect_fee::varchar;
  --i_profile.destination_next_interval:=i_destination.next_interval;
  i_profile.destination_rate_policy_id:=i_destination.rate_policy_id;

  --vendor account capacity limit;
  if i_vendor_acc.termination_capacity is not null then
    i_profile.resources:=i_profile.resources||'2:'||i_dp.account_id::varchar||':'||i_vendor_acc.termination_capacity::varchar||':1;';
  end if;

  if i_vendor_acc.total_capacity is not null then
    i_profile.resources:=i_profile.resources||'7:'||i_dp.account_id::varchar||':'||i_vendor_acc.total_capacity::varchar||':1;';
  end if;


  -- dialpeer account capacity limit;
  if i_dp.capacity is not null then
    i_profile.resources:=i_profile.resources||'6:'||i_dp.id::varchar||':'||i_dp.capacity::varchar||':1;';
  end if;

  /* */
  i_profile.dialpeer_id=i_dp.id;
  i_profile.dialpeer_prefix=i_dp.prefix;
  i_profile.dialpeer_next_rate=i_dp.next_rate::varchar;
  i_profile.dialpeer_initial_rate=i_dp.initial_rate::varchar;
  i_profile.dialpeer_initial_interval=i_dp.initial_interval;
  i_profile.dialpeer_next_interval=i_dp.next_interval;
  i_profile.dialpeer_fee=i_dp.connect_fee::varchar;
  i_profile.dialpeer_reverse_billing=i_dp.reverse_billing;
  i_profile.vendor_id=i_dp.vendor_id;
  i_profile.vendor_acc_id=i_dp.account_id;
  i_profile.term_gw_id=i_vendor_gw.id;

  i_profile.orig_gw_name=i_customer_gw."name";
  i_profile.orig_gw_external_id=i_customer_gw.external_id;

  i_profile.term_gw_name=i_vendor_gw."name";
  i_profile.term_gw_external_id=i_vendor_gw.external_id;

  i_profile.customer_account_name=i_customer_acc."name";

  i_profile.routing_group_id:=i_dp.routing_group_id;

  if i_send_billing_information then
    i_profile.aleg_append_headers_reply=E'X-VND-INIT-INT:'||i_profile.dialpeer_initial_interval||E'\r\nX-VND-NEXT-INT:'||i_profile.dialpeer_next_interval||E'\r\nX-VND-INIT-RATE:'||i_profile.dialpeer_initial_rate||E'\r\nX-VND-NEXT-RATE:'||i_profile.dialpeer_next_rate||E'\r\nX-VND-CF:'||i_profile.dialpeer_fee;
  end if;

  if i_destination.use_dp_intervals THEN
    i_profile.destination_initial_interval:=i_dp.initial_interval;
    i_profile.destination_next_interval:=i_dp.next_interval;
  ELSE
    i_profile.destination_initial_interval:=i_destination.initial_interval;
    i_profile.destination_next_interval:=i_destination.next_interval;
  end if;

  CASE i_profile.destination_rate_policy_id
    WHEN 1 THEN -- fixed
    i_profile.destination_next_rate:=i_destination.next_rate::varchar;
    i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    WHEN 2 THEN -- based on dialpeer
    i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    WHEN 3 THEN -- min
    IF i_dp.next_rate >= i_destination.next_rate THEN
      i_profile.destination_next_rate:=i_destination.next_rate::varchar; -- FIXED least
      i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    ELSE
      i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar; -- DYNAMIC
      i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    END IF;
    WHEN 4 THEN -- max
    IF i_dp.next_rate < i_destination.next_rate THEN
      i_profile.destination_next_rate:=i_destination.next_rate::varchar; --FIXED
      i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    ELSE
      i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar; -- DYNAMIC
      i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    END IF;
  ELSE
  --
  end case;



  /* time limiting START */
  --SELECT INTO STRICT v_c_acc * FROM billing.accounts  WHERE id=v_customer_auth.account_id;
  --SELECT INTO STRICT v_v_acc * FROM billing.accounts  WHERE id=v_dialpeer.account_id;

  IF (i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee <0 THEN
    v_customer_allowtime:=0;
    i_profile.disconnect_code_id=8000; --Not enough customer balance
    RETURN i_profile;
  ELSIF (i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee-i_destination.initial_rate/60*i_destination.initial_interval<0 THEN
    v_customer_allowtime:=i_destination.initial_interval;
    i_profile.disconnect_code_id=8000; --Not enough customer balance
    RETURN i_profile;
  ELSIF i_destination.next_rate!=0 AND i_destination.next_interval!=0 THEN
    v_customer_allowtime:=i_destination.initial_interval+
                          LEAST(FLOOR(((i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee-i_destination.initial_rate/60*i_destination.initial_interval)/
                                      (i_destination.next_rate/60*i_destination.next_interval)),24e6)::integer*i_destination.next_interval;
  ELSE /* DST rates is 0, allowing maximum call length */
    v_customer_allowtime:=COALESCE(i_customer_acc.max_call_duration, i_max_call_length);
  end IF;


  IF (i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee <0 THEN /* No enough balance, skipping this profile */
    v_vendor_allowtime:=0;
    return null;
  ELSIF (i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee-i_dp.initial_rate/60*i_dp.initial_interval<0 THEN /* No enough balance even for first billing interval - skipping this profile */
    return null;
  ELSIF i_dp.next_rate!=0 AND i_dp.next_interval!=0 THEN /* DP rates is not zero, calculating limit */
    v_vendor_allowtime:=i_dp.initial_interval+
                        LEAST(FLOOR(((i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee-i_dp.initial_rate/60*i_dp.initial_interval)/
                                    (i_dp.next_rate/60*i_dp.next_interval)),24e6)::integer*i_dp.next_interval;
  ELSE /* DP rates is 0, allowing maximum call length */
    v_vendor_allowtime:=COALESCE(i_vendor_acc.max_call_duration, i_max_call_length);
  end IF;

  i_profile.time_limit=LEAST(
    COALESCE(i_customer_acc.max_call_duration, i_max_call_length),
    COALESCE(i_vendor_acc.max_call_duration, i_max_call_length),
    v_vendor_allowtime,
    v_customer_allowtime
  )::integer;


  /* number rewriting _After_ routing */
  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. Before rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/
  i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(i_profile.dst_prefix_out,i_dp.dst_rewrite_rule,i_dp.dst_rewrite_result);
  i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(i_profile.src_prefix_out,i_dp.src_rewrite_rule,i_dp.src_rewrite_result);
  i_profile.src_name_out=yeti_ext.regexp_replace_rand(i_profile.src_name_out,i_dp.src_name_rewrite_rule,i_dp.src_name_rewrite_result, true);

  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. After rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/

  /*
      get termination gw data
  */
  --SELECT into v_dst_gw * from class4.gateways WHERE id=v_dialpeer.gateway_id;
  --SELECT into v_orig_gw * from class4.gateways WHERE id=v_customer_auth.gateway_id;
  --vendor gw
  if i_vendor_gw.termination_capacity is not null then
    i_profile.resources:=i_profile.resources||'5:'||i_vendor_gw.id::varchar||':'||i_vendor_gw.termination_capacity::varchar||':1;';
  end if;


  /*
      numberlist processing _After_ routing _IN_ termination GW
  */
  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> GW. Before numberlist processing src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/


  ----- DST Numberlist processing-------------------------------------------------------------------------------------------------------
  IF i_vendor_gw.termination_dst_numberlist_id is not null then
    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW DST Numberlist processing. Lookup by key: %',EXTRACT(MILLISECOND from v_end-v_start), i_profile.dst_prefix_out;
    /*}dbg*/

    select into v_termination_numberlist * from class4.numberlists where id=i_vendor_gw.termination_dst_numberlist_id;
    CASE v_termination_numberlist.mode_id
      when 1 then -- strict match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id and
          ni.key=i_profile.dst_prefix_out
        limit 1;
      when 2 then -- prefix match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id and
          prefix_range(ni.key)@>prefix_range(i_profile.dst_prefix_out) and
          length(i_profile.dst_prefix_out) between ni.number_min_length and ni.number_max_length
        order by length(prefix_range(ni.key)) desc
        limit 1;
      when 3 then -- random
        select into v_termination_numberlist_size count(*) from class4.numberlist_items where numberlist_id=i_vendor_gw.termination_dst_numberlist_id;
        select into v_termination_numberlist_item * from class4.numberlist_items ni
         where ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id order by ni.id OFFSET floor(random()*v_termination_numberlist_size) limit 1;
    END CASE;

    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW DST Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_termination_numberlist_item);
    /*}dbg*/

    IF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW DST Numberlist. Drop by key action. Skipping route. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_termination_numberlist_item.key;
      /*}dbg*/
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=2 then
        i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.src_prefix_out,
          v_termination_numberlist_item.src_rewrite_rule,
          v_termination_numberlist_item.src_rewrite_result
        );

        i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.dst_prefix_out,
          v_termination_numberlist_item.dst_rewrite_rule,
          v_termination_numberlist_item.dst_rewrite_result
        );
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW DST Numberlist. Drop by default action. Skipping route',EXTRACT(MILLISECOND from v_end-v_start);
      /*}dbg*/
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=2 then
      i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.src_prefix_out,
        v_termination_numberlist.default_src_rewrite_rule,
        v_termination_numberlist.default_src_rewrite_result
      );

      i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.dst_prefix_out,
        v_termination_numberlist.default_dst_rewrite_rule,
        v_termination_numberlist.default_dst_rewrite_result
      );
    END IF;
  END IF;



  ----- SRC Numberlist processing-------------------------------------------------------------------------------------------------------
  IF i_vendor_gw.termination_src_numberlist_id is not null then
    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW SRC Numberlist processing. Lookup by key: %',EXTRACT(MILLISECOND from v_end-v_start), i_profile.src_prefix_out;
    /*}dbg*/

    select into v_termination_numberlist * from class4.numberlists where id=i_vendor_gw.termination_src_numberlist_id;
    CASE v_termination_numberlist.mode_id
      when 1 then -- strict match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id and
          ni.key=i_profile.src_prefix_out
        limit 1;
      when 2 then -- prefix match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id and
          prefix_range(ni.key)@>prefix_range(i_profile.src_prefix_out) and
          length(i_profile.src_prefix_out) between ni.number_min_length and ni.number_max_length
        order by length(prefix_range(ni.key)) desc
        limit 1;
      when 3 then -- random
        select into v_termination_numberlist_size count(*) from class4.numberlist_items where numberlist_id=i_vendor_gw.termination_src_numberlist_id;
        select into v_termination_numberlist_item * from class4.numberlist_items ni
         where ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id order by ni.id OFFSET floor(random()*v_termination_numberlist_size) limit 1;
    END CASE;

    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW SRC Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_termination_numberlist_item);
    /*}dbg*/

    IF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW SRC Numberlist. Drop by key action. Skipping route. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_termination_numberlist_item.key;
      /*}dbg*/
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=2 then
        i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.src_prefix_out,
          v_termination_numberlist_item.src_rewrite_rule,
          v_termination_numberlist_item.src_rewrite_result
        );

        i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.dst_prefix_out,
          v_termination_numberlist_item.dst_rewrite_rule,
          v_termination_numberlist_item.dst_rewrite_result
        );
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW DST Numberlist. Drop by default action. Skipping route.',EXTRACT(MILLISECOND from v_end-v_start);
      /*}dbg*/
      -- drop by default
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=2 then
      i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.src_prefix_out,
        v_termination_numberlist.default_src_rewrite_rule,
        v_termination_numberlist.default_src_rewrite_result
      );

      i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.dst_prefix_out,
        v_termination_numberlist.default_dst_rewrite_rule,
        v_termination_numberlist.default_dst_rewrite_result
      );
    END IF;
  END IF;



  /*
      number rewriting _After_ routing _IN_ termination GW
  */
  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> GW. Before rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/
  i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(i_profile.dst_prefix_out,i_vendor_gw.dst_rewrite_rule,i_vendor_gw.dst_rewrite_result);
  i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(i_profile.src_prefix_out,i_vendor_gw.src_rewrite_rule,i_vendor_gw.src_rewrite_result);
  i_profile.src_name_out=yeti_ext.regexp_replace_rand(i_profile.src_name_out,i_vendor_gw.src_name_rewrite_rule,i_vendor_gw.src_name_rewrite_result, true);

  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> GW. After rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/

  -- i_profile.anonymize_sdp:=i_vendor_gw.anonymize_sdp OR i_customer_gw.anonymize_sdp;

  --i_profile.append_headers:='User-Agent: YETI SBC\r\n';
  i_profile.append_headers_req:=i_vendor_gw.term_append_headers_req;
  i_profile.aleg_append_headers_req=i_customer_gw.orig_append_headers_req;



  i_profile.next_hop_1st_req=i_vendor_gw.auth_enabled; -- use low delay dns srv if auth enabled
  i_profile.next_hop:=i_vendor_gw.term_next_hop;
  i_profile.aleg_next_hop:=i_customer_gw.orig_next_hop;
  --    i_profile.next_hop_for_replies:=v_dst_gw.term_next_hop_for_replies;

  i_profile.dlg_nat_handling=i_customer_gw.dialog_nat_handling;

  i_profile.call_id:=''; -- Generation by sems

  i_profile.enable_auth:=i_vendor_gw.auth_enabled;
  i_profile.auth_pwd:=i_vendor_gw.auth_password;
  i_profile.auth_user:=i_vendor_gw.auth_user;
  i_profile.enable_aleg_auth:=false;
  i_profile.auth_aleg_pwd:='';
  i_profile.auth_aleg_user:='';

  if i_profile.enable_auth then
    v_from_user=COALESCE(i_vendor_gw.auth_from_user,i_profile.src_prefix_out,'');
    v_from_domain=COALESCE(i_vendor_gw.auth_from_domain,'$Oi');
  else
    v_from_user=COALESCE(i_profile.src_prefix_out,'');
    if i_vendor_gw.preserve_anonymous_from_domain and i_profile.from_domain='anonymous.invalid' then
      v_from_domain='anonymous.invalid';
    else
      v_from_domain='$Oi';
    end if;
  end if;

  if i_vendor_gw.sip_schema_id = 1 then
    v_schema='sip';
  elsif i_vendor_gw.sip_schema_id = 2 then
    v_schema='sips';
  else
    RAISE exception 'Unknown termination gateway % SIP schema %', i_vendor_gw.id, i_vendor_gw.sip_schema_id;
  end if;


  i_profile."from":=COALESCE(i_profile.src_name_out||' ','')||'<'||v_schema||':'||coalesce(nullif(v_from_user,'')||'@','')||v_from_domain||'>';
  i_profile."to":='<'||v_schema||':'||i_profile.dst_prefix_out||'@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port||'>','>');

  if i_vendor_gw.send_lnp_information and i_profile.lrn is not null then
    if i_profile.lrn=i_profile.dst_prefix_routing then -- number not ported, but request was successf we musr add ;npdi=yes;
      i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||';npdi=yes@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,'');
      i_profile.lrn=nullif(i_profile.dst_prefix_routing,i_profile.lrn); -- clear lnr field if number not ported;
    else -- if number ported
      i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||';rn='||i_profile.lrn||';npdi=yes@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,'');
    end if;
  else
    i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||'@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,''); -- no fucking porting
  end if;

  if i_vendor_gw.use_registered_aor then
    i_profile.registered_aor_id=i_vendor_gw.id;
  end if;

  i_profile.bleg_transport_protocol_id:=i_vendor_gw.transport_protocol_id;
  i_profile.bleg_protocol_priority_id:=i_vendor_gw.network_protocol_priority_id;

  i_profile.aleg_media_encryption_mode_id:=i_customer_gw.media_encryption_mode_id;
  i_profile.bleg_media_encryption_mode_id:=i_vendor_gw.media_encryption_mode_id;


  IF (i_vendor_gw.term_use_outbound_proxy ) THEN
    i_profile.outbound_proxy:=v_schema||':'||i_vendor_gw.term_outbound_proxy;
    i_profile.force_outbound_proxy:=i_vendor_gw.term_force_outbound_proxy;
    i_profile.bleg_outbound_proxy_transport_protocol_id:=i_vendor_gw.term_proxy_transport_protocol_id;
  ELSE
    i_profile.outbound_proxy:=NULL;
    i_profile.force_outbound_proxy:=false;
  END IF;

  IF (i_customer_gw.orig_use_outbound_proxy ) THEN
    i_profile.aleg_force_outbound_proxy:=i_customer_gw.orig_force_outbound_proxy;
    i_profile.aleg_outbound_proxy=v_schema||':'||i_customer_gw.orig_outbound_proxy;
    i_profile.aleg_outbound_proxy_transport_protocol_id:=i_customer_gw.orig_proxy_transport_protocol_id;
  else
    i_profile.aleg_force_outbound_proxy:=FALSE;
    i_profile.aleg_outbound_proxy=NULL;
  end if;

  i_profile.aleg_policy_id=i_customer_gw.orig_disconnect_policy_id;
  i_profile.bleg_policy_id=i_vendor_gw.term_disconnect_policy_id;

  i_profile.transit_headers_a2b:=i_customer_gw.transit_headers_from_origination||';'||i_vendor_gw.transit_headers_from_origination;
  i_profile.transit_headers_b2a:=i_vendor_gw.transit_headers_from_termination||';'||i_customer_gw.transit_headers_from_termination;


  i_profile.sdp_filter_type_id:=0;
  i_profile.sdp_filter_list:='';

  i_profile.sdp_alines_filter_type_id:=i_vendor_gw.sdp_alines_filter_type_id;
  i_profile.sdp_alines_filter_list:=i_vendor_gw.sdp_alines_filter_list;

  i_profile.enable_session_timer=i_vendor_gw.sst_enabled;
  i_profile.session_expires =i_vendor_gw.sst_session_expires;
  i_profile.minimum_timer:=i_vendor_gw.sst_minimum_timer;
  i_profile.maximum_timer:=i_vendor_gw.sst_maximum_timer;
  i_profile.session_refresh_method_id:=i_vendor_gw.session_refresh_method_id;
  i_profile.accept_501_reply:=i_vendor_gw.sst_accept501;

  i_profile.enable_aleg_session_timer=i_customer_gw.sst_enabled;
  i_profile.aleg_session_expires:=i_customer_gw.sst_session_expires;
  i_profile.aleg_minimum_timer:=i_customer_gw.sst_minimum_timer;
  i_profile.aleg_maximum_timer:=i_customer_gw.sst_maximum_timer;
  i_profile.aleg_session_refresh_method_id:=i_customer_gw.session_refresh_method_id;
  i_profile.aleg_accept_501_reply:=i_customer_gw.sst_accept501;

  i_profile.reply_translations:='';
  i_profile.disconnect_code_id:=NULL;
  i_profile.enable_rtprelay:=i_vendor_gw.proxy_media OR i_customer_gw.proxy_media;

  i_profile.rtprelay_interface:=i_vendor_gw.rtp_interface_name;
  i_profile.aleg_rtprelay_interface:=i_customer_gw.rtp_interface_name;

  i_profile.outbound_interface:=i_vendor_gw.sip_interface_name;
  i_profile.aleg_outbound_interface:=i_customer_gw.sip_interface_name;

  i_profile.bleg_force_symmetric_rtp:=i_vendor_gw.force_symmetric_rtp;
  i_profile.bleg_symmetric_rtp_nonstop=i_vendor_gw.symmetric_rtp_nonstop;
  i_profile.bleg_symmetric_rtp_ignore_rtcp=i_vendor_gw.symmetric_rtp_ignore_rtcp;

  i_profile.aleg_force_symmetric_rtp:=i_customer_gw.force_symmetric_rtp;
  i_profile.aleg_symmetric_rtp_nonstop=i_customer_gw.symmetric_rtp_nonstop;
  i_profile.aleg_symmetric_rtp_ignore_rtcp=i_customer_gw.symmetric_rtp_ignore_rtcp;

  i_profile.bleg_rtp_ping=i_vendor_gw.rtp_ping;
  i_profile.aleg_rtp_ping=i_customer_gw.rtp_ping;

  i_profile.bleg_relay_options = i_vendor_gw.relay_options;
  i_profile.aleg_relay_options = i_customer_gw.relay_options;


  i_profile.filter_noaudio_streams = i_vendor_gw.filter_noaudio_streams OR i_customer_gw.filter_noaudio_streams;
  i_profile.force_one_way_early_media = i_vendor_gw.force_one_way_early_media OR i_customer_gw.force_one_way_early_media;
  i_profile.aleg_relay_reinvite = i_vendor_gw.relay_reinvite;
  i_profile.bleg_relay_reinvite = i_customer_gw.relay_reinvite;

  i_profile.aleg_relay_hold = i_vendor_gw.relay_hold;
  i_profile.bleg_relay_hold = i_customer_gw.relay_hold;

  i_profile.aleg_relay_prack = i_vendor_gw.relay_prack;
  i_profile.bleg_relay_prack = i_customer_gw.relay_prack;
  i_profile.aleg_rel100_mode_id = i_customer_gw.rel100_mode_id;
  i_profile.bleg_rel100_mode_id = i_vendor_gw.rel100_mode_id;

  i_profile.rtp_relay_timestamp_aligning=i_vendor_gw.rtp_relay_timestamp_aligning OR i_customer_gw.rtp_relay_timestamp_aligning;
  i_profile.allow_1xx_wo2tag=i_vendor_gw.allow_1xx_without_to_tag OR i_customer_gw.allow_1xx_without_to_tag;

  i_profile.aleg_sdp_c_location_id=i_customer_gw.sdp_c_location_id;
  i_profile.bleg_sdp_c_location_id=i_vendor_gw.sdp_c_location_id;
  i_profile.trusted_hdrs_gw=false;



  i_profile.aleg_codecs_group_id:=i_customer_gw.codec_group_id;
  i_profile.bleg_codecs_group_id:=i_vendor_gw.codec_group_id;
  i_profile.aleg_single_codec_in_200ok:=i_customer_gw.single_codec_in_200ok;
  i_profile.bleg_single_codec_in_200ok:=i_vendor_gw.single_codec_in_200ok;
  i_profile.ringing_timeout=i_vendor_gw.ringing_timeout;
  i_profile.dead_rtp_time=GREATEST(i_vendor_gw.rtp_timeout,i_customer_gw.rtp_timeout);
  i_profile.invite_timeout=i_vendor_gw.sip_timer_b;
  i_profile.srv_failover_timeout=i_vendor_gw.dns_srv_failover_timer;
  i_profile.fake_180_timer=i_vendor_gw.fake_180_timer;
  i_profile.rtp_force_relay_cn=i_vendor_gw.rtp_force_relay_cn OR i_customer_gw.rtp_force_relay_cn;
  i_profile.patch_ruri_next_hop=i_vendor_gw.resolve_ruri;

  i_profile.aleg_sensor_id=i_customer_gw.sensor_id;
  i_profile.aleg_sensor_level_id=i_customer_gw.sensor_level_id;
  i_profile.bleg_sensor_id=i_vendor_gw.sensor_id;
  i_profile.bleg_sensor_level_id=i_vendor_gw.sensor_level_id;

  i_profile.aleg_dtmf_send_mode_id=i_customer_gw.dtmf_send_mode_id;
  i_profile.aleg_dtmf_recv_modes=i_customer_gw.dtmf_receive_mode_id;
  i_profile.bleg_dtmf_send_mode_id=i_vendor_gw.dtmf_send_mode_id;
  i_profile.bleg_dtmf_recv_modes=i_vendor_gw.dtmf_receive_mode_id;


  i_profile.aleg_rtp_filter_inband_dtmf=false;
  i_profile.bleg_rtp_filter_inband_dtmf=false;

  if i_customer_gw.rx_inband_dtmf_filtering_mode_id=3 then -- enable filtering
    i_profile.aleg_rtp_filter_inband_dtmf=true;
  elsif i_customer_gw.rx_inband_dtmf_filtering_mode_id=1 then -- inherit
    if i_vendor_gw.tx_inband_dtmf_filtering_mode_id in (1,2) then  -- inherit or disable filtering
      i_profile.aleg_rtp_filter_inband_dtmf=false;
    elsif i_vendor_gw.tx_inband_dtmf_filtering_mode_id = 3 then -- enable filtering
      i_profile.aleg_rtp_filter_inband_dtmf=true;
    end if;
  end if;


  if i_vendor_gw.rx_inband_dtmf_filtering_mode_id=3 then -- enable filtering
    i_profile.bleg_rtp_filter_inband_dtmf=true;
  elsif i_vendor_gw.rx_inband_dtmf_filtering_mode_id=1 then -- inherit
    if i_customer_gw.tx_inband_dtmf_filtering_mode_id in (1,2) then  -- inherit or disable filtering
      i_profile.bleg_rtp_filter_inband_dtmf=false;
    elsif i_customer_gw.tx_inband_dtmf_filtering_mode_id = 3 then -- enable filtering
      i_profile.bleg_rtp_filter_inband_dtmf=true;
    end if;
  end if;


  i_profile.rtprelay_force_dtmf_relay=i_vendor_gw.force_dtmf_relay;
  i_profile.rtprelay_dtmf_detection=NOT i_vendor_gw.force_dtmf_relay;
  i_profile.rtprelay_dtmf_filtering=NOT i_vendor_gw.force_dtmf_relay;
  i_profile.bleg_max_30x_redirects = i_vendor_gw.max_30x_redirects;
  i_profile.bleg_max_transfers = i_vendor_gw.max_transfers;


  i_profile.aleg_relay_update=i_customer_gw.relay_update;
  i_profile.bleg_relay_update=i_vendor_gw.relay_update;
  i_profile.suppress_early_media=i_customer_gw.suppress_early_media OR i_vendor_gw.suppress_early_media;

  i_profile.bleg_radius_acc_profile_id=i_vendor_gw.radius_accounting_profile_id;

  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. Finished: % ',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(i_profile,true);
  /*}dbg*/
  RETURN i_profile;
END;
$_$;


--
-- Name: process_gw_debug(switch18.callprofile62_ty, class4.destinations, class4.dialpeers, billing.accounts, class4.gateways, billing.accounts, class4.gateways, boolean, integer); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.process_gw_debug(i_profile switch18.callprofile62_ty, i_destination class4.destinations, i_dp class4.dialpeers, i_customer_acc billing.accounts, i_customer_gw class4.gateways, i_vendor_acc billing.accounts, i_vendor_gw class4.gateways, i_send_billing_information boolean, i_max_call_length integer) RETURNS switch18.callprofile62_ty
    LANGUAGE plpgsql STABLE SECURITY DEFINER COST 100000
    AS $_$
DECLARE
  i integer;
  v_customer_allowtime real;
  v_vendor_allowtime real;
  v_route_found boolean:=false;
  v_from_user varchar;
  v_from_domain varchar;
  v_schema varchar;
  v_termination_numberlist class4.numberlists%rowtype;
  v_termination_numberlist_item class4.numberlist_items%rowtype;
  v_termination_numberlist_size integer;
  /*dbg{*/
  v_start timestamp;
  v_end timestamp;
  /*}dbg*/
BEGIN
  /*dbg{*/
  v_start:=now();
  --RAISE NOTICE 'process_dp in: %',i_profile;
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. Found dialpeer: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(i_dp,true);
  /*}dbg*/

  --RAISE NOTICE 'process_dp dst: %',i_destination;

  i_profile.destination_id:=i_destination.id;
  --    i_profile.destination_initial_interval:=i_destination.initial_interval;
  i_profile.destination_fee:=i_destination.connect_fee::varchar;
  --i_profile.destination_next_interval:=i_destination.next_interval;
  i_profile.destination_rate_policy_id:=i_destination.rate_policy_id;

  --vendor account capacity limit;
  if i_vendor_acc.termination_capacity is not null then
    i_profile.resources:=i_profile.resources||'2:'||i_dp.account_id::varchar||':'||i_vendor_acc.termination_capacity::varchar||':1;';
  end if;

  if i_vendor_acc.total_capacity is not null then
    i_profile.resources:=i_profile.resources||'7:'||i_dp.account_id::varchar||':'||i_vendor_acc.total_capacity::varchar||':1;';
  end if;


  -- dialpeer account capacity limit;
  if i_dp.capacity is not null then
    i_profile.resources:=i_profile.resources||'6:'||i_dp.id::varchar||':'||i_dp.capacity::varchar||':1;';
  end if;

  /* */
  i_profile.dialpeer_id=i_dp.id;
  i_profile.dialpeer_prefix=i_dp.prefix;
  i_profile.dialpeer_next_rate=i_dp.next_rate::varchar;
  i_profile.dialpeer_initial_rate=i_dp.initial_rate::varchar;
  i_profile.dialpeer_initial_interval=i_dp.initial_interval;
  i_profile.dialpeer_next_interval=i_dp.next_interval;
  i_profile.dialpeer_fee=i_dp.connect_fee::varchar;
  i_profile.dialpeer_reverse_billing=i_dp.reverse_billing;
  i_profile.vendor_id=i_dp.vendor_id;
  i_profile.vendor_acc_id=i_dp.account_id;
  i_profile.term_gw_id=i_vendor_gw.id;

  i_profile.orig_gw_name=i_customer_gw."name";
  i_profile.orig_gw_external_id=i_customer_gw.external_id;

  i_profile.term_gw_name=i_vendor_gw."name";
  i_profile.term_gw_external_id=i_vendor_gw.external_id;

  i_profile.customer_account_name=i_customer_acc."name";

  i_profile.routing_group_id:=i_dp.routing_group_id;

  if i_send_billing_information then
    i_profile.aleg_append_headers_reply=E'X-VND-INIT-INT:'||i_profile.dialpeer_initial_interval||E'\r\nX-VND-NEXT-INT:'||i_profile.dialpeer_next_interval||E'\r\nX-VND-INIT-RATE:'||i_profile.dialpeer_initial_rate||E'\r\nX-VND-NEXT-RATE:'||i_profile.dialpeer_next_rate||E'\r\nX-VND-CF:'||i_profile.dialpeer_fee;
  end if;

  if i_destination.use_dp_intervals THEN
    i_profile.destination_initial_interval:=i_dp.initial_interval;
    i_profile.destination_next_interval:=i_dp.next_interval;
  ELSE
    i_profile.destination_initial_interval:=i_destination.initial_interval;
    i_profile.destination_next_interval:=i_destination.next_interval;
  end if;

  CASE i_profile.destination_rate_policy_id
    WHEN 1 THEN -- fixed
    i_profile.destination_next_rate:=i_destination.next_rate::varchar;
    i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    WHEN 2 THEN -- based on dialpeer
    i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    WHEN 3 THEN -- min
    IF i_dp.next_rate >= i_destination.next_rate THEN
      i_profile.destination_next_rate:=i_destination.next_rate::varchar; -- FIXED least
      i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    ELSE
      i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar; -- DYNAMIC
      i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    END IF;
    WHEN 4 THEN -- max
    IF i_dp.next_rate < i_destination.next_rate THEN
      i_profile.destination_next_rate:=i_destination.next_rate::varchar; --FIXED
      i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    ELSE
      i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar; -- DYNAMIC
      i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    END IF;
  ELSE
  --
  end case;



  /* time limiting START */
  --SELECT INTO STRICT v_c_acc * FROM billing.accounts  WHERE id=v_customer_auth.account_id;
  --SELECT INTO STRICT v_v_acc * FROM billing.accounts  WHERE id=v_dialpeer.account_id;

  IF (i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee <0 THEN
    v_customer_allowtime:=0;
    i_profile.disconnect_code_id=8000; --Not enough customer balance
    RETURN i_profile;
  ELSIF (i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee-i_destination.initial_rate/60*i_destination.initial_interval<0 THEN
    v_customer_allowtime:=i_destination.initial_interval;
    i_profile.disconnect_code_id=8000; --Not enough customer balance
    RETURN i_profile;
  ELSIF i_destination.next_rate!=0 AND i_destination.next_interval!=0 THEN
    v_customer_allowtime:=i_destination.initial_interval+
                          LEAST(FLOOR(((i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee-i_destination.initial_rate/60*i_destination.initial_interval)/
                                      (i_destination.next_rate/60*i_destination.next_interval)),24e6)::integer*i_destination.next_interval;
  ELSE /* DST rates is 0, allowing maximum call length */
    v_customer_allowtime:=COALESCE(i_customer_acc.max_call_duration, i_max_call_length);
  end IF;


  IF (i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee <0 THEN /* No enough balance, skipping this profile */
    v_vendor_allowtime:=0;
    return null;
  ELSIF (i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee-i_dp.initial_rate/60*i_dp.initial_interval<0 THEN /* No enough balance even for first billing interval - skipping this profile */
    return null;
  ELSIF i_dp.next_rate!=0 AND i_dp.next_interval!=0 THEN /* DP rates is not zero, calculating limit */
    v_vendor_allowtime:=i_dp.initial_interval+
                        LEAST(FLOOR(((i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee-i_dp.initial_rate/60*i_dp.initial_interval)/
                                    (i_dp.next_rate/60*i_dp.next_interval)),24e6)::integer*i_dp.next_interval;
  ELSE /* DP rates is 0, allowing maximum call length */
    v_vendor_allowtime:=COALESCE(i_vendor_acc.max_call_duration, i_max_call_length);
  end IF;

  i_profile.time_limit=LEAST(
    COALESCE(i_customer_acc.max_call_duration, i_max_call_length),
    COALESCE(i_vendor_acc.max_call_duration, i_max_call_length),
    v_vendor_allowtime,
    v_customer_allowtime
  )::integer;


  /* number rewriting _After_ routing */
  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. Before rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/
  i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(i_profile.dst_prefix_out,i_dp.dst_rewrite_rule,i_dp.dst_rewrite_result);
  i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(i_profile.src_prefix_out,i_dp.src_rewrite_rule,i_dp.src_rewrite_result);
  i_profile.src_name_out=yeti_ext.regexp_replace_rand(i_profile.src_name_out,i_dp.src_name_rewrite_rule,i_dp.src_name_rewrite_result, true);

  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. After rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/

  /*
      get termination gw data
  */
  --SELECT into v_dst_gw * from class4.gateways WHERE id=v_dialpeer.gateway_id;
  --SELECT into v_orig_gw * from class4.gateways WHERE id=v_customer_auth.gateway_id;
  --vendor gw
  if i_vendor_gw.termination_capacity is not null then
    i_profile.resources:=i_profile.resources||'5:'||i_vendor_gw.id::varchar||':'||i_vendor_gw.termination_capacity::varchar||':1;';
  end if;


  /*
      numberlist processing _After_ routing _IN_ termination GW
  */
  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> GW. Before numberlist processing src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/


  ----- DST Numberlist processing-------------------------------------------------------------------------------------------------------
  IF i_vendor_gw.termination_dst_numberlist_id is not null then
    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW DST Numberlist processing. Lookup by key: %',EXTRACT(MILLISECOND from v_end-v_start), i_profile.dst_prefix_out;
    /*}dbg*/

    select into v_termination_numberlist * from class4.numberlists where id=i_vendor_gw.termination_dst_numberlist_id;
    CASE v_termination_numberlist.mode_id
      when 1 then -- strict match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id and
          ni.key=i_profile.dst_prefix_out
        limit 1;
      when 2 then -- prefix match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id and
          prefix_range(ni.key)@>prefix_range(i_profile.dst_prefix_out) and
          length(i_profile.dst_prefix_out) between ni.number_min_length and ni.number_max_length
        order by length(prefix_range(ni.key)) desc
        limit 1;
      when 3 then -- random
        select into v_termination_numberlist_size count(*) from class4.numberlist_items where numberlist_id=i_vendor_gw.termination_dst_numberlist_id;
        select into v_termination_numberlist_item * from class4.numberlist_items ni
         where ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id order by ni.id OFFSET floor(random()*v_termination_numberlist_size) limit 1;
    END CASE;

    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW DST Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_termination_numberlist_item);
    /*}dbg*/

    IF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW DST Numberlist. Drop by key action. Skipping route. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_termination_numberlist_item.key;
      /*}dbg*/
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=2 then
        i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.src_prefix_out,
          v_termination_numberlist_item.src_rewrite_rule,
          v_termination_numberlist_item.src_rewrite_result
        );

        i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.dst_prefix_out,
          v_termination_numberlist_item.dst_rewrite_rule,
          v_termination_numberlist_item.dst_rewrite_result
        );
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW DST Numberlist. Drop by default action. Skipping route',EXTRACT(MILLISECOND from v_end-v_start);
      /*}dbg*/
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=2 then
      i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.src_prefix_out,
        v_termination_numberlist.default_src_rewrite_rule,
        v_termination_numberlist.default_src_rewrite_result
      );

      i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.dst_prefix_out,
        v_termination_numberlist.default_dst_rewrite_rule,
        v_termination_numberlist.default_dst_rewrite_result
      );
    END IF;
  END IF;



  ----- SRC Numberlist processing-------------------------------------------------------------------------------------------------------
  IF i_vendor_gw.termination_src_numberlist_id is not null then
    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW SRC Numberlist processing. Lookup by key: %',EXTRACT(MILLISECOND from v_end-v_start), i_profile.src_prefix_out;
    /*}dbg*/

    select into v_termination_numberlist * from class4.numberlists where id=i_vendor_gw.termination_src_numberlist_id;
    CASE v_termination_numberlist.mode_id
      when 1 then -- strict match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id and
          ni.key=i_profile.src_prefix_out
        limit 1;
      when 2 then -- prefix match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id and
          prefix_range(ni.key)@>prefix_range(i_profile.src_prefix_out) and
          length(i_profile.src_prefix_out) between ni.number_min_length and ni.number_max_length
        order by length(prefix_range(ni.key)) desc
        limit 1;
      when 3 then -- random
        select into v_termination_numberlist_size count(*) from class4.numberlist_items where numberlist_id=i_vendor_gw.termination_src_numberlist_id;
        select into v_termination_numberlist_item * from class4.numberlist_items ni
         where ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id order by ni.id OFFSET floor(random()*v_termination_numberlist_size) limit 1;
    END CASE;

    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW SRC Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_termination_numberlist_item);
    /*}dbg*/

    IF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW SRC Numberlist. Drop by key action. Skipping route. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_termination_numberlist_item.key;
      /*}dbg*/
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=2 then
        i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.src_prefix_out,
          v_termination_numberlist_item.src_rewrite_rule,
          v_termination_numberlist_item.src_rewrite_result
        );

        i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.dst_prefix_out,
          v_termination_numberlist_item.dst_rewrite_rule,
          v_termination_numberlist_item.dst_rewrite_result
        );
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW DST Numberlist. Drop by default action. Skipping route.',EXTRACT(MILLISECOND from v_end-v_start);
      /*}dbg*/
      -- drop by default
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=2 then
      i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.src_prefix_out,
        v_termination_numberlist.default_src_rewrite_rule,
        v_termination_numberlist.default_src_rewrite_result
      );

      i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.dst_prefix_out,
        v_termination_numberlist.default_dst_rewrite_rule,
        v_termination_numberlist.default_dst_rewrite_result
      );
    END IF;
  END IF;



  /*
      number rewriting _After_ routing _IN_ termination GW
  */
  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> GW. Before rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/
  i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(i_profile.dst_prefix_out,i_vendor_gw.dst_rewrite_rule,i_vendor_gw.dst_rewrite_result);
  i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(i_profile.src_prefix_out,i_vendor_gw.src_rewrite_rule,i_vendor_gw.src_rewrite_result);
  i_profile.src_name_out=yeti_ext.regexp_replace_rand(i_profile.src_name_out,i_vendor_gw.src_name_rewrite_rule,i_vendor_gw.src_name_rewrite_result, true);

  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> GW. After rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/

  -- i_profile.anonymize_sdp:=i_vendor_gw.anonymize_sdp OR i_customer_gw.anonymize_sdp;

  --i_profile.append_headers:='User-Agent: YETI SBC\r\n';
  i_profile.append_headers_req:=i_vendor_gw.term_append_headers_req;
  i_profile.aleg_append_headers_req=i_customer_gw.orig_append_headers_req;



  i_profile.next_hop_1st_req=i_vendor_gw.auth_enabled; -- use low delay dns srv if auth enabled
  i_profile.next_hop:=i_vendor_gw.term_next_hop;
  i_profile.aleg_next_hop:=i_customer_gw.orig_next_hop;
  --    i_profile.next_hop_for_replies:=v_dst_gw.term_next_hop_for_replies;

  i_profile.dlg_nat_handling=i_customer_gw.dialog_nat_handling;

  i_profile.call_id:=''; -- Generation by sems

  i_profile.enable_auth:=i_vendor_gw.auth_enabled;
  i_profile.auth_pwd:=i_vendor_gw.auth_password;
  i_profile.auth_user:=i_vendor_gw.auth_user;
  i_profile.enable_aleg_auth:=false;
  i_profile.auth_aleg_pwd:='';
  i_profile.auth_aleg_user:='';

  if i_profile.enable_auth then
    v_from_user=COALESCE(i_vendor_gw.auth_from_user,i_profile.src_prefix_out,'');
    v_from_domain=COALESCE(i_vendor_gw.auth_from_domain,'$Oi');
  else
    v_from_user=COALESCE(i_profile.src_prefix_out,'');
    if i_vendor_gw.preserve_anonymous_from_domain and i_profile.from_domain='anonymous.invalid' then
      v_from_domain='anonymous.invalid';
    else
      v_from_domain='$Oi';
    end if;
  end if;

  if i_vendor_gw.sip_schema_id = 1 then
    v_schema='sip';
  elsif i_vendor_gw.sip_schema_id = 2 then
    v_schema='sips';
  else
    RAISE exception 'Unknown termination gateway % SIP schema %', i_vendor_gw.id, i_vendor_gw.sip_schema_id;
  end if;


  i_profile."from":=COALESCE(i_profile.src_name_out||' ','')||'<'||v_schema||':'||coalesce(nullif(v_from_user,'')||'@','')||v_from_domain||'>';
  i_profile."to":='<'||v_schema||':'||i_profile.dst_prefix_out||'@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port||'>','>');

  if i_vendor_gw.send_lnp_information and i_profile.lrn is not null then
    if i_profile.lrn=i_profile.dst_prefix_routing then -- number not ported, but request was successf we musr add ;npdi=yes;
      i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||';npdi=yes@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,'');
      i_profile.lrn=nullif(i_profile.dst_prefix_routing,i_profile.lrn); -- clear lnr field if number not ported;
    else -- if number ported
      i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||';rn='||i_profile.lrn||';npdi=yes@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,'');
    end if;
  else
    i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||'@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,''); -- no fucking porting
  end if;

  if i_vendor_gw.use_registered_aor then
    i_profile.registered_aor_id=i_vendor_gw.id;
  end if;

  i_profile.bleg_transport_protocol_id:=i_vendor_gw.transport_protocol_id;
  i_profile.bleg_protocol_priority_id:=i_vendor_gw.network_protocol_priority_id;

  i_profile.aleg_media_encryption_mode_id:=i_customer_gw.media_encryption_mode_id;
  i_profile.bleg_media_encryption_mode_id:=i_vendor_gw.media_encryption_mode_id;


  IF (i_vendor_gw.term_use_outbound_proxy ) THEN
    i_profile.outbound_proxy:=v_schema||':'||i_vendor_gw.term_outbound_proxy;
    i_profile.force_outbound_proxy:=i_vendor_gw.term_force_outbound_proxy;
    i_profile.bleg_outbound_proxy_transport_protocol_id:=i_vendor_gw.term_proxy_transport_protocol_id;
  ELSE
    i_profile.outbound_proxy:=NULL;
    i_profile.force_outbound_proxy:=false;
  END IF;

  IF (i_customer_gw.orig_use_outbound_proxy ) THEN
    i_profile.aleg_force_outbound_proxy:=i_customer_gw.orig_force_outbound_proxy;
    i_profile.aleg_outbound_proxy=v_schema||':'||i_customer_gw.orig_outbound_proxy;
    i_profile.aleg_outbound_proxy_transport_protocol_id:=i_customer_gw.orig_proxy_transport_protocol_id;
  else
    i_profile.aleg_force_outbound_proxy:=FALSE;
    i_profile.aleg_outbound_proxy=NULL;
  end if;

  i_profile.aleg_policy_id=i_customer_gw.orig_disconnect_policy_id;
  i_profile.bleg_policy_id=i_vendor_gw.term_disconnect_policy_id;

  i_profile.transit_headers_a2b:=i_customer_gw.transit_headers_from_origination||';'||i_vendor_gw.transit_headers_from_origination;
  i_profile.transit_headers_b2a:=i_vendor_gw.transit_headers_from_termination||';'||i_customer_gw.transit_headers_from_termination;


  i_profile.sdp_filter_type_id:=0;
  i_profile.sdp_filter_list:='';

  i_profile.sdp_alines_filter_type_id:=i_vendor_gw.sdp_alines_filter_type_id;
  i_profile.sdp_alines_filter_list:=i_vendor_gw.sdp_alines_filter_list;

  i_profile.enable_session_timer=i_vendor_gw.sst_enabled;
  i_profile.session_expires =i_vendor_gw.sst_session_expires;
  i_profile.minimum_timer:=i_vendor_gw.sst_minimum_timer;
  i_profile.maximum_timer:=i_vendor_gw.sst_maximum_timer;
  i_profile.session_refresh_method_id:=i_vendor_gw.session_refresh_method_id;
  i_profile.accept_501_reply:=i_vendor_gw.sst_accept501;

  i_profile.enable_aleg_session_timer=i_customer_gw.sst_enabled;
  i_profile.aleg_session_expires:=i_customer_gw.sst_session_expires;
  i_profile.aleg_minimum_timer:=i_customer_gw.sst_minimum_timer;
  i_profile.aleg_maximum_timer:=i_customer_gw.sst_maximum_timer;
  i_profile.aleg_session_refresh_method_id:=i_customer_gw.session_refresh_method_id;
  i_profile.aleg_accept_501_reply:=i_customer_gw.sst_accept501;

  i_profile.reply_translations:='';
  i_profile.disconnect_code_id:=NULL;
  i_profile.enable_rtprelay:=i_vendor_gw.proxy_media OR i_customer_gw.proxy_media;

  i_profile.rtprelay_interface:=i_vendor_gw.rtp_interface_name;
  i_profile.aleg_rtprelay_interface:=i_customer_gw.rtp_interface_name;

  i_profile.outbound_interface:=i_vendor_gw.sip_interface_name;
  i_profile.aleg_outbound_interface:=i_customer_gw.sip_interface_name;

  i_profile.bleg_force_symmetric_rtp:=i_vendor_gw.force_symmetric_rtp;
  i_profile.bleg_symmetric_rtp_nonstop=i_vendor_gw.symmetric_rtp_nonstop;
  i_profile.bleg_symmetric_rtp_ignore_rtcp=i_vendor_gw.symmetric_rtp_ignore_rtcp;

  i_profile.aleg_force_symmetric_rtp:=i_customer_gw.force_symmetric_rtp;
  i_profile.aleg_symmetric_rtp_nonstop=i_customer_gw.symmetric_rtp_nonstop;
  i_profile.aleg_symmetric_rtp_ignore_rtcp=i_customer_gw.symmetric_rtp_ignore_rtcp;

  i_profile.bleg_rtp_ping=i_vendor_gw.rtp_ping;
  i_profile.aleg_rtp_ping=i_customer_gw.rtp_ping;

  i_profile.bleg_relay_options = i_vendor_gw.relay_options;
  i_profile.aleg_relay_options = i_customer_gw.relay_options;


  i_profile.filter_noaudio_streams = i_vendor_gw.filter_noaudio_streams OR i_customer_gw.filter_noaudio_streams;
  i_profile.force_one_way_early_media = i_vendor_gw.force_one_way_early_media OR i_customer_gw.force_one_way_early_media;
  i_profile.aleg_relay_reinvite = i_vendor_gw.relay_reinvite;
  i_profile.bleg_relay_reinvite = i_customer_gw.relay_reinvite;

  i_profile.aleg_relay_hold = i_vendor_gw.relay_hold;
  i_profile.bleg_relay_hold = i_customer_gw.relay_hold;

  i_profile.aleg_relay_prack = i_vendor_gw.relay_prack;
  i_profile.bleg_relay_prack = i_customer_gw.relay_prack;
  i_profile.aleg_rel100_mode_id = i_customer_gw.rel100_mode_id;
  i_profile.bleg_rel100_mode_id = i_vendor_gw.rel100_mode_id;

  i_profile.rtp_relay_timestamp_aligning=i_vendor_gw.rtp_relay_timestamp_aligning OR i_customer_gw.rtp_relay_timestamp_aligning;
  i_profile.allow_1xx_wo2tag=i_vendor_gw.allow_1xx_without_to_tag OR i_customer_gw.allow_1xx_without_to_tag;

  i_profile.aleg_sdp_c_location_id=i_customer_gw.sdp_c_location_id;
  i_profile.bleg_sdp_c_location_id=i_vendor_gw.sdp_c_location_id;
  i_profile.trusted_hdrs_gw=false;



  i_profile.aleg_codecs_group_id:=i_customer_gw.codec_group_id;
  i_profile.bleg_codecs_group_id:=i_vendor_gw.codec_group_id;
  i_profile.aleg_single_codec_in_200ok:=i_customer_gw.single_codec_in_200ok;
  i_profile.bleg_single_codec_in_200ok:=i_vendor_gw.single_codec_in_200ok;
  i_profile.ringing_timeout=i_vendor_gw.ringing_timeout;
  i_profile.dead_rtp_time=GREATEST(i_vendor_gw.rtp_timeout,i_customer_gw.rtp_timeout);
  i_profile.invite_timeout=i_vendor_gw.sip_timer_b;
  i_profile.srv_failover_timeout=i_vendor_gw.dns_srv_failover_timer;
  i_profile.fake_180_timer=i_vendor_gw.fake_180_timer;
  i_profile.rtp_force_relay_cn=i_vendor_gw.rtp_force_relay_cn OR i_customer_gw.rtp_force_relay_cn;
  i_profile.patch_ruri_next_hop=i_vendor_gw.resolve_ruri;

  i_profile.aleg_sensor_id=i_customer_gw.sensor_id;
  i_profile.aleg_sensor_level_id=i_customer_gw.sensor_level_id;
  i_profile.bleg_sensor_id=i_vendor_gw.sensor_id;
  i_profile.bleg_sensor_level_id=i_vendor_gw.sensor_level_id;

  i_profile.aleg_dtmf_send_mode_id=i_customer_gw.dtmf_send_mode_id;
  i_profile.aleg_dtmf_recv_modes=i_customer_gw.dtmf_receive_mode_id;
  i_profile.bleg_dtmf_send_mode_id=i_vendor_gw.dtmf_send_mode_id;
  i_profile.bleg_dtmf_recv_modes=i_vendor_gw.dtmf_receive_mode_id;


  i_profile.aleg_rtp_filter_inband_dtmf=false;
  i_profile.bleg_rtp_filter_inband_dtmf=false;

  if i_customer_gw.rx_inband_dtmf_filtering_mode_id=3 then -- enable filtering
    i_profile.aleg_rtp_filter_inband_dtmf=true;
  elsif i_customer_gw.rx_inband_dtmf_filtering_mode_id=1 then -- inherit
    if i_vendor_gw.tx_inband_dtmf_filtering_mode_id in (1,2) then  -- inherit or disable filtering
      i_profile.aleg_rtp_filter_inband_dtmf=false;
    elsif i_vendor_gw.tx_inband_dtmf_filtering_mode_id = 3 then -- enable filtering
      i_profile.aleg_rtp_filter_inband_dtmf=true;
    end if;
  end if;


  if i_vendor_gw.rx_inband_dtmf_filtering_mode_id=3 then -- enable filtering
    i_profile.bleg_rtp_filter_inband_dtmf=true;
  elsif i_vendor_gw.rx_inband_dtmf_filtering_mode_id=1 then -- inherit
    if i_customer_gw.tx_inband_dtmf_filtering_mode_id in (1,2) then  -- inherit or disable filtering
      i_profile.bleg_rtp_filter_inband_dtmf=false;
    elsif i_customer_gw.tx_inband_dtmf_filtering_mode_id = 3 then -- enable filtering
      i_profile.bleg_rtp_filter_inband_dtmf=true;
    end if;
  end if;


  i_profile.rtprelay_force_dtmf_relay=i_vendor_gw.force_dtmf_relay;
  i_profile.rtprelay_dtmf_detection=NOT i_vendor_gw.force_dtmf_relay;
  i_profile.rtprelay_dtmf_filtering=NOT i_vendor_gw.force_dtmf_relay;
  i_profile.bleg_max_30x_redirects = i_vendor_gw.max_30x_redirects;
  i_profile.bleg_max_transfers = i_vendor_gw.max_transfers;


  i_profile.aleg_relay_update=i_customer_gw.relay_update;
  i_profile.bleg_relay_update=i_vendor_gw.relay_update;
  i_profile.suppress_early_media=i_customer_gw.suppress_early_media OR i_vendor_gw.suppress_early_media;

  i_profile.bleg_radius_acc_profile_id=i_vendor_gw.radius_accounting_profile_id;

  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. Finished: % ',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(i_profile,true);
  /*}dbg*/
  RETURN i_profile;
END;
$_$;


--
-- Name: process_gw_release(switch18.callprofile62_ty, class4.destinations, class4.dialpeers, billing.accounts, class4.gateways, billing.accounts, class4.gateways, boolean, integer); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.process_gw_release(i_profile switch18.callprofile62_ty, i_destination class4.destinations, i_dp class4.dialpeers, i_customer_acc billing.accounts, i_customer_gw class4.gateways, i_vendor_acc billing.accounts, i_vendor_gw class4.gateways, i_send_billing_information boolean, i_max_call_length integer) RETURNS switch18.callprofile62_ty
    LANGUAGE plpgsql STABLE SECURITY DEFINER COST 100000
    AS $_$
DECLARE
  i integer;
  v_customer_allowtime real;
  v_vendor_allowtime real;
  v_route_found boolean:=false;
  v_from_user varchar;
  v_from_domain varchar;
  v_schema varchar;
  v_termination_numberlist class4.numberlists%rowtype;
  v_termination_numberlist_item class4.numberlist_items%rowtype;
  v_termination_numberlist_size integer;
  
BEGIN
  

  --RAISE NOTICE 'process_dp dst: %',i_destination;

  i_profile.destination_id:=i_destination.id;
  --    i_profile.destination_initial_interval:=i_destination.initial_interval;
  i_profile.destination_fee:=i_destination.connect_fee::varchar;
  --i_profile.destination_next_interval:=i_destination.next_interval;
  i_profile.destination_rate_policy_id:=i_destination.rate_policy_id;

  --vendor account capacity limit;
  if i_vendor_acc.termination_capacity is not null then
    i_profile.resources:=i_profile.resources||'2:'||i_dp.account_id::varchar||':'||i_vendor_acc.termination_capacity::varchar||':1;';
  end if;

  if i_vendor_acc.total_capacity is not null then
    i_profile.resources:=i_profile.resources||'7:'||i_dp.account_id::varchar||':'||i_vendor_acc.total_capacity::varchar||':1;';
  end if;


  -- dialpeer account capacity limit;
  if i_dp.capacity is not null then
    i_profile.resources:=i_profile.resources||'6:'||i_dp.id::varchar||':'||i_dp.capacity::varchar||':1;';
  end if;

  /* */
  i_profile.dialpeer_id=i_dp.id;
  i_profile.dialpeer_prefix=i_dp.prefix;
  i_profile.dialpeer_next_rate=i_dp.next_rate::varchar;
  i_profile.dialpeer_initial_rate=i_dp.initial_rate::varchar;
  i_profile.dialpeer_initial_interval=i_dp.initial_interval;
  i_profile.dialpeer_next_interval=i_dp.next_interval;
  i_profile.dialpeer_fee=i_dp.connect_fee::varchar;
  i_profile.dialpeer_reverse_billing=i_dp.reverse_billing;
  i_profile.vendor_id=i_dp.vendor_id;
  i_profile.vendor_acc_id=i_dp.account_id;
  i_profile.term_gw_id=i_vendor_gw.id;

  i_profile.orig_gw_name=i_customer_gw."name";
  i_profile.orig_gw_external_id=i_customer_gw.external_id;

  i_profile.term_gw_name=i_vendor_gw."name";
  i_profile.term_gw_external_id=i_vendor_gw.external_id;

  i_profile.customer_account_name=i_customer_acc."name";

  i_profile.routing_group_id:=i_dp.routing_group_id;

  if i_send_billing_information then
    i_profile.aleg_append_headers_reply=E'X-VND-INIT-INT:'||i_profile.dialpeer_initial_interval||E'\r\nX-VND-NEXT-INT:'||i_profile.dialpeer_next_interval||E'\r\nX-VND-INIT-RATE:'||i_profile.dialpeer_initial_rate||E'\r\nX-VND-NEXT-RATE:'||i_profile.dialpeer_next_rate||E'\r\nX-VND-CF:'||i_profile.dialpeer_fee;
  end if;

  if i_destination.use_dp_intervals THEN
    i_profile.destination_initial_interval:=i_dp.initial_interval;
    i_profile.destination_next_interval:=i_dp.next_interval;
  ELSE
    i_profile.destination_initial_interval:=i_destination.initial_interval;
    i_profile.destination_next_interval:=i_destination.next_interval;
  end if;

  CASE i_profile.destination_rate_policy_id
    WHEN 1 THEN -- fixed
    i_profile.destination_next_rate:=i_destination.next_rate::varchar;
    i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    WHEN 2 THEN -- based on dialpeer
    i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    WHEN 3 THEN -- min
    IF i_dp.next_rate >= i_destination.next_rate THEN
      i_profile.destination_next_rate:=i_destination.next_rate::varchar; -- FIXED least
      i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    ELSE
      i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar; -- DYNAMIC
      i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    END IF;
    WHEN 4 THEN -- max
    IF i_dp.next_rate < i_destination.next_rate THEN
      i_profile.destination_next_rate:=i_destination.next_rate::varchar; --FIXED
      i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    ELSE
      i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar; -- DYNAMIC
      i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    END IF;
  ELSE
  --
  end case;



  /* time limiting START */
  --SELECT INTO STRICT v_c_acc * FROM billing.accounts  WHERE id=v_customer_auth.account_id;
  --SELECT INTO STRICT v_v_acc * FROM billing.accounts  WHERE id=v_dialpeer.account_id;

  IF (i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee <0 THEN
    v_customer_allowtime:=0;
    i_profile.disconnect_code_id=8000; --Not enough customer balance
    RETURN i_profile;
  ELSIF (i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee-i_destination.initial_rate/60*i_destination.initial_interval<0 THEN
    v_customer_allowtime:=i_destination.initial_interval;
    i_profile.disconnect_code_id=8000; --Not enough customer balance
    RETURN i_profile;
  ELSIF i_destination.next_rate!=0 AND i_destination.next_interval!=0 THEN
    v_customer_allowtime:=i_destination.initial_interval+
                          LEAST(FLOOR(((i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee-i_destination.initial_rate/60*i_destination.initial_interval)/
                                      (i_destination.next_rate/60*i_destination.next_interval)),24e6)::integer*i_destination.next_interval;
  ELSE /* DST rates is 0, allowing maximum call length */
    v_customer_allowtime:=COALESCE(i_customer_acc.max_call_duration, i_max_call_length);
  end IF;


  IF (i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee <0 THEN /* No enough balance, skipping this profile */
    v_vendor_allowtime:=0;
    return null;
  ELSIF (i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee-i_dp.initial_rate/60*i_dp.initial_interval<0 THEN /* No enough balance even for first billing interval - skipping this profile */
    return null;
  ELSIF i_dp.next_rate!=0 AND i_dp.next_interval!=0 THEN /* DP rates is not zero, calculating limit */
    v_vendor_allowtime:=i_dp.initial_interval+
                        LEAST(FLOOR(((i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee-i_dp.initial_rate/60*i_dp.initial_interval)/
                                    (i_dp.next_rate/60*i_dp.next_interval)),24e6)::integer*i_dp.next_interval;
  ELSE /* DP rates is 0, allowing maximum call length */
    v_vendor_allowtime:=COALESCE(i_vendor_acc.max_call_duration, i_max_call_length);
  end IF;

  i_profile.time_limit=LEAST(
    COALESCE(i_customer_acc.max_call_duration, i_max_call_length),
    COALESCE(i_vendor_acc.max_call_duration, i_max_call_length),
    v_vendor_allowtime,
    v_customer_allowtime
  )::integer;


  /* number rewriting _After_ routing */
  
  i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(i_profile.dst_prefix_out,i_dp.dst_rewrite_rule,i_dp.dst_rewrite_result);
  i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(i_profile.src_prefix_out,i_dp.src_rewrite_rule,i_dp.src_rewrite_result);
  i_profile.src_name_out=yeti_ext.regexp_replace_rand(i_profile.src_name_out,i_dp.src_name_rewrite_rule,i_dp.src_name_rewrite_result, true);

  

  /*
      get termination gw data
  */
  --SELECT into v_dst_gw * from class4.gateways WHERE id=v_dialpeer.gateway_id;
  --SELECT into v_orig_gw * from class4.gateways WHERE id=v_customer_auth.gateway_id;
  --vendor gw
  if i_vendor_gw.termination_capacity is not null then
    i_profile.resources:=i_profile.resources||'5:'||i_vendor_gw.id::varchar||':'||i_vendor_gw.termination_capacity::varchar||':1;';
  end if;


  /*
      numberlist processing _After_ routing _IN_ termination GW
  */
  


  ----- DST Numberlist processing-------------------------------------------------------------------------------------------------------
  IF i_vendor_gw.termination_dst_numberlist_id is not null then
    

    select into v_termination_numberlist * from class4.numberlists where id=i_vendor_gw.termination_dst_numberlist_id;
    CASE v_termination_numberlist.mode_id
      when 1 then -- strict match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id and
          ni.key=i_profile.dst_prefix_out
        limit 1;
      when 2 then -- prefix match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id and
          prefix_range(ni.key)@>prefix_range(i_profile.dst_prefix_out) and
          length(i_profile.dst_prefix_out) between ni.number_min_length and ni.number_max_length
        order by length(prefix_range(ni.key)) desc
        limit 1;
      when 3 then -- random
        select into v_termination_numberlist_size count(*) from class4.numberlist_items where numberlist_id=i_vendor_gw.termination_dst_numberlist_id;
        select into v_termination_numberlist_item * from class4.numberlist_items ni
         where ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id order by ni.id OFFSET floor(random()*v_termination_numberlist_size) limit 1;
    END CASE;

    

    IF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=1 then
      
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=2 then
        i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.src_prefix_out,
          v_termination_numberlist_item.src_rewrite_rule,
          v_termination_numberlist_item.src_rewrite_result
        );

        i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.dst_prefix_out,
          v_termination_numberlist_item.dst_rewrite_rule,
          v_termination_numberlist_item.dst_rewrite_result
        );
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=1 then
      
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=2 then
      i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.src_prefix_out,
        v_termination_numberlist.default_src_rewrite_rule,
        v_termination_numberlist.default_src_rewrite_result
      );

      i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.dst_prefix_out,
        v_termination_numberlist.default_dst_rewrite_rule,
        v_termination_numberlist.default_dst_rewrite_result
      );
    END IF;
  END IF;



  ----- SRC Numberlist processing-------------------------------------------------------------------------------------------------------
  IF i_vendor_gw.termination_src_numberlist_id is not null then
    

    select into v_termination_numberlist * from class4.numberlists where id=i_vendor_gw.termination_src_numberlist_id;
    CASE v_termination_numberlist.mode_id
      when 1 then -- strict match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id and
          ni.key=i_profile.src_prefix_out
        limit 1;
      when 2 then -- prefix match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id and
          prefix_range(ni.key)@>prefix_range(i_profile.src_prefix_out) and
          length(i_profile.src_prefix_out) between ni.number_min_length and ni.number_max_length
        order by length(prefix_range(ni.key)) desc
        limit 1;
      when 3 then -- random
        select into v_termination_numberlist_size count(*) from class4.numberlist_items where numberlist_id=i_vendor_gw.termination_src_numberlist_id;
        select into v_termination_numberlist_item * from class4.numberlist_items ni
         where ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id order by ni.id OFFSET floor(random()*v_termination_numberlist_size) limit 1;
    END CASE;

    

    IF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=1 then
      
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=2 then
        i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.src_prefix_out,
          v_termination_numberlist_item.src_rewrite_rule,
          v_termination_numberlist_item.src_rewrite_result
        );

        i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.dst_prefix_out,
          v_termination_numberlist_item.dst_rewrite_rule,
          v_termination_numberlist_item.dst_rewrite_result
        );
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=1 then
      
      -- drop by default
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=2 then
      i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.src_prefix_out,
        v_termination_numberlist.default_src_rewrite_rule,
        v_termination_numberlist.default_src_rewrite_result
      );

      i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.dst_prefix_out,
        v_termination_numberlist.default_dst_rewrite_rule,
        v_termination_numberlist.default_dst_rewrite_result
      );
    END IF;
  END IF;



  /*
      number rewriting _After_ routing _IN_ termination GW
  */
  
  i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(i_profile.dst_prefix_out,i_vendor_gw.dst_rewrite_rule,i_vendor_gw.dst_rewrite_result);
  i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(i_profile.src_prefix_out,i_vendor_gw.src_rewrite_rule,i_vendor_gw.src_rewrite_result);
  i_profile.src_name_out=yeti_ext.regexp_replace_rand(i_profile.src_name_out,i_vendor_gw.src_name_rewrite_rule,i_vendor_gw.src_name_rewrite_result, true);

  

  -- i_profile.anonymize_sdp:=i_vendor_gw.anonymize_sdp OR i_customer_gw.anonymize_sdp;

  --i_profile.append_headers:='User-Agent: YETI SBC\r\n';
  i_profile.append_headers_req:=i_vendor_gw.term_append_headers_req;
  i_profile.aleg_append_headers_req=i_customer_gw.orig_append_headers_req;



  i_profile.next_hop_1st_req=i_vendor_gw.auth_enabled; -- use low delay dns srv if auth enabled
  i_profile.next_hop:=i_vendor_gw.term_next_hop;
  i_profile.aleg_next_hop:=i_customer_gw.orig_next_hop;
  --    i_profile.next_hop_for_replies:=v_dst_gw.term_next_hop_for_replies;

  i_profile.dlg_nat_handling=i_customer_gw.dialog_nat_handling;

  i_profile.call_id:=''; -- Generation by sems

  i_profile.enable_auth:=i_vendor_gw.auth_enabled;
  i_profile.auth_pwd:=i_vendor_gw.auth_password;
  i_profile.auth_user:=i_vendor_gw.auth_user;
  i_profile.enable_aleg_auth:=false;
  i_profile.auth_aleg_pwd:='';
  i_profile.auth_aleg_user:='';

  if i_profile.enable_auth then
    v_from_user=COALESCE(i_vendor_gw.auth_from_user,i_profile.src_prefix_out,'');
    v_from_domain=COALESCE(i_vendor_gw.auth_from_domain,'$Oi');
  else
    v_from_user=COALESCE(i_profile.src_prefix_out,'');
    if i_vendor_gw.preserve_anonymous_from_domain and i_profile.from_domain='anonymous.invalid' then
      v_from_domain='anonymous.invalid';
    else
      v_from_domain='$Oi';
    end if;
  end if;

  if i_vendor_gw.sip_schema_id = 1 then
    v_schema='sip';
  elsif i_vendor_gw.sip_schema_id = 2 then
    v_schema='sips';
  else
    RAISE exception 'Unknown termination gateway % SIP schema %', i_vendor_gw.id, i_vendor_gw.sip_schema_id;
  end if;


  i_profile."from":=COALESCE(i_profile.src_name_out||' ','')||'<'||v_schema||':'||coalesce(nullif(v_from_user,'')||'@','')||v_from_domain||'>';
  i_profile."to":='<'||v_schema||':'||i_profile.dst_prefix_out||'@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port||'>','>');

  if i_vendor_gw.send_lnp_information and i_profile.lrn is not null then
    if i_profile.lrn=i_profile.dst_prefix_routing then -- number not ported, but request was successf we musr add ;npdi=yes;
      i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||';npdi=yes@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,'');
      i_profile.lrn=nullif(i_profile.dst_prefix_routing,i_profile.lrn); -- clear lnr field if number not ported;
    else -- if number ported
      i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||';rn='||i_profile.lrn||';npdi=yes@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,'');
    end if;
  else
    i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||'@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,''); -- no fucking porting
  end if;

  if i_vendor_gw.use_registered_aor then
    i_profile.registered_aor_id=i_vendor_gw.id;
  end if;

  i_profile.bleg_transport_protocol_id:=i_vendor_gw.transport_protocol_id;
  i_profile.bleg_protocol_priority_id:=i_vendor_gw.network_protocol_priority_id;

  i_profile.aleg_media_encryption_mode_id:=i_customer_gw.media_encryption_mode_id;
  i_profile.bleg_media_encryption_mode_id:=i_vendor_gw.media_encryption_mode_id;


  IF (i_vendor_gw.term_use_outbound_proxy ) THEN
    i_profile.outbound_proxy:=v_schema||':'||i_vendor_gw.term_outbound_proxy;
    i_profile.force_outbound_proxy:=i_vendor_gw.term_force_outbound_proxy;
    i_profile.bleg_outbound_proxy_transport_protocol_id:=i_vendor_gw.term_proxy_transport_protocol_id;
  ELSE
    i_profile.outbound_proxy:=NULL;
    i_profile.force_outbound_proxy:=false;
  END IF;

  IF (i_customer_gw.orig_use_outbound_proxy ) THEN
    i_profile.aleg_force_outbound_proxy:=i_customer_gw.orig_force_outbound_proxy;
    i_profile.aleg_outbound_proxy=v_schema||':'||i_customer_gw.orig_outbound_proxy;
    i_profile.aleg_outbound_proxy_transport_protocol_id:=i_customer_gw.orig_proxy_transport_protocol_id;
  else
    i_profile.aleg_force_outbound_proxy:=FALSE;
    i_profile.aleg_outbound_proxy=NULL;
  end if;

  i_profile.aleg_policy_id=i_customer_gw.orig_disconnect_policy_id;
  i_profile.bleg_policy_id=i_vendor_gw.term_disconnect_policy_id;

  i_profile.transit_headers_a2b:=i_customer_gw.transit_headers_from_origination||';'||i_vendor_gw.transit_headers_from_origination;
  i_profile.transit_headers_b2a:=i_vendor_gw.transit_headers_from_termination||';'||i_customer_gw.transit_headers_from_termination;


  i_profile.sdp_filter_type_id:=0;
  i_profile.sdp_filter_list:='';

  i_profile.sdp_alines_filter_type_id:=i_vendor_gw.sdp_alines_filter_type_id;
  i_profile.sdp_alines_filter_list:=i_vendor_gw.sdp_alines_filter_list;

  i_profile.enable_session_timer=i_vendor_gw.sst_enabled;
  i_profile.session_expires =i_vendor_gw.sst_session_expires;
  i_profile.minimum_timer:=i_vendor_gw.sst_minimum_timer;
  i_profile.maximum_timer:=i_vendor_gw.sst_maximum_timer;
  i_profile.session_refresh_method_id:=i_vendor_gw.session_refresh_method_id;
  i_profile.accept_501_reply:=i_vendor_gw.sst_accept501;

  i_profile.enable_aleg_session_timer=i_customer_gw.sst_enabled;
  i_profile.aleg_session_expires:=i_customer_gw.sst_session_expires;
  i_profile.aleg_minimum_timer:=i_customer_gw.sst_minimum_timer;
  i_profile.aleg_maximum_timer:=i_customer_gw.sst_maximum_timer;
  i_profile.aleg_session_refresh_method_id:=i_customer_gw.session_refresh_method_id;
  i_profile.aleg_accept_501_reply:=i_customer_gw.sst_accept501;

  i_profile.reply_translations:='';
  i_profile.disconnect_code_id:=NULL;
  i_profile.enable_rtprelay:=i_vendor_gw.proxy_media OR i_customer_gw.proxy_media;

  i_profile.rtprelay_interface:=i_vendor_gw.rtp_interface_name;
  i_profile.aleg_rtprelay_interface:=i_customer_gw.rtp_interface_name;

  i_profile.outbound_interface:=i_vendor_gw.sip_interface_name;
  i_profile.aleg_outbound_interface:=i_customer_gw.sip_interface_name;

  i_profile.bleg_force_symmetric_rtp:=i_vendor_gw.force_symmetric_rtp;
  i_profile.bleg_symmetric_rtp_nonstop=i_vendor_gw.symmetric_rtp_nonstop;
  i_profile.bleg_symmetric_rtp_ignore_rtcp=i_vendor_gw.symmetric_rtp_ignore_rtcp;

  i_profile.aleg_force_symmetric_rtp:=i_customer_gw.force_symmetric_rtp;
  i_profile.aleg_symmetric_rtp_nonstop=i_customer_gw.symmetric_rtp_nonstop;
  i_profile.aleg_symmetric_rtp_ignore_rtcp=i_customer_gw.symmetric_rtp_ignore_rtcp;

  i_profile.bleg_rtp_ping=i_vendor_gw.rtp_ping;
  i_profile.aleg_rtp_ping=i_customer_gw.rtp_ping;

  i_profile.bleg_relay_options = i_vendor_gw.relay_options;
  i_profile.aleg_relay_options = i_customer_gw.relay_options;


  i_profile.filter_noaudio_streams = i_vendor_gw.filter_noaudio_streams OR i_customer_gw.filter_noaudio_streams;
  i_profile.force_one_way_early_media = i_vendor_gw.force_one_way_early_media OR i_customer_gw.force_one_way_early_media;
  i_profile.aleg_relay_reinvite = i_vendor_gw.relay_reinvite;
  i_profile.bleg_relay_reinvite = i_customer_gw.relay_reinvite;

  i_profile.aleg_relay_hold = i_vendor_gw.relay_hold;
  i_profile.bleg_relay_hold = i_customer_gw.relay_hold;

  i_profile.aleg_relay_prack = i_vendor_gw.relay_prack;
  i_profile.bleg_relay_prack = i_customer_gw.relay_prack;
  i_profile.aleg_rel100_mode_id = i_customer_gw.rel100_mode_id;
  i_profile.bleg_rel100_mode_id = i_vendor_gw.rel100_mode_id;

  i_profile.rtp_relay_timestamp_aligning=i_vendor_gw.rtp_relay_timestamp_aligning OR i_customer_gw.rtp_relay_timestamp_aligning;
  i_profile.allow_1xx_wo2tag=i_vendor_gw.allow_1xx_without_to_tag OR i_customer_gw.allow_1xx_without_to_tag;

  i_profile.aleg_sdp_c_location_id=i_customer_gw.sdp_c_location_id;
  i_profile.bleg_sdp_c_location_id=i_vendor_gw.sdp_c_location_id;
  i_profile.trusted_hdrs_gw=false;



  i_profile.aleg_codecs_group_id:=i_customer_gw.codec_group_id;
  i_profile.bleg_codecs_group_id:=i_vendor_gw.codec_group_id;
  i_profile.aleg_single_codec_in_200ok:=i_customer_gw.single_codec_in_200ok;
  i_profile.bleg_single_codec_in_200ok:=i_vendor_gw.single_codec_in_200ok;
  i_profile.ringing_timeout=i_vendor_gw.ringing_timeout;
  i_profile.dead_rtp_time=GREATEST(i_vendor_gw.rtp_timeout,i_customer_gw.rtp_timeout);
  i_profile.invite_timeout=i_vendor_gw.sip_timer_b;
  i_profile.srv_failover_timeout=i_vendor_gw.dns_srv_failover_timer;
  i_profile.fake_180_timer=i_vendor_gw.fake_180_timer;
  i_profile.rtp_force_relay_cn=i_vendor_gw.rtp_force_relay_cn OR i_customer_gw.rtp_force_relay_cn;
  i_profile.patch_ruri_next_hop=i_vendor_gw.resolve_ruri;

  i_profile.aleg_sensor_id=i_customer_gw.sensor_id;
  i_profile.aleg_sensor_level_id=i_customer_gw.sensor_level_id;
  i_profile.bleg_sensor_id=i_vendor_gw.sensor_id;
  i_profile.bleg_sensor_level_id=i_vendor_gw.sensor_level_id;

  i_profile.aleg_dtmf_send_mode_id=i_customer_gw.dtmf_send_mode_id;
  i_profile.aleg_dtmf_recv_modes=i_customer_gw.dtmf_receive_mode_id;
  i_profile.bleg_dtmf_send_mode_id=i_vendor_gw.dtmf_send_mode_id;
  i_profile.bleg_dtmf_recv_modes=i_vendor_gw.dtmf_receive_mode_id;


  i_profile.aleg_rtp_filter_inband_dtmf=false;
  i_profile.bleg_rtp_filter_inband_dtmf=false;

  if i_customer_gw.rx_inband_dtmf_filtering_mode_id=3 then -- enable filtering
    i_profile.aleg_rtp_filter_inband_dtmf=true;
  elsif i_customer_gw.rx_inband_dtmf_filtering_mode_id=1 then -- inherit
    if i_vendor_gw.tx_inband_dtmf_filtering_mode_id in (1,2) then  -- inherit or disable filtering
      i_profile.aleg_rtp_filter_inband_dtmf=false;
    elsif i_vendor_gw.tx_inband_dtmf_filtering_mode_id = 3 then -- enable filtering
      i_profile.aleg_rtp_filter_inband_dtmf=true;
    end if;
  end if;


  if i_vendor_gw.rx_inband_dtmf_filtering_mode_id=3 then -- enable filtering
    i_profile.bleg_rtp_filter_inband_dtmf=true;
  elsif i_vendor_gw.rx_inband_dtmf_filtering_mode_id=1 then -- inherit
    if i_customer_gw.tx_inband_dtmf_filtering_mode_id in (1,2) then  -- inherit or disable filtering
      i_profile.bleg_rtp_filter_inband_dtmf=false;
    elsif i_customer_gw.tx_inband_dtmf_filtering_mode_id = 3 then -- enable filtering
      i_profile.bleg_rtp_filter_inband_dtmf=true;
    end if;
  end if;


  i_profile.rtprelay_force_dtmf_relay=i_vendor_gw.force_dtmf_relay;
  i_profile.rtprelay_dtmf_detection=NOT i_vendor_gw.force_dtmf_relay;
  i_profile.rtprelay_dtmf_filtering=NOT i_vendor_gw.force_dtmf_relay;
  i_profile.bleg_max_30x_redirects = i_vendor_gw.max_30x_redirects;
  i_profile.bleg_max_transfers = i_vendor_gw.max_transfers;


  i_profile.aleg_relay_update=i_customer_gw.relay_update;
  i_profile.bleg_relay_update=i_vendor_gw.relay_update;
  i_profile.suppress_early_media=i_customer_gw.suppress_early_media OR i_vendor_gw.suppress_early_media;

  i_profile.bleg_radius_acc_profile_id=i_vendor_gw.radius_accounting_profile_id;

  
  RETURN i_profile;
END;
$_$;


--
-- Name: recompile_interface(integer); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.recompile_interface(i_version integer) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
DECLARE
  v_attr record;
  v_sql varchar;
BEGIN
  v_sql:='CREATE TYPE callprofile'||i_version::varchar||'_ty AS (';
  FOR v_attr IN SELECT * from load_interface_out() LOOP
    v_sql:=v_sql||'"'||v_attr.varname::varchar||'" '||v_attr.vartype||',';
  END LOOP;
  v_sql:=left(v_sql,-1)||')'; --removing last ',' added in loop and add )
  EXECUTE v_sql;
END;
$$;


--
-- Name: route(integer, integer, smallint, inet, integer, inet, integer, character varying, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, inet, integer, smallint, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.route(i_node_id integer, i_pop_id integer, i_protocol_id smallint, i_remote_ip inet, i_remote_port integer, i_local_ip inet, i_local_port integer, i_from_dsp character varying, i_from_name character varying, i_from_domain character varying, i_from_port integer, i_to_name character varying, i_to_domain character varying, i_to_port integer, i_contact_name character varying, i_contact_domain character varying, i_contact_port integer, i_uri_name character varying, i_uri_domain character varying, i_auth_id integer, i_x_yeti_auth character varying, i_diversion character varying, i_x_orig_ip inet, i_x_orig_port integer, i_x_orig_protocol_id smallint, i_pai character varying, i_ppi character varying, i_privacy character varying, i_rpid character varying, i_rpid_privacy character varying) RETURNS SETOF switch18.callprofile62_ty
    LANGUAGE plpgsql SECURITY DEFINER ROWS 10
    AS $_$
      DECLARE
        v_ret switch18.callprofile62_ty;
        i integer;
        v_ip inet;
        v_remote_ip inet;
        v_remote_port INTEGER;
        v_transport_protocol_id smallint;
        v_customer_auth_normalized class4.customers_auth_normalized;
        v_destination class4.destinations%rowtype;
        v_dialpeer record;
        v_rateplan class4.rateplans%rowtype;
        v_dst_gw class4.gateways%rowtype;
        v_orig_gw class4.gateways%rowtype;
        v_rp class4.routing_plans%rowtype;
        v_customer_allowtime real;
        v_vendor_allowtime real;
        v_sorting_id integer;
        v_customer_acc integer;
        v_route_found boolean:=false;
        v_c_acc billing.accounts%rowtype;
        v_v_acc billing.accounts%rowtype;
        v_network sys.network_prefixes%rowtype;
        routedata record;
        /*dbg{*/
        v_start timestamp;
        v_end timestamp;
        /*}dbg*/
        v_rate NUMERIC;
        v_now timestamp;
        v_x_yeti_auth varchar;
        --  v_uri_domain varchar;
        v_rate_limit float:='Infinity'::float;
        v_destination_rate_limit float:='Infinity'::float;
        v_test_vendor_id integer;
        v_random float;
        v_max_call_length integer;
        v_routing_key varchar;
        v_lnp_key varchar;
        v_drop_call_if_lnp_fail boolean;
        v_lnp_rule class4.routing_plan_lnp_rules%rowtype;
        v_numberlist record;
        v_numberlist_item record;
        v_call_tags smallint[]:='{}'::smallint[];
        v_area_direction class4.routing_tag_detection_rules%rowtype;
        v_numberlist_size integer;

      BEGIN
        /*dbg{*/
        v_start:=now();
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Execution start',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/

        perform id from sys.load_balancers where signalling_ip=host(i_remote_ip)::varchar;
        IF FOUND and i_x_orig_ip IS not NULL AND i_x_orig_port IS not NULL THEN
          v_remote_ip:=i_x_orig_ip;
          v_remote_port:=i_x_orig_port;
          v_transport_protocol_id=i_x_orig_protocol_id;
          /*dbg{*/RAISE NOTICE '% ms -> Got originator address "%:%, proto: %" from x-headers',EXTRACT(MILLISECOND from v_end-v_start), v_remote_ip,v_remote_port, v_transport_protocol_id;/*}dbg*/
        else
          v_remote_ip:=i_remote_ip;
          v_remote_port:=i_remote_port;
          v_transport_protocol_id:=i_protocol_id;
          /*dbg{*/RAISE NOTICE '% ms -> Got originator address "%:%, proto: %" from switch leg info',EXTRACT(MILLISECOND from v_end-v_start), v_remote_ip,v_remote_port, v_transport_protocol_id;/*}dbg*/
        end if;

        v_now:=now();
        v_ret:=switch18.new_profile();
        v_ret.cache_time = 10;

        v_ret.diversion_in:=i_diversion;
        v_ret.diversion_out:=i_diversion; -- FIXME

        v_ret.auth_orig_protocol_id =v_transport_protocol_id;
        v_ret.auth_orig_ip = v_remote_ip;
        v_ret.auth_orig_port = v_remote_port;

        v_ret.src_name_in:=i_from_dsp;
        v_ret.src_name_out:=v_ret.src_name_in;

        v_ret.src_prefix_in:=i_from_name;
        v_ret.src_prefix_out:=v_ret.src_prefix_in;

        v_ret.dst_prefix_in:=i_uri_name;
        v_ret.dst_prefix_out:=v_ret.dst_prefix_in;


        v_ret.ruri_domain=i_uri_domain;
        v_ret.from_domain=i_from_domain;
        v_ret.to_domain=i_to_domain;

        v_ret.pai_in=i_pai;
        v_ret.ppi_in=i_ppi;
        v_ret.privacy_in=i_privacy;
        v_ret.rpid_in=i_rpid;
        v_ret.rpid_privacy_in=i_rpid_privacy;

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. lookup started',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/
        v_x_yeti_auth:=COALESCE(i_x_yeti_auth,'');
        --  v_uri_domain:=COALESCE(i_uri_domain,'');

        if i_auth_id is null then
            SELECT into v_customer_auth_normalized ca.*
            from class4.customers_auth_normalized ca
                JOIN public.contractors c ON c.id=ca.customer_id
            WHERE ca.enabled AND
              ca.ip>>=v_remote_ip AND
              prefix_range(ca.dst_prefix)@>prefix_range(v_ret.dst_prefix_in) AND
              prefix_range(ca.src_prefix)@>prefix_range(v_ret.src_prefix_in) AND
              (ca.pop_id=i_pop_id or ca.pop_id is null) and
              COALESCE(ca.x_yeti_auth,'')=v_x_yeti_auth AND
              COALESCE(nullif(ca.uri_domain,'')=i_uri_domain,true) AND
              COALESCE(nullif(ca.to_domain,'')=i_to_domain,true) AND
              COALESCE(nullif(ca.from_domain,'')=i_from_domain,true) AND
              (ca.transport_protocol_id is null or ca.transport_protocol_id=v_transport_protocol_id) AND
              length(v_ret.dst_prefix_in) between ca.dst_number_min_length and ca.dst_number_max_length and
              length(v_ret.src_prefix_in) between ca.src_number_min_length and ca.src_number_max_length and
              c.enabled and c.customer
            ORDER BY
                masklen(ca.ip) DESC,
                ca.transport_protocol_id is null,
                length(prefix_range(ca.dst_prefix)) DESC,
                length(prefix_range(ca.src_prefix)) DESC,
                ca.pop_id is null,
                ca.uri_domain is null,
                ca.to_domain is null,
                ca.from_domain is null,
                ca.require_incoming_auth
            LIMIT 1;
            IF NOT FOUND THEN
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 110.Cant find customer or customer locked',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=110; --Cant find customer or customer locked
                RETURN NEXT v_ret;
                RETURN;
            END IF;
            if v_customer_auth_normalized.require_incoming_auth then
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH. Incoming auth required. Respond 401',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.aleg_auth_required=true;
                RETURN NEXT v_ret;
                RETURN;
            end IF;
            if v_customer_auth_normalized.reject_calls then
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 8004. Reject by customers auth',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=8004; -- call rejected by authorization

                v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
                v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

                v_ret.customer_id:=v_customer_auth_normalized.customer_id;
                select into strict v_ret.customer_external_id external_id from public.contractors where id=v_ret.customer_id;

                v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
                v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;

                v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
                SELECT INTO STRICT v_ret.customer_acc_external_id external_id FROM billing.accounts WHERE id=v_customer_auth_normalized.account_id;

                RETURN NEXT v_ret;
                RETURN;
            end if;
        else
            SELECT into v_customer_auth_normalized ca.*
            from class4.customers_auth_normalized ca
                JOIN public.contractors c ON c.id=ca.customer_id
            WHERE ca.enabled AND
              ca.ip>>=v_remote_ip AND
              prefix_range(ca.dst_prefix)@>prefix_range(v_ret.dst_prefix_in) AND
              prefix_range(ca.src_prefix)@>prefix_range(v_ret.src_prefix_in) AND
              (ca.pop_id=i_pop_id or ca.pop_id is null) and
              COALESCE(ca.x_yeti_auth,'')=v_x_yeti_auth AND
              COALESCE(nullif(ca.uri_domain,'')=i_uri_domain,true) AND
              COALESCE(nullif(ca.to_domain,'')=i_to_domain,true) AND
              COALESCE(nullif(ca.from_domain,'')=i_from_domain,true) AND
              (ca.transport_protocol_id is null or ca.transport_protocol_id=v_transport_protocol_id) AND
              length(v_ret.dst_prefix_in) between ca.dst_number_min_length and ca.dst_number_max_length and
              length(v_ret.src_prefix_in) between ca.src_number_min_length and ca.src_number_max_length and
              c.enabled and c.customer and
              ca.require_incoming_auth and gateway_id = i_auth_id
            ORDER BY
                masklen(ca.ip) DESC,
                ca.transport_protocol_id is null,
                length(prefix_range(ca.dst_prefix)) DESC,
                length(prefix_range(ca.src_prefix)) DESC,
                ca.pop_id is null,
                ca.uri_domain is null,
                ca.to_domain is null,
                ca.from_domain is null
            LIMIT 1;
            IF NOT FOUND THEN
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 110.Cant find customer or customer locked',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=110; --Cant find customer or customer locked
                RETURN NEXT v_ret;
                RETURN;
            END IF;
            if v_customer_auth_normalized.reject_calls then
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 8004. Reject by customers auth',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=8004; -- call rejected by authorization

                v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
                v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

                v_ret.customer_id:=v_customer_auth_normalized.customer_id;
                select into strict v_ret.customer_external_id external_id from public.contractors where id=v_ret.customer_id;

                v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
                v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;

                v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
                SELECT INTO STRICT v_ret.customer_acc_external_id external_id FROM billing.accounts WHERE id=v_customer_auth_normalized.account_id;

                RETURN NEXT v_ret;
                RETURN;
            end if;
        end IF;

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. found: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(v_customer_auth_normalized, true);
        /*}dbg*/

        -- redefine call SRC/DST numbers

        IF v_customer_auth_normalized.src_name_field_id=1 THEN  /* default - from uri display name */
          v_ret.src_name_in:=i_from_dsp;
        END IF;
        v_ret.src_name_out:=v_ret.src_name_in;

        IF v_customer_auth_normalized.src_number_field_id=1 THEN  /* default - from uri userpart */
          v_ret.src_prefix_in:=i_from_name;
        ELSIF v_customer_auth_normalized.src_number_field_id=2 THEN /* From uri Display name */
          v_ret.src_prefix_in:=i_from_dsp;
        END IF;
        v_ret.src_prefix_out:=v_ret.src_prefix_in;

        IF v_customer_auth_normalized.dst_number_field_id=1 THEN /* default  - RURI userpart*/
          v_ret.dst_prefix_in:=i_uri_name;
        ELSIF v_customer_auth_normalized.dst_number_field_id=2 THEN /* TO URI userpart */
          v_ret.dst_prefix_in:=i_to_name;
        ELSIF v_customer_auth_normalized.dst_number_field_id=3 THEN /* Top-Most Diversion header userpart */
          v_ret.dst_prefix_in:=i_diversion;
        END IF;
        v_ret.dst_prefix_out:=v_ret.dst_prefix_in;


        -- feel customer data ;-)
        v_ret.dump_level_id:=v_customer_auth_normalized.dump_level_id;
        v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
        v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

        v_ret.customer_id:=v_customer_auth_normalized.customer_id;
        select into strict v_ret.customer_external_id external_id from public.contractors where id=v_customer_auth_normalized.customer_id;

        v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
        v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;
        v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
        v_ret.orig_gw_id:=v_customer_auth_normalized.gateway_id;

        v_ret.radius_auth_profile_id=v_customer_auth_normalized.radius_auth_profile_id;
        v_ret.aleg_radius_acc_profile_id=v_customer_auth_normalized.radius_accounting_profile_id;
        v_ret.record_audio=v_customer_auth_normalized.enable_audio_recording;

        v_ret.customer_acc_check_balance=v_customer_auth_normalized.check_account_balance;

        SELECT INTO STRICT v_c_acc * FROM billing.accounts  WHERE id=v_customer_auth_normalized.account_id;
        v_ret.customer_acc_external_id=v_c_acc.external_id;
        v_ret.customer_acc_vat=v_c_acc.vat;
        v_destination_rate_limit=coalesce(v_c_acc.destination_rate_limit::float,'Infinity'::float);

        if v_customer_auth_normalized.check_account_balance AND v_c_acc.balance<=v_c_acc.min_balance then
          v_ret.disconnect_code_id=8000; --No enough customer balance
          RETURN NEXT v_ret;
          RETURN;
        end if;

        v_ret.customer_acc_external_id=v_c_acc.external_id;
        v_ret.customer_acc_vat=v_c_acc.vat;

        SELECT into v_orig_gw * from class4.gateways WHERE id=v_customer_auth_normalized.gateway_id;
        if not v_orig_gw.enabled then
          v_ret.disconnect_code_id=8005; -- Origination gateway is disabled
          RETURN NEXT v_ret;
          RETURN;
        end if;

        v_ret.resources:='';
        if v_customer_auth_normalized.capacity is not null then
          v_ret.resources:=v_ret.resources||'3:'||v_customer_auth_normalized.customers_auth_id||':'||v_customer_auth_normalized.capacity::varchar||':1;';
        end if;

        if v_c_acc.origination_capacity is not null then
          v_ret.resources:=v_ret.resources||'1:'||v_c_acc.id::varchar||':'||v_c_acc.origination_capacity::varchar||':1;';
        end if;

        if v_c_acc.total_capacity is not null then
          v_ret.resources:=v_ret.resources||'7:'||v_c_acc.id::varchar||':'||v_c_acc.total_capacity::varchar||':1;';
        end if;

        if v_orig_gw.origination_capacity is not null then
          v_ret.resources:=v_ret.resources||'4:'||v_orig_gw.id::varchar||':'||v_orig_gw.origination_capacity::varchar||':1;';
        end if;

        -- Tag processing CA
        v_call_tags=yeti_ext.tag_action(v_customer_auth_normalized.tag_action_id, v_call_tags, v_customer_auth_normalized.tag_action_value);

        /*
            number rewriting _Before_ routing
        */
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. Before rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.src_prefix_out,v_ret.dst_prefix_out;
        /*}dbg*/
        v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(v_ret.dst_prefix_out,v_customer_auth_normalized.dst_rewrite_rule,v_customer_auth_normalized.dst_rewrite_result);
        v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(v_ret.src_prefix_out,v_customer_auth_normalized.src_rewrite_rule,v_customer_auth_normalized.src_rewrite_result);
        v_ret.src_name_out=yeti_ext.regexp_replace_rand(v_ret.src_name_out,v_customer_auth_normalized.src_name_rewrite_rule,v_customer_auth_normalized.src_name_rewrite_result, true);

        --  if v_ret.radius_auth_profile_id is not null then
        v_ret.src_number_radius:=i_from_name;
        v_ret.dst_number_radius:=i_uri_name;
        v_ret.src_number_radius=yeti_ext.regexp_replace_rand(
            v_ret.src_number_radius,
            v_customer_auth_normalized.src_number_radius_rewrite_rule,
            v_customer_auth_normalized.src_number_radius_rewrite_result
        );

        v_ret.dst_number_radius=yeti_ext.regexp_replace_rand(
            v_ret.dst_number_radius,
            v_customer_auth_normalized.dst_number_radius_rewrite_rule,
            v_customer_auth_normalized.dst_number_radius_rewrite_result
        );
        v_ret.customer_auth_name=v_customer_auth_normalized."name";
        v_ret.customer_name=(select "name" from public.contractors where id=v_customer_auth_normalized.customer_id limit 1);
        --  end if;


        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. After rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.src_prefix_out,v_ret.dst_prefix_out;
        /*}dbg*/

        ----- Numberlist processing-------------------------------------------------------------------------------------------------------
        if v_customer_auth_normalized.dst_numberlist_id is not null then
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> DST Numberlist processing. Lookup by key: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.dst_prefix_out;
          /*}dbg*/
          select into v_numberlist * from class4.numberlists where id=v_customer_auth_normalized.dst_numberlist_id;
          CASE v_numberlist.mode_id
            when 1 then -- strict match
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id and ni.key=v_ret.dst_prefix_out limit 1;
            when 2 then -- prefix match
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where
                  ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id and
                  prefix_range(ni.key)@>prefix_range(v_ret.dst_prefix_out) and
                  length(v_ret.dst_prefix_out) between ni.number_min_length and ni.number_max_length
                order by length(prefix_range(ni.key))
                desc limit 1;
            when 3 then -- random
                select into v_numberlist_size count(*) from class4.numberlist_items where numberlist_id=v_customer_auth_normalized.dst_numberlist_id;
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id order by ni.id OFFSET floor(random()*v_numberlist_size) limit 1;
          end case;
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> DST Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_numberlist_item);
          /*}dbg*/
          IF v_numberlist_item.action_id is not null and v_numberlist_item.action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> DST Numberlist. Drop by key action. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_numberlist_item.key;
            /*}dbg*/
            v_ret.disconnect_code_id=8001; --destination blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is not null and v_numberlist_item.action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist_item.src_rewrite_rule,
                v_numberlist_item.src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist_item.dst_rewrite_rule,
                v_numberlist_item.dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist_item.tag_action_id, v_call_tags, v_numberlist_item.tag_action_value);
            -- pass call NOP.
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> DST Numberlist. Drop by default action',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
            -- drop by default
            v_ret.disconnect_code_id=8001; --destination blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist.default_src_rewrite_rule,
                v_numberlist.default_src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist.default_dst_rewrite_rule,
                v_numberlist.default_dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist.tag_action_id, v_call_tags, v_numberlist.tag_action_value);
            -- pass by default
          end if;
        end if;

        if v_customer_auth_normalized.src_numberlist_id is not null then
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> SRC Numberlist processing. Lookup by key: %s',EXTRACT(MILLISECOND from v_end-v_start), v_ret.src_prefix_out;
          /*}dbg*/
          select into v_numberlist * from class4.numberlists where id=v_customer_auth_normalized.src_numberlist_id;
          CASE v_numberlist.mode_id
            when 1 then -- strict match
              select into v_numberlist_item * from class4.numberlist_items ni
              where ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id and ni.key=v_ret.src_prefix_out limit 1;
            when 2 then -- prefix match
              select into v_numberlist_item * from class4.numberlist_items ni
              where
                ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id and
                prefix_range(ni.key)@>prefix_range(v_ret.src_prefix_out) and
                length(v_ret.src_prefix_out) between ni.number_min_length and ni.number_max_length
              order by length(prefix_range(ni.key)) desc limit 1;
            when 3 then -- random
              select into v_numberlist_size count(*) from class4.numberlist_items where numberlist_id=v_customer_auth_normalized.src_numberlist_id;
              select into v_numberlist_item *
              from class4.numberlist_items ni
              where ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id order by ni.id OFFSET floor(random()*v_numberlist_size) limit 1;
          end case;
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> SRC Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_numberlist_item);
          /*}dbg*/
          IF v_numberlist_item.action_id is not null and v_numberlist_item.action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> SRC Numberlist. Drop by key action. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_numberlist_item.key;
            /*}dbg*/
            v_ret.disconnect_code_id=8002; --source blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is not null and v_numberlist_item.action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist_item.src_rewrite_rule,
                v_numberlist_item.src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist_item.dst_rewrite_rule,
                v_numberlist_item.dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist_item.tag_action_id, v_call_tags, v_numberlist_item.tag_action_value);
            -- pass call NOP.
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> SRC Numberlist. Drop by default action',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
            v_ret.disconnect_code_id=8002; --source blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist.default_src_rewrite_rule,
                v_numberlist.default_src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist.default_dst_rewrite_rule,
                v_numberlist.default_dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist.tag_action_id, v_call_tags, v_numberlist.tag_action_value);
            -- pass by default
          end if;
        end if;

        --  setting numbers used for routing & billing
        v_ret.src_prefix_routing=v_ret.src_prefix_out;
        v_ret.dst_prefix_routing=v_ret.dst_prefix_out;
        v_routing_key=v_ret.dst_prefix_out;

        -- Areas and Tag detection-------------------------------------------
        v_ret.src_area_id:=(
          select area_id from class4.area_prefixes where prefix_range(prefix)@>prefix_range(v_ret.src_prefix_routing)
          order by length(prefix_range(prefix)) desc limit 1
        );

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> SRC Area found: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.src_area_id;
        /*}dbg*/

        v_ret.dst_area_id:=(
          select area_id from class4.area_prefixes where prefix_range(prefix)@>prefix_range(v_ret.dst_prefix_routing)
          order by length(prefix_range(prefix)) desc limit 1
        );

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DST Area found: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.dst_area_id;
        /*}dbg*/


        select into v_area_direction * from class4.routing_tag_detection_rules
        where
          (src_area_id is null OR src_area_id = v_ret.src_area_id) AND
          (dst_area_id is null OR dst_area_id = v_ret.dst_area_id) AND
          prefix_range(src_prefix) @> prefix_range(v_ret.src_prefix_routing) AND
          prefix_range(dst_prefix) @> prefix_range(v_ret.dst_prefix_routing) AND
          yeti_ext.tag_compare(routing_tag_ids, v_call_tags, routing_tag_mode_id ) > 0
        order by
          yeti_ext.tag_compare(routing_tag_ids, v_call_tags, routing_tag_mode_id) desc,
          length(prefix_range(v_ret.src_prefix_routing)) desc,
          length(prefix_range(v_ret.dst_prefix_routing)) desc,
          src_area_id is null,
          dst_area_id is null
        limit 1;
        if found then
            v_call_tags=yeti_ext.tag_action(v_area_direction.tag_action_id, v_call_tags, v_area_direction.tag_action_value);
        end if;

        v_ret.routing_tag_ids:=v_call_tags;

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Routing tag detected: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.routing_tag_ids;
        /*}dbg*/
        ----------------------------------------------------------------------

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Routing plan search start',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/

        select into v_max_call_length,v_drop_call_if_lnp_fail max_call_duration,drop_call_if_lnp_fail from sys.guiconfig limit 1;

        v_routing_key=v_ret.dst_prefix_routing;
        SELECT INTO v_rp * from class4.routing_plans WHERE id=v_customer_auth_normalized.routing_plan_id;
        if v_rp.sorting_id=5 then -- route testing
          v_test_vendor_id=regexp_replace(v_routing_key,'(.*)\*(.*)','\1')::integer;
          v_routing_key=regexp_replace(v_routing_key,'(.*)\*(.*)','\2');
          v_ret.dst_prefix_out=v_routing_key;
          v_ret.dst_prefix_routing=v_routing_key;
        end if;

        if v_rp.use_lnp then
          select into v_lnp_rule rules.*
          from class4.routing_plan_lnp_rules rules
          WHERE prefix_range(rules.dst_prefix)@>prefix_range(v_ret.dst_prefix_routing) and rules.routing_plan_id=v_rp.id
          order by length(prefix_range(rules.dst_prefix)) limit 1;
          if found then
            v_ret.lnp_database_id=v_lnp_rule.database_id;
            v_lnp_key=v_ret.dst_prefix_routing;
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> LNP. Need LNP lookup, LNP key: %',EXTRACT(MILLISECOND from v_end-v_start),v_lnp_key;
            /*}dbg*/
            v_lnp_key=yeti_ext.regexp_replace_rand(v_lnp_key,v_lnp_rule.req_dst_rewrite_rule,v_lnp_rule.req_dst_rewrite_result);
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> LNP key translation. LNP key: %',EXTRACT(MILLISECOND from v_end-v_start),v_lnp_key;
            /*}dbg*/
            -- try cache
            select into v_ret.lrn lrn from class4.lnp_cache where dst=v_lnp_key AND database_id=v_lnp_rule.database_id and expires_at>v_now;
            if found then
              /*dbg{*/
              v_end:=clock_timestamp();
              RAISE NOTICE '% ms -> LNP. Data found in cache, lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
              /*}dbg*/
              -- TRANSLATING response from cache
              v_ret.lrn=yeti_ext.regexp_replace_rand(v_ret.lrn,v_lnp_rule.lrn_rewrite_rule,v_lnp_rule.lrn_rewrite_result);
              /*dbg{*/
              v_end:=clock_timestamp();
              RAISE NOTICE '% ms -> LNP. Translation. lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
              /*}dbg*/
              v_routing_key=v_ret.lrn;
            else
              v_ret.lrn=switch18.lnp_resolve(v_ret.lnp_database_id,v_lnp_key);
              if v_ret.lrn is null then -- fail
                /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> LNP. Query failed',EXTRACT(MILLISECOND from v_end-v_start);
                /*}dbg*/
                if v_drop_call_if_lnp_fail then
                  /*dbg{*/
                  v_end:=clock_timestamp();
                  RAISE NOTICE '% ms -> LNP. Dropping call',EXTRACT(MILLISECOND from v_end-v_start);
                  /*}dbg*/
                  v_ret.disconnect_code_id=8003; --No response from LNP DB
                  RETURN NEXT v_ret;
                  RETURN;
                end if;
              else
                /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> LNP. Success, lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
                /*}dbg*/
                -- TRANSLATING response from LNP DB
                v_ret.lrn=yeti_ext.regexp_replace_rand(v_ret.lrn,v_lnp_rule.lrn_rewrite_rule,v_lnp_rule.lrn_rewrite_result);
                /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> LNP. Translation. lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
                /*}dbg*/
                v_routing_key=v_ret.lrn;
              end if;
            end if;
          end if;
        end if;



        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DST. search start. Routing key: %. Routing tags: %, Rate limit: %',EXTRACT(MILLISECOND from v_end-v_start), v_routing_key, v_ret.routing_tag_ids, v_destination_rate_limit;
        /*}dbg*/
        v_network:=switch18.detect_network(v_ret.dst_prefix_routing);
        v_ret.dst_network_id=v_network.network_id;
        v_ret.dst_country_id=v_network.country_id;

        IF v_rp.validate_dst_number_network AND v_ret.dst_network_id is null THEN
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> Network detection. DST network validation enabled and DST network was not found. Rejecting calls',EXTRACT(MILLISECOND from v_end-v_start);
          /*}dbg*/

          v_ret.disconnect_code_id=8007; --No network detected for DST number
          RETURN NEXT v_ret;
          RETURN;
        END IF;


        IF v_rp.validate_dst_number_format AND NOT (v_routing_key ~ '^[0-9]+$') THEN
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> Dst number format is not valid. DST number: %s',EXTRACT(MILLISECOND from v_end-v_start), v_routing_key;
          /*}dbg*/

          v_ret.disconnect_code_id=8008; --Invalid number format
          RETURN NEXT v_ret;
          RETURN;
        END IF;

        SELECT into v_destination d.*/*,switch.tracelog(d.*)*/
        FROM class4.destinations d
        JOIN class4.rate_plan_groups rpg ON d.rate_group_id=rpg.rate_group_id
        WHERE
          prefix_range(prefix)@>prefix_range(v_routing_key)
          AND length(v_routing_key) between d.dst_number_min_length and d.dst_number_max_length
          AND rpg.rateplan_id=v_customer_auth_normalized.rateplan_id
          AND enabled
          AND valid_from <= v_now
          AND valid_till >= v_now
          AND yeti_ext.tag_compare(d.routing_tag_ids, v_call_tags, d.routing_tag_mode_id)>0
        ORDER BY length(prefix_range(prefix)) DESC, yeti_ext.tag_compare(d.routing_tag_ids, v_call_tags) desc
        limit 1;
        IF NOT FOUND THEN
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> DST.  Destination not found',EXTRACT(MILLISECOND from v_end-v_start);
          /*}dbg*/
          v_ret.disconnect_code_id=111; --Cant find destination prefix
          RETURN NEXT v_ret;
          RETURN;
        END IF;
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DST. found: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(v_destination, true);
        /*}dbg*/

        v_ret.destination_id:=v_destination.id;
        v_ret.destination_prefix=v_destination.prefix;
        v_ret.destination_initial_interval:=v_destination.initial_interval;
        v_ret.destination_fee:=v_destination.connect_fee::varchar;
        v_ret.destination_next_interval:=v_destination.next_interval;
        v_ret.destination_rate_policy_id:=v_destination.rate_policy_id;
        v_ret.destination_reverse_billing:=v_destination.reverse_billing;
        IF v_destination.reject_calls THEN
          v_ret.disconnect_code_id=112; --Rejected by destination
          RETURN NEXT v_ret;
          RETURN;
        END IF;

        if v_destination.next_rate::float>v_destination_rate_limit then
          v_ret.disconnect_code_id=8006; -- No destination with appropriate rate found
          RETURN NEXT v_ret;
          RETURN;
        end if;

        select into v_rateplan * from class4.rateplans where id=v_customer_auth_normalized.rateplan_id;
        if COALESCE(v_destination.profit_control_mode_id,v_rateplan.profit_control_mode_id)=2 then -- per call
          v_rate_limit=v_destination.next_rate::float;
        end if;


        /*
                    FIND dialpeers logic. Queries must use prefix index for best performance
        */
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DP. search start. Routing key: %. Rate limit: %. Routing tag: %',EXTRACT(MILLISECOND from v_end-v_start), v_routing_key, v_rate_limit, v_ret.routing_tag_ids;
        /*}dbg*/
        CASE v_rp.sorting_id
          WHEN'1' THEN -- LCR,Prio, ACD&ASR control
          FOR routedata IN (
            WITH step1 AS(
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.lcr_rate_multiplier AS dp_lcr_rate_multiplier,
                  t_dp.priority AS dp_priority,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id = t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            from step1
            WHERE
              r=1
              and exclusive_rank=1
              AND dp_next_rate<=v_rate_limit
              AND dp_enabled
              and not dp_locked --ACD&ASR control for DP
            ORDER BY dp_next_rate*dp_lcr_rate_multiplier, dp_priority DESC
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          end LOOP;
          WHEN '2' THEN --LCR, no prio, No ACD&ASR control
          FOR routedata IN (
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  --  (t_vendor_gateway.*)::class4.gateways as s1_vendor_gateway,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id)>0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              AND dp_enabled
              and dp_next_rate<=v_rate_limit
            ORDER BY dp_metric
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN '3' THEN --Prio, LCR, ACD&ASR control
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
              and not dp_locked
            ORDER BY dp_metric_priority DESC, dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN'4' THEN -- LCRD, Prio, ACD&ACR control
          FOR routedata IN (
            WITH step1 AS(
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  ((t_dp.next_rate - first_value(t_dp.next_rate) OVER(ORDER BY t_dp.next_rate ASC)) > v_rp.rate_delta_max)::INTEGER *(t_dp.next_rate + t_dp.priority) - t_dp.priority AS r2,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id = t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id)>0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            from step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_next_rate <= v_rate_limit
              and dp_enabled
              and not dp_locked --ACD&ASR control for DP
            ORDER BY r2 ASC
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          end LOOP;
          WHEN'5' THEN -- Route test
          FOR routedata IN (
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  and t_dp.vendor_id=v_test_vendor_id
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_enabled
              and dp_next_rate<=v_rate_limit
            ORDER BY dp_metric_priority DESC, dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN'6' THEN -- QD.Static,LCR,ACD&ACR control
          v_random:=random();
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY length(prefix_range(coalesce(rpsr.prefix,''))) desc
                  ) as r2,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled,
                  t_dp.force_hit_rate as dp_force_hit_rate,
                  rpsr.priority as rpsr_priority,
                  rpsr.weight as rpsr_weight
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                  left join class4.routing_plan_static_routes rpsr
                    ON rpsr.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                      and rpsr.vendor_id=t_dp.vendor_id
                      AND prefix_range(rpsr.prefix)@>prefix_range(v_routing_key)
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and r2=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
              and not dp_locked
            ORDER BY
              coalesce(v_random<=dp_force_hit_rate,false) desc,
              rpsr_priority,
              yeti_ext.rank_dns_srv(rpsr_weight) over ( partition by rpsr_priority order by rpsr_weight),
              dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN'7' THEN -- QD.Static, No ACD&ACR control
          v_random:=random();
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY length(prefix_range(coalesce(rpsr.prefix,''))) desc
                  ) as r2,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled,
                  t_dp.force_hit_rate as dp_force_hit_rate,
                  rpsr.priority as rpsr_priority,
                  rpsr.weight as rpsr_weight
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                  join class4.routing_plan_static_routes rpsr
                    ON rpsr.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                      and rpsr.vendor_id=t_dp.vendor_id
                      AND prefix_range(rpsr.prefix)@>prefix_range(v_routing_key)
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and r2=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
            ORDER BY
              coalesce(v_random<=dp_force_hit_rate,false) desc,
              rpsr_priority,
              yeti_ext.rank_dns_srv(rpsr_weight) over ( partition by rpsr_priority order by rpsr_weight),
              dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;

        ELSE
          RAISE NOTICE 'BUG: unknown sorting_id';
        END CASE;
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Dialpeer search done',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/
        v_ret.disconnect_code_id=113; --No routes
        RETURN NEXT v_ret;
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DONE.',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/
        RETURN;
      END;
      $_$;


--
-- Name: route_debug(integer, integer, smallint, inet, integer, inet, integer, character varying, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, inet, integer, smallint, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.route_debug(i_node_id integer, i_pop_id integer, i_protocol_id smallint, i_remote_ip inet, i_remote_port integer, i_local_ip inet, i_local_port integer, i_from_dsp character varying, i_from_name character varying, i_from_domain character varying, i_from_port integer, i_to_name character varying, i_to_domain character varying, i_to_port integer, i_contact_name character varying, i_contact_domain character varying, i_contact_port integer, i_uri_name character varying, i_uri_domain character varying, i_auth_id integer, i_x_yeti_auth character varying, i_diversion character varying, i_x_orig_ip inet, i_x_orig_port integer, i_x_orig_protocol_id smallint, i_pai character varying, i_ppi character varying, i_privacy character varying, i_rpid character varying, i_rpid_privacy character varying) RETURNS SETOF switch18.callprofile62_ty
    LANGUAGE plpgsql SECURITY DEFINER ROWS 10
    AS $_$
      DECLARE
        v_ret switch18.callprofile62_ty;
        i integer;
        v_ip inet;
        v_remote_ip inet;
        v_remote_port INTEGER;
        v_transport_protocol_id smallint;
        v_customer_auth_normalized class4.customers_auth_normalized;
        v_destination class4.destinations%rowtype;
        v_dialpeer record;
        v_rateplan class4.rateplans%rowtype;
        v_dst_gw class4.gateways%rowtype;
        v_orig_gw class4.gateways%rowtype;
        v_rp class4.routing_plans%rowtype;
        v_customer_allowtime real;
        v_vendor_allowtime real;
        v_sorting_id integer;
        v_customer_acc integer;
        v_route_found boolean:=false;
        v_c_acc billing.accounts%rowtype;
        v_v_acc billing.accounts%rowtype;
        v_network sys.network_prefixes%rowtype;
        routedata record;
        /*dbg{*/
        v_start timestamp;
        v_end timestamp;
        /*}dbg*/
        v_rate NUMERIC;
        v_now timestamp;
        v_x_yeti_auth varchar;
        --  v_uri_domain varchar;
        v_rate_limit float:='Infinity'::float;
        v_destination_rate_limit float:='Infinity'::float;
        v_test_vendor_id integer;
        v_random float;
        v_max_call_length integer;
        v_routing_key varchar;
        v_lnp_key varchar;
        v_drop_call_if_lnp_fail boolean;
        v_lnp_rule class4.routing_plan_lnp_rules%rowtype;
        v_numberlist record;
        v_numberlist_item record;
        v_call_tags smallint[]:='{}'::smallint[];
        v_area_direction class4.routing_tag_detection_rules%rowtype;
        v_numberlist_size integer;

      BEGIN
        /*dbg{*/
        v_start:=now();
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Execution start',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/

        perform id from sys.load_balancers where signalling_ip=host(i_remote_ip)::varchar;
        IF FOUND and i_x_orig_ip IS not NULL AND i_x_orig_port IS not NULL THEN
          v_remote_ip:=i_x_orig_ip;
          v_remote_port:=i_x_orig_port;
          v_transport_protocol_id=i_x_orig_protocol_id;
          /*dbg{*/RAISE NOTICE '% ms -> Got originator address "%:%, proto: %" from x-headers',EXTRACT(MILLISECOND from v_end-v_start), v_remote_ip,v_remote_port, v_transport_protocol_id;/*}dbg*/
        else
          v_remote_ip:=i_remote_ip;
          v_remote_port:=i_remote_port;
          v_transport_protocol_id:=i_protocol_id;
          /*dbg{*/RAISE NOTICE '% ms -> Got originator address "%:%, proto: %" from switch leg info',EXTRACT(MILLISECOND from v_end-v_start), v_remote_ip,v_remote_port, v_transport_protocol_id;/*}dbg*/
        end if;

        v_now:=now();
        v_ret:=switch18.new_profile();
        v_ret.cache_time = 10;

        v_ret.diversion_in:=i_diversion;
        v_ret.diversion_out:=i_diversion; -- FIXME

        v_ret.auth_orig_protocol_id =v_transport_protocol_id;
        v_ret.auth_orig_ip = v_remote_ip;
        v_ret.auth_orig_port = v_remote_port;

        v_ret.src_name_in:=i_from_dsp;
        v_ret.src_name_out:=v_ret.src_name_in;

        v_ret.src_prefix_in:=i_from_name;
        v_ret.src_prefix_out:=v_ret.src_prefix_in;

        v_ret.dst_prefix_in:=i_uri_name;
        v_ret.dst_prefix_out:=v_ret.dst_prefix_in;


        v_ret.ruri_domain=i_uri_domain;
        v_ret.from_domain=i_from_domain;
        v_ret.to_domain=i_to_domain;

        v_ret.pai_in=i_pai;
        v_ret.ppi_in=i_ppi;
        v_ret.privacy_in=i_privacy;
        v_ret.rpid_in=i_rpid;
        v_ret.rpid_privacy_in=i_rpid_privacy;

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. lookup started',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/
        v_x_yeti_auth:=COALESCE(i_x_yeti_auth,'');
        --  v_uri_domain:=COALESCE(i_uri_domain,'');

        if i_auth_id is null then
            SELECT into v_customer_auth_normalized ca.*
            from class4.customers_auth_normalized ca
                JOIN public.contractors c ON c.id=ca.customer_id
            WHERE ca.enabled AND
              ca.ip>>=v_remote_ip AND
              prefix_range(ca.dst_prefix)@>prefix_range(v_ret.dst_prefix_in) AND
              prefix_range(ca.src_prefix)@>prefix_range(v_ret.src_prefix_in) AND
              (ca.pop_id=i_pop_id or ca.pop_id is null) and
              COALESCE(ca.x_yeti_auth,'')=v_x_yeti_auth AND
              COALESCE(nullif(ca.uri_domain,'')=i_uri_domain,true) AND
              COALESCE(nullif(ca.to_domain,'')=i_to_domain,true) AND
              COALESCE(nullif(ca.from_domain,'')=i_from_domain,true) AND
              (ca.transport_protocol_id is null or ca.transport_protocol_id=v_transport_protocol_id) AND
              length(v_ret.dst_prefix_in) between ca.dst_number_min_length and ca.dst_number_max_length and
              length(v_ret.src_prefix_in) between ca.src_number_min_length and ca.src_number_max_length and
              c.enabled and c.customer
            ORDER BY
                masklen(ca.ip) DESC,
                ca.transport_protocol_id is null,
                length(prefix_range(ca.dst_prefix)) DESC,
                length(prefix_range(ca.src_prefix)) DESC,
                ca.pop_id is null,
                ca.uri_domain is null,
                ca.to_domain is null,
                ca.from_domain is null,
                ca.require_incoming_auth
            LIMIT 1;
            IF NOT FOUND THEN
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 110.Cant find customer or customer locked',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=110; --Cant find customer or customer locked
                RETURN NEXT v_ret;
                RETURN;
            END IF;
            if v_customer_auth_normalized.require_incoming_auth then
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH. Incoming auth required. Respond 401',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.aleg_auth_required=true;
                RETURN NEXT v_ret;
                RETURN;
            end IF;
            if v_customer_auth_normalized.reject_calls then
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 8004. Reject by customers auth',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=8004; -- call rejected by authorization

                v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
                v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

                v_ret.customer_id:=v_customer_auth_normalized.customer_id;
                select into strict v_ret.customer_external_id external_id from public.contractors where id=v_ret.customer_id;

                v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
                v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;

                v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
                SELECT INTO STRICT v_ret.customer_acc_external_id external_id FROM billing.accounts WHERE id=v_customer_auth_normalized.account_id;

                RETURN NEXT v_ret;
                RETURN;
            end if;
        else
            SELECT into v_customer_auth_normalized ca.*
            from class4.customers_auth_normalized ca
                JOIN public.contractors c ON c.id=ca.customer_id
            WHERE ca.enabled AND
              ca.ip>>=v_remote_ip AND
              prefix_range(ca.dst_prefix)@>prefix_range(v_ret.dst_prefix_in) AND
              prefix_range(ca.src_prefix)@>prefix_range(v_ret.src_prefix_in) AND
              (ca.pop_id=i_pop_id or ca.pop_id is null) and
              COALESCE(ca.x_yeti_auth,'')=v_x_yeti_auth AND
              COALESCE(nullif(ca.uri_domain,'')=i_uri_domain,true) AND
              COALESCE(nullif(ca.to_domain,'')=i_to_domain,true) AND
              COALESCE(nullif(ca.from_domain,'')=i_from_domain,true) AND
              (ca.transport_protocol_id is null or ca.transport_protocol_id=v_transport_protocol_id) AND
              length(v_ret.dst_prefix_in) between ca.dst_number_min_length and ca.dst_number_max_length and
              length(v_ret.src_prefix_in) between ca.src_number_min_length and ca.src_number_max_length and
              c.enabled and c.customer and
              ca.require_incoming_auth and gateway_id = i_auth_id
            ORDER BY
                masklen(ca.ip) DESC,
                ca.transport_protocol_id is null,
                length(prefix_range(ca.dst_prefix)) DESC,
                length(prefix_range(ca.src_prefix)) DESC,
                ca.pop_id is null,
                ca.uri_domain is null,
                ca.to_domain is null,
                ca.from_domain is null
            LIMIT 1;
            IF NOT FOUND THEN
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 110.Cant find customer or customer locked',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=110; --Cant find customer or customer locked
                RETURN NEXT v_ret;
                RETURN;
            END IF;
            if v_customer_auth_normalized.reject_calls then
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 8004. Reject by customers auth',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=8004; -- call rejected by authorization

                v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
                v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

                v_ret.customer_id:=v_customer_auth_normalized.customer_id;
                select into strict v_ret.customer_external_id external_id from public.contractors where id=v_ret.customer_id;

                v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
                v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;

                v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
                SELECT INTO STRICT v_ret.customer_acc_external_id external_id FROM billing.accounts WHERE id=v_customer_auth_normalized.account_id;

                RETURN NEXT v_ret;
                RETURN;
            end if;
        end IF;

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. found: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(v_customer_auth_normalized, true);
        /*}dbg*/

        -- redefine call SRC/DST numbers

        IF v_customer_auth_normalized.src_name_field_id=1 THEN  /* default - from uri display name */
          v_ret.src_name_in:=i_from_dsp;
        END IF;
        v_ret.src_name_out:=v_ret.src_name_in;

        IF v_customer_auth_normalized.src_number_field_id=1 THEN  /* default - from uri userpart */
          v_ret.src_prefix_in:=i_from_name;
        ELSIF v_customer_auth_normalized.src_number_field_id=2 THEN /* From uri Display name */
          v_ret.src_prefix_in:=i_from_dsp;
        END IF;
        v_ret.src_prefix_out:=v_ret.src_prefix_in;

        IF v_customer_auth_normalized.dst_number_field_id=1 THEN /* default  - RURI userpart*/
          v_ret.dst_prefix_in:=i_uri_name;
        ELSIF v_customer_auth_normalized.dst_number_field_id=2 THEN /* TO URI userpart */
          v_ret.dst_prefix_in:=i_to_name;
        ELSIF v_customer_auth_normalized.dst_number_field_id=3 THEN /* Top-Most Diversion header userpart */
          v_ret.dst_prefix_in:=i_diversion;
        END IF;
        v_ret.dst_prefix_out:=v_ret.dst_prefix_in;


        -- feel customer data ;-)
        v_ret.dump_level_id:=v_customer_auth_normalized.dump_level_id;
        v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
        v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

        v_ret.customer_id:=v_customer_auth_normalized.customer_id;
        select into strict v_ret.customer_external_id external_id from public.contractors where id=v_customer_auth_normalized.customer_id;

        v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
        v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;
        v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
        v_ret.orig_gw_id:=v_customer_auth_normalized.gateway_id;

        v_ret.radius_auth_profile_id=v_customer_auth_normalized.radius_auth_profile_id;
        v_ret.aleg_radius_acc_profile_id=v_customer_auth_normalized.radius_accounting_profile_id;
        v_ret.record_audio=v_customer_auth_normalized.enable_audio_recording;

        v_ret.customer_acc_check_balance=v_customer_auth_normalized.check_account_balance;

        SELECT INTO STRICT v_c_acc * FROM billing.accounts  WHERE id=v_customer_auth_normalized.account_id;
        v_ret.customer_acc_external_id=v_c_acc.external_id;
        v_ret.customer_acc_vat=v_c_acc.vat;
        v_destination_rate_limit=coalesce(v_c_acc.destination_rate_limit::float,'Infinity'::float);

        if v_customer_auth_normalized.check_account_balance AND v_c_acc.balance<=v_c_acc.min_balance then
          v_ret.disconnect_code_id=8000; --No enough customer balance
          RETURN NEXT v_ret;
          RETURN;
        end if;

        v_ret.customer_acc_external_id=v_c_acc.external_id;
        v_ret.customer_acc_vat=v_c_acc.vat;

        SELECT into v_orig_gw * from class4.gateways WHERE id=v_customer_auth_normalized.gateway_id;
        if not v_orig_gw.enabled then
          v_ret.disconnect_code_id=8005; -- Origination gateway is disabled
          RETURN NEXT v_ret;
          RETURN;
        end if;

        v_ret.resources:='';
        if v_customer_auth_normalized.capacity is not null then
          v_ret.resources:=v_ret.resources||'3:'||v_customer_auth_normalized.customers_auth_id||':'||v_customer_auth_normalized.capacity::varchar||':1;';
        end if;

        if v_c_acc.origination_capacity is not null then
          v_ret.resources:=v_ret.resources||'1:'||v_c_acc.id::varchar||':'||v_c_acc.origination_capacity::varchar||':1;';
        end if;

        if v_c_acc.total_capacity is not null then
          v_ret.resources:=v_ret.resources||'7:'||v_c_acc.id::varchar||':'||v_c_acc.total_capacity::varchar||':1;';
        end if;

        if v_orig_gw.origination_capacity is not null then
          v_ret.resources:=v_ret.resources||'4:'||v_orig_gw.id::varchar||':'||v_orig_gw.origination_capacity::varchar||':1;';
        end if;

        -- Tag processing CA
        v_call_tags=yeti_ext.tag_action(v_customer_auth_normalized.tag_action_id, v_call_tags, v_customer_auth_normalized.tag_action_value);

        /*
            number rewriting _Before_ routing
        */
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. Before rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.src_prefix_out,v_ret.dst_prefix_out;
        /*}dbg*/
        v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(v_ret.dst_prefix_out,v_customer_auth_normalized.dst_rewrite_rule,v_customer_auth_normalized.dst_rewrite_result);
        v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(v_ret.src_prefix_out,v_customer_auth_normalized.src_rewrite_rule,v_customer_auth_normalized.src_rewrite_result);
        v_ret.src_name_out=yeti_ext.regexp_replace_rand(v_ret.src_name_out,v_customer_auth_normalized.src_name_rewrite_rule,v_customer_auth_normalized.src_name_rewrite_result, true);

        --  if v_ret.radius_auth_profile_id is not null then
        v_ret.src_number_radius:=i_from_name;
        v_ret.dst_number_radius:=i_uri_name;
        v_ret.src_number_radius=yeti_ext.regexp_replace_rand(
            v_ret.src_number_radius,
            v_customer_auth_normalized.src_number_radius_rewrite_rule,
            v_customer_auth_normalized.src_number_radius_rewrite_result
        );

        v_ret.dst_number_radius=yeti_ext.regexp_replace_rand(
            v_ret.dst_number_radius,
            v_customer_auth_normalized.dst_number_radius_rewrite_rule,
            v_customer_auth_normalized.dst_number_radius_rewrite_result
        );
        v_ret.customer_auth_name=v_customer_auth_normalized."name";
        v_ret.customer_name=(select "name" from public.contractors where id=v_customer_auth_normalized.customer_id limit 1);
        --  end if;


        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. After rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.src_prefix_out,v_ret.dst_prefix_out;
        /*}dbg*/

        ----- Numberlist processing-------------------------------------------------------------------------------------------------------
        if v_customer_auth_normalized.dst_numberlist_id is not null then
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> DST Numberlist processing. Lookup by key: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.dst_prefix_out;
          /*}dbg*/
          select into v_numberlist * from class4.numberlists where id=v_customer_auth_normalized.dst_numberlist_id;
          CASE v_numberlist.mode_id
            when 1 then -- strict match
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id and ni.key=v_ret.dst_prefix_out limit 1;
            when 2 then -- prefix match
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where
                  ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id and
                  prefix_range(ni.key)@>prefix_range(v_ret.dst_prefix_out) and
                  length(v_ret.dst_prefix_out) between ni.number_min_length and ni.number_max_length
                order by length(prefix_range(ni.key))
                desc limit 1;
            when 3 then -- random
                select into v_numberlist_size count(*) from class4.numberlist_items where numberlist_id=v_customer_auth_normalized.dst_numberlist_id;
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id order by ni.id OFFSET floor(random()*v_numberlist_size) limit 1;
          end case;
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> DST Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_numberlist_item);
          /*}dbg*/
          IF v_numberlist_item.action_id is not null and v_numberlist_item.action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> DST Numberlist. Drop by key action. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_numberlist_item.key;
            /*}dbg*/
            v_ret.disconnect_code_id=8001; --destination blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is not null and v_numberlist_item.action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist_item.src_rewrite_rule,
                v_numberlist_item.src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist_item.dst_rewrite_rule,
                v_numberlist_item.dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist_item.tag_action_id, v_call_tags, v_numberlist_item.tag_action_value);
            -- pass call NOP.
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> DST Numberlist. Drop by default action',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
            -- drop by default
            v_ret.disconnect_code_id=8001; --destination blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist.default_src_rewrite_rule,
                v_numberlist.default_src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist.default_dst_rewrite_rule,
                v_numberlist.default_dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist.tag_action_id, v_call_tags, v_numberlist.tag_action_value);
            -- pass by default
          end if;
        end if;

        if v_customer_auth_normalized.src_numberlist_id is not null then
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> SRC Numberlist processing. Lookup by key: %s',EXTRACT(MILLISECOND from v_end-v_start), v_ret.src_prefix_out;
          /*}dbg*/
          select into v_numberlist * from class4.numberlists where id=v_customer_auth_normalized.src_numberlist_id;
          CASE v_numberlist.mode_id
            when 1 then -- strict match
              select into v_numberlist_item * from class4.numberlist_items ni
              where ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id and ni.key=v_ret.src_prefix_out limit 1;
            when 2 then -- prefix match
              select into v_numberlist_item * from class4.numberlist_items ni
              where
                ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id and
                prefix_range(ni.key)@>prefix_range(v_ret.src_prefix_out) and
                length(v_ret.src_prefix_out) between ni.number_min_length and ni.number_max_length
              order by length(prefix_range(ni.key)) desc limit 1;
            when 3 then -- random
              select into v_numberlist_size count(*) from class4.numberlist_items where numberlist_id=v_customer_auth_normalized.src_numberlist_id;
              select into v_numberlist_item *
              from class4.numberlist_items ni
              where ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id order by ni.id OFFSET floor(random()*v_numberlist_size) limit 1;
          end case;
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> SRC Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_numberlist_item);
          /*}dbg*/
          IF v_numberlist_item.action_id is not null and v_numberlist_item.action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> SRC Numberlist. Drop by key action. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_numberlist_item.key;
            /*}dbg*/
            v_ret.disconnect_code_id=8002; --source blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is not null and v_numberlist_item.action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist_item.src_rewrite_rule,
                v_numberlist_item.src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist_item.dst_rewrite_rule,
                v_numberlist_item.dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist_item.tag_action_id, v_call_tags, v_numberlist_item.tag_action_value);
            -- pass call NOP.
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> SRC Numberlist. Drop by default action',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
            v_ret.disconnect_code_id=8002; --source blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist.default_src_rewrite_rule,
                v_numberlist.default_src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist.default_dst_rewrite_rule,
                v_numberlist.default_dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist.tag_action_id, v_call_tags, v_numberlist.tag_action_value);
            -- pass by default
          end if;
        end if;

        --  setting numbers used for routing & billing
        v_ret.src_prefix_routing=v_ret.src_prefix_out;
        v_ret.dst_prefix_routing=v_ret.dst_prefix_out;
        v_routing_key=v_ret.dst_prefix_out;

        -- Areas and Tag detection-------------------------------------------
        v_ret.src_area_id:=(
          select area_id from class4.area_prefixes where prefix_range(prefix)@>prefix_range(v_ret.src_prefix_routing)
          order by length(prefix_range(prefix)) desc limit 1
        );

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> SRC Area found: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.src_area_id;
        /*}dbg*/

        v_ret.dst_area_id:=(
          select area_id from class4.area_prefixes where prefix_range(prefix)@>prefix_range(v_ret.dst_prefix_routing)
          order by length(prefix_range(prefix)) desc limit 1
        );

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DST Area found: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.dst_area_id;
        /*}dbg*/


        select into v_area_direction * from class4.routing_tag_detection_rules
        where
          (src_area_id is null OR src_area_id = v_ret.src_area_id) AND
          (dst_area_id is null OR dst_area_id = v_ret.dst_area_id) AND
          prefix_range(src_prefix) @> prefix_range(v_ret.src_prefix_routing) AND
          prefix_range(dst_prefix) @> prefix_range(v_ret.dst_prefix_routing) AND
          yeti_ext.tag_compare(routing_tag_ids, v_call_tags, routing_tag_mode_id ) > 0
        order by
          yeti_ext.tag_compare(routing_tag_ids, v_call_tags, routing_tag_mode_id) desc,
          length(prefix_range(v_ret.src_prefix_routing)) desc,
          length(prefix_range(v_ret.dst_prefix_routing)) desc,
          src_area_id is null,
          dst_area_id is null
        limit 1;
        if found then
            v_call_tags=yeti_ext.tag_action(v_area_direction.tag_action_id, v_call_tags, v_area_direction.tag_action_value);
        end if;

        v_ret.routing_tag_ids:=v_call_tags;

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Routing tag detected: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.routing_tag_ids;
        /*}dbg*/
        ----------------------------------------------------------------------

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Routing plan search start',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/

        select into v_max_call_length,v_drop_call_if_lnp_fail max_call_duration,drop_call_if_lnp_fail from sys.guiconfig limit 1;

        v_routing_key=v_ret.dst_prefix_routing;
        SELECT INTO v_rp * from class4.routing_plans WHERE id=v_customer_auth_normalized.routing_plan_id;
        if v_rp.sorting_id=5 then -- route testing
          v_test_vendor_id=regexp_replace(v_routing_key,'(.*)\*(.*)','\1')::integer;
          v_routing_key=regexp_replace(v_routing_key,'(.*)\*(.*)','\2');
          v_ret.dst_prefix_out=v_routing_key;
          v_ret.dst_prefix_routing=v_routing_key;
        end if;

        if v_rp.use_lnp then
          select into v_lnp_rule rules.*
          from class4.routing_plan_lnp_rules rules
          WHERE prefix_range(rules.dst_prefix)@>prefix_range(v_ret.dst_prefix_routing) and rules.routing_plan_id=v_rp.id
          order by length(prefix_range(rules.dst_prefix)) limit 1;
          if found then
            v_ret.lnp_database_id=v_lnp_rule.database_id;
            v_lnp_key=v_ret.dst_prefix_routing;
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> LNP. Need LNP lookup, LNP key: %',EXTRACT(MILLISECOND from v_end-v_start),v_lnp_key;
            /*}dbg*/
            v_lnp_key=yeti_ext.regexp_replace_rand(v_lnp_key,v_lnp_rule.req_dst_rewrite_rule,v_lnp_rule.req_dst_rewrite_result);
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> LNP key translation. LNP key: %',EXTRACT(MILLISECOND from v_end-v_start),v_lnp_key;
            /*}dbg*/
            -- try cache
            select into v_ret.lrn lrn from class4.lnp_cache where dst=v_lnp_key AND database_id=v_lnp_rule.database_id and expires_at>v_now;
            if found then
              /*dbg{*/
              v_end:=clock_timestamp();
              RAISE NOTICE '% ms -> LNP. Data found in cache, lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
              /*}dbg*/
              -- TRANSLATING response from cache
              v_ret.lrn=yeti_ext.regexp_replace_rand(v_ret.lrn,v_lnp_rule.lrn_rewrite_rule,v_lnp_rule.lrn_rewrite_result);
              /*dbg{*/
              v_end:=clock_timestamp();
              RAISE NOTICE '% ms -> LNP. Translation. lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
              /*}dbg*/
              v_routing_key=v_ret.lrn;
            else
              v_ret.lrn=switch18.lnp_resolve(v_ret.lnp_database_id,v_lnp_key);
              if v_ret.lrn is null then -- fail
                /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> LNP. Query failed',EXTRACT(MILLISECOND from v_end-v_start);
                /*}dbg*/
                if v_drop_call_if_lnp_fail then
                  /*dbg{*/
                  v_end:=clock_timestamp();
                  RAISE NOTICE '% ms -> LNP. Dropping call',EXTRACT(MILLISECOND from v_end-v_start);
                  /*}dbg*/
                  v_ret.disconnect_code_id=8003; --No response from LNP DB
                  RETURN NEXT v_ret;
                  RETURN;
                end if;
              else
                /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> LNP. Success, lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
                /*}dbg*/
                -- TRANSLATING response from LNP DB
                v_ret.lrn=yeti_ext.regexp_replace_rand(v_ret.lrn,v_lnp_rule.lrn_rewrite_rule,v_lnp_rule.lrn_rewrite_result);
                /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> LNP. Translation. lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
                /*}dbg*/
                v_routing_key=v_ret.lrn;
              end if;
            end if;
          end if;
        end if;



        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DST. search start. Routing key: %. Routing tags: %, Rate limit: %',EXTRACT(MILLISECOND from v_end-v_start), v_routing_key, v_ret.routing_tag_ids, v_destination_rate_limit;
        /*}dbg*/
        v_network:=switch18.detect_network(v_ret.dst_prefix_routing);
        v_ret.dst_network_id=v_network.network_id;
        v_ret.dst_country_id=v_network.country_id;

        IF v_rp.validate_dst_number_network AND v_ret.dst_network_id is null THEN
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> Network detection. DST network validation enabled and DST network was not found. Rejecting calls',EXTRACT(MILLISECOND from v_end-v_start);
          /*}dbg*/

          v_ret.disconnect_code_id=8007; --No network detected for DST number
          RETURN NEXT v_ret;
          RETURN;
        END IF;


        IF v_rp.validate_dst_number_format AND NOT (v_routing_key ~ '^[0-9]+$') THEN
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> Dst number format is not valid. DST number: %s',EXTRACT(MILLISECOND from v_end-v_start), v_routing_key;
          /*}dbg*/

          v_ret.disconnect_code_id=8008; --Invalid number format
          RETURN NEXT v_ret;
          RETURN;
        END IF;

        SELECT into v_destination d.*/*,switch.tracelog(d.*)*/
        FROM class4.destinations d
        JOIN class4.rate_plan_groups rpg ON d.rate_group_id=rpg.rate_group_id
        WHERE
          prefix_range(prefix)@>prefix_range(v_routing_key)
          AND length(v_routing_key) between d.dst_number_min_length and d.dst_number_max_length
          AND rpg.rateplan_id=v_customer_auth_normalized.rateplan_id
          AND enabled
          AND valid_from <= v_now
          AND valid_till >= v_now
          AND yeti_ext.tag_compare(d.routing_tag_ids, v_call_tags, d.routing_tag_mode_id)>0
        ORDER BY length(prefix_range(prefix)) DESC, yeti_ext.tag_compare(d.routing_tag_ids, v_call_tags) desc
        limit 1;
        IF NOT FOUND THEN
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> DST.  Destination not found',EXTRACT(MILLISECOND from v_end-v_start);
          /*}dbg*/
          v_ret.disconnect_code_id=111; --Cant find destination prefix
          RETURN NEXT v_ret;
          RETURN;
        END IF;
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DST. found: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(v_destination, true);
        /*}dbg*/

        v_ret.destination_id:=v_destination.id;
        v_ret.destination_prefix=v_destination.prefix;
        v_ret.destination_initial_interval:=v_destination.initial_interval;
        v_ret.destination_fee:=v_destination.connect_fee::varchar;
        v_ret.destination_next_interval:=v_destination.next_interval;
        v_ret.destination_rate_policy_id:=v_destination.rate_policy_id;
        v_ret.destination_reverse_billing:=v_destination.reverse_billing;
        IF v_destination.reject_calls THEN
          v_ret.disconnect_code_id=112; --Rejected by destination
          RETURN NEXT v_ret;
          RETURN;
        END IF;

        if v_destination.next_rate::float>v_destination_rate_limit then
          v_ret.disconnect_code_id=8006; -- No destination with appropriate rate found
          RETURN NEXT v_ret;
          RETURN;
        end if;

        select into v_rateplan * from class4.rateplans where id=v_customer_auth_normalized.rateplan_id;
        if COALESCE(v_destination.profit_control_mode_id,v_rateplan.profit_control_mode_id)=2 then -- per call
          v_rate_limit=v_destination.next_rate::float;
        end if;


        /*
                    FIND dialpeers logic. Queries must use prefix index for best performance
        */
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DP. search start. Routing key: %. Rate limit: %. Routing tag: %',EXTRACT(MILLISECOND from v_end-v_start), v_routing_key, v_rate_limit, v_ret.routing_tag_ids;
        /*}dbg*/
        CASE v_rp.sorting_id
          WHEN'1' THEN -- LCR,Prio, ACD&ASR control
          FOR routedata IN (
            WITH step1 AS(
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.lcr_rate_multiplier AS dp_lcr_rate_multiplier,
                  t_dp.priority AS dp_priority,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id = t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            from step1
            WHERE
              r=1
              and exclusive_rank=1
              AND dp_next_rate<=v_rate_limit
              AND dp_enabled
              and not dp_locked --ACD&ASR control for DP
            ORDER BY dp_next_rate*dp_lcr_rate_multiplier, dp_priority DESC
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          end LOOP;
          WHEN '2' THEN --LCR, no prio, No ACD&ASR control
          FOR routedata IN (
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  --  (t_vendor_gateway.*)::class4.gateways as s1_vendor_gateway,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id)>0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              AND dp_enabled
              and dp_next_rate<=v_rate_limit
            ORDER BY dp_metric
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN '3' THEN --Prio, LCR, ACD&ASR control
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
              and not dp_locked
            ORDER BY dp_metric_priority DESC, dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN'4' THEN -- LCRD, Prio, ACD&ACR control
          FOR routedata IN (
            WITH step1 AS(
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  ((t_dp.next_rate - first_value(t_dp.next_rate) OVER(ORDER BY t_dp.next_rate ASC)) > v_rp.rate_delta_max)::INTEGER *(t_dp.next_rate + t_dp.priority) - t_dp.priority AS r2,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id = t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id)>0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            from step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_next_rate <= v_rate_limit
              and dp_enabled
              and not dp_locked --ACD&ASR control for DP
            ORDER BY r2 ASC
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          end LOOP;
          WHEN'5' THEN -- Route test
          FOR routedata IN (
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  and t_dp.vendor_id=v_test_vendor_id
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_enabled
              and dp_next_rate<=v_rate_limit
            ORDER BY dp_metric_priority DESC, dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN'6' THEN -- QD.Static,LCR,ACD&ACR control
          v_random:=random();
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY length(prefix_range(coalesce(rpsr.prefix,''))) desc
                  ) as r2,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled,
                  t_dp.force_hit_rate as dp_force_hit_rate,
                  rpsr.priority as rpsr_priority,
                  rpsr.weight as rpsr_weight
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                  left join class4.routing_plan_static_routes rpsr
                    ON rpsr.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                      and rpsr.vendor_id=t_dp.vendor_id
                      AND prefix_range(rpsr.prefix)@>prefix_range(v_routing_key)
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and r2=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
              and not dp_locked
            ORDER BY
              coalesce(v_random<=dp_force_hit_rate,false) desc,
              rpsr_priority,
              yeti_ext.rank_dns_srv(rpsr_weight) over ( partition by rpsr_priority order by rpsr_weight),
              dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN'7' THEN -- QD.Static, No ACD&ACR control
          v_random:=random();
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY length(prefix_range(coalesce(rpsr.prefix,''))) desc
                  ) as r2,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled,
                  t_dp.force_hit_rate as dp_force_hit_rate,
                  rpsr.priority as rpsr_priority,
                  rpsr.weight as rpsr_weight
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                  join class4.routing_plan_static_routes rpsr
                    ON rpsr.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                      and rpsr.vendor_id=t_dp.vendor_id
                      AND prefix_range(rpsr.prefix)@>prefix_range(v_routing_key)
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and r2=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
            ORDER BY
              coalesce(v_random<=dp_force_hit_rate,false) desc,
              rpsr_priority,
              yeti_ext.rank_dns_srv(rpsr_weight) over ( partition by rpsr_priority order by rpsr_weight),
              dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;

        ELSE
          RAISE NOTICE 'BUG: unknown sorting_id';
        END CASE;
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Dialpeer search done',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/
        v_ret.disconnect_code_id=113; --No routes
        RETURN NEXT v_ret;
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DONE.',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/
        RETURN;
      END;
      $_$;


--
-- Name: route_release(integer, integer, smallint, inet, integer, inet, integer, character varying, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, inet, integer, smallint, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.route_release(i_node_id integer, i_pop_id integer, i_protocol_id smallint, i_remote_ip inet, i_remote_port integer, i_local_ip inet, i_local_port integer, i_from_dsp character varying, i_from_name character varying, i_from_domain character varying, i_from_port integer, i_to_name character varying, i_to_domain character varying, i_to_port integer, i_contact_name character varying, i_contact_domain character varying, i_contact_port integer, i_uri_name character varying, i_uri_domain character varying, i_auth_id integer, i_x_yeti_auth character varying, i_diversion character varying, i_x_orig_ip inet, i_x_orig_port integer, i_x_orig_protocol_id smallint, i_pai character varying, i_ppi character varying, i_privacy character varying, i_rpid character varying, i_rpid_privacy character varying) RETURNS SETOF switch18.callprofile62_ty
    LANGUAGE plpgsql SECURITY DEFINER ROWS 10
    AS $_$
      DECLARE
        v_ret switch18.callprofile62_ty;
        i integer;
        v_ip inet;
        v_remote_ip inet;
        v_remote_port INTEGER;
        v_transport_protocol_id smallint;
        v_customer_auth_normalized class4.customers_auth_normalized;
        v_destination class4.destinations%rowtype;
        v_dialpeer record;
        v_rateplan class4.rateplans%rowtype;
        v_dst_gw class4.gateways%rowtype;
        v_orig_gw class4.gateways%rowtype;
        v_rp class4.routing_plans%rowtype;
        v_customer_allowtime real;
        v_vendor_allowtime real;
        v_sorting_id integer;
        v_customer_acc integer;
        v_route_found boolean:=false;
        v_c_acc billing.accounts%rowtype;
        v_v_acc billing.accounts%rowtype;
        v_network sys.network_prefixes%rowtype;
        routedata record;
        
        v_rate NUMERIC;
        v_now timestamp;
        v_x_yeti_auth varchar;
        --  v_uri_domain varchar;
        v_rate_limit float:='Infinity'::float;
        v_destination_rate_limit float:='Infinity'::float;
        v_test_vendor_id integer;
        v_random float;
        v_max_call_length integer;
        v_routing_key varchar;
        v_lnp_key varchar;
        v_drop_call_if_lnp_fail boolean;
        v_lnp_rule class4.routing_plan_lnp_rules%rowtype;
        v_numberlist record;
        v_numberlist_item record;
        v_call_tags smallint[]:='{}'::smallint[];
        v_area_direction class4.routing_tag_detection_rules%rowtype;
        v_numberlist_size integer;

      BEGIN
        

        perform id from sys.load_balancers where signalling_ip=host(i_remote_ip)::varchar;
        IF FOUND and i_x_orig_ip IS not NULL AND i_x_orig_port IS not NULL THEN
          v_remote_ip:=i_x_orig_ip;
          v_remote_port:=i_x_orig_port;
          v_transport_protocol_id=i_x_orig_protocol_id;
          
        else
          v_remote_ip:=i_remote_ip;
          v_remote_port:=i_remote_port;
          v_transport_protocol_id:=i_protocol_id;
          
        end if;

        v_now:=now();
        v_ret:=switch18.new_profile();
        v_ret.cache_time = 10;

        v_ret.diversion_in:=i_diversion;
        v_ret.diversion_out:=i_diversion; -- FIXME

        v_ret.auth_orig_protocol_id =v_transport_protocol_id;
        v_ret.auth_orig_ip = v_remote_ip;
        v_ret.auth_orig_port = v_remote_port;

        v_ret.src_name_in:=i_from_dsp;
        v_ret.src_name_out:=v_ret.src_name_in;

        v_ret.src_prefix_in:=i_from_name;
        v_ret.src_prefix_out:=v_ret.src_prefix_in;

        v_ret.dst_prefix_in:=i_uri_name;
        v_ret.dst_prefix_out:=v_ret.dst_prefix_in;


        v_ret.ruri_domain=i_uri_domain;
        v_ret.from_domain=i_from_domain;
        v_ret.to_domain=i_to_domain;

        v_ret.pai_in=i_pai;
        v_ret.ppi_in=i_ppi;
        v_ret.privacy_in=i_privacy;
        v_ret.rpid_in=i_rpid;
        v_ret.rpid_privacy_in=i_rpid_privacy;

        
        v_x_yeti_auth:=COALESCE(i_x_yeti_auth,'');
        --  v_uri_domain:=COALESCE(i_uri_domain,'');

        if i_auth_id is null then
            SELECT into v_customer_auth_normalized ca.*
            from class4.customers_auth_normalized ca
                JOIN public.contractors c ON c.id=ca.customer_id
            WHERE ca.enabled AND
              ca.ip>>=v_remote_ip AND
              prefix_range(ca.dst_prefix)@>prefix_range(v_ret.dst_prefix_in) AND
              prefix_range(ca.src_prefix)@>prefix_range(v_ret.src_prefix_in) AND
              (ca.pop_id=i_pop_id or ca.pop_id is null) and
              COALESCE(ca.x_yeti_auth,'')=v_x_yeti_auth AND
              COALESCE(nullif(ca.uri_domain,'')=i_uri_domain,true) AND
              COALESCE(nullif(ca.to_domain,'')=i_to_domain,true) AND
              COALESCE(nullif(ca.from_domain,'')=i_from_domain,true) AND
              (ca.transport_protocol_id is null or ca.transport_protocol_id=v_transport_protocol_id) AND
              length(v_ret.dst_prefix_in) between ca.dst_number_min_length and ca.dst_number_max_length and
              length(v_ret.src_prefix_in) between ca.src_number_min_length and ca.src_number_max_length and
              c.enabled and c.customer
            ORDER BY
                masklen(ca.ip) DESC,
                ca.transport_protocol_id is null,
                length(prefix_range(ca.dst_prefix)) DESC,
                length(prefix_range(ca.src_prefix)) DESC,
                ca.pop_id is null,
                ca.uri_domain is null,
                ca.to_domain is null,
                ca.from_domain is null,
                ca.require_incoming_auth
            LIMIT 1;
            IF NOT FOUND THEN
            
                v_ret.disconnect_code_id=110; --Cant find customer or customer locked
                RETURN NEXT v_ret;
                RETURN;
            END IF;
            if v_customer_auth_normalized.require_incoming_auth then
            
                v_ret.aleg_auth_required=true;
                RETURN NEXT v_ret;
                RETURN;
            end IF;
            if v_customer_auth_normalized.reject_calls then
            
                v_ret.disconnect_code_id=8004; -- call rejected by authorization

                v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
                v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

                v_ret.customer_id:=v_customer_auth_normalized.customer_id;
                select into strict v_ret.customer_external_id external_id from public.contractors where id=v_ret.customer_id;

                v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
                v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;

                v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
                SELECT INTO STRICT v_ret.customer_acc_external_id external_id FROM billing.accounts WHERE id=v_customer_auth_normalized.account_id;

                RETURN NEXT v_ret;
                RETURN;
            end if;
        else
            SELECT into v_customer_auth_normalized ca.*
            from class4.customers_auth_normalized ca
                JOIN public.contractors c ON c.id=ca.customer_id
            WHERE ca.enabled AND
              ca.ip>>=v_remote_ip AND
              prefix_range(ca.dst_prefix)@>prefix_range(v_ret.dst_prefix_in) AND
              prefix_range(ca.src_prefix)@>prefix_range(v_ret.src_prefix_in) AND
              (ca.pop_id=i_pop_id or ca.pop_id is null) and
              COALESCE(ca.x_yeti_auth,'')=v_x_yeti_auth AND
              COALESCE(nullif(ca.uri_domain,'')=i_uri_domain,true) AND
              COALESCE(nullif(ca.to_domain,'')=i_to_domain,true) AND
              COALESCE(nullif(ca.from_domain,'')=i_from_domain,true) AND
              (ca.transport_protocol_id is null or ca.transport_protocol_id=v_transport_protocol_id) AND
              length(v_ret.dst_prefix_in) between ca.dst_number_min_length and ca.dst_number_max_length and
              length(v_ret.src_prefix_in) between ca.src_number_min_length and ca.src_number_max_length and
              c.enabled and c.customer and
              ca.require_incoming_auth and gateway_id = i_auth_id
            ORDER BY
                masklen(ca.ip) DESC,
                ca.transport_protocol_id is null,
                length(prefix_range(ca.dst_prefix)) DESC,
                length(prefix_range(ca.src_prefix)) DESC,
                ca.pop_id is null,
                ca.uri_domain is null,
                ca.to_domain is null,
                ca.from_domain is null
            LIMIT 1;
            IF NOT FOUND THEN
            
                v_ret.disconnect_code_id=110; --Cant find customer or customer locked
                RETURN NEXT v_ret;
                RETURN;
            END IF;
            if v_customer_auth_normalized.reject_calls then
            
                v_ret.disconnect_code_id=8004; -- call rejected by authorization

                v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
                v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

                v_ret.customer_id:=v_customer_auth_normalized.customer_id;
                select into strict v_ret.customer_external_id external_id from public.contractors where id=v_ret.customer_id;

                v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
                v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;

                v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
                SELECT INTO STRICT v_ret.customer_acc_external_id external_id FROM billing.accounts WHERE id=v_customer_auth_normalized.account_id;

                RETURN NEXT v_ret;
                RETURN;
            end if;
        end IF;

        

        -- redefine call SRC/DST numbers

        IF v_customer_auth_normalized.src_name_field_id=1 THEN  /* default - from uri display name */
          v_ret.src_name_in:=i_from_dsp;
        END IF;
        v_ret.src_name_out:=v_ret.src_name_in;

        IF v_customer_auth_normalized.src_number_field_id=1 THEN  /* default - from uri userpart */
          v_ret.src_prefix_in:=i_from_name;
        ELSIF v_customer_auth_normalized.src_number_field_id=2 THEN /* From uri Display name */
          v_ret.src_prefix_in:=i_from_dsp;
        END IF;
        v_ret.src_prefix_out:=v_ret.src_prefix_in;

        IF v_customer_auth_normalized.dst_number_field_id=1 THEN /* default  - RURI userpart*/
          v_ret.dst_prefix_in:=i_uri_name;
        ELSIF v_customer_auth_normalized.dst_number_field_id=2 THEN /* TO URI userpart */
          v_ret.dst_prefix_in:=i_to_name;
        ELSIF v_customer_auth_normalized.dst_number_field_id=3 THEN /* Top-Most Diversion header userpart */
          v_ret.dst_prefix_in:=i_diversion;
        END IF;
        v_ret.dst_prefix_out:=v_ret.dst_prefix_in;


        -- feel customer data ;-)
        v_ret.dump_level_id:=v_customer_auth_normalized.dump_level_id;
        v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
        v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

        v_ret.customer_id:=v_customer_auth_normalized.customer_id;
        select into strict v_ret.customer_external_id external_id from public.contractors where id=v_customer_auth_normalized.customer_id;

        v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
        v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;
        v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
        v_ret.orig_gw_id:=v_customer_auth_normalized.gateway_id;

        v_ret.radius_auth_profile_id=v_customer_auth_normalized.radius_auth_profile_id;
        v_ret.aleg_radius_acc_profile_id=v_customer_auth_normalized.radius_accounting_profile_id;
        v_ret.record_audio=v_customer_auth_normalized.enable_audio_recording;

        v_ret.customer_acc_check_balance=v_customer_auth_normalized.check_account_balance;

        SELECT INTO STRICT v_c_acc * FROM billing.accounts  WHERE id=v_customer_auth_normalized.account_id;
        v_ret.customer_acc_external_id=v_c_acc.external_id;
        v_ret.customer_acc_vat=v_c_acc.vat;
        v_destination_rate_limit=coalesce(v_c_acc.destination_rate_limit::float,'Infinity'::float);

        if v_customer_auth_normalized.check_account_balance AND v_c_acc.balance<=v_c_acc.min_balance then
          v_ret.disconnect_code_id=8000; --No enough customer balance
          RETURN NEXT v_ret;
          RETURN;
        end if;

        v_ret.customer_acc_external_id=v_c_acc.external_id;
        v_ret.customer_acc_vat=v_c_acc.vat;

        SELECT into v_orig_gw * from class4.gateways WHERE id=v_customer_auth_normalized.gateway_id;
        if not v_orig_gw.enabled then
          v_ret.disconnect_code_id=8005; -- Origination gateway is disabled
          RETURN NEXT v_ret;
          RETURN;
        end if;

        v_ret.resources:='';
        if v_customer_auth_normalized.capacity is not null then
          v_ret.resources:=v_ret.resources||'3:'||v_customer_auth_normalized.customers_auth_id||':'||v_customer_auth_normalized.capacity::varchar||':1;';
        end if;

        if v_c_acc.origination_capacity is not null then
          v_ret.resources:=v_ret.resources||'1:'||v_c_acc.id::varchar||':'||v_c_acc.origination_capacity::varchar||':1;';
        end if;

        if v_c_acc.total_capacity is not null then
          v_ret.resources:=v_ret.resources||'7:'||v_c_acc.id::varchar||':'||v_c_acc.total_capacity::varchar||':1;';
        end if;

        if v_orig_gw.origination_capacity is not null then
          v_ret.resources:=v_ret.resources||'4:'||v_orig_gw.id::varchar||':'||v_orig_gw.origination_capacity::varchar||':1;';
        end if;

        -- Tag processing CA
        v_call_tags=yeti_ext.tag_action(v_customer_auth_normalized.tag_action_id, v_call_tags, v_customer_auth_normalized.tag_action_value);

        /*
            number rewriting _Before_ routing
        */
        
        v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(v_ret.dst_prefix_out,v_customer_auth_normalized.dst_rewrite_rule,v_customer_auth_normalized.dst_rewrite_result);
        v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(v_ret.src_prefix_out,v_customer_auth_normalized.src_rewrite_rule,v_customer_auth_normalized.src_rewrite_result);
        v_ret.src_name_out=yeti_ext.regexp_replace_rand(v_ret.src_name_out,v_customer_auth_normalized.src_name_rewrite_rule,v_customer_auth_normalized.src_name_rewrite_result, true);

        --  if v_ret.radius_auth_profile_id is not null then
        v_ret.src_number_radius:=i_from_name;
        v_ret.dst_number_radius:=i_uri_name;
        v_ret.src_number_radius=yeti_ext.regexp_replace_rand(
            v_ret.src_number_radius,
            v_customer_auth_normalized.src_number_radius_rewrite_rule,
            v_customer_auth_normalized.src_number_radius_rewrite_result
        );

        v_ret.dst_number_radius=yeti_ext.regexp_replace_rand(
            v_ret.dst_number_radius,
            v_customer_auth_normalized.dst_number_radius_rewrite_rule,
            v_customer_auth_normalized.dst_number_radius_rewrite_result
        );
        v_ret.customer_auth_name=v_customer_auth_normalized."name";
        v_ret.customer_name=(select "name" from public.contractors where id=v_customer_auth_normalized.customer_id limit 1);
        --  end if;


        

        ----- Numberlist processing-------------------------------------------------------------------------------------------------------
        if v_customer_auth_normalized.dst_numberlist_id is not null then
          
          select into v_numberlist * from class4.numberlists where id=v_customer_auth_normalized.dst_numberlist_id;
          CASE v_numberlist.mode_id
            when 1 then -- strict match
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id and ni.key=v_ret.dst_prefix_out limit 1;
            when 2 then -- prefix match
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where
                  ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id and
                  prefix_range(ni.key)@>prefix_range(v_ret.dst_prefix_out) and
                  length(v_ret.dst_prefix_out) between ni.number_min_length and ni.number_max_length
                order by length(prefix_range(ni.key))
                desc limit 1;
            when 3 then -- random
                select into v_numberlist_size count(*) from class4.numberlist_items where numberlist_id=v_customer_auth_normalized.dst_numberlist_id;
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id order by ni.id OFFSET floor(random()*v_numberlist_size) limit 1;
          end case;
          
          IF v_numberlist_item.action_id is not null and v_numberlist_item.action_id=1 then
            
            v_ret.disconnect_code_id=8001; --destination blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is not null and v_numberlist_item.action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist_item.src_rewrite_rule,
                v_numberlist_item.src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist_item.dst_rewrite_rule,
                v_numberlist_item.dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist_item.tag_action_id, v_call_tags, v_numberlist_item.tag_action_value);
            -- pass call NOP.
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=1 then
            
            -- drop by default
            v_ret.disconnect_code_id=8001; --destination blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist.default_src_rewrite_rule,
                v_numberlist.default_src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist.default_dst_rewrite_rule,
                v_numberlist.default_dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist.tag_action_id, v_call_tags, v_numberlist.tag_action_value);
            -- pass by default
          end if;
        end if;

        if v_customer_auth_normalized.src_numberlist_id is not null then
          
          select into v_numberlist * from class4.numberlists where id=v_customer_auth_normalized.src_numberlist_id;
          CASE v_numberlist.mode_id
            when 1 then -- strict match
              select into v_numberlist_item * from class4.numberlist_items ni
              where ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id and ni.key=v_ret.src_prefix_out limit 1;
            when 2 then -- prefix match
              select into v_numberlist_item * from class4.numberlist_items ni
              where
                ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id and
                prefix_range(ni.key)@>prefix_range(v_ret.src_prefix_out) and
                length(v_ret.src_prefix_out) between ni.number_min_length and ni.number_max_length
              order by length(prefix_range(ni.key)) desc limit 1;
            when 3 then -- random
              select into v_numberlist_size count(*) from class4.numberlist_items where numberlist_id=v_customer_auth_normalized.src_numberlist_id;
              select into v_numberlist_item *
              from class4.numberlist_items ni
              where ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id order by ni.id OFFSET floor(random()*v_numberlist_size) limit 1;
          end case;
          
          IF v_numberlist_item.action_id is not null and v_numberlist_item.action_id=1 then
            
            v_ret.disconnect_code_id=8002; --source blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is not null and v_numberlist_item.action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist_item.src_rewrite_rule,
                v_numberlist_item.src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist_item.dst_rewrite_rule,
                v_numberlist_item.dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist_item.tag_action_id, v_call_tags, v_numberlist_item.tag_action_value);
            -- pass call NOP.
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=1 then
            
            v_ret.disconnect_code_id=8002; --source blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist.default_src_rewrite_rule,
                v_numberlist.default_src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist.default_dst_rewrite_rule,
                v_numberlist.default_dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist.tag_action_id, v_call_tags, v_numberlist.tag_action_value);
            -- pass by default
          end if;
        end if;

        --  setting numbers used for routing & billing
        v_ret.src_prefix_routing=v_ret.src_prefix_out;
        v_ret.dst_prefix_routing=v_ret.dst_prefix_out;
        v_routing_key=v_ret.dst_prefix_out;

        -- Areas and Tag detection-------------------------------------------
        v_ret.src_area_id:=(
          select area_id from class4.area_prefixes where prefix_range(prefix)@>prefix_range(v_ret.src_prefix_routing)
          order by length(prefix_range(prefix)) desc limit 1
        );

        

        v_ret.dst_area_id:=(
          select area_id from class4.area_prefixes where prefix_range(prefix)@>prefix_range(v_ret.dst_prefix_routing)
          order by length(prefix_range(prefix)) desc limit 1
        );

        


        select into v_area_direction * from class4.routing_tag_detection_rules
        where
          (src_area_id is null OR src_area_id = v_ret.src_area_id) AND
          (dst_area_id is null OR dst_area_id = v_ret.dst_area_id) AND
          prefix_range(src_prefix) @> prefix_range(v_ret.src_prefix_routing) AND
          prefix_range(dst_prefix) @> prefix_range(v_ret.dst_prefix_routing) AND
          yeti_ext.tag_compare(routing_tag_ids, v_call_tags, routing_tag_mode_id ) > 0
        order by
          yeti_ext.tag_compare(routing_tag_ids, v_call_tags, routing_tag_mode_id) desc,
          length(prefix_range(v_ret.src_prefix_routing)) desc,
          length(prefix_range(v_ret.dst_prefix_routing)) desc,
          src_area_id is null,
          dst_area_id is null
        limit 1;
        if found then
            v_call_tags=yeti_ext.tag_action(v_area_direction.tag_action_id, v_call_tags, v_area_direction.tag_action_value);
        end if;

        v_ret.routing_tag_ids:=v_call_tags;

        
        ----------------------------------------------------------------------

        

        select into v_max_call_length,v_drop_call_if_lnp_fail max_call_duration,drop_call_if_lnp_fail from sys.guiconfig limit 1;

        v_routing_key=v_ret.dst_prefix_routing;
        SELECT INTO v_rp * from class4.routing_plans WHERE id=v_customer_auth_normalized.routing_plan_id;
        if v_rp.sorting_id=5 then -- route testing
          v_test_vendor_id=regexp_replace(v_routing_key,'(.*)\*(.*)','\1')::integer;
          v_routing_key=regexp_replace(v_routing_key,'(.*)\*(.*)','\2');
          v_ret.dst_prefix_out=v_routing_key;
          v_ret.dst_prefix_routing=v_routing_key;
        end if;

        if v_rp.use_lnp then
          select into v_lnp_rule rules.*
          from class4.routing_plan_lnp_rules rules
          WHERE prefix_range(rules.dst_prefix)@>prefix_range(v_ret.dst_prefix_routing) and rules.routing_plan_id=v_rp.id
          order by length(prefix_range(rules.dst_prefix)) limit 1;
          if found then
            v_ret.lnp_database_id=v_lnp_rule.database_id;
            v_lnp_key=v_ret.dst_prefix_routing;
            
            v_lnp_key=yeti_ext.regexp_replace_rand(v_lnp_key,v_lnp_rule.req_dst_rewrite_rule,v_lnp_rule.req_dst_rewrite_result);
            
            -- try cache
            select into v_ret.lrn lrn from class4.lnp_cache where dst=v_lnp_key AND database_id=v_lnp_rule.database_id and expires_at>v_now;
            if found then
              
              -- TRANSLATING response from cache
              v_ret.lrn=yeti_ext.regexp_replace_rand(v_ret.lrn,v_lnp_rule.lrn_rewrite_rule,v_lnp_rule.lrn_rewrite_result);
              
              v_routing_key=v_ret.lrn;
            else
              v_ret.lrn=switch18.lnp_resolve(v_ret.lnp_database_id,v_lnp_key);
              if v_ret.lrn is null then -- fail
                
                if v_drop_call_if_lnp_fail then
                  
                  v_ret.disconnect_code_id=8003; --No response from LNP DB
                  RETURN NEXT v_ret;
                  RETURN;
                end if;
              else
                
                -- TRANSLATING response from LNP DB
                v_ret.lrn=yeti_ext.regexp_replace_rand(v_ret.lrn,v_lnp_rule.lrn_rewrite_rule,v_lnp_rule.lrn_rewrite_result);
                
                v_routing_key=v_ret.lrn;
              end if;
            end if;
          end if;
        end if;



        
        v_network:=switch18.detect_network(v_ret.dst_prefix_routing);
        v_ret.dst_network_id=v_network.network_id;
        v_ret.dst_country_id=v_network.country_id;

        IF v_rp.validate_dst_number_network AND v_ret.dst_network_id is null THEN
          

          v_ret.disconnect_code_id=8007; --No network detected for DST number
          RETURN NEXT v_ret;
          RETURN;
        END IF;


        IF v_rp.validate_dst_number_format AND NOT (v_routing_key ~ '^[0-9]+$') THEN
          

          v_ret.disconnect_code_id=8008; --Invalid number format
          RETURN NEXT v_ret;
          RETURN;
        END IF;

        SELECT into v_destination d.*/*,switch.tracelog(d.*)*/
        FROM class4.destinations d
        JOIN class4.rate_plan_groups rpg ON d.rate_group_id=rpg.rate_group_id
        WHERE
          prefix_range(prefix)@>prefix_range(v_routing_key)
          AND length(v_routing_key) between d.dst_number_min_length and d.dst_number_max_length
          AND rpg.rateplan_id=v_customer_auth_normalized.rateplan_id
          AND enabled
          AND valid_from <= v_now
          AND valid_till >= v_now
          AND yeti_ext.tag_compare(d.routing_tag_ids, v_call_tags, d.routing_tag_mode_id)>0
        ORDER BY length(prefix_range(prefix)) DESC, yeti_ext.tag_compare(d.routing_tag_ids, v_call_tags) desc
        limit 1;
        IF NOT FOUND THEN
          
          v_ret.disconnect_code_id=111; --Cant find destination prefix
          RETURN NEXT v_ret;
          RETURN;
        END IF;
        

        v_ret.destination_id:=v_destination.id;
        v_ret.destination_prefix=v_destination.prefix;
        v_ret.destination_initial_interval:=v_destination.initial_interval;
        v_ret.destination_fee:=v_destination.connect_fee::varchar;
        v_ret.destination_next_interval:=v_destination.next_interval;
        v_ret.destination_rate_policy_id:=v_destination.rate_policy_id;
        v_ret.destination_reverse_billing:=v_destination.reverse_billing;
        IF v_destination.reject_calls THEN
          v_ret.disconnect_code_id=112; --Rejected by destination
          RETURN NEXT v_ret;
          RETURN;
        END IF;

        if v_destination.next_rate::float>v_destination_rate_limit then
          v_ret.disconnect_code_id=8006; -- No destination with appropriate rate found
          RETURN NEXT v_ret;
          RETURN;
        end if;

        select into v_rateplan * from class4.rateplans where id=v_customer_auth_normalized.rateplan_id;
        if COALESCE(v_destination.profit_control_mode_id,v_rateplan.profit_control_mode_id)=2 then -- per call
          v_rate_limit=v_destination.next_rate::float;
        end if;


        /*
                    FIND dialpeers logic. Queries must use prefix index for best performance
        */
        
        CASE v_rp.sorting_id
          WHEN'1' THEN -- LCR,Prio, ACD&ASR control
          FOR routedata IN (
            WITH step1 AS(
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.lcr_rate_multiplier AS dp_lcr_rate_multiplier,
                  t_dp.priority AS dp_priority,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id = t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            from step1
            WHERE
              r=1
              and exclusive_rank=1
              AND dp_next_rate<=v_rate_limit
              AND dp_enabled
              and not dp_locked --ACD&ASR control for DP
            ORDER BY dp_next_rate*dp_lcr_rate_multiplier, dp_priority DESC
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            
          end LOOP;
          WHEN '2' THEN --LCR, no prio, No ACD&ASR control
          FOR routedata IN (
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  --  (t_vendor_gateway.*)::class4.gateways as s1_vendor_gateway,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id)>0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              AND dp_enabled
              and dp_next_rate<=v_rate_limit
            ORDER BY dp_metric
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            
          END LOOP;
          WHEN '3' THEN --Prio, LCR, ACD&ASR control
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
              and not dp_locked
            ORDER BY dp_metric_priority DESC, dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            
          END LOOP;
          WHEN'4' THEN -- LCRD, Prio, ACD&ACR control
          FOR routedata IN (
            WITH step1 AS(
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  ((t_dp.next_rate - first_value(t_dp.next_rate) OVER(ORDER BY t_dp.next_rate ASC)) > v_rp.rate_delta_max)::INTEGER *(t_dp.next_rate + t_dp.priority) - t_dp.priority AS r2,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id = t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id)>0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            from step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_next_rate <= v_rate_limit
              and dp_enabled
              and not dp_locked --ACD&ASR control for DP
            ORDER BY r2 ASC
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            
          end LOOP;
          WHEN'5' THEN -- Route test
          FOR routedata IN (
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  and t_dp.vendor_id=v_test_vendor_id
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_enabled
              and dp_next_rate<=v_rate_limit
            ORDER BY dp_metric_priority DESC, dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            
          END LOOP;
          WHEN'6' THEN -- QD.Static,LCR,ACD&ACR control
          v_random:=random();
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY length(prefix_range(coalesce(rpsr.prefix,''))) desc
                  ) as r2,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled,
                  t_dp.force_hit_rate as dp_force_hit_rate,
                  rpsr.priority as rpsr_priority,
                  rpsr.weight as rpsr_weight
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                  left join class4.routing_plan_static_routes rpsr
                    ON rpsr.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                      and rpsr.vendor_id=t_dp.vendor_id
                      AND prefix_range(rpsr.prefix)@>prefix_range(v_routing_key)
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and r2=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
              and not dp_locked
            ORDER BY
              coalesce(v_random<=dp_force_hit_rate,false) desc,
              rpsr_priority,
              yeti_ext.rank_dns_srv(rpsr_weight) over ( partition by rpsr_priority order by rpsr_weight),
              dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            
          END LOOP;
          WHEN'7' THEN -- QD.Static, No ACD&ACR control
          v_random:=random();
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY length(prefix_range(coalesce(rpsr.prefix,''))) desc
                  ) as r2,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled,
                  t_dp.force_hit_rate as dp_force_hit_rate,
                  rpsr.priority as rpsr_priority,
                  rpsr.weight as rpsr_weight
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                  join class4.routing_plan_static_routes rpsr
                    ON rpsr.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                      and rpsr.vendor_id=t_dp.vendor_id
                      AND prefix_range(rpsr.prefix)@>prefix_range(v_routing_key)
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and r2=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
            ORDER BY
              coalesce(v_random<=dp_force_hit_rate,false) desc,
              rpsr_priority,
              yeti_ext.rank_dns_srv(rpsr_weight) over ( partition by rpsr_priority order by rpsr_weight),
              dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            
          END LOOP;

        ELSE
          RAISE NOTICE 'BUG: unknown sorting_id';
        END CASE;
        
        v_ret.disconnect_code_id=113; --No routes
        RETURN NEXT v_ret;
        
        RETURN;
      END;
      $_$;


--
-- Name: tracelog(class4.destinations); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.tracelog(i_in class4.destinations) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RAISE INFO'switch18.tracelog: % : %',clock_timestamp()::char(25),i_in;
END;
$$;


--
-- Name: tracelog(class4.dialpeers); Type: FUNCTION; Schema: switch18; Owner: -
--

CREATE FUNCTION switch18.tracelog(i_in class4.dialpeers) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RAISE INFO 'switch18.tracelog: % : %',clock_timestamp()::char(25),i_in;
END;
$$;


--
-- Name: check_event(integer); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.check_event(i_event_id integer) RETURNS boolean
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  PERFORM id from sys.events where id=i_event_id;
  return FOUND;
END;
$$;


--
-- Name: detect_network(character varying); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.detect_network(i_dst character varying) RETURNS sys.network_prefixes
    LANGUAGE plpgsql COST 10
    AS $$
declare
  v_ret sys.network_prefixes%rowtype;
BEGIN

  select into v_ret *
  from sys.network_prefixes
  where prefix_range(prefix)@>prefix_range(i_dst)
  order by length(prefix_range(prefix)) desc
  limit 1;

  return v_ret;
END;
$$;


--
-- Name: init(integer, integer); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.init(i_node_id integer, i_pop_id integer) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
declare
  v_lnp_sockets text[];
  v_timeout integer:=1000;
BEGIN
  select into v_lnp_sockets array_agg('tcp://'||address||':'||port::varchar) from sys.lnp_resolvers;-- where 0=1;
  RAISE WARNING 'Adding LNP resolvers sockets: %. Resolver timeout: %ms', v_lnp_sockets, v_timeout;
  perform yeti_ext.lnp_endpoints_set(ARRAY[]::text[]);
  perform yeti_ext.lnp_endpoints_set(v_lnp_sockets);
  perform yeti_ext.lnp_set_timeout(v_timeout);
  RETURN;
end;
$$;


--
-- Name: lnp_resolve(smallint, character varying); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.lnp_resolve(i_database_id smallint, i_dst character varying) RETURNS character varying
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  return lrn from yeti_ext.lnp_resolve_tagged(i_database_id::int, i_dst);
END;
$$;


--
-- Name: lnp_resolve_tagged(smallint, character varying); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.lnp_resolve_tagged(i_database_id smallint, i_dst character varying) RETURNS switch19.lnp_resolve
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  return yeti_ext.lnp_resolve_tagged(i_database_id::int, i_dst);
END;
$$;


--
-- Name: load_codecs(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_codecs() RETURNS TABLE(o_id integer, o_codec_group_id integer, o_codec_name character varying, o_priority integer, o_dynamic_payload_id integer, o_format_params character varying)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN
  QUERY SELECT
          cgc.id,
          cgc.codec_group_id,
          c.name ,
          cgc.priority,
          cgc.dynamic_payload_type,
          cgc.format_parameters
        from class4.codec_group_codecs cgc
          JOIN class4.codecs c ON c.id=cgc.codec_id
        order by cgc.codec_group_id,cgc.priority desc ,c.name;
END;
$$;


--
-- Name: load_disconnect_code_namespace(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_disconnect_code_namespace() RETURNS SETOF class4.disconnect_code_namespace
    LANGUAGE plpgsql COST 10
    AS $$

BEGIN
  RETURN QUERY SELECT * from class4.disconnect_code_namespace order by id;
END;
$$;


--
-- Name: load_disconnect_code_refuse(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_disconnect_code_refuse() RETURNS TABLE(o_id integer, o_code integer, o_reason character varying, o_rewrited_code integer, o_rewrited_reason character varying, o_store_cdr boolean, o_silently_drop boolean)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN
  QUERY SELECT id,code,reason,rewrited_code,rewrited_reason,store_cdr,silently_drop
        from class4.disconnect_code
        where namespace_id=0 or namespace_id=1 OR namespace_id=3 /* radius */
        order by id;
END;
$$;


--
-- Name: load_disconnect_code_refuse_overrides(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_disconnect_code_refuse_overrides() RETURNS TABLE(o_policy_id integer, o_id integer, o_code integer, o_reason character varying, o_rewrited_code integer, o_rewrited_reason character varying, o_store_cdr boolean, o_silently_drop boolean)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN
  QUERY SELECT
            dpc.policy_id,
            dc.id,
            dc.code,
            dc.reason,
            dpc.rewrited_code,
            dpc.rewrited_reason,
            dc.store_cdr,
            dc.silently_drop
        from class4.disconnect_policy_code dpc
          JOIN class4.disconnect_code dc
            ON dc.id=dpc.code_id
        where namespace_id=0 or namespace_id=1 OR namespace_id=3 /* radius */
        order by dpc.id;
END;
$$;


--
-- Name: load_disconnect_code_rerouting(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_disconnect_code_rerouting() RETURNS TABLE(received_code integer, stop_rerouting boolean)
    LANGUAGE plpgsql COST 10
    AS $$

BEGIN
  RETURN QUERY SELECT code,stop_hunting
               from class4.disconnect_code
               WHERE namespace_id=2
               order by id;
END;
$$;


--
-- Name: load_disconnect_code_rerouting_overrides(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_disconnect_code_rerouting_overrides() RETURNS TABLE(policy_id integer, received_code integer, stop_rerouting boolean)
    LANGUAGE plpgsql COST 10
    AS $$

BEGIN
  RETURN QUERY SELECT dpc.policy_id,dc.code,dpc.stop_hunting
               from class4.disconnect_policy_code dpc
                 join class4.disconnect_code dc
                   ON dpc.code_id=dc.id
               WHERE dc.namespace_id=2 -- SIP ONLY
               order by dpc.id;
END;
$$;


--
-- Name: load_disconnect_code_rewrite(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_disconnect_code_rewrite() RETURNS TABLE(o_code integer, o_reason character varying, o_pass_reason_to_originator boolean, o_rewrited_code integer, o_rewrited_reason character varying)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN
  QUERY SELECT code,reason,pass_reason_to_originator,rewrited_code,rewrited_reason
        from class4.disconnect_code
        where namespace_id=2
        order by id;
END;
$$;


--
-- Name: load_disconnect_code_rewrite_overrides(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_disconnect_code_rewrite_overrides() RETURNS TABLE(o_policy_id integer, o_code integer, o_reason character varying, o_pass_reason_to_originator boolean, o_rewrited_code integer, o_rewrited_reason character varying)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN
  QUERY SELECT dpc.policy_id,dc.code,dc.reason,dpc.pass_reason_to_originator,dpc.rewrited_code,dpc.rewrited_reason
        from class4.disconnect_policy_code dpc
          JOIN class4.disconnect_code dc
            ON dc.id=dpc.code_id
        where dc.namespace_id=2 -- ONLY SIP
        order by dpc.id;
END;
$$;


--
-- Name: load_incoming_auth(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_incoming_auth() RETURNS TABLE(id integer, username character varying, password character varying)
    LANGUAGE plpgsql COST 10 ROWS 10
    AS $$
BEGIN
  RETURN QUERY
    SELECT
      gw.id,
      gw.incoming_auth_username,
      gw.incoming_auth_password
    from class4.gateways gw
    where
      gw.enabled and
      gw.incoming_auth_username is not null and gw.incoming_auth_password is not null and
      gw.incoming_auth_username !='' and gw.incoming_auth_password !='';
END;
$$;


--
-- Name: load_interface_in(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_interface_in() RETURNS TABLE(varname character varying, vartype character varying, varformat character varying, varhashkey boolean, varparam character varying)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN QUERY SELECT "name","type","format","hashkey","param" from switch_interface_in order by rank asc;
END;
$$;


--
-- Name: load_interface_out(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_interface_out() RETURNS TABLE(varname character varying, vartype character varying, forcdr boolean, forradius boolean)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN QUERY SELECT "name","type","custom","for_radius" from switch19.switch_interface_out order by rank asc;
END;
$$;


--
-- Name: load_radius_accounting_profiles(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_radius_accounting_profiles() RETURNS TABLE(id smallint, name character varying, server character varying, port integer, secret character varying, timeout smallint, attempts smallint, enable_start_accounting boolean, enable_interim_accounting boolean, enable_stop_accounting boolean, interim_accounting_interval smallint, start_avps json, interim_avps json, stop_avps json)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN QUERY
  SELECT
    p.id,
    p.name,
    p.server,
    p.port,
    p.secret,
    p.timeout,
    p.attempts,
    p.enable_start_accounting,
    p.enable_interim_accounting,
    p.enable_stop_accounting,
    p.interim_accounting_interval,
    (select json_agg(d.*) from class4.radius_accounting_profile_start_attributes d where profile_id=p.id),
    (select json_agg(d.*) from class4.radius_accounting_profile_interim_attributes d where profile_id=p.id),
    (select json_agg(d.*) from class4.radius_accounting_profile_stop_attributes d where profile_id=p.id)
  from class4.radius_accounting_profiles p
  order by p.id;
END;
$$;


--
-- Name: load_radius_profiles(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_radius_profiles() RETURNS TABLE(id smallint, name character varying, server character varying, port integer, secret character varying, reject_on_error boolean, timeout smallint, attempts smallint, avps json)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN QUERY SELECT p.id, p.name, p.server, p.port, p.secret, p.reject_on_error, p.timeout, p.attempts, json_agg(a.*)
               from class4.radius_auth_profiles p
                 JOIN class4.radius_auth_profile_attributes a ON p.id=a.profile_id
               GROUP by p.id, p.name, p.server, p.port, p.secret
               order by p.id;
END;
$$;


--
-- Name: load_registrations_out(integer, integer, integer); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_registrations_out(i_pop_id integer, i_node_id integer, i_registration_id integer DEFAULT NULL::integer) RETURNS TABLE(o_id integer, o_transport_protocol_id smallint, o_domain character varying, o_user character varying, o_display_name character varying, o_auth_user character varying, o_auth_password character varying, o_proxy character varying, o_proxy_transport_protocol_id smallint, o_contact character varying, o_expire integer, o_force_expire boolean, o_retry_delay smallint, o_max_attempts smallint, o_scheme_id smallint)
    LANGUAGE plpgsql COST 10 ROWS 100
    AS $$
BEGIN
  RETURN QUERY
  SELECT
    id,
    transport_protocol_id,
    "domain",
    "username",
    "display_username",
    auth_user,
    auth_password,
    proxy,
    proxy_transport_protocol_id,
    contact,
    expire,
    force_expire,
    retry_delay,
    max_attempts,
    sip_schema_id
  FROM class4.registrations r
  WHERE
    r.enabled and
    (r.pop_id=i_pop_id OR r.pop_id is null) AND
    (r.node_id=i_node_id OR r.node_id IS NULL) AND
    (i_registration_id is null OR id=i_registration_id);

end;
$$;


--
-- Name: resource_type; Type: TABLE; Schema: switch19; Owner: -
--

CREATE TABLE switch19.resource_type (
    id integer NOT NULL,
    name character varying NOT NULL,
    internal_code_id integer NOT NULL,
    action_id integer DEFAULT 1 NOT NULL
);


--
-- Name: load_resource_types(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_resource_types() RETURNS SETOF switch19.resource_type
    LANGUAGE plpgsql COST 10 ROWS 10
    AS $$

BEGIN
  RETURN QUERY SELECT * from resource_type;
END;
$$;


--
-- Name: load_sensor(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_sensor() RETURNS TABLE(o_id smallint, o_name character varying, o_mode_id integer, o_source_interface character varying, o_target_mac macaddr, o_use_routing boolean, o_target_ip inet, o_target_port integer, o_hep_capture_id integer, o_source_ip inet)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN
  QUERY SELECT
          id,
          name,
          mode_id,
          source_interface,
          target_mac macaddr,
          use_routing,
          target_ip,
          target_port,
          hep_capture_id,
          source_ip from sys.sensors;
END;
$$;


--
-- Name: load_sip_options_probers(integer, integer); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_sip_options_probers(i_node_id integer, i_registration_id integer DEFAULT NULL::integer) RETURNS TABLE(id integer, name character varying, ruri_domain character varying, ruri_username character varying, transport_protocol_id smallint, sip_schema_id smallint, from_uri character varying, to_uri character varying, contact_uri character varying, proxy character varying, proxy_transport_protocol_id smallint, "interval" smallint, append_headers character varying, sip_interface_name character varying, auth_username character varying, auth_password character varying, created_at timestamp with time zone, updated_at timestamp with time zone)
    LANGUAGE plpgsql COST 10 ROWS 100
    AS $$
BEGIN
  RETURN QUERY
  SELECT
        o.id,
        o.name,
        o.ruri_domain,
        o.ruri_username,
        o.transport_protocol_id,
        o.sip_schema_id,
        o.from_uri,
        o.to_uri,
        o.contact_uri,
        o.proxy,
        o.proxy_transport_protocol_id,
        o.interval,
        o.append_headers,
        o.sip_interface_name,
        o.auth_username,
        o.auth_password,
        o.created_at,
        o.updated_at
  FROM
    class4.sip_options_probers o
  WHERE
    o.enabled AND
    (
      (o.pop_id is null and o.node_id is null) OR
      (o.pop_id is not null and o.node_id is null and o.pop_id in (select n.pop_id from sys.nodes n where n.id=i_node_id)) OR
      (o.node_id is not null and o.node_id=i_node_id )
    ) AND
    (i_registration_id is null OR o.id=i_registration_id);
end;
$$;


--
-- Name: load_trusted_headers(integer); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.load_trusted_headers(i_node_id integer) RETURNS TABLE(o_name character varying)
    LANGUAGE plpgsql COST 10 ROWS 100
    AS $$
BEGIN
  RETURN QUERY    SELECT "name" from trusted_headers order by rank asc;
end;
$$;


--
-- Name: lua_clear_cache(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.lua_clear_cache() RETURNS void
    LANGUAGE pllua
    AS $$
        if shared.functions_cache ~= nil then
          for k in pairs(shared.functions_cache) do
            shared.functions_cache[k] = nil
          end
        end
      $$;


--
-- Name: lua_exec(integer, switch19.lua_call_context); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.lua_exec(function_id integer, arg switch19.lua_call_context) RETURNS switch19.lua_call_context
    LANGUAGE pllua
    AS $_$
        local ttl = 5 --seconds
        if shared.functions_cache == nil then
          setshared('functions_cache',{})
        end

        local cached_entry = shared.functions_cache[function_id]

        if cached_entry ~= nil then
          if os.time() < cached_entry.expire_at then
            -- execute cached function
            return cached_entry.func()(arg)
          end
          -- clear cache entry because of expired ttl
          shared.functions_cache[function_id] = nil
        end

        -- try to fetch and compile function
        if shared.prepared_user_function_query == nil then
          -- prepare and cache query
          setshared(
            'prepared_user_function_query',
             server.prepare('SELECT source FROM sys.lua_scripts WHERE id=$1',{"integer"}):save()
          )
        end

        local c = shared.prepared_user_function_query:getcursor({function_id}, true)
        local r = c:fetch(1)
        if r == nil then
          error("no user function with id: "..function_id)
        end

        shared.functions_cache[function_id] = {
          func = assert(load('return function(arg) ' .. r[1].source .. ' end')),
          expire_at = os.time()+ttl
        }
        return shared.functions_cache[function_id].func()(arg)

      $_$;


--
-- Name: new_profile(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.new_profile() RETURNS switch19.callprofile_ty
    LANGUAGE plpgsql COST 10
    AS $_$
DECLARE
  v_ret switch19.callprofile_ty;
BEGIN
  --v_ret.append_headers:='Max-Forwards: 70\r\n';
  v_ret.enable_auth:=false;
  v_ret.auth_user:='';
  v_ret.auth_pwd:='';
  v_ret.enable_aleg_auth:=false;
  v_ret.auth_aleg_user:='';
  v_ret.auth_aleg_pwd:='';
  v_ret.call_id:='$ci_leg43';
  --    v_ret.contact:='<sip:$Ri>';
  v_ret."from":='$f';
  v_ret."to":='$t';
  v_ret.ruri:='$r';
  v_ret.force_outbound_proxy:=false;
  v_ret.outbound_proxy:='';
  v_ret.next_hop:='';
  --    v_ret.next_hop_for_replies:='';
  v_ret.next_hop_1st_req:=false;

  v_ret.sdp_filter_type_id:=0; -- transparent
  v_ret.sdp_filter_list:='';
  v_ret.sdp_alines_filter_type_id:=0; -- transparent
  v_ret.sdp_alines_filter_list:='';

  v_ret.enable_session_timer:=false;
  v_ret.session_expires ='150';
  v_ret.minimum_timer:='30';
  v_ret.minimum_timer:='60';
  v_ret.session_refresh_method_id:=1;
  v_ret.accept_501_reply:=true;
  v_ret.enable_aleg_session_timer=false;
  v_ret.aleg_session_expires:='180';
  v_ret.aleg_minimum_timer:='30';
  v_ret.aleg_maximum_timer:='60';
  v_ret.aleg_session_refresh_method_id:=1;
  v_ret.aleg_accept_501_reply:='';
  v_ret.reply_translations:='';

  v_ret.enable_rtprelay:=false;

  v_ret.rtprelay_interface:='';
  v_ret.aleg_rtprelay_interface:='';
  v_ret.outbound_interface:='';

  v_ret.try_avoid_transcoding:=FALSE;

  v_ret.rtprelay_dtmf_filtering:=TRUE;
  v_ret.rtprelay_dtmf_detection:=TRUE;
  v_ret.rtprelay_force_dtmf_relay:=FALSE;

  v_ret.patch_ruri_next_hop:=FALSE;

  v_ret.aleg_force_symmetric_rtp:=TRUE;
  v_ret.bleg_force_symmetric_rtp:=TRUE;

  v_ret.aleg_symmetric_rtp_nonstop:=FALSE;
  v_ret.bleg_symmetric_rtp_nonstop:=FALSE;

  v_ret.aleg_symmetric_rtp_ignore_rtcp:=TRUE;
  v_ret.bleg_symmetric_rtp_ignore_rtcp:=TRUE;

  v_ret.aleg_rtp_ping:=FALSE;
  v_ret.bleg_rtp_ping:=FALSE;

  v_ret.aleg_relay_options:=FALSE;
  v_ret.bleg_relay_options:=FALSE;

  v_ret.filter_noaudio_streams:=FALSE;

  /* enum conn_location {
   *   BOTH = 0,
   *   SESSION_ONLY,
   *   MEDIA_ONLY
   * } */
  v_ret.aleg_sdp_c_location_id:=0; --BOTH
  v_ret.bleg_sdp_c_location_id:=0; --BOTH

  v_ret.trusted_hdrs_gw:=FALSE;

  --v_ret.aleg_append_headers_reply:='';
  --v_ret.aleg_append_headers_reply=E'X-VND-INIT-INT:60\r\nX-VND-NEXT-INT:60\r\nX-VND-INIT-RATE:0\r\nX-VND-NEXT-RATE:0\r\nX-VND-CF:0';


  /*
   *  #define FILTER_TYPE_TRANSPARENT     0
   *  #define FILTER_TYPE_BLACKLIST       1
   *  #define FILTER_TYPE_WHITELIST       2
   */
  v_ret.bleg_sdp_alines_filter_list:='';
  v_ret.bleg_sdp_alines_filter_type_id:=0; --FILTER_TYPE_TRANSPARENT

  RETURN v_ret;
END;
$_$;


--
-- Name: preprocess(character varying, character varying, boolean); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.preprocess(i_namespace character varying, i_funcname character varying, i_comment boolean) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
DECLARE
  v_sql VARCHAR;
  v_sql_debug VARCHAR;
  v_sql_release VARCHAR;
  v_dbg_suffix VARCHAR = '_debug';
  v_rel_suffix VARCHAR = '_release';
BEGIN

  -- get function oiriginal definition
  SELECT INTO v_sql
    pg_get_functiondef(p.oid)
  FROM pg_proc p
    JOIN pg_namespace n
      ON p.pronamespace = n.oid
  WHERE n.nspname = i_namespace AND p.proname = i_funcname;

  IF v_sql IS NULL THEN
    RAISE EXCEPTION 'no such fucntion';
  END IF;

  --change function name for debug
  SELECT into v_sql_debug regexp_replace(v_sql,'(CREATE OR REPLACE FUNCTION '||i_namespace||')\.('||i_funcname||')','\1.'||i_funcname||v_dbg_suffix);
  --change function name for release
  SELECT into v_sql_release regexp_replace(v_sql,'(CREATE OR REPLACE FUNCTION '||i_namespace||')\.('||i_funcname||')','\1.'||i_funcname||v_rel_suffix);

  IF i_comment THEN
    --comment debug stuff in release code
    SELECT into v_sql_release regexp_replace(v_sql_release,'(/\*dbg{\*/)(.*?)(/\*}dbg\*/)','\1/*\2*/\3','g');
    --comment release stuff in debug code
    SELECT into v_sql_debug regexp_replace(v_sql_debug,'(/\*rel{\*/)(.*?)(/\*}rel\*/)','\1/*\2*/\3','g');
  ELSE
    --remove debug stuff from release code
    SELECT into v_sql_release regexp_replace(v_sql_release,'/\*dbg{\*/.*?/\*}dbg\*/','','g');
    --remove release stuff from debug code
    SELECT into v_sql_debug regexp_replace(v_sql_debug,'/\*rel{\*/.*?/\*}rel\*/','','g');
  END IF;

  --RAISE NOTICE 'v_sql = "%"', v_sql;
  --RAISE NOTICE 'v_sql_debug = "%"', v_sql_debug;
  --RAISE NOTICE 'v_sql_release = "%"', v_sql_release;

  -- CREATE OR REPLACE FUNCTION  debug version
  EXECUTE v_sql_debug;
  -- CREATE OR REPLACE FUNCTION  release version
  EXECUTE v_sql_release;

END;
$$;


--
-- Name: preprocess_all(); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.preprocess_all() RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
DECLARE
  v_sql VARCHAR;
  v_sql_debug VARCHAR;
  v_sql_release VARCHAR;
  v_dbg_suffix VARCHAR = '_debug';
  v_rel_suffix VARCHAR = '_release';
BEGIN
  PERFORM preprocess('switch19','route',false);
  PERFORM preprocess('switch19','process_dp',false);
  PERFORM preprocess('switch19','process_gw',false);
END;
$$;


--
-- Name: process_dp(switch19.callprofile_ty, class4.destinations, class4.dialpeers, billing.accounts, class4.gateways, billing.accounts, integer, boolean, integer); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.process_dp(i_profile switch19.callprofile_ty, i_destination class4.destinations, i_dp class4.dialpeers, i_customer_acc billing.accounts, i_customer_gw class4.gateways, i_vendor_acc billing.accounts, i_pop_id integer, i_send_billing_information boolean, i_max_call_length integer) RETURNS SETOF switch19.callprofile_ty
    LANGUAGE plpgsql STABLE SECURITY DEFINER COST 10000
    AS $$
DECLARE
  /*dbg{*/
  v_start timestamp;
  v_end timestamp;
  /*}dbg*/
  v_gw class4.gateways%rowtype;
  v_gateway_group class4.gateway_groups%rowtype;
BEGIN
  /*dbg{*/
  v_start:=now();
  --RAISE NOTICE 'process_dp in: %',i_profile;5
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> process-DP. Found dialpeer: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(i_dp,true);
  /*}dbg*/

  --RAISE NOTICE 'process_dp dst: %',i_destination;
  if i_dp.gateway_id is null then /* termination to gw group */
    select into v_gateway_group * from  class4.gateway_groups where id=i_dp.gateway_group_id;
    IF v_gateway_group.balancing_mode_id=2 THEN
      /*rel{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id and
          cg.contractor_id=i_dp.vendor_id and
          cg.enabled
        ORDER BY
          cg.pop_id=i_pop_id desc,
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
        LOOP
        return query select * from process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,
                                                      i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}rel*/
      /*dbg{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id AND
          cg.enabled
        ORDER BY
          cg.pop_id=i_pop_id desc,
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
        IF v_gw.contractor_id!=i_dp.vendor_id THEN
          RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Skip gateway';
          continue;
        end if;
        return query select * from process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,
                                                    i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}dbg*/
    elsif v_gateway_group.balancing_mode_id=1 then
      /*rel{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id AND
          cg.contractor_id=i_dp.vendor_id AND
          cg.enabled
        ORDER BY
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
        return query select * from process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,
                                                      i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}rel*/
      /*dbg{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id and
          cg.enabled
        ORDER BY
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
        IF v_gw.contractor_id!=i_dp.vendor_id AND NOT v_gw.is_shared THEN
          RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Skip gateway';
          continue;
        end if;
        return query select * from process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,
                                                    i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}dbg*/

    elsif v_gateway_group.balancing_mode_id=3 THEN
      /*rel{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
	  (cg.pop_id is null OR cg.pop_id=i_pop_id) and
          cg.gateway_group_id=i_dp.gateway_group_id and
          cg.contractor_id=i_dp.vendor_id and
          cg.enabled
        ORDER BY
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
        LOOP
        return query select * from process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,
                                                      i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}rel*/
      /*dbg{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id AND
          cg.enabled
        ORDER BY
          cg.pop_id=i_pop_id desc,
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
	IF v_gw.pop_id is not null and v_gw.pop_id!=i_pop_id THEN
          RAISE WARNING 'process_dp: Gateway POP is %, call pop %, skipping.',v_gw.pop_id, i_pop_id;
          continue;
        end if;
        IF v_gw.contractor_id!=i_dp.vendor_id THEN
          RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Skip gateway';
          continue;
        end if;
        return query select * from process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,
                                                    i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}dbg*/
    end if;
  else
    select into v_gw * from class4.gateways cg where cg.id=i_dp.gateway_id and cg.enabled;
    if FOUND THEN
      IF v_gw.contractor_id!=i_dp.vendor_id AND NOT v_gw.is_shared THEN
        RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Stop processing';
        return;
      end if;

      /*rel{*/
      return query select * from
          process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,i_customer_gw, i_vendor_acc, v_gw, i_send_billing_information,i_max_call_length);
      /*}rel*/
      /*dbg{*/
      return query select * from
          process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,i_customer_gw, i_vendor_acc, v_gw, i_send_billing_information,i_max_call_length);
      /*}dbg*/
    else
      return;
    end if;
  end if;
END;
$$;


--
-- Name: process_dp_debug(switch19.callprofile_ty, class4.destinations, class4.dialpeers, billing.accounts, class4.gateways, billing.accounts, integer, boolean, integer); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.process_dp_debug(i_profile switch19.callprofile_ty, i_destination class4.destinations, i_dp class4.dialpeers, i_customer_acc billing.accounts, i_customer_gw class4.gateways, i_vendor_acc billing.accounts, i_pop_id integer, i_send_billing_information boolean, i_max_call_length integer) RETURNS SETOF switch19.callprofile_ty
    LANGUAGE plpgsql STABLE SECURITY DEFINER COST 10000
    AS $$
DECLARE
  /*dbg{*/
  v_start timestamp;
  v_end timestamp;
  /*}dbg*/
  v_gw class4.gateways%rowtype;
  v_gateway_group class4.gateway_groups%rowtype;
BEGIN
  /*dbg{*/
  v_start:=now();
  --RAISE NOTICE 'process_dp in: %',i_profile;5
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> process-DP. Found dialpeer: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(i_dp,true);
  /*}dbg*/

  --RAISE NOTICE 'process_dp dst: %',i_destination;
  if i_dp.gateway_id is null then /* termination to gw group */
    select into v_gateway_group * from  class4.gateway_groups where id=i_dp.gateway_group_id;
    IF v_gateway_group.balancing_mode_id=2 THEN
      
      /*dbg{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id AND
          cg.enabled
        ORDER BY
          cg.pop_id=i_pop_id desc,
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
        IF v_gw.contractor_id!=i_dp.vendor_id THEN
          RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Skip gateway';
          continue;
        end if;
        return query select * from process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,
                                                    i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}dbg*/
    elsif v_gateway_group.balancing_mode_id=1 then
      
      /*dbg{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id and
          cg.enabled
        ORDER BY
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
        IF v_gw.contractor_id!=i_dp.vendor_id AND NOT v_gw.is_shared THEN
          RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Skip gateway';
          continue;
        end if;
        return query select * from process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,
                                                    i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}dbg*/

    elsif v_gateway_group.balancing_mode_id=3 THEN
      
      /*dbg{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id AND
          cg.enabled
        ORDER BY
          cg.pop_id=i_pop_id desc,
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
	IF v_gw.pop_id is not null and v_gw.pop_id!=i_pop_id THEN
          RAISE WARNING 'process_dp: Gateway POP is %, call pop %, skipping.',v_gw.pop_id, i_pop_id;
          continue;
        end if;
        IF v_gw.contractor_id!=i_dp.vendor_id THEN
          RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Skip gateway';
          continue;
        end if;
        return query select * from process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,
                                                    i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}dbg*/
    end if;
  else
    select into v_gw * from class4.gateways cg where cg.id=i_dp.gateway_id and cg.enabled;
    if FOUND THEN
      IF v_gw.contractor_id!=i_dp.vendor_id AND NOT v_gw.is_shared THEN
        RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Stop processing';
        return;
      end if;

      
      /*dbg{*/
      return query select * from
          process_gw_debug(i_profile, i_destination, i_dp, i_customer_acc,i_customer_gw, i_vendor_acc, v_gw, i_send_billing_information,i_max_call_length);
      /*}dbg*/
    else
      return;
    end if;
  end if;
END;
$$;


--
-- Name: process_dp_release(switch19.callprofile_ty, class4.destinations, class4.dialpeers, billing.accounts, class4.gateways, billing.accounts, integer, boolean, integer); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.process_dp_release(i_profile switch19.callprofile_ty, i_destination class4.destinations, i_dp class4.dialpeers, i_customer_acc billing.accounts, i_customer_gw class4.gateways, i_vendor_acc billing.accounts, i_pop_id integer, i_send_billing_information boolean, i_max_call_length integer) RETURNS SETOF switch19.callprofile_ty
    LANGUAGE plpgsql STABLE SECURITY DEFINER COST 10000
    AS $$
DECLARE
  
  v_gw class4.gateways%rowtype;
  v_gateway_group class4.gateway_groups%rowtype;
BEGIN
  

  --RAISE NOTICE 'process_dp dst: %',i_destination;
  if i_dp.gateway_id is null then /* termination to gw group */
    select into v_gateway_group * from  class4.gateway_groups where id=i_dp.gateway_group_id;
    IF v_gateway_group.balancing_mode_id=2 THEN
      /*rel{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id and
          cg.contractor_id=i_dp.vendor_id and
          cg.enabled
        ORDER BY
          cg.pop_id=i_pop_id desc,
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
        LOOP
        return query select * from process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,
                                                      i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}rel*/
      
    elsif v_gateway_group.balancing_mode_id=1 then
      /*rel{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
          cg.gateway_group_id=i_dp.gateway_group_id AND
          cg.contractor_id=i_dp.vendor_id AND
          cg.enabled
        ORDER BY
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
      LOOP
        return query select * from process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,
                                                      i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}rel*/
      

    elsif v_gateway_group.balancing_mode_id=3 THEN
      /*rel{*/
      FOR v_gw in
        select * from class4.gateways cg
        where
	  (cg.pop_id is null OR cg.pop_id=i_pop_id) and
          cg.gateway_group_id=i_dp.gateway_group_id and
          cg.contractor_id=i_dp.vendor_id and
          cg.enabled
        ORDER BY
          yeti_ext.rank_dns_srv(cg.weight) over ( partition by cg.priority order by cg.weight)
        LOOP
        return query select * from process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,
                                                      i_customer_gw, i_vendor_acc , v_gw, i_send_billing_information,i_max_call_length);
      end loop;
      /*}rel*/
      
    end if;
  else
    select into v_gw * from class4.gateways cg where cg.id=i_dp.gateway_id and cg.enabled;
    if FOUND THEN
      IF v_gw.contractor_id!=i_dp.vendor_id AND NOT v_gw.is_shared THEN
        RAISE WARNING 'process_dp: Gateway owner !=dialpeer owner. Stop processing';
        return;
      end if;

      /*rel{*/
      return query select * from
          process_gw_release(i_profile, i_destination, i_dp, i_customer_acc,i_customer_gw, i_vendor_acc, v_gw, i_send_billing_information,i_max_call_length);
      /*}rel*/
      
    else
      return;
    end if;
  end if;
END;
$$;


--
-- Name: process_gw(switch19.callprofile_ty, class4.destinations, class4.dialpeers, billing.accounts, class4.gateways, billing.accounts, class4.gateways, boolean, integer); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.process_gw(i_profile switch19.callprofile_ty, i_destination class4.destinations, i_dp class4.dialpeers, i_customer_acc billing.accounts, i_customer_gw class4.gateways, i_vendor_acc billing.accounts, i_vendor_gw class4.gateways, i_send_billing_information boolean, i_max_call_length integer) RETURNS switch19.callprofile_ty
    LANGUAGE plpgsql STABLE SECURITY DEFINER COST 100000
    AS $_$
DECLARE
  i integer;
  v_customer_allowtime real;
  v_vendor_allowtime real;
  v_route_found boolean:=false;
  v_from_user varchar;
  v_from_domain varchar;
  v_schema varchar;
  v_termination_numberlist class4.numberlists%rowtype;
  v_termination_numberlist_item class4.numberlist_items%rowtype;
  v_termination_numberlist_size integer;
  /*dbg{*/
  v_start timestamp;
  v_end timestamp;
  /*}dbg*/
BEGIN
  /*dbg{*/
  v_start:=now();
  --RAISE NOTICE 'process_dp in: %',i_profile;
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. Found dialpeer: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(i_dp,true);
  /*}dbg*/

  --RAISE NOTICE 'process_dp dst: %',i_destination;

  i_profile.destination_id:=i_destination.id;
  --    i_profile.destination_initial_interval:=i_destination.initial_interval;
  i_profile.destination_fee:=i_destination.connect_fee::varchar;
  --i_profile.destination_next_interval:=i_destination.next_interval;
  i_profile.destination_rate_policy_id:=i_destination.rate_policy_id;

  --vendor account capacity limit;
  if i_vendor_acc.termination_capacity is not null then
    i_profile.resources:=i_profile.resources||'2:'||i_dp.account_id::varchar||':'||i_vendor_acc.termination_capacity::varchar||':1;';
  end if;

  if i_vendor_acc.total_capacity is not null then
    i_profile.resources:=i_profile.resources||'7:'||i_dp.account_id::varchar||':'||i_vendor_acc.total_capacity::varchar||':1;';
  end if;


  -- dialpeer account capacity limit;
  if i_dp.capacity is not null then
    i_profile.resources:=i_profile.resources||'6:'||i_dp.id::varchar||':'||i_dp.capacity::varchar||':1;';
  end if;

  /* */
  i_profile.dialpeer_id=i_dp.id;
  i_profile.dialpeer_prefix=i_dp.prefix;
  i_profile.dialpeer_next_rate=i_dp.next_rate::varchar;
  i_profile.dialpeer_initial_rate=i_dp.initial_rate::varchar;
  i_profile.dialpeer_initial_interval=i_dp.initial_interval;
  i_profile.dialpeer_next_interval=i_dp.next_interval;
  i_profile.dialpeer_fee=i_dp.connect_fee::varchar;
  i_profile.dialpeer_reverse_billing=i_dp.reverse_billing;
  i_profile.vendor_id=i_dp.vendor_id;
  i_profile.vendor_acc_id=i_dp.account_id;
  i_profile.term_gw_id=i_vendor_gw.id;

  i_profile.orig_gw_name=i_customer_gw."name";
  i_profile.orig_gw_external_id=i_customer_gw.external_id;

  i_profile.term_gw_name=i_vendor_gw."name";
  i_profile.term_gw_external_id=i_vendor_gw.external_id;

  i_profile.customer_account_name=i_customer_acc."name";

  i_profile.routing_group_id:=i_dp.routing_group_id;

  if i_send_billing_information then
    i_profile.aleg_append_headers_reply=E'X-VND-INIT-INT:'||i_profile.dialpeer_initial_interval||E'\r\nX-VND-NEXT-INT:'||i_profile.dialpeer_next_interval||E'\r\nX-VND-INIT-RATE:'||i_profile.dialpeer_initial_rate||E'\r\nX-VND-NEXT-RATE:'||i_profile.dialpeer_next_rate||E'\r\nX-VND-CF:'||i_profile.dialpeer_fee;
  end if;

  if i_destination.use_dp_intervals THEN
    i_profile.destination_initial_interval:=i_dp.initial_interval;
    i_profile.destination_next_interval:=i_dp.next_interval;
  ELSE
    i_profile.destination_initial_interval:=i_destination.initial_interval;
    i_profile.destination_next_interval:=i_destination.next_interval;
  end if;

  CASE i_profile.destination_rate_policy_id
    WHEN 1 THEN -- fixed
    i_profile.destination_next_rate:=i_destination.next_rate::varchar;
    i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    WHEN 2 THEN -- based on dialpeer
    i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    WHEN 3 THEN -- min
    IF i_dp.next_rate >= i_destination.next_rate THEN
      i_profile.destination_next_rate:=i_destination.next_rate::varchar; -- FIXED least
      i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    ELSE
      i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar; -- DYNAMIC
      i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    END IF;
    WHEN 4 THEN -- max
    IF i_dp.next_rate < i_destination.next_rate THEN
      i_profile.destination_next_rate:=i_destination.next_rate::varchar; --FIXED
      i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    ELSE
      i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar; -- DYNAMIC
      i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    END IF;
  ELSE
  --
  end case;



  /* time limiting START */
  --SELECT INTO STRICT v_c_acc * FROM billing.accounts  WHERE id=v_customer_auth.account_id;
  --SELECT INTO STRICT v_v_acc * FROM billing.accounts  WHERE id=v_dialpeer.account_id;

  IF (i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee <0 THEN
    v_customer_allowtime:=0;
    i_profile.disconnect_code_id=8000; --Not enough customer balance
    RETURN i_profile;
  ELSIF (i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee-i_destination.initial_rate/60*i_destination.initial_interval<0 THEN
    v_customer_allowtime:=i_destination.initial_interval;
    i_profile.disconnect_code_id=8000; --Not enough customer balance
    RETURN i_profile;
  ELSIF i_destination.next_rate!=0 AND i_destination.next_interval!=0 THEN
    v_customer_allowtime:=i_destination.initial_interval+
                          LEAST(FLOOR(((i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee-i_destination.initial_rate/60*i_destination.initial_interval)/
                                      (i_destination.next_rate/60*i_destination.next_interval)),24e6)::integer*i_destination.next_interval;
  ELSE /* DST rates is 0, allowing maximum call length */
    v_customer_allowtime:=COALESCE(i_customer_acc.max_call_duration, i_max_call_length);
  end IF;


  IF (i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee <0 THEN /* No enough balance, skipping this profile */
    v_vendor_allowtime:=0;
    return null;
  ELSIF (i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee-i_dp.initial_rate/60*i_dp.initial_interval<0 THEN /* No enough balance even for first billing interval - skipping this profile */
    return null;
  ELSIF i_dp.next_rate!=0 AND i_dp.next_interval!=0 THEN /* DP rates is not zero, calculating limit */
    v_vendor_allowtime:=i_dp.initial_interval+
                        LEAST(FLOOR(((i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee-i_dp.initial_rate/60*i_dp.initial_interval)/
                                    (i_dp.next_rate/60*i_dp.next_interval)),24e6)::integer*i_dp.next_interval;
  ELSE /* DP rates is 0, allowing maximum call length */
    v_vendor_allowtime:=COALESCE(i_vendor_acc.max_call_duration, i_max_call_length);
  end IF;

  i_profile.time_limit=LEAST(
    COALESCE(i_customer_acc.max_call_duration, i_max_call_length),
    COALESCE(i_vendor_acc.max_call_duration, i_max_call_length),
    v_vendor_allowtime,
    v_customer_allowtime
  )::integer;


  /* number rewriting _After_ routing */
  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. Before rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/
  i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(i_profile.dst_prefix_out,i_dp.dst_rewrite_rule,i_dp.dst_rewrite_result);
  i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(i_profile.src_prefix_out,i_dp.src_rewrite_rule,i_dp.src_rewrite_result);
  i_profile.src_name_out=yeti_ext.regexp_replace_rand(i_profile.src_name_out,i_dp.src_name_rewrite_rule,i_dp.src_name_rewrite_result, true);

  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. After rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/

  /*
      get termination gw data
  */
  --SELECT into v_dst_gw * from class4.gateways WHERE id=v_dialpeer.gateway_id;
  --SELECT into v_orig_gw * from class4.gateways WHERE id=v_customer_auth.gateway_id;
  --vendor gw
  if i_vendor_gw.termination_capacity is not null then
    i_profile.resources:=i_profile.resources||'5:'||i_vendor_gw.id::varchar||':'||i_vendor_gw.termination_capacity::varchar||':1;';
  end if;


  /*
      numberlist processing _After_ routing _IN_ termination GW
  */
  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> GW. Before numberlist processing src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/


  ----- DST Numberlist processing-------------------------------------------------------------------------------------------------------
  IF i_vendor_gw.termination_dst_numberlist_id is not null then
    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW DST Numberlist processing. Lookup by key: %',EXTRACT(MILLISECOND from v_end-v_start), i_profile.dst_prefix_out;
    /*}dbg*/

    select into v_termination_numberlist * from class4.numberlists where id=i_vendor_gw.termination_dst_numberlist_id;
    CASE v_termination_numberlist.mode_id
      when 1 then -- strict match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id and
          ni.key=i_profile.dst_prefix_out
        limit 1;
      when 2 then -- prefix match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id and
          prefix_range(ni.key)@>prefix_range(i_profile.dst_prefix_out) and
          length(i_profile.dst_prefix_out) between ni.number_min_length and ni.number_max_length
        order by length(prefix_range(ni.key)) desc
        limit 1;
      when 3 then -- random
        select into v_termination_numberlist_size count(*) from class4.numberlist_items where numberlist_id=i_vendor_gw.termination_dst_numberlist_id;
        select into v_termination_numberlist_item * from class4.numberlist_items ni
         where ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id order by ni.id OFFSET floor(random()*v_termination_numberlist_size) limit 1;
    END CASE;

    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW DST Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_termination_numberlist_item);
    /*}dbg*/

    IF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW DST Numberlist. Drop by key action. Skipping route. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_termination_numberlist_item.key;
      /*}dbg*/
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=2 then
        i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.src_prefix_out,
          v_termination_numberlist_item.src_rewrite_rule,
          v_termination_numberlist_item.src_rewrite_result
        );

        i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.dst_prefix_out,
          v_termination_numberlist_item.dst_rewrite_rule,
          v_termination_numberlist_item.dst_rewrite_result
        );
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW DST Numberlist. Drop by default action. Skipping route',EXTRACT(MILLISECOND from v_end-v_start);
      /*}dbg*/
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=2 then
      i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.src_prefix_out,
        v_termination_numberlist.default_src_rewrite_rule,
        v_termination_numberlist.default_src_rewrite_result
      );

      i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.dst_prefix_out,
        v_termination_numberlist.default_dst_rewrite_rule,
        v_termination_numberlist.default_dst_rewrite_result
      );
    END IF;
  END IF;



  ----- SRC Numberlist processing-------------------------------------------------------------------------------------------------------
  IF i_vendor_gw.termination_src_numberlist_id is not null then
    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW SRC Numberlist processing. Lookup by key: %',EXTRACT(MILLISECOND from v_end-v_start), i_profile.src_prefix_out;
    /*}dbg*/

    select into v_termination_numberlist * from class4.numberlists where id=i_vendor_gw.termination_src_numberlist_id;
    CASE v_termination_numberlist.mode_id
      when 1 then -- strict match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id and
          ni.key=i_profile.src_prefix_out
        limit 1;
      when 2 then -- prefix match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id and
          prefix_range(ni.key)@>prefix_range(i_profile.src_prefix_out) and
          length(i_profile.src_prefix_out) between ni.number_min_length and ni.number_max_length
        order by length(prefix_range(ni.key)) desc
        limit 1;
      when 3 then -- random
        select into v_termination_numberlist_size count(*) from class4.numberlist_items where numberlist_id=i_vendor_gw.termination_src_numberlist_id;
        select into v_termination_numberlist_item * from class4.numberlist_items ni
         where ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id order by ni.id OFFSET floor(random()*v_termination_numberlist_size) limit 1;
    END CASE;

    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW SRC Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_termination_numberlist_item);
    /*}dbg*/

    IF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW SRC Numberlist. Drop by key action. Skipping route. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_termination_numberlist_item.key;
      /*}dbg*/
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=2 then
        i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.src_prefix_out,
          v_termination_numberlist_item.src_rewrite_rule,
          v_termination_numberlist_item.src_rewrite_result
        );

        i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.dst_prefix_out,
          v_termination_numberlist_item.dst_rewrite_rule,
          v_termination_numberlist_item.dst_rewrite_result
        );
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW DST Numberlist. Drop by default action. Skipping route.',EXTRACT(MILLISECOND from v_end-v_start);
      /*}dbg*/
      -- drop by default
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=2 then
      i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.src_prefix_out,
        v_termination_numberlist.default_src_rewrite_rule,
        v_termination_numberlist.default_src_rewrite_result
      );

      i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.dst_prefix_out,
        v_termination_numberlist.default_dst_rewrite_rule,
        v_termination_numberlist.default_dst_rewrite_result
      );
    END IF;
  END IF;



  /*
      number rewriting _After_ routing _IN_ termination GW
  */
  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> GW. Before rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/
  i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(i_profile.dst_prefix_out,i_vendor_gw.dst_rewrite_rule,i_vendor_gw.dst_rewrite_result);
  i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(i_profile.src_prefix_out,i_vendor_gw.src_rewrite_rule,i_vendor_gw.src_rewrite_result);
  i_profile.src_name_out=yeti_ext.regexp_replace_rand(i_profile.src_name_out,i_vendor_gw.src_name_rewrite_rule,i_vendor_gw.src_name_rewrite_result, true);

  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> GW. After rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/

  -- i_profile.anonymize_sdp:=i_vendor_gw.anonymize_sdp OR i_customer_gw.anonymize_sdp;

  --i_profile.append_headers:='User-Agent: YETI SBC\r\n';
  i_profile.append_headers_req:=i_vendor_gw.term_append_headers_req;
  i_profile.aleg_append_headers_req=i_customer_gw.orig_append_headers_req;



  i_profile.next_hop_1st_req=i_vendor_gw.auth_enabled; -- use low delay dns srv if auth enabled
  i_profile.next_hop:=i_vendor_gw.term_next_hop;
  i_profile.aleg_next_hop:=i_customer_gw.orig_next_hop;
  --    i_profile.next_hop_for_replies:=v_dst_gw.term_next_hop_for_replies;

  i_profile.dlg_nat_handling=i_customer_gw.dialog_nat_handling;

  i_profile.call_id:=''; -- Generation by sems

  i_profile.enable_auth:=i_vendor_gw.auth_enabled;
  i_profile.auth_pwd:=i_vendor_gw.auth_password;
  i_profile.auth_user:=i_vendor_gw.auth_user;
  i_profile.enable_aleg_auth:=false;
  i_profile.auth_aleg_pwd:='';
  i_profile.auth_aleg_user:='';

  if i_profile.enable_auth then
    v_from_user=COALESCE(i_vendor_gw.auth_from_user,i_profile.src_prefix_out,'');
    v_from_domain=COALESCE(i_vendor_gw.auth_from_domain,'$Oi');
  else
    v_from_user=COALESCE(i_profile.src_prefix_out,'');
    if i_vendor_gw.preserve_anonymous_from_domain and i_profile.from_domain='anonymous.invalid' then
      v_from_domain='anonymous.invalid';
    else
      v_from_domain='$Oi';
    end if;
  end if;

  if i_vendor_gw.sip_schema_id = 1 then
    v_schema='sip';
  elsif i_vendor_gw.sip_schema_id = 2 then
    v_schema='sips';
  else
    RAISE exception 'Unknown termination gateway % SIP schema %', i_vendor_gw.id, i_vendor_gw.sip_schema_id;
  end if;


  i_profile."from":=COALESCE(i_profile.src_name_out||' ','')||'<'||v_schema||':'||coalesce(nullif(v_from_user,'')||'@','')||v_from_domain||'>';
  i_profile."to":='<'||v_schema||':'||i_profile.dst_prefix_out||'@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port||'>','>');

  if i_vendor_gw.send_lnp_information and i_profile.lrn is not null then
    if i_profile.lrn=i_profile.dst_prefix_routing then -- number not ported, but request was successf we musr add ;npdi=yes;
      i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||';npdi=yes@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,'');
      i_profile.lrn=nullif(i_profile.dst_prefix_routing,i_profile.lrn); -- clear lnr field if number not ported;
    else -- if number ported
      i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||';rn='||i_profile.lrn||';npdi=yes@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,'');
    end if;
  else
    i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||'@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,''); -- no fucking porting
  end if;

  if i_vendor_gw.use_registered_aor then
    i_profile.registered_aor_id=i_vendor_gw.id;
  end if;

  i_profile.bleg_transport_protocol_id:=i_vendor_gw.transport_protocol_id;
  i_profile.bleg_protocol_priority_id:=i_vendor_gw.network_protocol_priority_id;

  i_profile.aleg_media_encryption_mode_id:=i_customer_gw.media_encryption_mode_id;
  i_profile.bleg_media_encryption_mode_id:=i_vendor_gw.media_encryption_mode_id;


  IF (i_vendor_gw.term_use_outbound_proxy ) THEN
    i_profile.outbound_proxy:=v_schema||':'||i_vendor_gw.term_outbound_proxy;
    i_profile.force_outbound_proxy:=i_vendor_gw.term_force_outbound_proxy;
    i_profile.bleg_outbound_proxy_transport_protocol_id:=i_vendor_gw.term_proxy_transport_protocol_id;
  ELSE
    i_profile.outbound_proxy:=NULL;
    i_profile.force_outbound_proxy:=false;
  END IF;

  IF (i_customer_gw.orig_use_outbound_proxy ) THEN
    i_profile.aleg_force_outbound_proxy:=i_customer_gw.orig_force_outbound_proxy;
    i_profile.aleg_outbound_proxy=v_schema||':'||i_customer_gw.orig_outbound_proxy;
    i_profile.aleg_outbound_proxy_transport_protocol_id:=i_customer_gw.orig_proxy_transport_protocol_id;
  else
    i_profile.aleg_force_outbound_proxy:=FALSE;
    i_profile.aleg_outbound_proxy=NULL;
  end if;

  i_profile.aleg_policy_id=i_customer_gw.orig_disconnect_policy_id;
  i_profile.bleg_policy_id=i_vendor_gw.term_disconnect_policy_id;

  i_profile.transit_headers_a2b:=i_customer_gw.transit_headers_from_origination||';'||i_vendor_gw.transit_headers_from_origination;
  i_profile.transit_headers_b2a:=i_vendor_gw.transit_headers_from_termination||';'||i_customer_gw.transit_headers_from_termination;


  i_profile.sdp_filter_type_id:=0;
  i_profile.sdp_filter_list:='';

  i_profile.sdp_alines_filter_type_id:=i_vendor_gw.sdp_alines_filter_type_id;
  i_profile.sdp_alines_filter_list:=i_vendor_gw.sdp_alines_filter_list;

  i_profile.enable_session_timer=i_vendor_gw.sst_enabled;
  i_profile.session_expires =i_vendor_gw.sst_session_expires;
  i_profile.minimum_timer:=i_vendor_gw.sst_minimum_timer;
  i_profile.maximum_timer:=i_vendor_gw.sst_maximum_timer;
  i_profile.session_refresh_method_id:=i_vendor_gw.session_refresh_method_id;
  i_profile.accept_501_reply:=i_vendor_gw.sst_accept501;

  i_profile.enable_aleg_session_timer=i_customer_gw.sst_enabled;
  i_profile.aleg_session_expires:=i_customer_gw.sst_session_expires;
  i_profile.aleg_minimum_timer:=i_customer_gw.sst_minimum_timer;
  i_profile.aleg_maximum_timer:=i_customer_gw.sst_maximum_timer;
  i_profile.aleg_session_refresh_method_id:=i_customer_gw.session_refresh_method_id;
  i_profile.aleg_accept_501_reply:=i_customer_gw.sst_accept501;

  i_profile.reply_translations:='';
  i_profile.disconnect_code_id:=NULL;
  i_profile.enable_rtprelay:=i_vendor_gw.proxy_media OR i_customer_gw.proxy_media;

  i_profile.rtprelay_interface:=i_vendor_gw.rtp_interface_name;
  i_profile.aleg_rtprelay_interface:=i_customer_gw.rtp_interface_name;

  i_profile.outbound_interface:=i_vendor_gw.sip_interface_name;
  i_profile.aleg_outbound_interface:=i_customer_gw.sip_interface_name;

  i_profile.bleg_force_symmetric_rtp:=i_vendor_gw.force_symmetric_rtp;
  i_profile.bleg_symmetric_rtp_nonstop=i_vendor_gw.symmetric_rtp_nonstop;
  i_profile.bleg_symmetric_rtp_ignore_rtcp=i_vendor_gw.symmetric_rtp_ignore_rtcp;

  i_profile.aleg_force_symmetric_rtp:=i_customer_gw.force_symmetric_rtp;
  i_profile.aleg_symmetric_rtp_nonstop=i_customer_gw.symmetric_rtp_nonstop;
  i_profile.aleg_symmetric_rtp_ignore_rtcp=i_customer_gw.symmetric_rtp_ignore_rtcp;

  i_profile.bleg_rtp_ping=i_vendor_gw.rtp_ping;
  i_profile.aleg_rtp_ping=i_customer_gw.rtp_ping;

  i_profile.bleg_relay_options = i_vendor_gw.relay_options;
  i_profile.aleg_relay_options = i_customer_gw.relay_options;


  i_profile.filter_noaudio_streams = i_vendor_gw.filter_noaudio_streams OR i_customer_gw.filter_noaudio_streams;
  i_profile.force_one_way_early_media = i_vendor_gw.force_one_way_early_media OR i_customer_gw.force_one_way_early_media;
  i_profile.aleg_relay_reinvite = i_vendor_gw.relay_reinvite;
  i_profile.bleg_relay_reinvite = i_customer_gw.relay_reinvite;

  i_profile.aleg_relay_hold = i_vendor_gw.relay_hold;
  i_profile.bleg_relay_hold = i_customer_gw.relay_hold;

  i_profile.aleg_relay_prack = i_vendor_gw.relay_prack;
  i_profile.bleg_relay_prack = i_customer_gw.relay_prack;
  i_profile.aleg_rel100_mode_id = i_customer_gw.rel100_mode_id;
  i_profile.bleg_rel100_mode_id = i_vendor_gw.rel100_mode_id;

  i_profile.rtp_relay_timestamp_aligning=i_vendor_gw.rtp_relay_timestamp_aligning OR i_customer_gw.rtp_relay_timestamp_aligning;
  i_profile.allow_1xx_wo2tag=i_vendor_gw.allow_1xx_without_to_tag OR i_customer_gw.allow_1xx_without_to_tag;

  i_profile.aleg_sdp_c_location_id=i_customer_gw.sdp_c_location_id;
  i_profile.bleg_sdp_c_location_id=i_vendor_gw.sdp_c_location_id;
  i_profile.trusted_hdrs_gw=false;



  i_profile.aleg_codecs_group_id:=i_customer_gw.codec_group_id;
  i_profile.bleg_codecs_group_id:=i_vendor_gw.codec_group_id;
  i_profile.aleg_single_codec_in_200ok:=i_customer_gw.single_codec_in_200ok;
  i_profile.bleg_single_codec_in_200ok:=i_vendor_gw.single_codec_in_200ok;
  i_profile.ringing_timeout=i_vendor_gw.ringing_timeout;
  i_profile.dead_rtp_time=GREATEST(i_vendor_gw.rtp_timeout,i_customer_gw.rtp_timeout);
  i_profile.invite_timeout=i_vendor_gw.sip_timer_b;
  i_profile.srv_failover_timeout=i_vendor_gw.dns_srv_failover_timer;
  i_profile.fake_180_timer=i_vendor_gw.fake_180_timer;
  i_profile.rtp_force_relay_cn=i_vendor_gw.rtp_force_relay_cn OR i_customer_gw.rtp_force_relay_cn;
  i_profile.patch_ruri_next_hop=i_vendor_gw.resolve_ruri;

  i_profile.aleg_sensor_id=i_customer_gw.sensor_id;
  i_profile.aleg_sensor_level_id=i_customer_gw.sensor_level_id;
  i_profile.bleg_sensor_id=i_vendor_gw.sensor_id;
  i_profile.bleg_sensor_level_id=i_vendor_gw.sensor_level_id;

  i_profile.aleg_dtmf_send_mode_id=i_customer_gw.dtmf_send_mode_id;
  i_profile.aleg_dtmf_recv_modes=i_customer_gw.dtmf_receive_mode_id;
  i_profile.bleg_dtmf_send_mode_id=i_vendor_gw.dtmf_send_mode_id;
  i_profile.bleg_dtmf_recv_modes=i_vendor_gw.dtmf_receive_mode_id;


  i_profile.aleg_rtp_filter_inband_dtmf=false;
  i_profile.bleg_rtp_filter_inband_dtmf=false;

  if i_customer_gw.rx_inband_dtmf_filtering_mode_id=3 then -- enable filtering
    i_profile.aleg_rtp_filter_inband_dtmf=true;
  elsif i_customer_gw.rx_inband_dtmf_filtering_mode_id=1 then -- inherit
    if i_vendor_gw.tx_inband_dtmf_filtering_mode_id in (1,2) then  -- inherit or disable filtering
      i_profile.aleg_rtp_filter_inband_dtmf=false;
    elsif i_vendor_gw.tx_inband_dtmf_filtering_mode_id = 3 then -- enable filtering
      i_profile.aleg_rtp_filter_inband_dtmf=true;
    end if;
  end if;


  if i_vendor_gw.rx_inband_dtmf_filtering_mode_id=3 then -- enable filtering
    i_profile.bleg_rtp_filter_inband_dtmf=true;
  elsif i_vendor_gw.rx_inband_dtmf_filtering_mode_id=1 then -- inherit
    if i_customer_gw.tx_inband_dtmf_filtering_mode_id in (1,2) then  -- inherit or disable filtering
      i_profile.bleg_rtp_filter_inband_dtmf=false;
    elsif i_customer_gw.tx_inband_dtmf_filtering_mode_id = 3 then -- enable filtering
      i_profile.bleg_rtp_filter_inband_dtmf=true;
    end if;
  end if;


  i_profile.rtprelay_force_dtmf_relay=i_vendor_gw.force_dtmf_relay;
  i_profile.rtprelay_dtmf_detection=NOT i_vendor_gw.force_dtmf_relay;
  i_profile.rtprelay_dtmf_filtering=NOT i_vendor_gw.force_dtmf_relay;
  i_profile.bleg_max_30x_redirects = i_vendor_gw.max_30x_redirects;
  i_profile.bleg_max_transfers = i_vendor_gw.max_transfers;


  i_profile.aleg_relay_update=i_customer_gw.relay_update;
  i_profile.bleg_relay_update=i_vendor_gw.relay_update;
  i_profile.suppress_early_media=i_customer_gw.suppress_early_media OR i_vendor_gw.suppress_early_media;

  i_profile.bleg_radius_acc_profile_id=i_vendor_gw.radius_accounting_profile_id;

  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. Finished: % ',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(i_profile,true);
  /*}dbg*/
  RETURN i_profile;
END;
$_$;


--
-- Name: process_gw_debug(switch19.callprofile_ty, class4.destinations, class4.dialpeers, billing.accounts, class4.gateways, billing.accounts, class4.gateways, boolean, integer); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.process_gw_debug(i_profile switch19.callprofile_ty, i_destination class4.destinations, i_dp class4.dialpeers, i_customer_acc billing.accounts, i_customer_gw class4.gateways, i_vendor_acc billing.accounts, i_vendor_gw class4.gateways, i_send_billing_information boolean, i_max_call_length integer) RETURNS switch19.callprofile_ty
    LANGUAGE plpgsql STABLE SECURITY DEFINER COST 100000
    AS $_$
DECLARE
  i integer;
  v_customer_allowtime real;
  v_vendor_allowtime real;
  v_route_found boolean:=false;
  v_from_user varchar;
  v_from_domain varchar;
  v_schema varchar;
  v_termination_numberlist class4.numberlists%rowtype;
  v_termination_numberlist_item class4.numberlist_items%rowtype;
  v_termination_numberlist_size integer;
  /*dbg{*/
  v_start timestamp;
  v_end timestamp;
  /*}dbg*/
BEGIN
  /*dbg{*/
  v_start:=now();
  --RAISE NOTICE 'process_dp in: %',i_profile;
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. Found dialpeer: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(i_dp,true);
  /*}dbg*/

  --RAISE NOTICE 'process_dp dst: %',i_destination;

  i_profile.destination_id:=i_destination.id;
  --    i_profile.destination_initial_interval:=i_destination.initial_interval;
  i_profile.destination_fee:=i_destination.connect_fee::varchar;
  --i_profile.destination_next_interval:=i_destination.next_interval;
  i_profile.destination_rate_policy_id:=i_destination.rate_policy_id;

  --vendor account capacity limit;
  if i_vendor_acc.termination_capacity is not null then
    i_profile.resources:=i_profile.resources||'2:'||i_dp.account_id::varchar||':'||i_vendor_acc.termination_capacity::varchar||':1;';
  end if;

  if i_vendor_acc.total_capacity is not null then
    i_profile.resources:=i_profile.resources||'7:'||i_dp.account_id::varchar||':'||i_vendor_acc.total_capacity::varchar||':1;';
  end if;


  -- dialpeer account capacity limit;
  if i_dp.capacity is not null then
    i_profile.resources:=i_profile.resources||'6:'||i_dp.id::varchar||':'||i_dp.capacity::varchar||':1;';
  end if;

  /* */
  i_profile.dialpeer_id=i_dp.id;
  i_profile.dialpeer_prefix=i_dp.prefix;
  i_profile.dialpeer_next_rate=i_dp.next_rate::varchar;
  i_profile.dialpeer_initial_rate=i_dp.initial_rate::varchar;
  i_profile.dialpeer_initial_interval=i_dp.initial_interval;
  i_profile.dialpeer_next_interval=i_dp.next_interval;
  i_profile.dialpeer_fee=i_dp.connect_fee::varchar;
  i_profile.dialpeer_reverse_billing=i_dp.reverse_billing;
  i_profile.vendor_id=i_dp.vendor_id;
  i_profile.vendor_acc_id=i_dp.account_id;
  i_profile.term_gw_id=i_vendor_gw.id;

  i_profile.orig_gw_name=i_customer_gw."name";
  i_profile.orig_gw_external_id=i_customer_gw.external_id;

  i_profile.term_gw_name=i_vendor_gw."name";
  i_profile.term_gw_external_id=i_vendor_gw.external_id;

  i_profile.customer_account_name=i_customer_acc."name";

  i_profile.routing_group_id:=i_dp.routing_group_id;

  if i_send_billing_information then
    i_profile.aleg_append_headers_reply=E'X-VND-INIT-INT:'||i_profile.dialpeer_initial_interval||E'\r\nX-VND-NEXT-INT:'||i_profile.dialpeer_next_interval||E'\r\nX-VND-INIT-RATE:'||i_profile.dialpeer_initial_rate||E'\r\nX-VND-NEXT-RATE:'||i_profile.dialpeer_next_rate||E'\r\nX-VND-CF:'||i_profile.dialpeer_fee;
  end if;

  if i_destination.use_dp_intervals THEN
    i_profile.destination_initial_interval:=i_dp.initial_interval;
    i_profile.destination_next_interval:=i_dp.next_interval;
  ELSE
    i_profile.destination_initial_interval:=i_destination.initial_interval;
    i_profile.destination_next_interval:=i_destination.next_interval;
  end if;

  CASE i_profile.destination_rate_policy_id
    WHEN 1 THEN -- fixed
    i_profile.destination_next_rate:=i_destination.next_rate::varchar;
    i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    WHEN 2 THEN -- based on dialpeer
    i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    WHEN 3 THEN -- min
    IF i_dp.next_rate >= i_destination.next_rate THEN
      i_profile.destination_next_rate:=i_destination.next_rate::varchar; -- FIXED least
      i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    ELSE
      i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar; -- DYNAMIC
      i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    END IF;
    WHEN 4 THEN -- max
    IF i_dp.next_rate < i_destination.next_rate THEN
      i_profile.destination_next_rate:=i_destination.next_rate::varchar; --FIXED
      i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    ELSE
      i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar; -- DYNAMIC
      i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    END IF;
  ELSE
  --
  end case;



  /* time limiting START */
  --SELECT INTO STRICT v_c_acc * FROM billing.accounts  WHERE id=v_customer_auth.account_id;
  --SELECT INTO STRICT v_v_acc * FROM billing.accounts  WHERE id=v_dialpeer.account_id;

  IF (i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee <0 THEN
    v_customer_allowtime:=0;
    i_profile.disconnect_code_id=8000; --Not enough customer balance
    RETURN i_profile;
  ELSIF (i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee-i_destination.initial_rate/60*i_destination.initial_interval<0 THEN
    v_customer_allowtime:=i_destination.initial_interval;
    i_profile.disconnect_code_id=8000; --Not enough customer balance
    RETURN i_profile;
  ELSIF i_destination.next_rate!=0 AND i_destination.next_interval!=0 THEN
    v_customer_allowtime:=i_destination.initial_interval+
                          LEAST(FLOOR(((i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee-i_destination.initial_rate/60*i_destination.initial_interval)/
                                      (i_destination.next_rate/60*i_destination.next_interval)),24e6)::integer*i_destination.next_interval;
  ELSE /* DST rates is 0, allowing maximum call length */
    v_customer_allowtime:=COALESCE(i_customer_acc.max_call_duration, i_max_call_length);
  end IF;


  IF (i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee <0 THEN /* No enough balance, skipping this profile */
    v_vendor_allowtime:=0;
    return null;
  ELSIF (i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee-i_dp.initial_rate/60*i_dp.initial_interval<0 THEN /* No enough balance even for first billing interval - skipping this profile */
    return null;
  ELSIF i_dp.next_rate!=0 AND i_dp.next_interval!=0 THEN /* DP rates is not zero, calculating limit */
    v_vendor_allowtime:=i_dp.initial_interval+
                        LEAST(FLOOR(((i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee-i_dp.initial_rate/60*i_dp.initial_interval)/
                                    (i_dp.next_rate/60*i_dp.next_interval)),24e6)::integer*i_dp.next_interval;
  ELSE /* DP rates is 0, allowing maximum call length */
    v_vendor_allowtime:=COALESCE(i_vendor_acc.max_call_duration, i_max_call_length);
  end IF;

  i_profile.time_limit=LEAST(
    COALESCE(i_customer_acc.max_call_duration, i_max_call_length),
    COALESCE(i_vendor_acc.max_call_duration, i_max_call_length),
    v_vendor_allowtime,
    v_customer_allowtime
  )::integer;


  /* number rewriting _After_ routing */
  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. Before rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/
  i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(i_profile.dst_prefix_out,i_dp.dst_rewrite_rule,i_dp.dst_rewrite_result);
  i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(i_profile.src_prefix_out,i_dp.src_rewrite_rule,i_dp.src_rewrite_result);
  i_profile.src_name_out=yeti_ext.regexp_replace_rand(i_profile.src_name_out,i_dp.src_name_rewrite_rule,i_dp.src_name_rewrite_result, true);

  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. After rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/

  /*
      get termination gw data
  */
  --SELECT into v_dst_gw * from class4.gateways WHERE id=v_dialpeer.gateway_id;
  --SELECT into v_orig_gw * from class4.gateways WHERE id=v_customer_auth.gateway_id;
  --vendor gw
  if i_vendor_gw.termination_capacity is not null then
    i_profile.resources:=i_profile.resources||'5:'||i_vendor_gw.id::varchar||':'||i_vendor_gw.termination_capacity::varchar||':1;';
  end if;


  /*
      numberlist processing _After_ routing _IN_ termination GW
  */
  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> GW. Before numberlist processing src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/


  ----- DST Numberlist processing-------------------------------------------------------------------------------------------------------
  IF i_vendor_gw.termination_dst_numberlist_id is not null then
    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW DST Numberlist processing. Lookup by key: %',EXTRACT(MILLISECOND from v_end-v_start), i_profile.dst_prefix_out;
    /*}dbg*/

    select into v_termination_numberlist * from class4.numberlists where id=i_vendor_gw.termination_dst_numberlist_id;
    CASE v_termination_numberlist.mode_id
      when 1 then -- strict match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id and
          ni.key=i_profile.dst_prefix_out
        limit 1;
      when 2 then -- prefix match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id and
          prefix_range(ni.key)@>prefix_range(i_profile.dst_prefix_out) and
          length(i_profile.dst_prefix_out) between ni.number_min_length and ni.number_max_length
        order by length(prefix_range(ni.key)) desc
        limit 1;
      when 3 then -- random
        select into v_termination_numberlist_size count(*) from class4.numberlist_items where numberlist_id=i_vendor_gw.termination_dst_numberlist_id;
        select into v_termination_numberlist_item * from class4.numberlist_items ni
         where ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id order by ni.id OFFSET floor(random()*v_termination_numberlist_size) limit 1;
    END CASE;

    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW DST Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_termination_numberlist_item);
    /*}dbg*/

    IF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW DST Numberlist. Drop by key action. Skipping route. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_termination_numberlist_item.key;
      /*}dbg*/
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=2 then
        i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.src_prefix_out,
          v_termination_numberlist_item.src_rewrite_rule,
          v_termination_numberlist_item.src_rewrite_result
        );

        i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.dst_prefix_out,
          v_termination_numberlist_item.dst_rewrite_rule,
          v_termination_numberlist_item.dst_rewrite_result
        );
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW DST Numberlist. Drop by default action. Skipping route',EXTRACT(MILLISECOND from v_end-v_start);
      /*}dbg*/
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=2 then
      i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.src_prefix_out,
        v_termination_numberlist.default_src_rewrite_rule,
        v_termination_numberlist.default_src_rewrite_result
      );

      i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.dst_prefix_out,
        v_termination_numberlist.default_dst_rewrite_rule,
        v_termination_numberlist.default_dst_rewrite_result
      );
    END IF;
  END IF;



  ----- SRC Numberlist processing-------------------------------------------------------------------------------------------------------
  IF i_vendor_gw.termination_src_numberlist_id is not null then
    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW SRC Numberlist processing. Lookup by key: %',EXTRACT(MILLISECOND from v_end-v_start), i_profile.src_prefix_out;
    /*}dbg*/

    select into v_termination_numberlist * from class4.numberlists where id=i_vendor_gw.termination_src_numberlist_id;
    CASE v_termination_numberlist.mode_id
      when 1 then -- strict match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id and
          ni.key=i_profile.src_prefix_out
        limit 1;
      when 2 then -- prefix match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id and
          prefix_range(ni.key)@>prefix_range(i_profile.src_prefix_out) and
          length(i_profile.src_prefix_out) between ni.number_min_length and ni.number_max_length
        order by length(prefix_range(ni.key)) desc
        limit 1;
      when 3 then -- random
        select into v_termination_numberlist_size count(*) from class4.numberlist_items where numberlist_id=i_vendor_gw.termination_src_numberlist_id;
        select into v_termination_numberlist_item * from class4.numberlist_items ni
         where ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id order by ni.id OFFSET floor(random()*v_termination_numberlist_size) limit 1;
    END CASE;

    /*dbg{*/
    v_end:=clock_timestamp();
    RAISE NOTICE '% ms -> GW SRC Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_termination_numberlist_item);
    /*}dbg*/

    IF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW SRC Numberlist. Drop by key action. Skipping route. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_termination_numberlist_item.key;
      /*}dbg*/
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=2 then
        i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.src_prefix_out,
          v_termination_numberlist_item.src_rewrite_rule,
          v_termination_numberlist_item.src_rewrite_result
        );

        i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.dst_prefix_out,
          v_termination_numberlist_item.dst_rewrite_rule,
          v_termination_numberlist_item.dst_rewrite_result
        );
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=1 then
      /*dbg{*/
      v_end:=clock_timestamp();
      RAISE NOTICE '% ms -> GW DST Numberlist. Drop by default action. Skipping route.',EXTRACT(MILLISECOND from v_end-v_start);
      /*}dbg*/
      -- drop by default
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=2 then
      i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.src_prefix_out,
        v_termination_numberlist.default_src_rewrite_rule,
        v_termination_numberlist.default_src_rewrite_result
      );

      i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.dst_prefix_out,
        v_termination_numberlist.default_dst_rewrite_rule,
        v_termination_numberlist.default_dst_rewrite_result
      );
    END IF;
  END IF;



  /*
      number rewriting _After_ routing _IN_ termination GW
  */
  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> GW. Before rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/
  i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(i_profile.dst_prefix_out,i_vendor_gw.dst_rewrite_rule,i_vendor_gw.dst_rewrite_result);
  i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(i_profile.src_prefix_out,i_vendor_gw.src_rewrite_rule,i_vendor_gw.src_rewrite_result);
  i_profile.src_name_out=yeti_ext.regexp_replace_rand(i_profile.src_name_out,i_vendor_gw.src_name_rewrite_rule,i_vendor_gw.src_name_rewrite_result, true);

  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> GW. After rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),i_profile.src_prefix_out,i_profile.dst_prefix_out;
  /*}dbg*/

  -- i_profile.anonymize_sdp:=i_vendor_gw.anonymize_sdp OR i_customer_gw.anonymize_sdp;

  --i_profile.append_headers:='User-Agent: YETI SBC\r\n';
  i_profile.append_headers_req:=i_vendor_gw.term_append_headers_req;
  i_profile.aleg_append_headers_req=i_customer_gw.orig_append_headers_req;



  i_profile.next_hop_1st_req=i_vendor_gw.auth_enabled; -- use low delay dns srv if auth enabled
  i_profile.next_hop:=i_vendor_gw.term_next_hop;
  i_profile.aleg_next_hop:=i_customer_gw.orig_next_hop;
  --    i_profile.next_hop_for_replies:=v_dst_gw.term_next_hop_for_replies;

  i_profile.dlg_nat_handling=i_customer_gw.dialog_nat_handling;

  i_profile.call_id:=''; -- Generation by sems

  i_profile.enable_auth:=i_vendor_gw.auth_enabled;
  i_profile.auth_pwd:=i_vendor_gw.auth_password;
  i_profile.auth_user:=i_vendor_gw.auth_user;
  i_profile.enable_aleg_auth:=false;
  i_profile.auth_aleg_pwd:='';
  i_profile.auth_aleg_user:='';

  if i_profile.enable_auth then
    v_from_user=COALESCE(i_vendor_gw.auth_from_user,i_profile.src_prefix_out,'');
    v_from_domain=COALESCE(i_vendor_gw.auth_from_domain,'$Oi');
  else
    v_from_user=COALESCE(i_profile.src_prefix_out,'');
    if i_vendor_gw.preserve_anonymous_from_domain and i_profile.from_domain='anonymous.invalid' then
      v_from_domain='anonymous.invalid';
    else
      v_from_domain='$Oi';
    end if;
  end if;

  if i_vendor_gw.sip_schema_id = 1 then
    v_schema='sip';
  elsif i_vendor_gw.sip_schema_id = 2 then
    v_schema='sips';
  else
    RAISE exception 'Unknown termination gateway % SIP schema %', i_vendor_gw.id, i_vendor_gw.sip_schema_id;
  end if;


  i_profile."from":=COALESCE(i_profile.src_name_out||' ','')||'<'||v_schema||':'||coalesce(nullif(v_from_user,'')||'@','')||v_from_domain||'>';
  i_profile."to":='<'||v_schema||':'||i_profile.dst_prefix_out||'@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port||'>','>');

  if i_vendor_gw.send_lnp_information and i_profile.lrn is not null then
    if i_profile.lrn=i_profile.dst_prefix_routing then -- number not ported, but request was successf we musr add ;npdi=yes;
      i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||';npdi=yes@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,'');
      i_profile.lrn=nullif(i_profile.dst_prefix_routing,i_profile.lrn); -- clear lnr field if number not ported;
    else -- if number ported
      i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||';rn='||i_profile.lrn||';npdi=yes@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,'');
    end if;
  else
    i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||'@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,''); -- no fucking porting
  end if;

  if i_vendor_gw.use_registered_aor then
    i_profile.registered_aor_id=i_vendor_gw.id;
  end if;

  i_profile.bleg_transport_protocol_id:=i_vendor_gw.transport_protocol_id;
  i_profile.bleg_protocol_priority_id:=i_vendor_gw.network_protocol_priority_id;

  i_profile.aleg_media_encryption_mode_id:=i_customer_gw.media_encryption_mode_id;
  i_profile.bleg_media_encryption_mode_id:=i_vendor_gw.media_encryption_mode_id;


  IF (i_vendor_gw.term_use_outbound_proxy ) THEN
    i_profile.outbound_proxy:=v_schema||':'||i_vendor_gw.term_outbound_proxy;
    i_profile.force_outbound_proxy:=i_vendor_gw.term_force_outbound_proxy;
    i_profile.bleg_outbound_proxy_transport_protocol_id:=i_vendor_gw.term_proxy_transport_protocol_id;
  ELSE
    i_profile.outbound_proxy:=NULL;
    i_profile.force_outbound_proxy:=false;
  END IF;

  IF (i_customer_gw.orig_use_outbound_proxy ) THEN
    i_profile.aleg_force_outbound_proxy:=i_customer_gw.orig_force_outbound_proxy;
    i_profile.aleg_outbound_proxy=v_schema||':'||i_customer_gw.orig_outbound_proxy;
    i_profile.aleg_outbound_proxy_transport_protocol_id:=i_customer_gw.orig_proxy_transport_protocol_id;
  else
    i_profile.aleg_force_outbound_proxy:=FALSE;
    i_profile.aleg_outbound_proxy=NULL;
  end if;

  i_profile.aleg_policy_id=i_customer_gw.orig_disconnect_policy_id;
  i_profile.bleg_policy_id=i_vendor_gw.term_disconnect_policy_id;

  i_profile.transit_headers_a2b:=i_customer_gw.transit_headers_from_origination||';'||i_vendor_gw.transit_headers_from_origination;
  i_profile.transit_headers_b2a:=i_vendor_gw.transit_headers_from_termination||';'||i_customer_gw.transit_headers_from_termination;


  i_profile.sdp_filter_type_id:=0;
  i_profile.sdp_filter_list:='';

  i_profile.sdp_alines_filter_type_id:=i_vendor_gw.sdp_alines_filter_type_id;
  i_profile.sdp_alines_filter_list:=i_vendor_gw.sdp_alines_filter_list;

  i_profile.enable_session_timer=i_vendor_gw.sst_enabled;
  i_profile.session_expires =i_vendor_gw.sst_session_expires;
  i_profile.minimum_timer:=i_vendor_gw.sst_minimum_timer;
  i_profile.maximum_timer:=i_vendor_gw.sst_maximum_timer;
  i_profile.session_refresh_method_id:=i_vendor_gw.session_refresh_method_id;
  i_profile.accept_501_reply:=i_vendor_gw.sst_accept501;

  i_profile.enable_aleg_session_timer=i_customer_gw.sst_enabled;
  i_profile.aleg_session_expires:=i_customer_gw.sst_session_expires;
  i_profile.aleg_minimum_timer:=i_customer_gw.sst_minimum_timer;
  i_profile.aleg_maximum_timer:=i_customer_gw.sst_maximum_timer;
  i_profile.aleg_session_refresh_method_id:=i_customer_gw.session_refresh_method_id;
  i_profile.aleg_accept_501_reply:=i_customer_gw.sst_accept501;

  i_profile.reply_translations:='';
  i_profile.disconnect_code_id:=NULL;
  i_profile.enable_rtprelay:=i_vendor_gw.proxy_media OR i_customer_gw.proxy_media;

  i_profile.rtprelay_interface:=i_vendor_gw.rtp_interface_name;
  i_profile.aleg_rtprelay_interface:=i_customer_gw.rtp_interface_name;

  i_profile.outbound_interface:=i_vendor_gw.sip_interface_name;
  i_profile.aleg_outbound_interface:=i_customer_gw.sip_interface_name;

  i_profile.bleg_force_symmetric_rtp:=i_vendor_gw.force_symmetric_rtp;
  i_profile.bleg_symmetric_rtp_nonstop=i_vendor_gw.symmetric_rtp_nonstop;
  i_profile.bleg_symmetric_rtp_ignore_rtcp=i_vendor_gw.symmetric_rtp_ignore_rtcp;

  i_profile.aleg_force_symmetric_rtp:=i_customer_gw.force_symmetric_rtp;
  i_profile.aleg_symmetric_rtp_nonstop=i_customer_gw.symmetric_rtp_nonstop;
  i_profile.aleg_symmetric_rtp_ignore_rtcp=i_customer_gw.symmetric_rtp_ignore_rtcp;

  i_profile.bleg_rtp_ping=i_vendor_gw.rtp_ping;
  i_profile.aleg_rtp_ping=i_customer_gw.rtp_ping;

  i_profile.bleg_relay_options = i_vendor_gw.relay_options;
  i_profile.aleg_relay_options = i_customer_gw.relay_options;


  i_profile.filter_noaudio_streams = i_vendor_gw.filter_noaudio_streams OR i_customer_gw.filter_noaudio_streams;
  i_profile.force_one_way_early_media = i_vendor_gw.force_one_way_early_media OR i_customer_gw.force_one_way_early_media;
  i_profile.aleg_relay_reinvite = i_vendor_gw.relay_reinvite;
  i_profile.bleg_relay_reinvite = i_customer_gw.relay_reinvite;

  i_profile.aleg_relay_hold = i_vendor_gw.relay_hold;
  i_profile.bleg_relay_hold = i_customer_gw.relay_hold;

  i_profile.aleg_relay_prack = i_vendor_gw.relay_prack;
  i_profile.bleg_relay_prack = i_customer_gw.relay_prack;
  i_profile.aleg_rel100_mode_id = i_customer_gw.rel100_mode_id;
  i_profile.bleg_rel100_mode_id = i_vendor_gw.rel100_mode_id;

  i_profile.rtp_relay_timestamp_aligning=i_vendor_gw.rtp_relay_timestamp_aligning OR i_customer_gw.rtp_relay_timestamp_aligning;
  i_profile.allow_1xx_wo2tag=i_vendor_gw.allow_1xx_without_to_tag OR i_customer_gw.allow_1xx_without_to_tag;

  i_profile.aleg_sdp_c_location_id=i_customer_gw.sdp_c_location_id;
  i_profile.bleg_sdp_c_location_id=i_vendor_gw.sdp_c_location_id;
  i_profile.trusted_hdrs_gw=false;



  i_profile.aleg_codecs_group_id:=i_customer_gw.codec_group_id;
  i_profile.bleg_codecs_group_id:=i_vendor_gw.codec_group_id;
  i_profile.aleg_single_codec_in_200ok:=i_customer_gw.single_codec_in_200ok;
  i_profile.bleg_single_codec_in_200ok:=i_vendor_gw.single_codec_in_200ok;
  i_profile.ringing_timeout=i_vendor_gw.ringing_timeout;
  i_profile.dead_rtp_time=GREATEST(i_vendor_gw.rtp_timeout,i_customer_gw.rtp_timeout);
  i_profile.invite_timeout=i_vendor_gw.sip_timer_b;
  i_profile.srv_failover_timeout=i_vendor_gw.dns_srv_failover_timer;
  i_profile.fake_180_timer=i_vendor_gw.fake_180_timer;
  i_profile.rtp_force_relay_cn=i_vendor_gw.rtp_force_relay_cn OR i_customer_gw.rtp_force_relay_cn;
  i_profile.patch_ruri_next_hop=i_vendor_gw.resolve_ruri;

  i_profile.aleg_sensor_id=i_customer_gw.sensor_id;
  i_profile.aleg_sensor_level_id=i_customer_gw.sensor_level_id;
  i_profile.bleg_sensor_id=i_vendor_gw.sensor_id;
  i_profile.bleg_sensor_level_id=i_vendor_gw.sensor_level_id;

  i_profile.aleg_dtmf_send_mode_id=i_customer_gw.dtmf_send_mode_id;
  i_profile.aleg_dtmf_recv_modes=i_customer_gw.dtmf_receive_mode_id;
  i_profile.bleg_dtmf_send_mode_id=i_vendor_gw.dtmf_send_mode_id;
  i_profile.bleg_dtmf_recv_modes=i_vendor_gw.dtmf_receive_mode_id;


  i_profile.aleg_rtp_filter_inband_dtmf=false;
  i_profile.bleg_rtp_filter_inband_dtmf=false;

  if i_customer_gw.rx_inband_dtmf_filtering_mode_id=3 then -- enable filtering
    i_profile.aleg_rtp_filter_inband_dtmf=true;
  elsif i_customer_gw.rx_inband_dtmf_filtering_mode_id=1 then -- inherit
    if i_vendor_gw.tx_inband_dtmf_filtering_mode_id in (1,2) then  -- inherit or disable filtering
      i_profile.aleg_rtp_filter_inband_dtmf=false;
    elsif i_vendor_gw.tx_inband_dtmf_filtering_mode_id = 3 then -- enable filtering
      i_profile.aleg_rtp_filter_inband_dtmf=true;
    end if;
  end if;


  if i_vendor_gw.rx_inband_dtmf_filtering_mode_id=3 then -- enable filtering
    i_profile.bleg_rtp_filter_inband_dtmf=true;
  elsif i_vendor_gw.rx_inband_dtmf_filtering_mode_id=1 then -- inherit
    if i_customer_gw.tx_inband_dtmf_filtering_mode_id in (1,2) then  -- inherit or disable filtering
      i_profile.bleg_rtp_filter_inband_dtmf=false;
    elsif i_customer_gw.tx_inband_dtmf_filtering_mode_id = 3 then -- enable filtering
      i_profile.bleg_rtp_filter_inband_dtmf=true;
    end if;
  end if;


  i_profile.rtprelay_force_dtmf_relay=i_vendor_gw.force_dtmf_relay;
  i_profile.rtprelay_dtmf_detection=NOT i_vendor_gw.force_dtmf_relay;
  i_profile.rtprelay_dtmf_filtering=NOT i_vendor_gw.force_dtmf_relay;
  i_profile.bleg_max_30x_redirects = i_vendor_gw.max_30x_redirects;
  i_profile.bleg_max_transfers = i_vendor_gw.max_transfers;


  i_profile.aleg_relay_update=i_customer_gw.relay_update;
  i_profile.bleg_relay_update=i_vendor_gw.relay_update;
  i_profile.suppress_early_media=i_customer_gw.suppress_early_media OR i_vendor_gw.suppress_early_media;

  i_profile.bleg_radius_acc_profile_id=i_vendor_gw.radius_accounting_profile_id;

  /*dbg{*/
  v_end:=clock_timestamp();
  RAISE NOTICE '% ms -> DP. Finished: % ',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(i_profile,true);
  /*}dbg*/
  RETURN i_profile;
END;
$_$;


--
-- Name: process_gw_release(switch19.callprofile_ty, class4.destinations, class4.dialpeers, billing.accounts, class4.gateways, billing.accounts, class4.gateways, boolean, integer); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.process_gw_release(i_profile switch19.callprofile_ty, i_destination class4.destinations, i_dp class4.dialpeers, i_customer_acc billing.accounts, i_customer_gw class4.gateways, i_vendor_acc billing.accounts, i_vendor_gw class4.gateways, i_send_billing_information boolean, i_max_call_length integer) RETURNS switch19.callprofile_ty
    LANGUAGE plpgsql STABLE SECURITY DEFINER COST 100000
    AS $_$
DECLARE
  i integer;
  v_customer_allowtime real;
  v_vendor_allowtime real;
  v_route_found boolean:=false;
  v_from_user varchar;
  v_from_domain varchar;
  v_schema varchar;
  v_termination_numberlist class4.numberlists%rowtype;
  v_termination_numberlist_item class4.numberlist_items%rowtype;
  v_termination_numberlist_size integer;
  
BEGIN
  

  --RAISE NOTICE 'process_dp dst: %',i_destination;

  i_profile.destination_id:=i_destination.id;
  --    i_profile.destination_initial_interval:=i_destination.initial_interval;
  i_profile.destination_fee:=i_destination.connect_fee::varchar;
  --i_profile.destination_next_interval:=i_destination.next_interval;
  i_profile.destination_rate_policy_id:=i_destination.rate_policy_id;

  --vendor account capacity limit;
  if i_vendor_acc.termination_capacity is not null then
    i_profile.resources:=i_profile.resources||'2:'||i_dp.account_id::varchar||':'||i_vendor_acc.termination_capacity::varchar||':1;';
  end if;

  if i_vendor_acc.total_capacity is not null then
    i_profile.resources:=i_profile.resources||'7:'||i_dp.account_id::varchar||':'||i_vendor_acc.total_capacity::varchar||':1;';
  end if;


  -- dialpeer account capacity limit;
  if i_dp.capacity is not null then
    i_profile.resources:=i_profile.resources||'6:'||i_dp.id::varchar||':'||i_dp.capacity::varchar||':1;';
  end if;

  /* */
  i_profile.dialpeer_id=i_dp.id;
  i_profile.dialpeer_prefix=i_dp.prefix;
  i_profile.dialpeer_next_rate=i_dp.next_rate::varchar;
  i_profile.dialpeer_initial_rate=i_dp.initial_rate::varchar;
  i_profile.dialpeer_initial_interval=i_dp.initial_interval;
  i_profile.dialpeer_next_interval=i_dp.next_interval;
  i_profile.dialpeer_fee=i_dp.connect_fee::varchar;
  i_profile.dialpeer_reverse_billing=i_dp.reverse_billing;
  i_profile.vendor_id=i_dp.vendor_id;
  i_profile.vendor_acc_id=i_dp.account_id;
  i_profile.term_gw_id=i_vendor_gw.id;

  i_profile.orig_gw_name=i_customer_gw."name";
  i_profile.orig_gw_external_id=i_customer_gw.external_id;

  i_profile.term_gw_name=i_vendor_gw."name";
  i_profile.term_gw_external_id=i_vendor_gw.external_id;

  i_profile.customer_account_name=i_customer_acc."name";

  i_profile.routing_group_id:=i_dp.routing_group_id;

  if i_send_billing_information then
    i_profile.aleg_append_headers_reply=E'X-VND-INIT-INT:'||i_profile.dialpeer_initial_interval||E'\r\nX-VND-NEXT-INT:'||i_profile.dialpeer_next_interval||E'\r\nX-VND-INIT-RATE:'||i_profile.dialpeer_initial_rate||E'\r\nX-VND-NEXT-RATE:'||i_profile.dialpeer_next_rate||E'\r\nX-VND-CF:'||i_profile.dialpeer_fee;
  end if;

  if i_destination.use_dp_intervals THEN
    i_profile.destination_initial_interval:=i_dp.initial_interval;
    i_profile.destination_next_interval:=i_dp.next_interval;
  ELSE
    i_profile.destination_initial_interval:=i_destination.initial_interval;
    i_profile.destination_next_interval:=i_destination.next_interval;
  end if;

  CASE i_profile.destination_rate_policy_id
    WHEN 1 THEN -- fixed
    i_profile.destination_next_rate:=i_destination.next_rate::varchar;
    i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    WHEN 2 THEN -- based on dialpeer
    i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    WHEN 3 THEN -- min
    IF i_dp.next_rate >= i_destination.next_rate THEN
      i_profile.destination_next_rate:=i_destination.next_rate::varchar; -- FIXED least
      i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    ELSE
      i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar; -- DYNAMIC
      i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    END IF;
    WHEN 4 THEN -- max
    IF i_dp.next_rate < i_destination.next_rate THEN
      i_profile.destination_next_rate:=i_destination.next_rate::varchar; --FIXED
      i_profile.destination_initial_rate:=i_destination.initial_rate::varchar;
    ELSE
      i_profile.destination_next_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.next_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar; -- DYNAMIC
      i_profile.destination_initial_rate:=(COALESCE(i_destination.dp_margin_fixed,0)+i_dp.initial_rate*(1+COALESCE(i_destination.dp_margin_percent,0)))::varchar;
    END IF;
  ELSE
  --
  end case;



  /* time limiting START */
  --SELECT INTO STRICT v_c_acc * FROM billing.accounts  WHERE id=v_customer_auth.account_id;
  --SELECT INTO STRICT v_v_acc * FROM billing.accounts  WHERE id=v_dialpeer.account_id;

  IF (i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee <0 THEN
    v_customer_allowtime:=0;
    i_profile.disconnect_code_id=8000; --Not enough customer balance
    RETURN i_profile;
  ELSIF (i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee-i_destination.initial_rate/60*i_destination.initial_interval<0 THEN
    v_customer_allowtime:=i_destination.initial_interval;
    i_profile.disconnect_code_id=8000; --Not enough customer balance
    RETURN i_profile;
  ELSIF i_destination.next_rate!=0 AND i_destination.next_interval!=0 THEN
    v_customer_allowtime:=i_destination.initial_interval+
                          LEAST(FLOOR(((i_customer_acc.balance-i_customer_acc.min_balance)-i_destination.connect_fee-i_destination.initial_rate/60*i_destination.initial_interval)/
                                      (i_destination.next_rate/60*i_destination.next_interval)),24e6)::integer*i_destination.next_interval;
  ELSE /* DST rates is 0, allowing maximum call length */
    v_customer_allowtime:=COALESCE(i_customer_acc.max_call_duration, i_max_call_length);
  end IF;


  IF (i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee <0 THEN /* No enough balance, skipping this profile */
    v_vendor_allowtime:=0;
    return null;
  ELSIF (i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee-i_dp.initial_rate/60*i_dp.initial_interval<0 THEN /* No enough balance even for first billing interval - skipping this profile */
    return null;
  ELSIF i_dp.next_rate!=0 AND i_dp.next_interval!=0 THEN /* DP rates is not zero, calculating limit */
    v_vendor_allowtime:=i_dp.initial_interval+
                        LEAST(FLOOR(((i_vendor_acc.max_balance-i_vendor_acc.balance)-i_dp.connect_fee-i_dp.initial_rate/60*i_dp.initial_interval)/
                                    (i_dp.next_rate/60*i_dp.next_interval)),24e6)::integer*i_dp.next_interval;
  ELSE /* DP rates is 0, allowing maximum call length */
    v_vendor_allowtime:=COALESCE(i_vendor_acc.max_call_duration, i_max_call_length);
  end IF;

  i_profile.time_limit=LEAST(
    COALESCE(i_customer_acc.max_call_duration, i_max_call_length),
    COALESCE(i_vendor_acc.max_call_duration, i_max_call_length),
    v_vendor_allowtime,
    v_customer_allowtime
  )::integer;


  /* number rewriting _After_ routing */
  
  i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(i_profile.dst_prefix_out,i_dp.dst_rewrite_rule,i_dp.dst_rewrite_result);
  i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(i_profile.src_prefix_out,i_dp.src_rewrite_rule,i_dp.src_rewrite_result);
  i_profile.src_name_out=yeti_ext.regexp_replace_rand(i_profile.src_name_out,i_dp.src_name_rewrite_rule,i_dp.src_name_rewrite_result, true);

  

  /*
      get termination gw data
  */
  --SELECT into v_dst_gw * from class4.gateways WHERE id=v_dialpeer.gateway_id;
  --SELECT into v_orig_gw * from class4.gateways WHERE id=v_customer_auth.gateway_id;
  --vendor gw
  if i_vendor_gw.termination_capacity is not null then
    i_profile.resources:=i_profile.resources||'5:'||i_vendor_gw.id::varchar||':'||i_vendor_gw.termination_capacity::varchar||':1;';
  end if;


  /*
      numberlist processing _After_ routing _IN_ termination GW
  */
  


  ----- DST Numberlist processing-------------------------------------------------------------------------------------------------------
  IF i_vendor_gw.termination_dst_numberlist_id is not null then
    

    select into v_termination_numberlist * from class4.numberlists where id=i_vendor_gw.termination_dst_numberlist_id;
    CASE v_termination_numberlist.mode_id
      when 1 then -- strict match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id and
          ni.key=i_profile.dst_prefix_out
        limit 1;
      when 2 then -- prefix match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id and
          prefix_range(ni.key)@>prefix_range(i_profile.dst_prefix_out) and
          length(i_profile.dst_prefix_out) between ni.number_min_length and ni.number_max_length
        order by length(prefix_range(ni.key)) desc
        limit 1;
      when 3 then -- random
        select into v_termination_numberlist_size count(*) from class4.numberlist_items where numberlist_id=i_vendor_gw.termination_dst_numberlist_id;
        select into v_termination_numberlist_item * from class4.numberlist_items ni
         where ni.numberlist_id=i_vendor_gw.termination_dst_numberlist_id order by ni.id OFFSET floor(random()*v_termination_numberlist_size) limit 1;
    END CASE;

    

    IF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=1 then
      
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=2 then
        i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.src_prefix_out,
          v_termination_numberlist_item.src_rewrite_rule,
          v_termination_numberlist_item.src_rewrite_result
        );

        i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.dst_prefix_out,
          v_termination_numberlist_item.dst_rewrite_rule,
          v_termination_numberlist_item.dst_rewrite_result
        );
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=1 then
      
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=2 then
      i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.src_prefix_out,
        v_termination_numberlist.default_src_rewrite_rule,
        v_termination_numberlist.default_src_rewrite_result
      );

      i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.dst_prefix_out,
        v_termination_numberlist.default_dst_rewrite_rule,
        v_termination_numberlist.default_dst_rewrite_result
      );
    END IF;
  END IF;



  ----- SRC Numberlist processing-------------------------------------------------------------------------------------------------------
  IF i_vendor_gw.termination_src_numberlist_id is not null then
    

    select into v_termination_numberlist * from class4.numberlists where id=i_vendor_gw.termination_src_numberlist_id;
    CASE v_termination_numberlist.mode_id
      when 1 then -- strict match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id and
          ni.key=i_profile.src_prefix_out
        limit 1;
      when 2 then -- prefix match
        select into v_termination_numberlist_item * from class4.numberlist_items ni
        where
          ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id and
          prefix_range(ni.key)@>prefix_range(i_profile.src_prefix_out) and
          length(i_profile.src_prefix_out) between ni.number_min_length and ni.number_max_length
        order by length(prefix_range(ni.key)) desc
        limit 1;
      when 3 then -- random
        select into v_termination_numberlist_size count(*) from class4.numberlist_items where numberlist_id=i_vendor_gw.termination_src_numberlist_id;
        select into v_termination_numberlist_item * from class4.numberlist_items ni
         where ni.numberlist_id=i_vendor_gw.termination_src_numberlist_id order by ni.id OFFSET floor(random()*v_termination_numberlist_size) limit 1;
    END CASE;

    

    IF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=1 then
      
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is not null and v_termination_numberlist_item.action_id=2 then
        i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.src_prefix_out,
          v_termination_numberlist_item.src_rewrite_rule,
          v_termination_numberlist_item.src_rewrite_result
        );

        i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
          i_profile.dst_prefix_out,
          v_termination_numberlist_item.dst_rewrite_rule,
          v_termination_numberlist_item.dst_rewrite_result
        );
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=1 then
      
      -- drop by default
      RETURN null;
    ELSIF v_termination_numberlist_item.action_id is null and v_termination_numberlist.default_action_id=2 then
      i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.src_prefix_out,
        v_termination_numberlist.default_src_rewrite_rule,
        v_termination_numberlist.default_src_rewrite_result
      );

      i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(
        i_profile.dst_prefix_out,
        v_termination_numberlist.default_dst_rewrite_rule,
        v_termination_numberlist.default_dst_rewrite_result
      );
    END IF;
  END IF;



  /*
      number rewriting _After_ routing _IN_ termination GW
  */
  
  i_profile.dst_prefix_out=yeti_ext.regexp_replace_rand(i_profile.dst_prefix_out,i_vendor_gw.dst_rewrite_rule,i_vendor_gw.dst_rewrite_result);
  i_profile.src_prefix_out=yeti_ext.regexp_replace_rand(i_profile.src_prefix_out,i_vendor_gw.src_rewrite_rule,i_vendor_gw.src_rewrite_result);
  i_profile.src_name_out=yeti_ext.regexp_replace_rand(i_profile.src_name_out,i_vendor_gw.src_name_rewrite_rule,i_vendor_gw.src_name_rewrite_result, true);

  

  -- i_profile.anonymize_sdp:=i_vendor_gw.anonymize_sdp OR i_customer_gw.anonymize_sdp;

  --i_profile.append_headers:='User-Agent: YETI SBC\r\n';
  i_profile.append_headers_req:=i_vendor_gw.term_append_headers_req;
  i_profile.aleg_append_headers_req=i_customer_gw.orig_append_headers_req;



  i_profile.next_hop_1st_req=i_vendor_gw.auth_enabled; -- use low delay dns srv if auth enabled
  i_profile.next_hop:=i_vendor_gw.term_next_hop;
  i_profile.aleg_next_hop:=i_customer_gw.orig_next_hop;
  --    i_profile.next_hop_for_replies:=v_dst_gw.term_next_hop_for_replies;

  i_profile.dlg_nat_handling=i_customer_gw.dialog_nat_handling;

  i_profile.call_id:=''; -- Generation by sems

  i_profile.enable_auth:=i_vendor_gw.auth_enabled;
  i_profile.auth_pwd:=i_vendor_gw.auth_password;
  i_profile.auth_user:=i_vendor_gw.auth_user;
  i_profile.enable_aleg_auth:=false;
  i_profile.auth_aleg_pwd:='';
  i_profile.auth_aleg_user:='';

  if i_profile.enable_auth then
    v_from_user=COALESCE(i_vendor_gw.auth_from_user,i_profile.src_prefix_out,'');
    v_from_domain=COALESCE(i_vendor_gw.auth_from_domain,'$Oi');
  else
    v_from_user=COALESCE(i_profile.src_prefix_out,'');
    if i_vendor_gw.preserve_anonymous_from_domain and i_profile.from_domain='anonymous.invalid' then
      v_from_domain='anonymous.invalid';
    else
      v_from_domain='$Oi';
    end if;
  end if;

  if i_vendor_gw.sip_schema_id = 1 then
    v_schema='sip';
  elsif i_vendor_gw.sip_schema_id = 2 then
    v_schema='sips';
  else
    RAISE exception 'Unknown termination gateway % SIP schema %', i_vendor_gw.id, i_vendor_gw.sip_schema_id;
  end if;


  i_profile."from":=COALESCE(i_profile.src_name_out||' ','')||'<'||v_schema||':'||coalesce(nullif(v_from_user,'')||'@','')||v_from_domain||'>';
  i_profile."to":='<'||v_schema||':'||i_profile.dst_prefix_out||'@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port||'>','>');

  if i_vendor_gw.send_lnp_information and i_profile.lrn is not null then
    if i_profile.lrn=i_profile.dst_prefix_routing then -- number not ported, but request was successf we musr add ;npdi=yes;
      i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||';npdi=yes@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,'');
      i_profile.lrn=nullif(i_profile.dst_prefix_routing,i_profile.lrn); -- clear lnr field if number not ported;
    else -- if number ported
      i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||';rn='||i_profile.lrn||';npdi=yes@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,'');
    end if;
  else
    i_profile.ruri:=v_schema||':'||i_profile.dst_prefix_out||'@'||i_vendor_gw.host::varchar||COALESCE(':'||i_vendor_gw.port,''); -- no fucking porting
  end if;

  if i_vendor_gw.use_registered_aor then
    i_profile.registered_aor_id=i_vendor_gw.id;
  end if;

  i_profile.bleg_transport_protocol_id:=i_vendor_gw.transport_protocol_id;
  i_profile.bleg_protocol_priority_id:=i_vendor_gw.network_protocol_priority_id;

  i_profile.aleg_media_encryption_mode_id:=i_customer_gw.media_encryption_mode_id;
  i_profile.bleg_media_encryption_mode_id:=i_vendor_gw.media_encryption_mode_id;


  IF (i_vendor_gw.term_use_outbound_proxy ) THEN
    i_profile.outbound_proxy:=v_schema||':'||i_vendor_gw.term_outbound_proxy;
    i_profile.force_outbound_proxy:=i_vendor_gw.term_force_outbound_proxy;
    i_profile.bleg_outbound_proxy_transport_protocol_id:=i_vendor_gw.term_proxy_transport_protocol_id;
  ELSE
    i_profile.outbound_proxy:=NULL;
    i_profile.force_outbound_proxy:=false;
  END IF;

  IF (i_customer_gw.orig_use_outbound_proxy ) THEN
    i_profile.aleg_force_outbound_proxy:=i_customer_gw.orig_force_outbound_proxy;
    i_profile.aleg_outbound_proxy=v_schema||':'||i_customer_gw.orig_outbound_proxy;
    i_profile.aleg_outbound_proxy_transport_protocol_id:=i_customer_gw.orig_proxy_transport_protocol_id;
  else
    i_profile.aleg_force_outbound_proxy:=FALSE;
    i_profile.aleg_outbound_proxy=NULL;
  end if;

  i_profile.aleg_policy_id=i_customer_gw.orig_disconnect_policy_id;
  i_profile.bleg_policy_id=i_vendor_gw.term_disconnect_policy_id;

  i_profile.transit_headers_a2b:=i_customer_gw.transit_headers_from_origination||';'||i_vendor_gw.transit_headers_from_origination;
  i_profile.transit_headers_b2a:=i_vendor_gw.transit_headers_from_termination||';'||i_customer_gw.transit_headers_from_termination;


  i_profile.sdp_filter_type_id:=0;
  i_profile.sdp_filter_list:='';

  i_profile.sdp_alines_filter_type_id:=i_vendor_gw.sdp_alines_filter_type_id;
  i_profile.sdp_alines_filter_list:=i_vendor_gw.sdp_alines_filter_list;

  i_profile.enable_session_timer=i_vendor_gw.sst_enabled;
  i_profile.session_expires =i_vendor_gw.sst_session_expires;
  i_profile.minimum_timer:=i_vendor_gw.sst_minimum_timer;
  i_profile.maximum_timer:=i_vendor_gw.sst_maximum_timer;
  i_profile.session_refresh_method_id:=i_vendor_gw.session_refresh_method_id;
  i_profile.accept_501_reply:=i_vendor_gw.sst_accept501;

  i_profile.enable_aleg_session_timer=i_customer_gw.sst_enabled;
  i_profile.aleg_session_expires:=i_customer_gw.sst_session_expires;
  i_profile.aleg_minimum_timer:=i_customer_gw.sst_minimum_timer;
  i_profile.aleg_maximum_timer:=i_customer_gw.sst_maximum_timer;
  i_profile.aleg_session_refresh_method_id:=i_customer_gw.session_refresh_method_id;
  i_profile.aleg_accept_501_reply:=i_customer_gw.sst_accept501;

  i_profile.reply_translations:='';
  i_profile.disconnect_code_id:=NULL;
  i_profile.enable_rtprelay:=i_vendor_gw.proxy_media OR i_customer_gw.proxy_media;

  i_profile.rtprelay_interface:=i_vendor_gw.rtp_interface_name;
  i_profile.aleg_rtprelay_interface:=i_customer_gw.rtp_interface_name;

  i_profile.outbound_interface:=i_vendor_gw.sip_interface_name;
  i_profile.aleg_outbound_interface:=i_customer_gw.sip_interface_name;

  i_profile.bleg_force_symmetric_rtp:=i_vendor_gw.force_symmetric_rtp;
  i_profile.bleg_symmetric_rtp_nonstop=i_vendor_gw.symmetric_rtp_nonstop;
  i_profile.bleg_symmetric_rtp_ignore_rtcp=i_vendor_gw.symmetric_rtp_ignore_rtcp;

  i_profile.aleg_force_symmetric_rtp:=i_customer_gw.force_symmetric_rtp;
  i_profile.aleg_symmetric_rtp_nonstop=i_customer_gw.symmetric_rtp_nonstop;
  i_profile.aleg_symmetric_rtp_ignore_rtcp=i_customer_gw.symmetric_rtp_ignore_rtcp;

  i_profile.bleg_rtp_ping=i_vendor_gw.rtp_ping;
  i_profile.aleg_rtp_ping=i_customer_gw.rtp_ping;

  i_profile.bleg_relay_options = i_vendor_gw.relay_options;
  i_profile.aleg_relay_options = i_customer_gw.relay_options;


  i_profile.filter_noaudio_streams = i_vendor_gw.filter_noaudio_streams OR i_customer_gw.filter_noaudio_streams;
  i_profile.force_one_way_early_media = i_vendor_gw.force_one_way_early_media OR i_customer_gw.force_one_way_early_media;
  i_profile.aleg_relay_reinvite = i_vendor_gw.relay_reinvite;
  i_profile.bleg_relay_reinvite = i_customer_gw.relay_reinvite;

  i_profile.aleg_relay_hold = i_vendor_gw.relay_hold;
  i_profile.bleg_relay_hold = i_customer_gw.relay_hold;

  i_profile.aleg_relay_prack = i_vendor_gw.relay_prack;
  i_profile.bleg_relay_prack = i_customer_gw.relay_prack;
  i_profile.aleg_rel100_mode_id = i_customer_gw.rel100_mode_id;
  i_profile.bleg_rel100_mode_id = i_vendor_gw.rel100_mode_id;

  i_profile.rtp_relay_timestamp_aligning=i_vendor_gw.rtp_relay_timestamp_aligning OR i_customer_gw.rtp_relay_timestamp_aligning;
  i_profile.allow_1xx_wo2tag=i_vendor_gw.allow_1xx_without_to_tag OR i_customer_gw.allow_1xx_without_to_tag;

  i_profile.aleg_sdp_c_location_id=i_customer_gw.sdp_c_location_id;
  i_profile.bleg_sdp_c_location_id=i_vendor_gw.sdp_c_location_id;
  i_profile.trusted_hdrs_gw=false;



  i_profile.aleg_codecs_group_id:=i_customer_gw.codec_group_id;
  i_profile.bleg_codecs_group_id:=i_vendor_gw.codec_group_id;
  i_profile.aleg_single_codec_in_200ok:=i_customer_gw.single_codec_in_200ok;
  i_profile.bleg_single_codec_in_200ok:=i_vendor_gw.single_codec_in_200ok;
  i_profile.ringing_timeout=i_vendor_gw.ringing_timeout;
  i_profile.dead_rtp_time=GREATEST(i_vendor_gw.rtp_timeout,i_customer_gw.rtp_timeout);
  i_profile.invite_timeout=i_vendor_gw.sip_timer_b;
  i_profile.srv_failover_timeout=i_vendor_gw.dns_srv_failover_timer;
  i_profile.fake_180_timer=i_vendor_gw.fake_180_timer;
  i_profile.rtp_force_relay_cn=i_vendor_gw.rtp_force_relay_cn OR i_customer_gw.rtp_force_relay_cn;
  i_profile.patch_ruri_next_hop=i_vendor_gw.resolve_ruri;

  i_profile.aleg_sensor_id=i_customer_gw.sensor_id;
  i_profile.aleg_sensor_level_id=i_customer_gw.sensor_level_id;
  i_profile.bleg_sensor_id=i_vendor_gw.sensor_id;
  i_profile.bleg_sensor_level_id=i_vendor_gw.sensor_level_id;

  i_profile.aleg_dtmf_send_mode_id=i_customer_gw.dtmf_send_mode_id;
  i_profile.aleg_dtmf_recv_modes=i_customer_gw.dtmf_receive_mode_id;
  i_profile.bleg_dtmf_send_mode_id=i_vendor_gw.dtmf_send_mode_id;
  i_profile.bleg_dtmf_recv_modes=i_vendor_gw.dtmf_receive_mode_id;


  i_profile.aleg_rtp_filter_inband_dtmf=false;
  i_profile.bleg_rtp_filter_inband_dtmf=false;

  if i_customer_gw.rx_inband_dtmf_filtering_mode_id=3 then -- enable filtering
    i_profile.aleg_rtp_filter_inband_dtmf=true;
  elsif i_customer_gw.rx_inband_dtmf_filtering_mode_id=1 then -- inherit
    if i_vendor_gw.tx_inband_dtmf_filtering_mode_id in (1,2) then  -- inherit or disable filtering
      i_profile.aleg_rtp_filter_inband_dtmf=false;
    elsif i_vendor_gw.tx_inband_dtmf_filtering_mode_id = 3 then -- enable filtering
      i_profile.aleg_rtp_filter_inband_dtmf=true;
    end if;
  end if;


  if i_vendor_gw.rx_inband_dtmf_filtering_mode_id=3 then -- enable filtering
    i_profile.bleg_rtp_filter_inband_dtmf=true;
  elsif i_vendor_gw.rx_inband_dtmf_filtering_mode_id=1 then -- inherit
    if i_customer_gw.tx_inband_dtmf_filtering_mode_id in (1,2) then  -- inherit or disable filtering
      i_profile.bleg_rtp_filter_inband_dtmf=false;
    elsif i_customer_gw.tx_inband_dtmf_filtering_mode_id = 3 then -- enable filtering
      i_profile.bleg_rtp_filter_inband_dtmf=true;
    end if;
  end if;


  i_profile.rtprelay_force_dtmf_relay=i_vendor_gw.force_dtmf_relay;
  i_profile.rtprelay_dtmf_detection=NOT i_vendor_gw.force_dtmf_relay;
  i_profile.rtprelay_dtmf_filtering=NOT i_vendor_gw.force_dtmf_relay;
  i_profile.bleg_max_30x_redirects = i_vendor_gw.max_30x_redirects;
  i_profile.bleg_max_transfers = i_vendor_gw.max_transfers;


  i_profile.aleg_relay_update=i_customer_gw.relay_update;
  i_profile.bleg_relay_update=i_vendor_gw.relay_update;
  i_profile.suppress_early_media=i_customer_gw.suppress_early_media OR i_vendor_gw.suppress_early_media;

  i_profile.bleg_radius_acc_profile_id=i_vendor_gw.radius_accounting_profile_id;

  
  RETURN i_profile;
END;
$_$;


--
-- Name: recompile_interface(integer); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.recompile_interface(i_version integer) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
DECLARE
  v_attr record;
  v_sql varchar;
BEGIN
  v_sql:='CREATE TYPE callprofile'||i_version::varchar||'_ty AS (';
  FOR v_attr IN SELECT * from load_interface_out() LOOP
    v_sql:=v_sql||'"'||v_attr.varname::varchar||'" '||v_attr.vartype||',';
  END LOOP;
  v_sql:=left(v_sql,-1)||')'; --removing last ',' added in loop and add )
  EXECUTE v_sql;
END;
$$;


--
-- Name: route(integer, integer, smallint, inet, integer, inet, integer, character varying, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, inet, integer, smallint, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.route(i_node_id integer, i_pop_id integer, i_protocol_id smallint, i_remote_ip inet, i_remote_port integer, i_local_ip inet, i_local_port integer, i_from_dsp character varying, i_from_name character varying, i_from_domain character varying, i_from_port integer, i_to_name character varying, i_to_domain character varying, i_to_port integer, i_contact_name character varying, i_contact_domain character varying, i_contact_port integer, i_uri_name character varying, i_uri_domain character varying, i_auth_id integer, i_x_yeti_auth character varying, i_diversion character varying, i_x_orig_ip inet, i_x_orig_port integer, i_x_orig_protocol_id smallint, i_pai character varying, i_ppi character varying, i_privacy character varying, i_rpid character varying, i_rpid_privacy character varying) RETURNS SETOF switch19.callprofile_ty
    LANGUAGE plpgsql SECURITY DEFINER ROWS 10
    AS $_$
      DECLARE
        v_ret switch19.callprofile_ty;
        i integer;
        v_ip inet;
        v_remote_ip inet;
        v_remote_port INTEGER;
        v_transport_protocol_id smallint;
        v_customer_auth_normalized class4.customers_auth_normalized;
        v_destination class4.destinations%rowtype;
        v_dialpeer record;
        v_rateplan class4.rateplans%rowtype;
        v_dst_gw class4.gateways%rowtype;
        v_orig_gw class4.gateways%rowtype;
        v_rp class4.routing_plans%rowtype;
        v_customer_allowtime real;
        v_vendor_allowtime real;
        v_sorting_id integer;
        v_customer_acc integer;
        v_route_found boolean:=false;
        v_c_acc billing.accounts%rowtype;
        v_v_acc billing.accounts%rowtype;
        v_network sys.network_prefixes%rowtype;
        v_src_network sys.network_prefixes%rowtype;
        routedata record;
        /*dbg{*/
        v_start timestamp;
        v_end timestamp;
        /*}dbg*/
        v_rate NUMERIC;
        v_now timestamp;
        v_x_yeti_auth varchar;
        --  v_uri_domain varchar;
        v_rate_limit float:='Infinity'::float;
        v_destination_rate_limit float:='Infinity'::float;
        v_test_vendor_id integer;
        v_random float;
        v_max_call_length integer;
        v_routing_key varchar;
        v_lnp_key varchar;
        v_drop_call_if_lnp_fail boolean;
        v_lnp_rule class4.routing_plan_lnp_rules%rowtype;
        v_numberlist record;
        v_numberlist_item record;
        v_call_tags smallint[]:='{}'::smallint[];
        v_area_direction class4.routing_tag_detection_rules%rowtype;
        v_numberlist_size integer;
        v_lua_context switch19.lua_call_context;

      BEGIN
        /*dbg{*/
        v_start:=now();
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Execution start',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/

        perform id from sys.load_balancers where signalling_ip=host(i_remote_ip)::varchar;
        IF FOUND and i_x_orig_ip IS not NULL AND i_x_orig_port IS not NULL THEN
          v_remote_ip:=i_x_orig_ip;
          v_remote_port:=i_x_orig_port;
          v_transport_protocol_id=i_x_orig_protocol_id;
          /*dbg{*/RAISE NOTICE '% ms -> Got originator address "%:%, proto: %" from x-headers',EXTRACT(MILLISECOND from v_end-v_start), v_remote_ip,v_remote_port, v_transport_protocol_id;/*}dbg*/
        else
          v_remote_ip:=i_remote_ip;
          v_remote_port:=i_remote_port;
          v_transport_protocol_id:=i_protocol_id;
          /*dbg{*/RAISE NOTICE '% ms -> Got originator address "%:%, proto: %" from switch leg info',EXTRACT(MILLISECOND from v_end-v_start), v_remote_ip,v_remote_port, v_transport_protocol_id;/*}dbg*/
        end if;

        v_now:=now();
        v_ret:=switch19.new_profile();
        v_ret.cache_time = 10;

        v_ret.diversion_in:=i_diversion;
        v_ret.diversion_out:=i_diversion; -- FIXME

        v_ret.auth_orig_protocol_id =v_transport_protocol_id;
        v_ret.auth_orig_ip = v_remote_ip;
        v_ret.auth_orig_port = v_remote_port;

        v_ret.src_name_in:=i_from_dsp;
        v_ret.src_name_out:=v_ret.src_name_in;

        v_ret.src_prefix_in:=i_from_name;
        v_ret.src_prefix_out:=v_ret.src_prefix_in;

        v_ret.dst_prefix_in:=i_uri_name;
        v_ret.dst_prefix_out:=v_ret.dst_prefix_in;


        v_ret.ruri_domain=i_uri_domain;
        v_ret.from_domain=i_from_domain;
        v_ret.to_domain=i_to_domain;

        v_ret.pai_in=i_pai;
        v_ret.ppi_in=i_ppi;
        v_ret.privacy_in=i_privacy;
        v_ret.rpid_in=i_rpid;
        v_ret.rpid_privacy_in=i_rpid_privacy;

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. lookup started',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/
        v_x_yeti_auth:=COALESCE(i_x_yeti_auth,'');
        --  v_uri_domain:=COALESCE(i_uri_domain,'');

        if i_auth_id is null then
            SELECT into v_customer_auth_normalized ca.*
            from class4.customers_auth_normalized ca
                JOIN public.contractors c ON c.id=ca.customer_id
            WHERE ca.enabled AND
              ca.ip>>=v_remote_ip AND
              prefix_range(ca.dst_prefix)@>prefix_range(v_ret.dst_prefix_in) AND
              prefix_range(ca.src_prefix)@>prefix_range(v_ret.src_prefix_in) AND
              (ca.pop_id=i_pop_id or ca.pop_id is null) and
              COALESCE(ca.x_yeti_auth,'')=v_x_yeti_auth AND
              COALESCE(nullif(ca.uri_domain,'')=i_uri_domain,true) AND
              COALESCE(nullif(ca.to_domain,'')=i_to_domain,true) AND
              COALESCE(nullif(ca.from_domain,'')=i_from_domain,true) AND
              (ca.transport_protocol_id is null or ca.transport_protocol_id=v_transport_protocol_id) AND
              length(v_ret.dst_prefix_in) between ca.dst_number_min_length and ca.dst_number_max_length and
              length(v_ret.src_prefix_in) between ca.src_number_min_length and ca.src_number_max_length and
              c.enabled and c.customer
            ORDER BY
                masklen(ca.ip) DESC,
                ca.transport_protocol_id is null,
                length(prefix_range(ca.dst_prefix)) DESC,
                length(prefix_range(ca.src_prefix)) DESC,
                ca.pop_id is null,
                ca.uri_domain is null,
                ca.to_domain is null,
                ca.from_domain is null,
                ca.require_incoming_auth
            LIMIT 1;
            IF NOT FOUND THEN
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 110.Cant find customer or customer locked',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=110; --Cant find customer or customer locked
                RETURN NEXT v_ret;
                RETURN;
            END IF;
            if v_customer_auth_normalized.require_incoming_auth then
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH. Incoming auth required. Respond 401',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.aleg_auth_required=true;
                RETURN NEXT v_ret;
                RETURN;
            end IF;
            if v_customer_auth_normalized.reject_calls then
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 8004. Reject by customers auth',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=8004; -- call rejected by authorization

                v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
                v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

                v_ret.customer_id:=v_customer_auth_normalized.customer_id;
                select into strict v_ret.customer_external_id external_id from public.contractors where id=v_ret.customer_id;

                v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
                v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;

                v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
                SELECT INTO STRICT v_ret.customer_acc_external_id external_id FROM billing.accounts WHERE id=v_customer_auth_normalized.account_id;

                RETURN NEXT v_ret;
                RETURN;
            end if;
        else
            SELECT into v_customer_auth_normalized ca.*
            from class4.customers_auth_normalized ca
                JOIN public.contractors c ON c.id=ca.customer_id
            WHERE ca.enabled AND
              ca.ip>>=v_remote_ip AND
              prefix_range(ca.dst_prefix)@>prefix_range(v_ret.dst_prefix_in) AND
              prefix_range(ca.src_prefix)@>prefix_range(v_ret.src_prefix_in) AND
              (ca.pop_id=i_pop_id or ca.pop_id is null) and
              COALESCE(ca.x_yeti_auth,'')=v_x_yeti_auth AND
              COALESCE(nullif(ca.uri_domain,'')=i_uri_domain,true) AND
              COALESCE(nullif(ca.to_domain,'')=i_to_domain,true) AND
              COALESCE(nullif(ca.from_domain,'')=i_from_domain,true) AND
              (ca.transport_protocol_id is null or ca.transport_protocol_id=v_transport_protocol_id) AND
              length(v_ret.dst_prefix_in) between ca.dst_number_min_length and ca.dst_number_max_length and
              length(v_ret.src_prefix_in) between ca.src_number_min_length and ca.src_number_max_length and
              c.enabled and c.customer and
              ca.require_incoming_auth and gateway_id = i_auth_id
            ORDER BY
                masklen(ca.ip) DESC,
                ca.transport_protocol_id is null,
                length(prefix_range(ca.dst_prefix)) DESC,
                length(prefix_range(ca.src_prefix)) DESC,
                ca.pop_id is null,
                ca.uri_domain is null,
                ca.to_domain is null,
                ca.from_domain is null
            LIMIT 1;
            IF NOT FOUND THEN
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 110.Cant find customer or customer locked',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=110; --Cant find customer or customer locked
                RETURN NEXT v_ret;
                RETURN;
            END IF;
            if v_customer_auth_normalized.reject_calls then
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 8004. Reject by customers auth',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=8004; -- call rejected by authorization

                v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
                v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

                v_ret.customer_id:=v_customer_auth_normalized.customer_id;
                select into strict v_ret.customer_external_id external_id from public.contractors where id=v_ret.customer_id;

                v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
                v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;

                v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
                SELECT INTO STRICT v_ret.customer_acc_external_id external_id FROM billing.accounts WHERE id=v_customer_auth_normalized.account_id;

                RETURN NEXT v_ret;
                RETURN;
            end if;
        end IF;

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. found: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(v_customer_auth_normalized, true);
        /*}dbg*/

        -- redefine call SRC/DST numbers

        IF v_customer_auth_normalized.src_name_field_id=1 THEN  /* default - from uri display name */
          v_ret.src_name_in:=i_from_dsp;
        END IF;
        v_ret.src_name_out:=v_ret.src_name_in;

        IF v_customer_auth_normalized.src_number_field_id=1 THEN  /* default - from uri userpart */
          v_ret.src_prefix_in:=i_from_name;
        ELSIF v_customer_auth_normalized.src_number_field_id=2 THEN /* From uri Display name */
          v_ret.src_prefix_in:=i_from_dsp;
        END IF;
        v_ret.src_prefix_out:=v_ret.src_prefix_in;

        IF v_customer_auth_normalized.dst_number_field_id=1 THEN /* default  - RURI userpart*/
          v_ret.dst_prefix_in:=i_uri_name;
        ELSIF v_customer_auth_normalized.dst_number_field_id=2 THEN /* TO URI userpart */
          v_ret.dst_prefix_in:=i_to_name;
        ELSIF v_customer_auth_normalized.dst_number_field_id=3 THEN /* Top-Most Diversion header userpart */
          v_ret.dst_prefix_in:=i_diversion;
        END IF;
        v_ret.dst_prefix_out:=v_ret.dst_prefix_in;


        -- feel customer data ;-)
        v_ret.dump_level_id:=v_customer_auth_normalized.dump_level_id;
        v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
        v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

        v_ret.customer_id:=v_customer_auth_normalized.customer_id;
        select into strict v_ret.customer_external_id external_id from public.contractors where id=v_customer_auth_normalized.customer_id;

        v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
        v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;
        v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
        v_ret.orig_gw_id:=v_customer_auth_normalized.gateway_id;

        v_ret.radius_auth_profile_id=v_customer_auth_normalized.radius_auth_profile_id;
        v_ret.aleg_radius_acc_profile_id=v_customer_auth_normalized.radius_accounting_profile_id;
        v_ret.record_audio=v_customer_auth_normalized.enable_audio_recording;

        v_ret.customer_acc_check_balance=v_customer_auth_normalized.check_account_balance;

        SELECT INTO STRICT v_c_acc * FROM billing.accounts  WHERE id=v_customer_auth_normalized.account_id;
        v_ret.customer_acc_external_id=v_c_acc.external_id;
        v_ret.customer_acc_vat=v_c_acc.vat;
        v_destination_rate_limit=coalesce(v_c_acc.destination_rate_limit::float,'Infinity'::float);

        if v_customer_auth_normalized.check_account_balance AND v_c_acc.balance<=v_c_acc.min_balance then
          v_ret.disconnect_code_id=8000; --No enough customer balance
          RETURN NEXT v_ret;
          RETURN;
        end if;

        v_ret.customer_acc_external_id=v_c_acc.external_id;
        v_ret.customer_acc_vat=v_c_acc.vat;

        SELECT into v_orig_gw * from class4.gateways WHERE id=v_customer_auth_normalized.gateway_id;
        if not v_orig_gw.enabled then
          v_ret.disconnect_code_id=8005; -- Origination gateway is disabled
          RETURN NEXT v_ret;
          RETURN;
        end if;

        v_ret.resources:='';
        if v_customer_auth_normalized.capacity is not null then
          v_ret.resources:=v_ret.resources||'3:'||v_customer_auth_normalized.customers_auth_id||':'||v_customer_auth_normalized.capacity::varchar||':1;';
        end if;

        if v_c_acc.origination_capacity is not null then
          v_ret.resources:=v_ret.resources||'1:'||v_c_acc.id::varchar||':'||v_c_acc.origination_capacity::varchar||':1;';
        end if;

        if v_c_acc.total_capacity is not null then
          v_ret.resources:=v_ret.resources||'7:'||v_c_acc.id::varchar||':'||v_c_acc.total_capacity::varchar||':1;';
        end if;

        if v_orig_gw.origination_capacity is not null then
          v_ret.resources:=v_ret.resources||'4:'||v_orig_gw.id::varchar||':'||v_orig_gw.origination_capacity::varchar||':1;';
        end if;

        -- Tag processing CA
        v_call_tags=yeti_ext.tag_action(v_customer_auth_normalized.tag_action_id, v_call_tags, v_customer_auth_normalized.tag_action_value);

        /*
            number rewriting _Before_ routing
        */
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. Before rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.src_prefix_out,v_ret.dst_prefix_out;
        /*}dbg*/
        v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(v_ret.dst_prefix_out,v_customer_auth_normalized.dst_rewrite_rule,v_customer_auth_normalized.dst_rewrite_result);
        v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(v_ret.src_prefix_out,v_customer_auth_normalized.src_rewrite_rule,v_customer_auth_normalized.src_rewrite_result);
        v_ret.src_name_out=yeti_ext.regexp_replace_rand(v_ret.src_name_out,v_customer_auth_normalized.src_name_rewrite_rule,v_customer_auth_normalized.src_name_rewrite_result, true);

        --  if v_ret.radius_auth_profile_id is not null then
        v_ret.src_number_radius:=i_from_name;
        v_ret.dst_number_radius:=i_uri_name;
        v_ret.src_number_radius=yeti_ext.regexp_replace_rand(
            v_ret.src_number_radius,
            v_customer_auth_normalized.src_number_radius_rewrite_rule,
            v_customer_auth_normalized.src_number_radius_rewrite_result
        );

        v_ret.dst_number_radius=yeti_ext.regexp_replace_rand(
            v_ret.dst_number_radius,
            v_customer_auth_normalized.dst_number_radius_rewrite_rule,
            v_customer_auth_normalized.dst_number_radius_rewrite_result
        );
        v_ret.customer_auth_name=v_customer_auth_normalized."name";
        v_ret.customer_name=(select "name" from public.contractors where id=v_customer_auth_normalized.customer_id limit 1);
        --  end if;
/*
        if v_customer_auth_normalized.lua_script_id is not null then
          v_lua_context.src_name_in = v_ret.src_name_in;
	        v_lua_context.src_number_in = v_ret.src_prefix_in;
	        v_lua_context.dst_number_in = v_ret.dst_prefix_in;
	        v_lua_context.src_name_out = v_ret.src_name_out;
	        v_lua_context.src_number_out = v_ret.src_prefix_out;
	        v_lua_context.dst_number_out = v_ret.dst_prefix_out;
	        -- v_lua_context.src_name_routing
	        -- v_lua_context.src_number_routing
	        -- v_lua_context.dst_number_routing
          -- #arrays
	        -- v_lua_context.diversion_in
	        -- v_lua_context.diversion_routing
	        -- v_lua_context.diversion_out
          v_lua_context = switch19.lua_exec(v_customer_auth_normalized.lua_script_id, v_lua_context);
          v_ret.src_name_out =  v_lua_context.src_name_out;
          v_ret.src_prefix_out = v_lua_context.src_number_out;
          v_ret.dst_prefix_out = v_lua_context.dst_number_out;
        end if;
*/

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. After rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.src_prefix_out,v_ret.dst_prefix_out;
        /*}dbg*/

        ----- Numberlist processing-------------------------------------------------------------------------------------------------------
        if v_customer_auth_normalized.dst_numberlist_id is not null then
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> DST Numberlist processing. Lookup by key: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.dst_prefix_out;
          /*}dbg*/
          select into v_numberlist * from class4.numberlists where id=v_customer_auth_normalized.dst_numberlist_id;
          CASE v_numberlist.mode_id
            when 1 then -- strict match
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id and ni.key=v_ret.dst_prefix_out limit 1;
            when 2 then -- prefix match
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where
                  ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id and
                  prefix_range(ni.key)@>prefix_range(v_ret.dst_prefix_out) and
                  length(v_ret.dst_prefix_out) between ni.number_min_length and ni.number_max_length
                order by length(prefix_range(ni.key))
                desc limit 1;
            when 3 then -- random
                select into v_numberlist_size count(*) from class4.numberlist_items where numberlist_id=v_customer_auth_normalized.dst_numberlist_id;
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id order by ni.id OFFSET floor(random()*v_numberlist_size) limit 1;
          end case;
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> DST Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_numberlist_item);
          /*}dbg*/
          IF v_numberlist_item.action_id is not null and v_numberlist_item.action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> DST Numberlist. Drop by key action. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_numberlist_item.key;
            /*}dbg*/
            v_ret.disconnect_code_id=8001; --destination blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is not null and v_numberlist_item.action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist_item.src_rewrite_rule,
                v_numberlist_item.src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist_item.dst_rewrite_rule,
                v_numberlist_item.dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist_item.tag_action_id, v_call_tags, v_numberlist_item.tag_action_value);
            -- pass call NOP.
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> DST Numberlist. Drop by default action',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
            -- drop by default
            v_ret.disconnect_code_id=8001; --destination blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist.default_src_rewrite_rule,
                v_numberlist.default_src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist.default_dst_rewrite_rule,
                v_numberlist.default_dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist.tag_action_id, v_call_tags, v_numberlist.tag_action_value);
            -- pass by default
          end if;
        end if;

        if v_customer_auth_normalized.src_numberlist_id is not null then
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> SRC Numberlist processing. Lookup by key: %s',EXTRACT(MILLISECOND from v_end-v_start), v_ret.src_prefix_out;
          /*}dbg*/
          select into v_numberlist * from class4.numberlists where id=v_customer_auth_normalized.src_numberlist_id;
          CASE v_numberlist.mode_id
            when 1 then -- strict match
              select into v_numberlist_item * from class4.numberlist_items ni
              where ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id and ni.key=v_ret.src_prefix_out limit 1;
            when 2 then -- prefix match
              select into v_numberlist_item * from class4.numberlist_items ni
              where
                ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id and
                prefix_range(ni.key)@>prefix_range(v_ret.src_prefix_out) and
                length(v_ret.src_prefix_out) between ni.number_min_length and ni.number_max_length
              order by length(prefix_range(ni.key)) desc limit 1;
            when 3 then -- random
              select into v_numberlist_size count(*) from class4.numberlist_items where numberlist_id=v_customer_auth_normalized.src_numberlist_id;
              select into v_numberlist_item *
              from class4.numberlist_items ni
              where ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id order by ni.id OFFSET floor(random()*v_numberlist_size) limit 1;
          end case;
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> SRC Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_numberlist_item);
          /*}dbg*/
          IF v_numberlist_item.action_id is not null and v_numberlist_item.action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> SRC Numberlist. Drop by key action. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_numberlist_item.key;
            /*}dbg*/
            v_ret.disconnect_code_id=8002; --source blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is not null and v_numberlist_item.action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist_item.src_rewrite_rule,
                v_numberlist_item.src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist_item.dst_rewrite_rule,
                v_numberlist_item.dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist_item.tag_action_id, v_call_tags, v_numberlist_item.tag_action_value);
            -- pass call NOP.
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> SRC Numberlist. Drop by default action',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
            v_ret.disconnect_code_id=8002; --source blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist.default_src_rewrite_rule,
                v_numberlist.default_src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist.default_dst_rewrite_rule,
                v_numberlist.default_dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist.tag_action_id, v_call_tags, v_numberlist.tag_action_value);
            -- pass by default
          end if;
        end if;

        --  setting numbers used for routing & billing
        v_ret.src_prefix_routing=v_ret.src_prefix_out;
        v_ret.dst_prefix_routing=v_ret.dst_prefix_out;
        v_routing_key=v_ret.dst_prefix_out;

        -- Areas and Tag detection-------------------------------------------
        v_ret.src_area_id:=(
          select area_id from class4.area_prefixes where prefix_range(prefix)@>prefix_range(v_ret.src_prefix_routing)
          order by length(prefix_range(prefix)) desc limit 1
        );

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> SRC Area found: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.src_area_id;
        /*}dbg*/

        v_ret.dst_area_id:=(
          select area_id from class4.area_prefixes where prefix_range(prefix)@>prefix_range(v_ret.dst_prefix_routing)
          order by length(prefix_range(prefix)) desc limit 1
        );

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DST Area found: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.dst_area_id;
        /*}dbg*/


        select into v_area_direction * from class4.routing_tag_detection_rules
        where
          (src_area_id is null OR src_area_id = v_ret.src_area_id) AND
          (dst_area_id is null OR dst_area_id = v_ret.dst_area_id) AND
          prefix_range(src_prefix) @> prefix_range(v_ret.src_prefix_routing) AND
          prefix_range(dst_prefix) @> prefix_range(v_ret.dst_prefix_routing) AND
          yeti_ext.tag_compare(routing_tag_ids, v_call_tags, routing_tag_mode_id ) > 0
        order by
          yeti_ext.tag_compare(routing_tag_ids, v_call_tags, routing_tag_mode_id) desc,
          length(prefix_range(v_ret.src_prefix_routing)) desc,
          length(prefix_range(v_ret.dst_prefix_routing)) desc,
          src_area_id is null,
          dst_area_id is null
        limit 1;
        if found then
            v_call_tags=yeti_ext.tag_action(v_area_direction.tag_action_id, v_call_tags, v_area_direction.tag_action_value);
        end if;

        v_ret.routing_tag_ids:=v_call_tags;

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Routing tag detected: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.routing_tag_ids;
        /*}dbg*/
        ----------------------------------------------------------------------

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Routing plan search start',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/

        select into v_max_call_length,v_drop_call_if_lnp_fail max_call_duration,drop_call_if_lnp_fail from sys.guiconfig limit 1;

        v_routing_key=v_ret.dst_prefix_routing;
        SELECT INTO v_rp * from class4.routing_plans WHERE id=v_customer_auth_normalized.routing_plan_id;
        if v_rp.sorting_id=5 then -- route testing
          v_test_vendor_id=regexp_replace(v_routing_key,'(.*)\*(.*)','\1')::integer;
          v_routing_key=regexp_replace(v_routing_key,'(.*)\*(.*)','\2');
          v_ret.dst_prefix_out=v_routing_key;
          v_ret.dst_prefix_routing=v_routing_key;
        end if;

        if v_rp.use_lnp then
          select into v_lnp_rule rules.*
          from class4.routing_plan_lnp_rules rules
          WHERE prefix_range(rules.dst_prefix)@>prefix_range(v_ret.dst_prefix_routing) and rules.routing_plan_id=v_rp.id
          order by length(prefix_range(rules.dst_prefix)) limit 1;
          if found then
            v_ret.lnp_database_id=v_lnp_rule.database_id;
            v_lnp_key=v_ret.dst_prefix_routing;
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> LNP. Need LNP lookup, LNP key: %',EXTRACT(MILLISECOND from v_end-v_start),v_lnp_key;
            /*}dbg*/
            v_lnp_key=yeti_ext.regexp_replace_rand(v_lnp_key,v_lnp_rule.req_dst_rewrite_rule,v_lnp_rule.req_dst_rewrite_result);
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> LNP key translation. LNP key: %',EXTRACT(MILLISECOND from v_end-v_start),v_lnp_key;
            /*}dbg*/
            -- try cache
            select into v_ret.lrn lrn from class4.lnp_cache where dst=v_lnp_key AND database_id=v_lnp_rule.database_id and expires_at>v_now;
            if found then
              /*dbg{*/
              v_end:=clock_timestamp();
              RAISE NOTICE '% ms -> LNP. Data found in cache, lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
              /*}dbg*/
              -- TRANSLATING response from cache
              v_ret.lrn=yeti_ext.regexp_replace_rand(v_ret.lrn,v_lnp_rule.lrn_rewrite_rule,v_lnp_rule.lrn_rewrite_result);
              /*dbg{*/
              v_end:=clock_timestamp();
              RAISE NOTICE '% ms -> LNP. Translation. lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
              /*}dbg*/
              v_routing_key=v_ret.lrn;
            else
              v_ret.lrn=switch19.lnp_resolve(v_ret.lnp_database_id,v_lnp_key);
              if v_ret.lrn is null then -- fail
                /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> LNP. Query failed',EXTRACT(MILLISECOND from v_end-v_start);
                /*}dbg*/
                if v_drop_call_if_lnp_fail then
                  /*dbg{*/
                  v_end:=clock_timestamp();
                  RAISE NOTICE '% ms -> LNP. Dropping call',EXTRACT(MILLISECOND from v_end-v_start);
                  /*}dbg*/
                  v_ret.disconnect_code_id=8003; --No response from LNP DB
                  RETURN NEXT v_ret;
                  RETURN;
                end if;
              else
                /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> LNP. Success, lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
                /*}dbg*/
                -- TRANSLATING response from LNP DB
                v_ret.lrn=yeti_ext.regexp_replace_rand(v_ret.lrn,v_lnp_rule.lrn_rewrite_rule,v_lnp_rule.lrn_rewrite_result);
                /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> LNP. Translation. lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
                /*}dbg*/
                v_routing_key=v_ret.lrn;
              end if;
            end if;
          end if;
        end if;



        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DST. search start. Routing key: %. Routing tags: %, Rate limit: %',EXTRACT(MILLISECOND from v_end-v_start), v_routing_key, v_ret.routing_tag_ids, v_destination_rate_limit;
        /*}dbg*/
        v_src_network:=switch19.detect_network(v_ret.src_prefix_routing);
        v_ret.src_network_id=v_src_network.network_id;
        v_ret.src_country_id=v_src_network.country_id;

        v_network:=switch19.detect_network(v_ret.dst_prefix_routing);
        v_ret.dst_network_id=v_network.network_id;
        v_ret.dst_country_id=v_network.country_id;

        IF v_rp.validate_dst_number_network AND v_ret.dst_network_id is null THEN
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> Network detection. DST network validation enabled and DST network was not found. Rejecting calls',EXTRACT(MILLISECOND from v_end-v_start);
          /*}dbg*/

          v_ret.disconnect_code_id=8007; --No network detected for DST number
          RETURN NEXT v_ret;
          RETURN;
        END IF;


        IF v_rp.validate_dst_number_format AND NOT (v_routing_key ~ '^[0-9]+$') THEN
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> Dst number format is not valid. DST number: %s',EXTRACT(MILLISECOND from v_end-v_start), v_routing_key;
          /*}dbg*/

          v_ret.disconnect_code_id=8008; --Invalid number format
          RETURN NEXT v_ret;
          RETURN;
        END IF;

        SELECT into v_destination d.*/*,switch.tracelog(d.*)*/
        FROM class4.destinations d
        JOIN class4.rate_plan_groups rpg ON d.rate_group_id=rpg.rate_group_id
        WHERE
          prefix_range(prefix)@>prefix_range(v_routing_key)
          AND length(v_routing_key) between d.dst_number_min_length and d.dst_number_max_length
          AND rpg.rateplan_id=v_customer_auth_normalized.rateplan_id
          AND enabled
          AND valid_from <= v_now
          AND valid_till >= v_now
          AND yeti_ext.tag_compare(d.routing_tag_ids, v_call_tags, d.routing_tag_mode_id)>0
        ORDER BY length(prefix_range(prefix)) DESC, yeti_ext.tag_compare(d.routing_tag_ids, v_call_tags) desc
        limit 1;
        IF NOT FOUND THEN
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> DST.  Destination not found',EXTRACT(MILLISECOND from v_end-v_start);
          /*}dbg*/
          v_ret.disconnect_code_id=111; --Cant find destination prefix
          RETURN NEXT v_ret;
          RETURN;
        END IF;
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DST. found: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(v_destination, true);
        /*}dbg*/

        v_ret.destination_id:=v_destination.id;
        v_ret.destination_prefix=v_destination.prefix;
        v_ret.destination_initial_interval:=v_destination.initial_interval;
        v_ret.destination_fee:=v_destination.connect_fee::varchar;
        v_ret.destination_next_interval:=v_destination.next_interval;
        v_ret.destination_rate_policy_id:=v_destination.rate_policy_id;
        v_ret.destination_reverse_billing:=v_destination.reverse_billing;
        IF v_destination.reject_calls THEN
          v_ret.disconnect_code_id=112; --Rejected by destination
          RETURN NEXT v_ret;
          RETURN;
        END IF;

        if v_destination.next_rate::float>v_destination_rate_limit then
          v_ret.disconnect_code_id=8006; -- No destination with appropriate rate found
          RETURN NEXT v_ret;
          RETURN;
        end if;

        select into v_rateplan * from class4.rateplans where id=v_customer_auth_normalized.rateplan_id;
        if COALESCE(v_destination.profit_control_mode_id,v_rateplan.profit_control_mode_id)=2 then -- per call
          v_rate_limit=v_destination.next_rate::float;
        end if;


        /*
                    FIND dialpeers logic. Queries must use prefix index for best performance
        */
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DP. search start. Routing key: %. Rate limit: %. Routing tag: %',EXTRACT(MILLISECOND from v_end-v_start), v_routing_key, v_rate_limit, v_ret.routing_tag_ids;
        /*}dbg*/
        CASE v_rp.sorting_id
          WHEN'1' THEN -- LCR,Prio, ACD&ASR control
          FOR routedata IN (
            WITH step1 AS(
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.lcr_rate_multiplier AS dp_lcr_rate_multiplier,
                  t_dp.priority AS dp_priority,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id = t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            from step1
            WHERE
              r=1
              and exclusive_rank=1
              AND dp_next_rate<=v_rate_limit
              AND dp_enabled
              and not dp_locked --ACD&ASR control for DP
            ORDER BY dp_next_rate*dp_lcr_rate_multiplier, dp_priority DESC
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          end LOOP;
          WHEN '2' THEN --LCR, no prio, No ACD&ASR control
          FOR routedata IN (
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  --  (t_vendor_gateway.*)::class4.gateways as s1_vendor_gateway,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id)>0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              AND dp_enabled
              and dp_next_rate<=v_rate_limit
            ORDER BY dp_metric
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN '3' THEN --Prio, LCR, ACD&ASR control
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
              and not dp_locked
            ORDER BY dp_metric_priority DESC, dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN'4' THEN -- LCRD, Prio, ACD&ACR control
          FOR routedata IN (
            WITH step1 AS(
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  ((t_dp.next_rate - first_value(t_dp.next_rate) OVER(ORDER BY t_dp.next_rate ASC)) > v_rp.rate_delta_max)::INTEGER *(t_dp.next_rate + t_dp.priority) - t_dp.priority AS r2,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id = t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id)>0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            from step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_next_rate <= v_rate_limit
              and dp_enabled
              and not dp_locked --ACD&ASR control for DP
            ORDER BY r2 ASC
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          end LOOP;
          WHEN'5' THEN -- Route test
          FOR routedata IN (
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  and t_dp.vendor_id=v_test_vendor_id
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_enabled
              and dp_next_rate<=v_rate_limit
            ORDER BY dp_metric_priority DESC, dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN'6' THEN -- QD.Static,LCR,ACD&ACR control
          v_random:=random();
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY length(prefix_range(coalesce(rpsr.prefix,''))) desc
                  ) as r2,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled,
                  t_dp.force_hit_rate as dp_force_hit_rate,
                  rpsr.priority as rpsr_priority,
                  rpsr.weight as rpsr_weight
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                  left join class4.routing_plan_static_routes rpsr
                    ON rpsr.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                      and rpsr.vendor_id=t_dp.vendor_id
                      AND prefix_range(rpsr.prefix)@>prefix_range(v_routing_key)
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and r2=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
              and not dp_locked
            ORDER BY
              coalesce(v_random<=dp_force_hit_rate,false) desc,
              rpsr_priority,
              yeti_ext.rank_dns_srv(rpsr_weight) over ( partition by rpsr_priority order by rpsr_weight),
              dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN'7' THEN -- QD.Static, No ACD&ACR control
          v_random:=random();
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY length(prefix_range(coalesce(rpsr.prefix,''))) desc
                  ) as r2,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled,
                  t_dp.force_hit_rate as dp_force_hit_rate,
                  rpsr.priority as rpsr_priority,
                  rpsr.weight as rpsr_weight
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                  join class4.routing_plan_static_routes rpsr
                    ON rpsr.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                      and rpsr.vendor_id=t_dp.vendor_id
                      AND prefix_range(rpsr.prefix)@>prefix_range(v_routing_key)
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and r2=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
            ORDER BY
              coalesce(v_random<=dp_force_hit_rate,false) desc,
              rpsr_priority,
              yeti_ext.rank_dns_srv(rpsr_weight) over ( partition by rpsr_priority order by rpsr_weight),
              dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;

        ELSE
          RAISE NOTICE 'BUG: unknown sorting_id';
        END CASE;
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Dialpeer search done',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/
        v_ret.disconnect_code_id=113; --No routes
        RETURN NEXT v_ret;
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DONE.',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/
        RETURN;
      END;
      $_$;


--
-- Name: route_debug(integer, integer, smallint, inet, integer, inet, integer, character varying, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, inet, integer, smallint, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.route_debug(i_node_id integer, i_pop_id integer, i_protocol_id smallint, i_remote_ip inet, i_remote_port integer, i_local_ip inet, i_local_port integer, i_from_dsp character varying, i_from_name character varying, i_from_domain character varying, i_from_port integer, i_to_name character varying, i_to_domain character varying, i_to_port integer, i_contact_name character varying, i_contact_domain character varying, i_contact_port integer, i_uri_name character varying, i_uri_domain character varying, i_auth_id integer, i_x_yeti_auth character varying, i_diversion character varying, i_x_orig_ip inet, i_x_orig_port integer, i_x_orig_protocol_id smallint, i_pai character varying, i_ppi character varying, i_privacy character varying, i_rpid character varying, i_rpid_privacy character varying) RETURNS SETOF switch19.callprofile_ty
    LANGUAGE plpgsql SECURITY DEFINER ROWS 10
    AS $_$
      DECLARE
        v_ret switch19.callprofile_ty;
        i integer;
        v_ip inet;
        v_remote_ip inet;
        v_remote_port INTEGER;
        v_transport_protocol_id smallint;
        v_customer_auth_normalized class4.customers_auth_normalized;
        v_destination class4.destinations%rowtype;
        v_dialpeer record;
        v_rateplan class4.rateplans%rowtype;
        v_dst_gw class4.gateways%rowtype;
        v_orig_gw class4.gateways%rowtype;
        v_rp class4.routing_plans%rowtype;
        v_customer_allowtime real;
        v_vendor_allowtime real;
        v_sorting_id integer;
        v_customer_acc integer;
        v_route_found boolean:=false;
        v_c_acc billing.accounts%rowtype;
        v_v_acc billing.accounts%rowtype;
        v_network sys.network_prefixes%rowtype;
        v_src_network sys.network_prefixes%rowtype;
        routedata record;
        /*dbg{*/
        v_start timestamp;
        v_end timestamp;
        /*}dbg*/
        v_rate NUMERIC;
        v_now timestamp;
        v_x_yeti_auth varchar;
        --  v_uri_domain varchar;
        v_rate_limit float:='Infinity'::float;
        v_destination_rate_limit float:='Infinity'::float;
        v_test_vendor_id integer;
        v_random float;
        v_max_call_length integer;
        v_routing_key varchar;
        v_lnp_key varchar;
        v_drop_call_if_lnp_fail boolean;
        v_lnp_rule class4.routing_plan_lnp_rules%rowtype;
        v_numberlist record;
        v_numberlist_item record;
        v_call_tags smallint[]:='{}'::smallint[];
        v_area_direction class4.routing_tag_detection_rules%rowtype;
        v_numberlist_size integer;
        v_lua_context switch19.lua_call_context;

      BEGIN
        /*dbg{*/
        v_start:=now();
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Execution start',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/

        perform id from sys.load_balancers where signalling_ip=host(i_remote_ip)::varchar;
        IF FOUND and i_x_orig_ip IS not NULL AND i_x_orig_port IS not NULL THEN
          v_remote_ip:=i_x_orig_ip;
          v_remote_port:=i_x_orig_port;
          v_transport_protocol_id=i_x_orig_protocol_id;
          /*dbg{*/RAISE NOTICE '% ms -> Got originator address "%:%, proto: %" from x-headers',EXTRACT(MILLISECOND from v_end-v_start), v_remote_ip,v_remote_port, v_transport_protocol_id;/*}dbg*/
        else
          v_remote_ip:=i_remote_ip;
          v_remote_port:=i_remote_port;
          v_transport_protocol_id:=i_protocol_id;
          /*dbg{*/RAISE NOTICE '% ms -> Got originator address "%:%, proto: %" from switch leg info',EXTRACT(MILLISECOND from v_end-v_start), v_remote_ip,v_remote_port, v_transport_protocol_id;/*}dbg*/
        end if;

        v_now:=now();
        v_ret:=switch19.new_profile();
        v_ret.cache_time = 10;

        v_ret.diversion_in:=i_diversion;
        v_ret.diversion_out:=i_diversion; -- FIXME

        v_ret.auth_orig_protocol_id =v_transport_protocol_id;
        v_ret.auth_orig_ip = v_remote_ip;
        v_ret.auth_orig_port = v_remote_port;

        v_ret.src_name_in:=i_from_dsp;
        v_ret.src_name_out:=v_ret.src_name_in;

        v_ret.src_prefix_in:=i_from_name;
        v_ret.src_prefix_out:=v_ret.src_prefix_in;

        v_ret.dst_prefix_in:=i_uri_name;
        v_ret.dst_prefix_out:=v_ret.dst_prefix_in;


        v_ret.ruri_domain=i_uri_domain;
        v_ret.from_domain=i_from_domain;
        v_ret.to_domain=i_to_domain;

        v_ret.pai_in=i_pai;
        v_ret.ppi_in=i_ppi;
        v_ret.privacy_in=i_privacy;
        v_ret.rpid_in=i_rpid;
        v_ret.rpid_privacy_in=i_rpid_privacy;

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. lookup started',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/
        v_x_yeti_auth:=COALESCE(i_x_yeti_auth,'');
        --  v_uri_domain:=COALESCE(i_uri_domain,'');

        if i_auth_id is null then
            SELECT into v_customer_auth_normalized ca.*
            from class4.customers_auth_normalized ca
                JOIN public.contractors c ON c.id=ca.customer_id
            WHERE ca.enabled AND
              ca.ip>>=v_remote_ip AND
              prefix_range(ca.dst_prefix)@>prefix_range(v_ret.dst_prefix_in) AND
              prefix_range(ca.src_prefix)@>prefix_range(v_ret.src_prefix_in) AND
              (ca.pop_id=i_pop_id or ca.pop_id is null) and
              COALESCE(ca.x_yeti_auth,'')=v_x_yeti_auth AND
              COALESCE(nullif(ca.uri_domain,'')=i_uri_domain,true) AND
              COALESCE(nullif(ca.to_domain,'')=i_to_domain,true) AND
              COALESCE(nullif(ca.from_domain,'')=i_from_domain,true) AND
              (ca.transport_protocol_id is null or ca.transport_protocol_id=v_transport_protocol_id) AND
              length(v_ret.dst_prefix_in) between ca.dst_number_min_length and ca.dst_number_max_length and
              length(v_ret.src_prefix_in) between ca.src_number_min_length and ca.src_number_max_length and
              c.enabled and c.customer
            ORDER BY
                masklen(ca.ip) DESC,
                ca.transport_protocol_id is null,
                length(prefix_range(ca.dst_prefix)) DESC,
                length(prefix_range(ca.src_prefix)) DESC,
                ca.pop_id is null,
                ca.uri_domain is null,
                ca.to_domain is null,
                ca.from_domain is null,
                ca.require_incoming_auth
            LIMIT 1;
            IF NOT FOUND THEN
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 110.Cant find customer or customer locked',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=110; --Cant find customer or customer locked
                RETURN NEXT v_ret;
                RETURN;
            END IF;
            if v_customer_auth_normalized.require_incoming_auth then
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH. Incoming auth required. Respond 401',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.aleg_auth_required=true;
                RETURN NEXT v_ret;
                RETURN;
            end IF;
            if v_customer_auth_normalized.reject_calls then
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 8004. Reject by customers auth',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=8004; -- call rejected by authorization

                v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
                v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

                v_ret.customer_id:=v_customer_auth_normalized.customer_id;
                select into strict v_ret.customer_external_id external_id from public.contractors where id=v_ret.customer_id;

                v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
                v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;

                v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
                SELECT INTO STRICT v_ret.customer_acc_external_id external_id FROM billing.accounts WHERE id=v_customer_auth_normalized.account_id;

                RETURN NEXT v_ret;
                RETURN;
            end if;
        else
            SELECT into v_customer_auth_normalized ca.*
            from class4.customers_auth_normalized ca
                JOIN public.contractors c ON c.id=ca.customer_id
            WHERE ca.enabled AND
              ca.ip>>=v_remote_ip AND
              prefix_range(ca.dst_prefix)@>prefix_range(v_ret.dst_prefix_in) AND
              prefix_range(ca.src_prefix)@>prefix_range(v_ret.src_prefix_in) AND
              (ca.pop_id=i_pop_id or ca.pop_id is null) and
              COALESCE(ca.x_yeti_auth,'')=v_x_yeti_auth AND
              COALESCE(nullif(ca.uri_domain,'')=i_uri_domain,true) AND
              COALESCE(nullif(ca.to_domain,'')=i_to_domain,true) AND
              COALESCE(nullif(ca.from_domain,'')=i_from_domain,true) AND
              (ca.transport_protocol_id is null or ca.transport_protocol_id=v_transport_protocol_id) AND
              length(v_ret.dst_prefix_in) between ca.dst_number_min_length and ca.dst_number_max_length and
              length(v_ret.src_prefix_in) between ca.src_number_min_length and ca.src_number_max_length and
              c.enabled and c.customer and
              ca.require_incoming_auth and gateway_id = i_auth_id
            ORDER BY
                masklen(ca.ip) DESC,
                ca.transport_protocol_id is null,
                length(prefix_range(ca.dst_prefix)) DESC,
                length(prefix_range(ca.src_prefix)) DESC,
                ca.pop_id is null,
                ca.uri_domain is null,
                ca.to_domain is null,
                ca.from_domain is null
            LIMIT 1;
            IF NOT FOUND THEN
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 110.Cant find customer or customer locked',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=110; --Cant find customer or customer locked
                RETURN NEXT v_ret;
                RETURN;
            END IF;
            if v_customer_auth_normalized.reject_calls then
            /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> AUTH.  disconnection with 8004. Reject by customers auth',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
                v_ret.disconnect_code_id=8004; -- call rejected by authorization

                v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
                v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

                v_ret.customer_id:=v_customer_auth_normalized.customer_id;
                select into strict v_ret.customer_external_id external_id from public.contractors where id=v_ret.customer_id;

                v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
                v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;

                v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
                SELECT INTO STRICT v_ret.customer_acc_external_id external_id FROM billing.accounts WHERE id=v_customer_auth_normalized.account_id;

                RETURN NEXT v_ret;
                RETURN;
            end if;
        end IF;

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. found: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(v_customer_auth_normalized, true);
        /*}dbg*/

        -- redefine call SRC/DST numbers

        IF v_customer_auth_normalized.src_name_field_id=1 THEN  /* default - from uri display name */
          v_ret.src_name_in:=i_from_dsp;
        END IF;
        v_ret.src_name_out:=v_ret.src_name_in;

        IF v_customer_auth_normalized.src_number_field_id=1 THEN  /* default - from uri userpart */
          v_ret.src_prefix_in:=i_from_name;
        ELSIF v_customer_auth_normalized.src_number_field_id=2 THEN /* From uri Display name */
          v_ret.src_prefix_in:=i_from_dsp;
        END IF;
        v_ret.src_prefix_out:=v_ret.src_prefix_in;

        IF v_customer_auth_normalized.dst_number_field_id=1 THEN /* default  - RURI userpart*/
          v_ret.dst_prefix_in:=i_uri_name;
        ELSIF v_customer_auth_normalized.dst_number_field_id=2 THEN /* TO URI userpart */
          v_ret.dst_prefix_in:=i_to_name;
        ELSIF v_customer_auth_normalized.dst_number_field_id=3 THEN /* Top-Most Diversion header userpart */
          v_ret.dst_prefix_in:=i_diversion;
        END IF;
        v_ret.dst_prefix_out:=v_ret.dst_prefix_in;


        -- feel customer data ;-)
        v_ret.dump_level_id:=v_customer_auth_normalized.dump_level_id;
        v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
        v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

        v_ret.customer_id:=v_customer_auth_normalized.customer_id;
        select into strict v_ret.customer_external_id external_id from public.contractors where id=v_customer_auth_normalized.customer_id;

        v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
        v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;
        v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
        v_ret.orig_gw_id:=v_customer_auth_normalized.gateway_id;

        v_ret.radius_auth_profile_id=v_customer_auth_normalized.radius_auth_profile_id;
        v_ret.aleg_radius_acc_profile_id=v_customer_auth_normalized.radius_accounting_profile_id;
        v_ret.record_audio=v_customer_auth_normalized.enable_audio_recording;

        v_ret.customer_acc_check_balance=v_customer_auth_normalized.check_account_balance;

        SELECT INTO STRICT v_c_acc * FROM billing.accounts  WHERE id=v_customer_auth_normalized.account_id;
        v_ret.customer_acc_external_id=v_c_acc.external_id;
        v_ret.customer_acc_vat=v_c_acc.vat;
        v_destination_rate_limit=coalesce(v_c_acc.destination_rate_limit::float,'Infinity'::float);

        if v_customer_auth_normalized.check_account_balance AND v_c_acc.balance<=v_c_acc.min_balance then
          v_ret.disconnect_code_id=8000; --No enough customer balance
          RETURN NEXT v_ret;
          RETURN;
        end if;

        v_ret.customer_acc_external_id=v_c_acc.external_id;
        v_ret.customer_acc_vat=v_c_acc.vat;

        SELECT into v_orig_gw * from class4.gateways WHERE id=v_customer_auth_normalized.gateway_id;
        if not v_orig_gw.enabled then
          v_ret.disconnect_code_id=8005; -- Origination gateway is disabled
          RETURN NEXT v_ret;
          RETURN;
        end if;

        v_ret.resources:='';
        if v_customer_auth_normalized.capacity is not null then
          v_ret.resources:=v_ret.resources||'3:'||v_customer_auth_normalized.customers_auth_id||':'||v_customer_auth_normalized.capacity::varchar||':1;';
        end if;

        if v_c_acc.origination_capacity is not null then
          v_ret.resources:=v_ret.resources||'1:'||v_c_acc.id::varchar||':'||v_c_acc.origination_capacity::varchar||':1;';
        end if;

        if v_c_acc.total_capacity is not null then
          v_ret.resources:=v_ret.resources||'7:'||v_c_acc.id::varchar||':'||v_c_acc.total_capacity::varchar||':1;';
        end if;

        if v_orig_gw.origination_capacity is not null then
          v_ret.resources:=v_ret.resources||'4:'||v_orig_gw.id::varchar||':'||v_orig_gw.origination_capacity::varchar||':1;';
        end if;

        -- Tag processing CA
        v_call_tags=yeti_ext.tag_action(v_customer_auth_normalized.tag_action_id, v_call_tags, v_customer_auth_normalized.tag_action_value);

        /*
            number rewriting _Before_ routing
        */
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. Before rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.src_prefix_out,v_ret.dst_prefix_out;
        /*}dbg*/
        v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(v_ret.dst_prefix_out,v_customer_auth_normalized.dst_rewrite_rule,v_customer_auth_normalized.dst_rewrite_result);
        v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(v_ret.src_prefix_out,v_customer_auth_normalized.src_rewrite_rule,v_customer_auth_normalized.src_rewrite_result);
        v_ret.src_name_out=yeti_ext.regexp_replace_rand(v_ret.src_name_out,v_customer_auth_normalized.src_name_rewrite_rule,v_customer_auth_normalized.src_name_rewrite_result, true);

        --  if v_ret.radius_auth_profile_id is not null then
        v_ret.src_number_radius:=i_from_name;
        v_ret.dst_number_radius:=i_uri_name;
        v_ret.src_number_radius=yeti_ext.regexp_replace_rand(
            v_ret.src_number_radius,
            v_customer_auth_normalized.src_number_radius_rewrite_rule,
            v_customer_auth_normalized.src_number_radius_rewrite_result
        );

        v_ret.dst_number_radius=yeti_ext.regexp_replace_rand(
            v_ret.dst_number_radius,
            v_customer_auth_normalized.dst_number_radius_rewrite_rule,
            v_customer_auth_normalized.dst_number_radius_rewrite_result
        );
        v_ret.customer_auth_name=v_customer_auth_normalized."name";
        v_ret.customer_name=(select "name" from public.contractors where id=v_customer_auth_normalized.customer_id limit 1);
        --  end if;
/*
        if v_customer_auth_normalized.lua_script_id is not null then
          v_lua_context.src_name_in = v_ret.src_name_in;
	        v_lua_context.src_number_in = v_ret.src_prefix_in;
	        v_lua_context.dst_number_in = v_ret.dst_prefix_in;
	        v_lua_context.src_name_out = v_ret.src_name_out;
	        v_lua_context.src_number_out = v_ret.src_prefix_out;
	        v_lua_context.dst_number_out = v_ret.dst_prefix_out;
	        -- v_lua_context.src_name_routing
	        -- v_lua_context.src_number_routing
	        -- v_lua_context.dst_number_routing
          -- #arrays
	        -- v_lua_context.diversion_in
	        -- v_lua_context.diversion_routing
	        -- v_lua_context.diversion_out
          v_lua_context = switch19.lua_exec(v_customer_auth_normalized.lua_script_id, v_lua_context);
          v_ret.src_name_out =  v_lua_context.src_name_out;
          v_ret.src_prefix_out = v_lua_context.src_number_out;
          v_ret.dst_prefix_out = v_lua_context.dst_number_out;
        end if;
*/

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> AUTH. After rewrite src_prefix: % , dst_prefix: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.src_prefix_out,v_ret.dst_prefix_out;
        /*}dbg*/

        ----- Numberlist processing-------------------------------------------------------------------------------------------------------
        if v_customer_auth_normalized.dst_numberlist_id is not null then
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> DST Numberlist processing. Lookup by key: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.dst_prefix_out;
          /*}dbg*/
          select into v_numberlist * from class4.numberlists where id=v_customer_auth_normalized.dst_numberlist_id;
          CASE v_numberlist.mode_id
            when 1 then -- strict match
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id and ni.key=v_ret.dst_prefix_out limit 1;
            when 2 then -- prefix match
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where
                  ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id and
                  prefix_range(ni.key)@>prefix_range(v_ret.dst_prefix_out) and
                  length(v_ret.dst_prefix_out) between ni.number_min_length and ni.number_max_length
                order by length(prefix_range(ni.key))
                desc limit 1;
            when 3 then -- random
                select into v_numberlist_size count(*) from class4.numberlist_items where numberlist_id=v_customer_auth_normalized.dst_numberlist_id;
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id order by ni.id OFFSET floor(random()*v_numberlist_size) limit 1;
          end case;
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> DST Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_numberlist_item);
          /*}dbg*/
          IF v_numberlist_item.action_id is not null and v_numberlist_item.action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> DST Numberlist. Drop by key action. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_numberlist_item.key;
            /*}dbg*/
            v_ret.disconnect_code_id=8001; --destination blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is not null and v_numberlist_item.action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist_item.src_rewrite_rule,
                v_numberlist_item.src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist_item.dst_rewrite_rule,
                v_numberlist_item.dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist_item.tag_action_id, v_call_tags, v_numberlist_item.tag_action_value);
            -- pass call NOP.
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> DST Numberlist. Drop by default action',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
            -- drop by default
            v_ret.disconnect_code_id=8001; --destination blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist.default_src_rewrite_rule,
                v_numberlist.default_src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist.default_dst_rewrite_rule,
                v_numberlist.default_dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist.tag_action_id, v_call_tags, v_numberlist.tag_action_value);
            -- pass by default
          end if;
        end if;

        if v_customer_auth_normalized.src_numberlist_id is not null then
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> SRC Numberlist processing. Lookup by key: %s',EXTRACT(MILLISECOND from v_end-v_start), v_ret.src_prefix_out;
          /*}dbg*/
          select into v_numberlist * from class4.numberlists where id=v_customer_auth_normalized.src_numberlist_id;
          CASE v_numberlist.mode_id
            when 1 then -- strict match
              select into v_numberlist_item * from class4.numberlist_items ni
              where ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id and ni.key=v_ret.src_prefix_out limit 1;
            when 2 then -- prefix match
              select into v_numberlist_item * from class4.numberlist_items ni
              where
                ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id and
                prefix_range(ni.key)@>prefix_range(v_ret.src_prefix_out) and
                length(v_ret.src_prefix_out) between ni.number_min_length and ni.number_max_length
              order by length(prefix_range(ni.key)) desc limit 1;
            when 3 then -- random
              select into v_numberlist_size count(*) from class4.numberlist_items where numberlist_id=v_customer_auth_normalized.src_numberlist_id;
              select into v_numberlist_item *
              from class4.numberlist_items ni
              where ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id order by ni.id OFFSET floor(random()*v_numberlist_size) limit 1;
          end case;
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> SRC Numberlist. key found: %',EXTRACT(MILLISECOND from v_end-v_start), row_to_json(v_numberlist_item);
          /*}dbg*/
          IF v_numberlist_item.action_id is not null and v_numberlist_item.action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> SRC Numberlist. Drop by key action. Key: %',EXTRACT(MILLISECOND from v_end-v_start), v_numberlist_item.key;
            /*}dbg*/
            v_ret.disconnect_code_id=8002; --source blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is not null and v_numberlist_item.action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist_item.src_rewrite_rule,
                v_numberlist_item.src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist_item.dst_rewrite_rule,
                v_numberlist_item.dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist_item.tag_action_id, v_call_tags, v_numberlist_item.tag_action_value);
            -- pass call NOP.
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=1 then
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> SRC Numberlist. Drop by default action',EXTRACT(MILLISECOND from v_end-v_start);
            /*}dbg*/
            v_ret.disconnect_code_id=8002; --source blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist.default_src_rewrite_rule,
                v_numberlist.default_src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist.default_dst_rewrite_rule,
                v_numberlist.default_dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist.tag_action_id, v_call_tags, v_numberlist.tag_action_value);
            -- pass by default
          end if;
        end if;

        --  setting numbers used for routing & billing
        v_ret.src_prefix_routing=v_ret.src_prefix_out;
        v_ret.dst_prefix_routing=v_ret.dst_prefix_out;
        v_routing_key=v_ret.dst_prefix_out;

        -- Areas and Tag detection-------------------------------------------
        v_ret.src_area_id:=(
          select area_id from class4.area_prefixes where prefix_range(prefix)@>prefix_range(v_ret.src_prefix_routing)
          order by length(prefix_range(prefix)) desc limit 1
        );

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> SRC Area found: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.src_area_id;
        /*}dbg*/

        v_ret.dst_area_id:=(
          select area_id from class4.area_prefixes where prefix_range(prefix)@>prefix_range(v_ret.dst_prefix_routing)
          order by length(prefix_range(prefix)) desc limit 1
        );

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DST Area found: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.dst_area_id;
        /*}dbg*/


        select into v_area_direction * from class4.routing_tag_detection_rules
        where
          (src_area_id is null OR src_area_id = v_ret.src_area_id) AND
          (dst_area_id is null OR dst_area_id = v_ret.dst_area_id) AND
          prefix_range(src_prefix) @> prefix_range(v_ret.src_prefix_routing) AND
          prefix_range(dst_prefix) @> prefix_range(v_ret.dst_prefix_routing) AND
          yeti_ext.tag_compare(routing_tag_ids, v_call_tags, routing_tag_mode_id ) > 0
        order by
          yeti_ext.tag_compare(routing_tag_ids, v_call_tags, routing_tag_mode_id) desc,
          length(prefix_range(v_ret.src_prefix_routing)) desc,
          length(prefix_range(v_ret.dst_prefix_routing)) desc,
          src_area_id is null,
          dst_area_id is null
        limit 1;
        if found then
            v_call_tags=yeti_ext.tag_action(v_area_direction.tag_action_id, v_call_tags, v_area_direction.tag_action_value);
        end if;

        v_ret.routing_tag_ids:=v_call_tags;

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Routing tag detected: %',EXTRACT(MILLISECOND from v_end-v_start), v_ret.routing_tag_ids;
        /*}dbg*/
        ----------------------------------------------------------------------

        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Routing plan search start',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/

        select into v_max_call_length,v_drop_call_if_lnp_fail max_call_duration,drop_call_if_lnp_fail from sys.guiconfig limit 1;

        v_routing_key=v_ret.dst_prefix_routing;
        SELECT INTO v_rp * from class4.routing_plans WHERE id=v_customer_auth_normalized.routing_plan_id;
        if v_rp.sorting_id=5 then -- route testing
          v_test_vendor_id=regexp_replace(v_routing_key,'(.*)\*(.*)','\1')::integer;
          v_routing_key=regexp_replace(v_routing_key,'(.*)\*(.*)','\2');
          v_ret.dst_prefix_out=v_routing_key;
          v_ret.dst_prefix_routing=v_routing_key;
        end if;

        if v_rp.use_lnp then
          select into v_lnp_rule rules.*
          from class4.routing_plan_lnp_rules rules
          WHERE prefix_range(rules.dst_prefix)@>prefix_range(v_ret.dst_prefix_routing) and rules.routing_plan_id=v_rp.id
          order by length(prefix_range(rules.dst_prefix)) limit 1;
          if found then
            v_ret.lnp_database_id=v_lnp_rule.database_id;
            v_lnp_key=v_ret.dst_prefix_routing;
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> LNP. Need LNP lookup, LNP key: %',EXTRACT(MILLISECOND from v_end-v_start),v_lnp_key;
            /*}dbg*/
            v_lnp_key=yeti_ext.regexp_replace_rand(v_lnp_key,v_lnp_rule.req_dst_rewrite_rule,v_lnp_rule.req_dst_rewrite_result);
            /*dbg{*/
            v_end:=clock_timestamp();
            RAISE NOTICE '% ms -> LNP key translation. LNP key: %',EXTRACT(MILLISECOND from v_end-v_start),v_lnp_key;
            /*}dbg*/
            -- try cache
            select into v_ret.lrn lrn from class4.lnp_cache where dst=v_lnp_key AND database_id=v_lnp_rule.database_id and expires_at>v_now;
            if found then
              /*dbg{*/
              v_end:=clock_timestamp();
              RAISE NOTICE '% ms -> LNP. Data found in cache, lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
              /*}dbg*/
              -- TRANSLATING response from cache
              v_ret.lrn=yeti_ext.regexp_replace_rand(v_ret.lrn,v_lnp_rule.lrn_rewrite_rule,v_lnp_rule.lrn_rewrite_result);
              /*dbg{*/
              v_end:=clock_timestamp();
              RAISE NOTICE '% ms -> LNP. Translation. lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
              /*}dbg*/
              v_routing_key=v_ret.lrn;
            else
              v_ret.lrn=switch19.lnp_resolve(v_ret.lnp_database_id,v_lnp_key);
              if v_ret.lrn is null then -- fail
                /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> LNP. Query failed',EXTRACT(MILLISECOND from v_end-v_start);
                /*}dbg*/
                if v_drop_call_if_lnp_fail then
                  /*dbg{*/
                  v_end:=clock_timestamp();
                  RAISE NOTICE '% ms -> LNP. Dropping call',EXTRACT(MILLISECOND from v_end-v_start);
                  /*}dbg*/
                  v_ret.disconnect_code_id=8003; --No response from LNP DB
                  RETURN NEXT v_ret;
                  RETURN;
                end if;
              else
                /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> LNP. Success, lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
                /*}dbg*/
                -- TRANSLATING response from LNP DB
                v_ret.lrn=yeti_ext.regexp_replace_rand(v_ret.lrn,v_lnp_rule.lrn_rewrite_rule,v_lnp_rule.lrn_rewrite_result);
                /*dbg{*/
                v_end:=clock_timestamp();
                RAISE NOTICE '% ms -> LNP. Translation. lrn: %',EXTRACT(MILLISECOND from v_end-v_start),v_ret.lrn;
                /*}dbg*/
                v_routing_key=v_ret.lrn;
              end if;
            end if;
          end if;
        end if;



        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DST. search start. Routing key: %. Routing tags: %, Rate limit: %',EXTRACT(MILLISECOND from v_end-v_start), v_routing_key, v_ret.routing_tag_ids, v_destination_rate_limit;
        /*}dbg*/
        v_src_network:=switch19.detect_network(v_ret.src_prefix_routing);
        v_ret.src_network_id=v_src_network.network_id;
        v_ret.src_country_id=v_src_network.country_id;

        v_network:=switch19.detect_network(v_ret.dst_prefix_routing);
        v_ret.dst_network_id=v_network.network_id;
        v_ret.dst_country_id=v_network.country_id;

        IF v_rp.validate_dst_number_network AND v_ret.dst_network_id is null THEN
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> Network detection. DST network validation enabled and DST network was not found. Rejecting calls',EXTRACT(MILLISECOND from v_end-v_start);
          /*}dbg*/

          v_ret.disconnect_code_id=8007; --No network detected for DST number
          RETURN NEXT v_ret;
          RETURN;
        END IF;


        IF v_rp.validate_dst_number_format AND NOT (v_routing_key ~ '^[0-9]+$') THEN
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> Dst number format is not valid. DST number: %s',EXTRACT(MILLISECOND from v_end-v_start), v_routing_key;
          /*}dbg*/

          v_ret.disconnect_code_id=8008; --Invalid number format
          RETURN NEXT v_ret;
          RETURN;
        END IF;

        SELECT into v_destination d.*/*,switch.tracelog(d.*)*/
        FROM class4.destinations d
        JOIN class4.rate_plan_groups rpg ON d.rate_group_id=rpg.rate_group_id
        WHERE
          prefix_range(prefix)@>prefix_range(v_routing_key)
          AND length(v_routing_key) between d.dst_number_min_length and d.dst_number_max_length
          AND rpg.rateplan_id=v_customer_auth_normalized.rateplan_id
          AND enabled
          AND valid_from <= v_now
          AND valid_till >= v_now
          AND yeti_ext.tag_compare(d.routing_tag_ids, v_call_tags, d.routing_tag_mode_id)>0
        ORDER BY length(prefix_range(prefix)) DESC, yeti_ext.tag_compare(d.routing_tag_ids, v_call_tags) desc
        limit 1;
        IF NOT FOUND THEN
          /*dbg{*/
          v_end:=clock_timestamp();
          RAISE NOTICE '% ms -> DST.  Destination not found',EXTRACT(MILLISECOND from v_end-v_start);
          /*}dbg*/
          v_ret.disconnect_code_id=111; --Cant find destination prefix
          RETURN NEXT v_ret;
          RETURN;
        END IF;
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DST. found: %',EXTRACT(MILLISECOND from v_end-v_start),row_to_json(v_destination, true);
        /*}dbg*/

        v_ret.destination_id:=v_destination.id;
        v_ret.destination_prefix=v_destination.prefix;
        v_ret.destination_initial_interval:=v_destination.initial_interval;
        v_ret.destination_fee:=v_destination.connect_fee::varchar;
        v_ret.destination_next_interval:=v_destination.next_interval;
        v_ret.destination_rate_policy_id:=v_destination.rate_policy_id;
        v_ret.destination_reverse_billing:=v_destination.reverse_billing;
        IF v_destination.reject_calls THEN
          v_ret.disconnect_code_id=112; --Rejected by destination
          RETURN NEXT v_ret;
          RETURN;
        END IF;

        if v_destination.next_rate::float>v_destination_rate_limit then
          v_ret.disconnect_code_id=8006; -- No destination with appropriate rate found
          RETURN NEXT v_ret;
          RETURN;
        end if;

        select into v_rateplan * from class4.rateplans where id=v_customer_auth_normalized.rateplan_id;
        if COALESCE(v_destination.profit_control_mode_id,v_rateplan.profit_control_mode_id)=2 then -- per call
          v_rate_limit=v_destination.next_rate::float;
        end if;


        /*
                    FIND dialpeers logic. Queries must use prefix index for best performance
        */
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DP. search start. Routing key: %. Rate limit: %. Routing tag: %',EXTRACT(MILLISECOND from v_end-v_start), v_routing_key, v_rate_limit, v_ret.routing_tag_ids;
        /*}dbg*/
        CASE v_rp.sorting_id
          WHEN'1' THEN -- LCR,Prio, ACD&ASR control
          FOR routedata IN (
            WITH step1 AS(
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.lcr_rate_multiplier AS dp_lcr_rate_multiplier,
                  t_dp.priority AS dp_priority,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id = t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            from step1
            WHERE
              r=1
              and exclusive_rank=1
              AND dp_next_rate<=v_rate_limit
              AND dp_enabled
              and not dp_locked --ACD&ASR control for DP
            ORDER BY dp_next_rate*dp_lcr_rate_multiplier, dp_priority DESC
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          end LOOP;
          WHEN '2' THEN --LCR, no prio, No ACD&ASR control
          FOR routedata IN (
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  --  (t_vendor_gateway.*)::class4.gateways as s1_vendor_gateway,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id)>0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              AND dp_enabled
              and dp_next_rate<=v_rate_limit
            ORDER BY dp_metric
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN '3' THEN --Prio, LCR, ACD&ASR control
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
              and not dp_locked
            ORDER BY dp_metric_priority DESC, dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN'4' THEN -- LCRD, Prio, ACD&ACR control
          FOR routedata IN (
            WITH step1 AS(
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  ((t_dp.next_rate - first_value(t_dp.next_rate) OVER(ORDER BY t_dp.next_rate ASC)) > v_rp.rate_delta_max)::INTEGER *(t_dp.next_rate + t_dp.priority) - t_dp.priority AS r2,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id = t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id)>0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            from step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_next_rate <= v_rate_limit
              and dp_enabled
              and not dp_locked --ACD&ASR control for DP
            ORDER BY r2 ASC
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          end LOOP;
          WHEN'5' THEN -- Route test
          FOR routedata IN (
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  and t_dp.vendor_id=v_test_vendor_id
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_enabled
              and dp_next_rate<=v_rate_limit
            ORDER BY dp_metric_priority DESC, dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN'6' THEN -- QD.Static,LCR,ACD&ACR control
          v_random:=random();
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY length(prefix_range(coalesce(rpsr.prefix,''))) desc
                  ) as r2,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled,
                  t_dp.force_hit_rate as dp_force_hit_rate,
                  rpsr.priority as rpsr_priority,
                  rpsr.weight as rpsr_weight
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                  left join class4.routing_plan_static_routes rpsr
                    ON rpsr.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                      and rpsr.vendor_id=t_dp.vendor_id
                      AND prefix_range(rpsr.prefix)@>prefix_range(v_routing_key)
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and r2=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
              and not dp_locked
            ORDER BY
              coalesce(v_random<=dp_force_hit_rate,false) desc,
              rpsr_priority,
              yeti_ext.rank_dns_srv(rpsr_weight) over ( partition by rpsr_priority order by rpsr_weight),
              dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;
          WHEN'7' THEN -- QD.Static, No ACD&ACR control
          v_random:=random();
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY length(prefix_range(coalesce(rpsr.prefix,''))) desc
                  ) as r2,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled,
                  t_dp.force_hit_rate as dp_force_hit_rate,
                  rpsr.priority as rpsr_priority,
                  rpsr.weight as rpsr_weight
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                  join class4.routing_plan_static_routes rpsr
                    ON rpsr.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                      and rpsr.vendor_id=t_dp.vendor_id
                      AND prefix_range(rpsr.prefix)@>prefix_range(v_routing_key)
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and r2=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
            ORDER BY
              coalesce(v_random<=dp_force_hit_rate,false) desc,
              rpsr_priority,
              yeti_ext.rank_dns_srv(rpsr_weight) over ( partition by rpsr_priority order by rpsr_weight),
              dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            
            /*dbg{*/SELECT * from process_dp_debug(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}dbg*/
          END LOOP;

        ELSE
          RAISE NOTICE 'BUG: unknown sorting_id';
        END CASE;
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> Dialpeer search done',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/
        v_ret.disconnect_code_id=113; --No routes
        RETURN NEXT v_ret;
        /*dbg{*/
        v_end:=clock_timestamp();
        RAISE NOTICE '% ms -> DONE.',EXTRACT(MILLISECOND from v_end-v_start);
        /*}dbg*/
        RETURN;
      END;
      $_$;


--
-- Name: route_release(integer, integer, smallint, inet, integer, inet, integer, character varying, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, integer, character varying, character varying, inet, integer, smallint, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.route_release(i_node_id integer, i_pop_id integer, i_protocol_id smallint, i_remote_ip inet, i_remote_port integer, i_local_ip inet, i_local_port integer, i_from_dsp character varying, i_from_name character varying, i_from_domain character varying, i_from_port integer, i_to_name character varying, i_to_domain character varying, i_to_port integer, i_contact_name character varying, i_contact_domain character varying, i_contact_port integer, i_uri_name character varying, i_uri_domain character varying, i_auth_id integer, i_x_yeti_auth character varying, i_diversion character varying, i_x_orig_ip inet, i_x_orig_port integer, i_x_orig_protocol_id smallint, i_pai character varying, i_ppi character varying, i_privacy character varying, i_rpid character varying, i_rpid_privacy character varying) RETURNS SETOF switch19.callprofile_ty
    LANGUAGE plpgsql SECURITY DEFINER ROWS 10
    AS $_$
      DECLARE
        v_ret switch19.callprofile_ty;
        i integer;
        v_ip inet;
        v_remote_ip inet;
        v_remote_port INTEGER;
        v_transport_protocol_id smallint;
        v_customer_auth_normalized class4.customers_auth_normalized;
        v_destination class4.destinations%rowtype;
        v_dialpeer record;
        v_rateplan class4.rateplans%rowtype;
        v_dst_gw class4.gateways%rowtype;
        v_orig_gw class4.gateways%rowtype;
        v_rp class4.routing_plans%rowtype;
        v_customer_allowtime real;
        v_vendor_allowtime real;
        v_sorting_id integer;
        v_customer_acc integer;
        v_route_found boolean:=false;
        v_c_acc billing.accounts%rowtype;
        v_v_acc billing.accounts%rowtype;
        v_network sys.network_prefixes%rowtype;
        v_src_network sys.network_prefixes%rowtype;
        routedata record;
        
        v_rate NUMERIC;
        v_now timestamp;
        v_x_yeti_auth varchar;
        --  v_uri_domain varchar;
        v_rate_limit float:='Infinity'::float;
        v_destination_rate_limit float:='Infinity'::float;
        v_test_vendor_id integer;
        v_random float;
        v_max_call_length integer;
        v_routing_key varchar;
        v_lnp_key varchar;
        v_drop_call_if_lnp_fail boolean;
        v_lnp_rule class4.routing_plan_lnp_rules%rowtype;
        v_numberlist record;
        v_numberlist_item record;
        v_call_tags smallint[]:='{}'::smallint[];
        v_area_direction class4.routing_tag_detection_rules%rowtype;
        v_numberlist_size integer;
        v_lua_context switch19.lua_call_context;

      BEGIN
        

        perform id from sys.load_balancers where signalling_ip=host(i_remote_ip)::varchar;
        IF FOUND and i_x_orig_ip IS not NULL AND i_x_orig_port IS not NULL THEN
          v_remote_ip:=i_x_orig_ip;
          v_remote_port:=i_x_orig_port;
          v_transport_protocol_id=i_x_orig_protocol_id;
          
        else
          v_remote_ip:=i_remote_ip;
          v_remote_port:=i_remote_port;
          v_transport_protocol_id:=i_protocol_id;
          
        end if;

        v_now:=now();
        v_ret:=switch19.new_profile();
        v_ret.cache_time = 10;

        v_ret.diversion_in:=i_diversion;
        v_ret.diversion_out:=i_diversion; -- FIXME

        v_ret.auth_orig_protocol_id =v_transport_protocol_id;
        v_ret.auth_orig_ip = v_remote_ip;
        v_ret.auth_orig_port = v_remote_port;

        v_ret.src_name_in:=i_from_dsp;
        v_ret.src_name_out:=v_ret.src_name_in;

        v_ret.src_prefix_in:=i_from_name;
        v_ret.src_prefix_out:=v_ret.src_prefix_in;

        v_ret.dst_prefix_in:=i_uri_name;
        v_ret.dst_prefix_out:=v_ret.dst_prefix_in;


        v_ret.ruri_domain=i_uri_domain;
        v_ret.from_domain=i_from_domain;
        v_ret.to_domain=i_to_domain;

        v_ret.pai_in=i_pai;
        v_ret.ppi_in=i_ppi;
        v_ret.privacy_in=i_privacy;
        v_ret.rpid_in=i_rpid;
        v_ret.rpid_privacy_in=i_rpid_privacy;

        
        v_x_yeti_auth:=COALESCE(i_x_yeti_auth,'');
        --  v_uri_domain:=COALESCE(i_uri_domain,'');

        if i_auth_id is null then
            SELECT into v_customer_auth_normalized ca.*
            from class4.customers_auth_normalized ca
                JOIN public.contractors c ON c.id=ca.customer_id
            WHERE ca.enabled AND
              ca.ip>>=v_remote_ip AND
              prefix_range(ca.dst_prefix)@>prefix_range(v_ret.dst_prefix_in) AND
              prefix_range(ca.src_prefix)@>prefix_range(v_ret.src_prefix_in) AND
              (ca.pop_id=i_pop_id or ca.pop_id is null) and
              COALESCE(ca.x_yeti_auth,'')=v_x_yeti_auth AND
              COALESCE(nullif(ca.uri_domain,'')=i_uri_domain,true) AND
              COALESCE(nullif(ca.to_domain,'')=i_to_domain,true) AND
              COALESCE(nullif(ca.from_domain,'')=i_from_domain,true) AND
              (ca.transport_protocol_id is null or ca.transport_protocol_id=v_transport_protocol_id) AND
              length(v_ret.dst_prefix_in) between ca.dst_number_min_length and ca.dst_number_max_length and
              length(v_ret.src_prefix_in) between ca.src_number_min_length and ca.src_number_max_length and
              c.enabled and c.customer
            ORDER BY
                masklen(ca.ip) DESC,
                ca.transport_protocol_id is null,
                length(prefix_range(ca.dst_prefix)) DESC,
                length(prefix_range(ca.src_prefix)) DESC,
                ca.pop_id is null,
                ca.uri_domain is null,
                ca.to_domain is null,
                ca.from_domain is null,
                ca.require_incoming_auth
            LIMIT 1;
            IF NOT FOUND THEN
            
                v_ret.disconnect_code_id=110; --Cant find customer or customer locked
                RETURN NEXT v_ret;
                RETURN;
            END IF;
            if v_customer_auth_normalized.require_incoming_auth then
            
                v_ret.aleg_auth_required=true;
                RETURN NEXT v_ret;
                RETURN;
            end IF;
            if v_customer_auth_normalized.reject_calls then
            
                v_ret.disconnect_code_id=8004; -- call rejected by authorization

                v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
                v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

                v_ret.customer_id:=v_customer_auth_normalized.customer_id;
                select into strict v_ret.customer_external_id external_id from public.contractors where id=v_ret.customer_id;

                v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
                v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;

                v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
                SELECT INTO STRICT v_ret.customer_acc_external_id external_id FROM billing.accounts WHERE id=v_customer_auth_normalized.account_id;

                RETURN NEXT v_ret;
                RETURN;
            end if;
        else
            SELECT into v_customer_auth_normalized ca.*
            from class4.customers_auth_normalized ca
                JOIN public.contractors c ON c.id=ca.customer_id
            WHERE ca.enabled AND
              ca.ip>>=v_remote_ip AND
              prefix_range(ca.dst_prefix)@>prefix_range(v_ret.dst_prefix_in) AND
              prefix_range(ca.src_prefix)@>prefix_range(v_ret.src_prefix_in) AND
              (ca.pop_id=i_pop_id or ca.pop_id is null) and
              COALESCE(ca.x_yeti_auth,'')=v_x_yeti_auth AND
              COALESCE(nullif(ca.uri_domain,'')=i_uri_domain,true) AND
              COALESCE(nullif(ca.to_domain,'')=i_to_domain,true) AND
              COALESCE(nullif(ca.from_domain,'')=i_from_domain,true) AND
              (ca.transport_protocol_id is null or ca.transport_protocol_id=v_transport_protocol_id) AND
              length(v_ret.dst_prefix_in) between ca.dst_number_min_length and ca.dst_number_max_length and
              length(v_ret.src_prefix_in) between ca.src_number_min_length and ca.src_number_max_length and
              c.enabled and c.customer and
              ca.require_incoming_auth and gateway_id = i_auth_id
            ORDER BY
                masklen(ca.ip) DESC,
                ca.transport_protocol_id is null,
                length(prefix_range(ca.dst_prefix)) DESC,
                length(prefix_range(ca.src_prefix)) DESC,
                ca.pop_id is null,
                ca.uri_domain is null,
                ca.to_domain is null,
                ca.from_domain is null
            LIMIT 1;
            IF NOT FOUND THEN
            
                v_ret.disconnect_code_id=110; --Cant find customer or customer locked
                RETURN NEXT v_ret;
                RETURN;
            END IF;
            if v_customer_auth_normalized.reject_calls then
            
                v_ret.disconnect_code_id=8004; -- call rejected by authorization

                v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
                v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

                v_ret.customer_id:=v_customer_auth_normalized.customer_id;
                select into strict v_ret.customer_external_id external_id from public.contractors where id=v_ret.customer_id;

                v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
                v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;

                v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
                SELECT INTO STRICT v_ret.customer_acc_external_id external_id FROM billing.accounts WHERE id=v_customer_auth_normalized.account_id;

                RETURN NEXT v_ret;
                RETURN;
            end if;
        end IF;

        

        -- redefine call SRC/DST numbers

        IF v_customer_auth_normalized.src_name_field_id=1 THEN  /* default - from uri display name */
          v_ret.src_name_in:=i_from_dsp;
        END IF;
        v_ret.src_name_out:=v_ret.src_name_in;

        IF v_customer_auth_normalized.src_number_field_id=1 THEN  /* default - from uri userpart */
          v_ret.src_prefix_in:=i_from_name;
        ELSIF v_customer_auth_normalized.src_number_field_id=2 THEN /* From uri Display name */
          v_ret.src_prefix_in:=i_from_dsp;
        END IF;
        v_ret.src_prefix_out:=v_ret.src_prefix_in;

        IF v_customer_auth_normalized.dst_number_field_id=1 THEN /* default  - RURI userpart*/
          v_ret.dst_prefix_in:=i_uri_name;
        ELSIF v_customer_auth_normalized.dst_number_field_id=2 THEN /* TO URI userpart */
          v_ret.dst_prefix_in:=i_to_name;
        ELSIF v_customer_auth_normalized.dst_number_field_id=3 THEN /* Top-Most Diversion header userpart */
          v_ret.dst_prefix_in:=i_diversion;
        END IF;
        v_ret.dst_prefix_out:=v_ret.dst_prefix_in;


        -- feel customer data ;-)
        v_ret.dump_level_id:=v_customer_auth_normalized.dump_level_id;
        v_ret.customer_auth_id:=v_customer_auth_normalized.customers_auth_id;
        v_ret.customer_auth_external_id:=v_customer_auth_normalized.external_id;

        v_ret.customer_id:=v_customer_auth_normalized.customer_id;
        select into strict v_ret.customer_external_id external_id from public.contractors where id=v_customer_auth_normalized.customer_id;

        v_ret.rateplan_id:=v_customer_auth_normalized.rateplan_id;
        v_ret.routing_plan_id:=v_customer_auth_normalized.routing_plan_id;
        v_ret.customer_acc_id:=v_customer_auth_normalized.account_id;
        v_ret.orig_gw_id:=v_customer_auth_normalized.gateway_id;

        v_ret.radius_auth_profile_id=v_customer_auth_normalized.radius_auth_profile_id;
        v_ret.aleg_radius_acc_profile_id=v_customer_auth_normalized.radius_accounting_profile_id;
        v_ret.record_audio=v_customer_auth_normalized.enable_audio_recording;

        v_ret.customer_acc_check_balance=v_customer_auth_normalized.check_account_balance;

        SELECT INTO STRICT v_c_acc * FROM billing.accounts  WHERE id=v_customer_auth_normalized.account_id;
        v_ret.customer_acc_external_id=v_c_acc.external_id;
        v_ret.customer_acc_vat=v_c_acc.vat;
        v_destination_rate_limit=coalesce(v_c_acc.destination_rate_limit::float,'Infinity'::float);

        if v_customer_auth_normalized.check_account_balance AND v_c_acc.balance<=v_c_acc.min_balance then
          v_ret.disconnect_code_id=8000; --No enough customer balance
          RETURN NEXT v_ret;
          RETURN;
        end if;

        v_ret.customer_acc_external_id=v_c_acc.external_id;
        v_ret.customer_acc_vat=v_c_acc.vat;

        SELECT into v_orig_gw * from class4.gateways WHERE id=v_customer_auth_normalized.gateway_id;
        if not v_orig_gw.enabled then
          v_ret.disconnect_code_id=8005; -- Origination gateway is disabled
          RETURN NEXT v_ret;
          RETURN;
        end if;

        v_ret.resources:='';
        if v_customer_auth_normalized.capacity is not null then
          v_ret.resources:=v_ret.resources||'3:'||v_customer_auth_normalized.customers_auth_id||':'||v_customer_auth_normalized.capacity::varchar||':1;';
        end if;

        if v_c_acc.origination_capacity is not null then
          v_ret.resources:=v_ret.resources||'1:'||v_c_acc.id::varchar||':'||v_c_acc.origination_capacity::varchar||':1;';
        end if;

        if v_c_acc.total_capacity is not null then
          v_ret.resources:=v_ret.resources||'7:'||v_c_acc.id::varchar||':'||v_c_acc.total_capacity::varchar||':1;';
        end if;

        if v_orig_gw.origination_capacity is not null then
          v_ret.resources:=v_ret.resources||'4:'||v_orig_gw.id::varchar||':'||v_orig_gw.origination_capacity::varchar||':1;';
        end if;

        -- Tag processing CA
        v_call_tags=yeti_ext.tag_action(v_customer_auth_normalized.tag_action_id, v_call_tags, v_customer_auth_normalized.tag_action_value);

        /*
            number rewriting _Before_ routing
        */
        
        v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(v_ret.dst_prefix_out,v_customer_auth_normalized.dst_rewrite_rule,v_customer_auth_normalized.dst_rewrite_result);
        v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(v_ret.src_prefix_out,v_customer_auth_normalized.src_rewrite_rule,v_customer_auth_normalized.src_rewrite_result);
        v_ret.src_name_out=yeti_ext.regexp_replace_rand(v_ret.src_name_out,v_customer_auth_normalized.src_name_rewrite_rule,v_customer_auth_normalized.src_name_rewrite_result, true);

        --  if v_ret.radius_auth_profile_id is not null then
        v_ret.src_number_radius:=i_from_name;
        v_ret.dst_number_radius:=i_uri_name;
        v_ret.src_number_radius=yeti_ext.regexp_replace_rand(
            v_ret.src_number_radius,
            v_customer_auth_normalized.src_number_radius_rewrite_rule,
            v_customer_auth_normalized.src_number_radius_rewrite_result
        );

        v_ret.dst_number_radius=yeti_ext.regexp_replace_rand(
            v_ret.dst_number_radius,
            v_customer_auth_normalized.dst_number_radius_rewrite_rule,
            v_customer_auth_normalized.dst_number_radius_rewrite_result
        );
        v_ret.customer_auth_name=v_customer_auth_normalized."name";
        v_ret.customer_name=(select "name" from public.contractors where id=v_customer_auth_normalized.customer_id limit 1);
        --  end if;
/*
        if v_customer_auth_normalized.lua_script_id is not null then
          v_lua_context.src_name_in = v_ret.src_name_in;
	        v_lua_context.src_number_in = v_ret.src_prefix_in;
	        v_lua_context.dst_number_in = v_ret.dst_prefix_in;
	        v_lua_context.src_name_out = v_ret.src_name_out;
	        v_lua_context.src_number_out = v_ret.src_prefix_out;
	        v_lua_context.dst_number_out = v_ret.dst_prefix_out;
	        -- v_lua_context.src_name_routing
	        -- v_lua_context.src_number_routing
	        -- v_lua_context.dst_number_routing
          -- #arrays
	        -- v_lua_context.diversion_in
	        -- v_lua_context.diversion_routing
	        -- v_lua_context.diversion_out
          v_lua_context = switch19.lua_exec(v_customer_auth_normalized.lua_script_id, v_lua_context);
          v_ret.src_name_out =  v_lua_context.src_name_out;
          v_ret.src_prefix_out = v_lua_context.src_number_out;
          v_ret.dst_prefix_out = v_lua_context.dst_number_out;
        end if;
*/

        

        ----- Numberlist processing-------------------------------------------------------------------------------------------------------
        if v_customer_auth_normalized.dst_numberlist_id is not null then
          
          select into v_numberlist * from class4.numberlists where id=v_customer_auth_normalized.dst_numberlist_id;
          CASE v_numberlist.mode_id
            when 1 then -- strict match
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id and ni.key=v_ret.dst_prefix_out limit 1;
            when 2 then -- prefix match
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where
                  ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id and
                  prefix_range(ni.key)@>prefix_range(v_ret.dst_prefix_out) and
                  length(v_ret.dst_prefix_out) between ni.number_min_length and ni.number_max_length
                order by length(prefix_range(ni.key))
                desc limit 1;
            when 3 then -- random
                select into v_numberlist_size count(*) from class4.numberlist_items where numberlist_id=v_customer_auth_normalized.dst_numberlist_id;
                select into v_numberlist_item *
                from class4.numberlist_items ni
                where ni.numberlist_id=v_customer_auth_normalized.dst_numberlist_id order by ni.id OFFSET floor(random()*v_numberlist_size) limit 1;
          end case;
          
          IF v_numberlist_item.action_id is not null and v_numberlist_item.action_id=1 then
            
            v_ret.disconnect_code_id=8001; --destination blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is not null and v_numberlist_item.action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist_item.src_rewrite_rule,
                v_numberlist_item.src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist_item.dst_rewrite_rule,
                v_numberlist_item.dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist_item.tag_action_id, v_call_tags, v_numberlist_item.tag_action_value);
            -- pass call NOP.
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=1 then
            
            -- drop by default
            v_ret.disconnect_code_id=8001; --destination blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist.default_src_rewrite_rule,
                v_numberlist.default_src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist.default_dst_rewrite_rule,
                v_numberlist.default_dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist.tag_action_id, v_call_tags, v_numberlist.tag_action_value);
            -- pass by default
          end if;
        end if;

        if v_customer_auth_normalized.src_numberlist_id is not null then
          
          select into v_numberlist * from class4.numberlists where id=v_customer_auth_normalized.src_numberlist_id;
          CASE v_numberlist.mode_id
            when 1 then -- strict match
              select into v_numberlist_item * from class4.numberlist_items ni
              where ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id and ni.key=v_ret.src_prefix_out limit 1;
            when 2 then -- prefix match
              select into v_numberlist_item * from class4.numberlist_items ni
              where
                ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id and
                prefix_range(ni.key)@>prefix_range(v_ret.src_prefix_out) and
                length(v_ret.src_prefix_out) between ni.number_min_length and ni.number_max_length
              order by length(prefix_range(ni.key)) desc limit 1;
            when 3 then -- random
              select into v_numberlist_size count(*) from class4.numberlist_items where numberlist_id=v_customer_auth_normalized.src_numberlist_id;
              select into v_numberlist_item *
              from class4.numberlist_items ni
              where ni.numberlist_id=v_customer_auth_normalized.src_numberlist_id order by ni.id OFFSET floor(random()*v_numberlist_size) limit 1;
          end case;
          
          IF v_numberlist_item.action_id is not null and v_numberlist_item.action_id=1 then
            
            v_ret.disconnect_code_id=8002; --source blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is not null and v_numberlist_item.action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist_item.src_rewrite_rule,
                v_numberlist_item.src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist_item.dst_rewrite_rule,
                v_numberlist_item.dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist_item.tag_action_id, v_call_tags, v_numberlist_item.tag_action_value);
            -- pass call NOP.
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=1 then
            
            v_ret.disconnect_code_id=8002; --source blacklisted
            RETURN NEXT v_ret;
            RETURN;
          elsif v_numberlist_item.action_id is null and v_numberlist.default_action_id=2 then
            v_ret.src_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.src_prefix_out,
                v_numberlist.default_src_rewrite_rule,
                v_numberlist.default_src_rewrite_result
            );
            v_ret.dst_prefix_out=yeti_ext.regexp_replace_rand(
                v_ret.dst_prefix_out,
                v_numberlist.default_dst_rewrite_rule,
                v_numberlist.default_dst_rewrite_result
            );
            v_call_tags=yeti_ext.tag_action(v_numberlist.tag_action_id, v_call_tags, v_numberlist.tag_action_value);
            -- pass by default
          end if;
        end if;

        --  setting numbers used for routing & billing
        v_ret.src_prefix_routing=v_ret.src_prefix_out;
        v_ret.dst_prefix_routing=v_ret.dst_prefix_out;
        v_routing_key=v_ret.dst_prefix_out;

        -- Areas and Tag detection-------------------------------------------
        v_ret.src_area_id:=(
          select area_id from class4.area_prefixes where prefix_range(prefix)@>prefix_range(v_ret.src_prefix_routing)
          order by length(prefix_range(prefix)) desc limit 1
        );

        

        v_ret.dst_area_id:=(
          select area_id from class4.area_prefixes where prefix_range(prefix)@>prefix_range(v_ret.dst_prefix_routing)
          order by length(prefix_range(prefix)) desc limit 1
        );

        


        select into v_area_direction * from class4.routing_tag_detection_rules
        where
          (src_area_id is null OR src_area_id = v_ret.src_area_id) AND
          (dst_area_id is null OR dst_area_id = v_ret.dst_area_id) AND
          prefix_range(src_prefix) @> prefix_range(v_ret.src_prefix_routing) AND
          prefix_range(dst_prefix) @> prefix_range(v_ret.dst_prefix_routing) AND
          yeti_ext.tag_compare(routing_tag_ids, v_call_tags, routing_tag_mode_id ) > 0
        order by
          yeti_ext.tag_compare(routing_tag_ids, v_call_tags, routing_tag_mode_id) desc,
          length(prefix_range(v_ret.src_prefix_routing)) desc,
          length(prefix_range(v_ret.dst_prefix_routing)) desc,
          src_area_id is null,
          dst_area_id is null
        limit 1;
        if found then
            v_call_tags=yeti_ext.tag_action(v_area_direction.tag_action_id, v_call_tags, v_area_direction.tag_action_value);
        end if;

        v_ret.routing_tag_ids:=v_call_tags;

        
        ----------------------------------------------------------------------

        

        select into v_max_call_length,v_drop_call_if_lnp_fail max_call_duration,drop_call_if_lnp_fail from sys.guiconfig limit 1;

        v_routing_key=v_ret.dst_prefix_routing;
        SELECT INTO v_rp * from class4.routing_plans WHERE id=v_customer_auth_normalized.routing_plan_id;
        if v_rp.sorting_id=5 then -- route testing
          v_test_vendor_id=regexp_replace(v_routing_key,'(.*)\*(.*)','\1')::integer;
          v_routing_key=regexp_replace(v_routing_key,'(.*)\*(.*)','\2');
          v_ret.dst_prefix_out=v_routing_key;
          v_ret.dst_prefix_routing=v_routing_key;
        end if;

        if v_rp.use_lnp then
          select into v_lnp_rule rules.*
          from class4.routing_plan_lnp_rules rules
          WHERE prefix_range(rules.dst_prefix)@>prefix_range(v_ret.dst_prefix_routing) and rules.routing_plan_id=v_rp.id
          order by length(prefix_range(rules.dst_prefix)) limit 1;
          if found then
            v_ret.lnp_database_id=v_lnp_rule.database_id;
            v_lnp_key=v_ret.dst_prefix_routing;
            
            v_lnp_key=yeti_ext.regexp_replace_rand(v_lnp_key,v_lnp_rule.req_dst_rewrite_rule,v_lnp_rule.req_dst_rewrite_result);
            
            -- try cache
            select into v_ret.lrn lrn from class4.lnp_cache where dst=v_lnp_key AND database_id=v_lnp_rule.database_id and expires_at>v_now;
            if found then
              
              -- TRANSLATING response from cache
              v_ret.lrn=yeti_ext.regexp_replace_rand(v_ret.lrn,v_lnp_rule.lrn_rewrite_rule,v_lnp_rule.lrn_rewrite_result);
              
              v_routing_key=v_ret.lrn;
            else
              v_ret.lrn=switch19.lnp_resolve(v_ret.lnp_database_id,v_lnp_key);
              if v_ret.lrn is null then -- fail
                
                if v_drop_call_if_lnp_fail then
                  
                  v_ret.disconnect_code_id=8003; --No response from LNP DB
                  RETURN NEXT v_ret;
                  RETURN;
                end if;
              else
                
                -- TRANSLATING response from LNP DB
                v_ret.lrn=yeti_ext.regexp_replace_rand(v_ret.lrn,v_lnp_rule.lrn_rewrite_rule,v_lnp_rule.lrn_rewrite_result);
                
                v_routing_key=v_ret.lrn;
              end if;
            end if;
          end if;
        end if;



        
        v_src_network:=switch19.detect_network(v_ret.src_prefix_routing);
        v_ret.src_network_id=v_src_network.network_id;
        v_ret.src_country_id=v_src_network.country_id;

        v_network:=switch19.detect_network(v_ret.dst_prefix_routing);
        v_ret.dst_network_id=v_network.network_id;
        v_ret.dst_country_id=v_network.country_id;

        IF v_rp.validate_dst_number_network AND v_ret.dst_network_id is null THEN
          

          v_ret.disconnect_code_id=8007; --No network detected for DST number
          RETURN NEXT v_ret;
          RETURN;
        END IF;


        IF v_rp.validate_dst_number_format AND NOT (v_routing_key ~ '^[0-9]+$') THEN
          

          v_ret.disconnect_code_id=8008; --Invalid number format
          RETURN NEXT v_ret;
          RETURN;
        END IF;

        SELECT into v_destination d.*/*,switch.tracelog(d.*)*/
        FROM class4.destinations d
        JOIN class4.rate_plan_groups rpg ON d.rate_group_id=rpg.rate_group_id
        WHERE
          prefix_range(prefix)@>prefix_range(v_routing_key)
          AND length(v_routing_key) between d.dst_number_min_length and d.dst_number_max_length
          AND rpg.rateplan_id=v_customer_auth_normalized.rateplan_id
          AND enabled
          AND valid_from <= v_now
          AND valid_till >= v_now
          AND yeti_ext.tag_compare(d.routing_tag_ids, v_call_tags, d.routing_tag_mode_id)>0
        ORDER BY length(prefix_range(prefix)) DESC, yeti_ext.tag_compare(d.routing_tag_ids, v_call_tags) desc
        limit 1;
        IF NOT FOUND THEN
          
          v_ret.disconnect_code_id=111; --Cant find destination prefix
          RETURN NEXT v_ret;
          RETURN;
        END IF;
        

        v_ret.destination_id:=v_destination.id;
        v_ret.destination_prefix=v_destination.prefix;
        v_ret.destination_initial_interval:=v_destination.initial_interval;
        v_ret.destination_fee:=v_destination.connect_fee::varchar;
        v_ret.destination_next_interval:=v_destination.next_interval;
        v_ret.destination_rate_policy_id:=v_destination.rate_policy_id;
        v_ret.destination_reverse_billing:=v_destination.reverse_billing;
        IF v_destination.reject_calls THEN
          v_ret.disconnect_code_id=112; --Rejected by destination
          RETURN NEXT v_ret;
          RETURN;
        END IF;

        if v_destination.next_rate::float>v_destination_rate_limit then
          v_ret.disconnect_code_id=8006; -- No destination with appropriate rate found
          RETURN NEXT v_ret;
          RETURN;
        end if;

        select into v_rateplan * from class4.rateplans where id=v_customer_auth_normalized.rateplan_id;
        if COALESCE(v_destination.profit_control_mode_id,v_rateplan.profit_control_mode_id)=2 then -- per call
          v_rate_limit=v_destination.next_rate::float;
        end if;


        /*
                    FIND dialpeers logic. Queries must use prefix index for best performance
        */
        
        CASE v_rp.sorting_id
          WHEN'1' THEN -- LCR,Prio, ACD&ASR control
          FOR routedata IN (
            WITH step1 AS(
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.lcr_rate_multiplier AS dp_lcr_rate_multiplier,
                  t_dp.priority AS dp_priority,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id = t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            from step1
            WHERE
              r=1
              and exclusive_rank=1
              AND dp_next_rate<=v_rate_limit
              AND dp_enabled
              and not dp_locked --ACD&ASR control for DP
            ORDER BY dp_next_rate*dp_lcr_rate_multiplier, dp_priority DESC
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            
          end LOOP;
          WHEN '2' THEN --LCR, no prio, No ACD&ASR control
          FOR routedata IN (
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  --  (t_vendor_gateway.*)::class4.gateways as s1_vendor_gateway,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id)>0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              AND dp_enabled
              and dp_next_rate<=v_rate_limit
            ORDER BY dp_metric
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            
          END LOOP;
          WHEN '3' THEN --Prio, LCR, ACD&ASR control
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                    ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                    ) as exclusive_rank,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
              and not dp_locked
            ORDER BY dp_metric_priority DESC, dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            
          END LOOP;
          WHEN'4' THEN -- LCRD, Prio, ACD&ACR control
          FOR routedata IN (
            WITH step1 AS(
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  ((t_dp.next_rate - first_value(t_dp.next_rate) OVER(ORDER BY t_dp.next_rate ASC)) > v_rp.rate_delta_max)::INTEGER *(t_dp.next_rate + t_dp.priority) - t_dp.priority AS r2,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id = t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id)>0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            from step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_next_rate <= v_rate_limit
              and dp_enabled
              and not dp_locked --ACD&ASR control for DP
            ORDER BY r2 ASC
            LIMIT v_rp.max_rerouting_attempts
          ) LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            
          end LOOP;
          WHEN'5' THEN -- Route test
          FOR routedata IN (
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  and t_dp.vendor_id=v_test_vendor_id
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and dp_enabled
              and dp_next_rate<=v_rate_limit
            ORDER BY dp_metric_priority DESC, dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            
          END LOOP;
          WHEN'6' THEN -- QD.Static,LCR,ACD&ACR control
          v_random:=random();
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY length(prefix_range(coalesce(rpsr.prefix,''))) desc
                  ) as r2,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.locked as dp_locked,
                  t_dp.enabled as dp_enabled,
                  t_dp.force_hit_rate as dp_force_hit_rate,
                  rpsr.priority as rpsr_priority,
                  rpsr.weight as rpsr_weight
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                  left join class4.routing_plan_static_routes rpsr
                    ON rpsr.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                      and rpsr.vendor_id=t_dp.vendor_id
                      AND prefix_range(rpsr.prefix)@>prefix_range(v_routing_key)
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and r2=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
              and not dp_locked
            ORDER BY
              coalesce(v_random<=dp_force_hit_rate,false) desc,
              rpsr_priority,
              yeti_ext.rank_dns_srv(rpsr_weight) over ( partition by rpsr_priority order by rpsr_weight),
              dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            
          END LOOP;
          WHEN'7' THEN -- QD.Static, No ACD&ACR control
          v_random:=random();
          FOR routedata in(
            WITH step1 AS( -- filtering
                SELECT
                  (t_dp.*)::class4.dialpeers as s1_dialpeer,
                  (t_vendor_account.*)::billing.accounts as s1_vendor_account,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY
                      length(prefix_range(t_dp.prefix)) desc,
                      yeti_ext.tag_compare(t_dp.routing_tag_ids, v_call_tags, t_dp.routing_tag_mode_id) desc,
                      t_dp.exclusive_route desc -- in case when we have two identical prefixes with different exclusive flag value, we should lift up exclusive route, otherwise it will be filtered at WHERE r=1  and exclusive_rank=1
                  ) as r,
                  rank() OVER (
                    ORDER BY t_dp.exclusive_route desc -- force top rank for exclusive route
                  ) as exclusive_rank,
                  rank() OVER (
                    PARTITION BY t_dp.vendor_id, t_dp.routeset_discriminator_id
                    ORDER BY length(prefix_range(coalesce(rpsr.prefix,''))) desc
                  ) as r2,
                  t_dp.priority as dp_metric_priority,
                  t_dp.next_rate*t_dp.lcr_rate_multiplier as dp_metric,
                  t_dp.next_rate as dp_next_rate,
                  t_dp.enabled as dp_enabled,
                  t_dp.force_hit_rate as dp_force_hit_rate,
                  rpsr.priority as rpsr_priority,
                  rpsr.weight as rpsr_weight
                FROM class4.dialpeers t_dp
                  JOIN billing.accounts t_vendor_account ON t_dp.account_id=t_vendor_account.id
                  join public.contractors t_vendor on t_dp.vendor_id=t_vendor.id
                  JOIN class4.routing_plan_groups t_rpg ON t_dp.routing_group_id=t_rpg.routing_group_id
                  join class4.routing_plan_static_routes rpsr
                    ON rpsr.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                      and rpsr.vendor_id=t_dp.vendor_id
                      AND prefix_range(rpsr.prefix)@>prefix_range(v_routing_key)
                WHERE
                  prefix_range(t_dp.prefix)@>prefix_range(v_routing_key)
                  AND length(v_routing_key) between t_dp.dst_number_min_length and t_dp.dst_number_max_length
                  AND t_rpg.routing_plan_id=v_customer_auth_normalized.routing_plan_id
                  and t_dp.valid_from<=v_now
                  and t_dp.valid_till>=v_now
                  AND t_vendor_account.balance<t_vendor_account.max_balance
                  and t_vendor.enabled and t_vendor.vendor
                  AND yeti_ext.tag_compare(t_dp.routing_tag_ids,v_call_tags, t_dp.routing_tag_mode_id) > 0
            )
            SELECT s1_dialpeer as s2_dialpeer,
                  s1_vendor_account as s2_vendor_account
            FROM step1
            WHERE
              r=1
              and exclusive_rank=1
              and r2=1
              and dp_next_rate<=v_rate_limit
              and dp_enabled
            ORDER BY
              coalesce(v_random<=dp_force_hit_rate,false) desc,
              rpsr_priority,
              yeti_ext.rank_dns_srv(rpsr_weight) over ( partition by rpsr_priority order by rpsr_weight),
              dp_metric
            LIMIT v_rp.max_rerouting_attempts
          )LOOP
            RETURN QUERY
            /*rel{*/SELECT * from process_dp_release(v_ret,v_destination,routedata.s2_dialpeer,v_c_acc,v_orig_gw,routedata.s2_vendor_account,i_pop_id,v_customer_auth_normalized.send_billing_information,v_max_call_length);/*}rel*/
            
          END LOOP;

        ELSE
          RAISE NOTICE 'BUG: unknown sorting_id';
        END CASE;
        
        v_ret.disconnect_code_id=113; --No routes
        RETURN NEXT v_ret;
        
        RETURN;
      END;
      $_$;


--
-- Name: tracelog(class4.destinations); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.tracelog(i_in class4.destinations) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RAISE INFO'switch19.tracelog: % : %',clock_timestamp()::char(25),i_in;
END;
$$;


--
-- Name: tracelog(class4.dialpeers); Type: FUNCTION; Schema: switch19; Owner: -
--

CREATE FUNCTION switch19.tracelog(i_in class4.dialpeers) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RAISE INFO 'switch19.tracelog: % : %',clock_timestamp()::char(25),i_in;
END;
$$;


--
-- Name: cdr_createtable(integer); Type: FUNCTION; Schema: sys; Owner: -
--

CREATE FUNCTION sys.cdr_createtable(i_offset integer) RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$
DECLARE
v_tbname varchar;
v_ftbname varchar;
v_tdate varchar;
v_start varchar;
v_end varchar;
v_c integer;
v_sql varchar;

BEGIN
        -- get tablename for next month;
        v_tdate:=to_char(now()+'1 month'::interval - i_offset * '1 month'::interval ,'YYYYMM');
        v_start:=to_char(now()+'1 month'::interval - i_offset * '1 month'::interval ,'YYYY-MM-01');
        v_end:=to_char(now()+'2 month'::interval - i_offset * '1 month'::interval,'YYYY-MM-01');

        v_tbname:='cdrs_'||v_tdate;
        v_ftbname:='class4.'||v_tbname::varchar;
        
        -- CHECK if table exists
        SELECT into v_c count(*) from pg_tables where schemaname='class4' and tablename=v_tbname;
        IF v_c>0 THEN
                RAISE NOTICE 'sys.cdr_createtable: next table % already created',v_tbname;
                RETURN;
        ELSE
                v_sql:='CREATE TABLE '||v_ftbname||'(
                CONSTRAINT '||v_tbname||'_time_start_check CHECK (
                        time_start >= '''||v_start||'''::date
                        AND time_start < '''||v_end||'''::date
                )
                ) INHERITS (class4.cdrs)';
                EXECUTE v_sql;
                v_sql:='ALTER TABLE '||v_ftbname||' ADD PRIMARY KEY(id)';
                EXECUTE v_sql;
                RAISE NOTICE 'sys.cdr_createtable: next table % creating started',v_tbname;
                PERFORM sys.cdr_reindex(v_tbname);
                -- update trigger
                INSERT INTO sys.cdr_tables(date_start,date_stop,"name",writable,readable) VALUES (v_start,v_end,v_ftbname,'t','t');
                PERFORM sys.cdrtable_tgr_reload();
        END IF;
END;
$$;


--
-- Name: cdr_drop_table(character varying); Type: FUNCTION; Schema: sys; Owner: -
--

CREATE FUNCTION sys.cdr_drop_table(i_tbname character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
v_t record;
BEGIN
    SELECT INTO v_t * from sys.cdr_tables WHERE "name"=i_tbname;
    IF FOUND THEN
        if v_t.writable THEN
            RAISE EXCEPTION 'sys.cdr_drop_table: table used, cant drop.';
        ELSE
            EXECUTE 'DROP TABLE '||v_t.name;
            DELETE FROM sys.cdr_tables where id=v_t.id;
            PERFORM cdrtable_tgr_reload();
        END IF;
    END IF;
END;
$$;


--
-- Name: cdr_export_data(character varying); Type: FUNCTION; Schema: sys; Owner: -
--

CREATE FUNCTION sys.cdr_export_data(i_tbname character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_file varchar:='/var/spool/yeti-rs/';
BEGIN
    v_file:=v_file||i_tbname||'-'||now()::varchar;
    execute 'COPY '||i_tbname||' TO '''||v_file||''' WITH CSV HEADER QUOTE AS ''"'' FORCE QUOTE *';
END;
$$;


--
-- Name: cdr_export_data(character varying, character varying); Type: FUNCTION; Schema: sys; Owner: -
--

CREATE FUNCTION sys.cdr_export_data(i_tbname character varying, i_dir character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_file varchar;
BEGIN
    v_file:=i_dir||'/'||i_tbname||'-'||now()::varchar;
    execute 'COPY '||i_tbname||' TO '''||v_file||''' WITH CSV HEADER QUOTE AS ''"'' FORCE QUOTE *';
END;
$$;


--
-- Name: cdr_reindex(character varying); Type: FUNCTION; Schema: sys; Owner: -
--

CREATE FUNCTION sys.cdr_reindex(i_tbname character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
v_c integer;
v_sql varchar;
v_indname varchar;
v_chname varchar:='class4';
BEGIN
        SELECT into v_c count(*) from pg_tables where schemaname='class4' and tablename=i_tbname;
        IF v_c=0 THEN
                RAISE EXCEPTION 'sys.cdr_reindex: table % not exist',i_tbname;
        ELSE
                -- CHECK primary key
                SELECT into v_indname conname from pg_catalog.pg_constraint  where conname like i_tbname||'_pkey%';
                IF NOT FOUND THEN
                        v_sql:='ALTER TABLE '||i_tbname||' ADD PRIMARY KEY (id);';
                        EXECUTE v_sql;
                        RAISE NOTICE 'sys.cdr_reindex: % add primary key' ,i_tbname;
                END IF;
/*
                -- UNIQUE index on out_call_id;
                SELECT into v_indname indexname FROM pg_catalog.pg_indexes WHERE schemaname=v_chname AND tablename=i_tbname AND indexdef LIKE '%(out_call_id)%';
                IF NOT FOUND THEN
                        v_sql:='CREATE UNIQUE INDEX ON '||v_chname||'.'||i_tbname||' USING btree (out_call_id);';
                        RAISE NOTICE 'sys.cdr_reindex: % add index out_call_id' ,i_tbname;
                        EXECUTE v_sql;
                ELSE
                        v_sql:='CREATE UNIQUE INDEX ON '||v_chname||'.'||i_tbname||' USING btree (out_call_id);';
                        EXECUTE v_sql;
                        v_sql:='DROP INDEX cdrs.'||v_indname;
                        EXECUTE v_sql;
                        RAISE NOTICE 'sys.cdr_reindex: % reindex out_call_id' ,i_tbname;
                END IF;
*/
                -- index on time_inviteprocessed;
                SELECT into v_indname indexname FROM pg_catalog.pg_indexes WHERE schemaname=v_chname AND tablename=i_tbname AND indexdef LIKE '%(time_start)%';
                IF NOT FOUND THEN
                        v_sql:='CREATE INDEX ON '||v_chname||'.'||i_tbname||' USING btree (time_start);';
                        EXECUTE v_sql;
                        RAISE NOTICE 'sys.cdr_reindex: % add index time_start' ,i_tbname;
                ELSE
                        v_sql:='CREATE INDEX ON '||v_chname||'.'||i_tbname||' USING btree (time_start);';
                        EXECUTE v_sql;
                        v_sql:='DROP INDEX cdrs.'||v_indname;
                        EXECUTE v_sql;
                        RAISE NOTICE 'sys.cdr_reindex: % reindex time_invite' ,i_tbname;
                END IF;

        END IF;
        RETURN ;
END;
$$;


--
-- Name: cdrtable_tgr_reload(); Type: FUNCTION; Schema: sys; Owner: -
--

CREATE FUNCTION sys.cdrtable_tgr_reload() RETURNS void
    LANGUAGE plpgsql
    AS $_$
DECLARE
v_tbname varchar;
v_sql1 varchar:='CREATE OR REPLACE FUNCTION class4.cdrs_i_tgf() RETURNS trigger AS $trg$ 
BEGIN  [MEAT]  
RETURN NULL; 
END; $trg$ LANGUAGE plpgsql VOLATILE COST 100';
--v_sql2 varchar:='ALTER FUNCTION cdrs.cdrs_i_tgf() OWNER TO accadmin;';
v_tb_row record;
v_meat varchar;
v_prfx varchar;
v_counter integer;
BEGIN
        v_meat:='';
        v_counter:='1';
        PERFORM * FROM sys.cdr_tables WHERE writable='t';
        IF NOT FOUND THEN
            RAISE EXCEPTION 'no tables for write data';
        end IF;
        FOR v_tb_row IN SELECT * FROM sys.cdr_tables WHERE writable='t' ORDER BY date_start LOOP
                IF v_counter=1 THEN
                        v_prfx='IF ';
                ELSE 
                        v_prfx='ELSIF ';
                END IF;
                v_meat:=v_meat||v_prfx||'( NEW.time_start >= DATE '''||v_tb_row.date_start||''' AND NEW.time_start < DATE '''||v_tb_row.date_stop||''' ) THEN INSERT INTO '||v_tb_row.name||' VALUES (NEW.*);'|| E'\n';
                v_counter:=v_counter+1;
        END LOOP;
        v_meat:=v_meat||' ELSE '|| E'\n'||' RAISE EXCEPTION ''class4.cdrs_i_tg: time_start out of range.''; '||E'\n'||' END IF;';
        v_sql1:=REPLACE(v_sql1,'[MEAT]',v_meat);
        set standard_conforming_strings=on;
        EXECUTE v_sql1;
      --  EXECUTE v_sql2;
        RAISE NOTICE 'sys.cdrtable_tgr_reload: CDR trigger reloaded';
       -- RETURN 'OK';
END;
$_$;


--
-- Name: checkcode(); Type: FUNCTION; Schema: sys; Owner: -
--

CREATE FUNCTION sys.checkcode() RETURNS TABLE(o_schema character varying, o_name character varying, o_hash character varying)
    LANGUAGE plpgsql COST 10
    AS $$
DECLARE
BEGIN 
RETURN QUERY
SELECT pn.nspname::varchar,
pp.proname::varchar,
md5(pp.prosrc)::varchar
from pg_proc pp 
join pg_namespace pn on pp.pronamespace=pn.oid
join pg_roles pa ON pa.oid=proowner
WHERE pn.nspname !~ '^pg_' AND 
pn.nspname <> 'information_schema' AND
pa.rolname=current_user
ORDER BY pn.nspname,pp.proname,pp.proargtypes;
END;
$$;


--
-- Name: checkstat(); Type: FUNCTION; Schema: sys; Owner: -
--

CREATE FUNCTION sys.checkstat() RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
DECLARE
        v_lock record;
BEGIN 
        /* DP  locking*/
        FOR v_lock IN SELECT  dp.id AS id,
                                dp.asr_limit AS asr_limit,
                                dp.acd_limit as acd_limit,
                                dp.vendor_id as vendor_id,
                                st.asr as asr,
                                st.acd as acd
                        FROM class4.dialpeers dp LEFT JOIN runtime_stats.dialpeers_stats st
                        ON dp.id=st.dialpeer_id
                        WHERE   (dp.asr_limit>0 AND asr<asr_limit AND NOT dp.locked) OR
                                (dp.acd_limit>0 AND acd<acd_limit AND NOT dp.locked) OR
                                (dp.locked AND st.asr IS NULL)
        LOOP
                IF NOT v_lock.locked THEN
                        -- locking
                        IF v_lock.asr<v_lock.asr_limit THEN
                                --process asr
                                --sys.dplock_event(v_lock,asr);
                        ELSE 
                                --sys.dplock_event(v_lock,acd);
                                --process acd
                        END IF;
                        UPDATE runtime_stats.dialpeers_stats set locked_at=now() where id=v_lock.id;
                        UPDATE class4.dialpeers set locked='t' where id=v_lock.id;
                 ELSE
                        --unlocking if good quality or stats not found
                        IF v_lock.asr>=v_lock.asr_limit OR v_lock.acd>=v_lock.acd_limit OR v_lock.asr IS NULL THEN
                                UPDATE runtime_stats.dialpeers_stats set unlocked_at=now() where id=v_lock.id;
                                UPDATE class4.dialpeers set locked='f' where id=v_lock.id;
                        END IF;
                 END IF;
        END LOOP;

        /* GW locking */
        FOR v_lock IN SELECT    gw.id AS id,
                                gw.asr_limit AS asr_limit,
                                gw.acd_limit as acd_limit,
                                gw.contractor_id AS contractor_id,
                                st.asr as asr,
                                st.acd as acd
                        FROM class4.gateways gw JOIN runtime_stats.gateways_stats st
                        ON gw.id=st.gateway_id
                        WHERE acd<acd_limit OR acd<acd_limit and not gw.locked
        LOOP
                IF v_lock.asr<v_lock.asr_limit THEN
                        --process asr
                ELSE 
                        --process acd
                END IF;
                UPDATE runtime_stats.gateways_stats set locked_at=now() where id=v_lock.id;
                UPDATE class4.gateways set locked='t' where id=v_lock.id;
        END LOOP;

        --FOR v_id in SELECT id from runtime_stats.dialpeers_stats WHERE locked)

END;
$$;


--
-- Name: codecheck(); Type: FUNCTION; Schema: sys; Owner: -
--

CREATE FUNCTION sys.codecheck() RETURNS TABLE(o_schema character varying, o_name character varying, o_hash character varying)
    LANGUAGE plpgsql COST 10
    AS $$
DECLARE
BEGIN 
RETURN QUERY
SELECT pn.nspname::varchar,
pp.proname::varchar,
md5(pp.prosrc)::varchar
from pg_proc pp 
join pg_namespace pn on pp.pronamespace=pn.oid
join pg_roles pa ON pa.oid=proowner
WHERE pn.nspname !~ '^pg_' AND 
pn.nspname <> 'information_schema' AND
pa.rolname=current_user
ORDER BY pn.nspname,pp.proname;
END;
$$;


--
-- Name: hex_to_int(text); Type: FUNCTION; Schema: sys; Owner: -
--

CREATE FUNCTION sys.hex_to_int(i_hex text, OUT o_dec integer) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$ 
BEGIN 
    EXECUTE 'SELECT x''' || i_hex || '''::integer' INTO o_dec; 
    RETURN; 
END $$;


--
-- Name: logic_log(character varying, integer, character varying); Type: FUNCTION; Schema: sys; Owner: -
--

CREATE FUNCTION sys.logic_log(i_source character varying, i_level integer, i_msg character varying) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
DECLARE
BEGIN
    --TODO: loglevel checking;
    INSERT INTO logs.logic_log(source,txid,"level",msg,"timestamp") values (i_source,txid_current(),i_level,i_msg,clock_timestamp());
END;
$$;


--
-- Name: version_check(integer); Type: FUNCTION; Schema: sys; Owner: -
--

CREATE FUNCTION sys.version_check(i_ver integer) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
DECLARE
v_num integer;
BEGIN 
    select into v_num "number" from sys.version ORDER BY "number" desc limit 1;
    if v_num=i_ver THEN
        RETURN;
    END IF;
    RAISE EXCEPTION 'Invalid version';
END;
$$;


--
-- Name: version_up(integer, character varying); Type: FUNCTION; Schema: sys; Owner: -
--

CREATE FUNCTION sys.version_up(i_ver integer, i_comment character varying) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
DECLARE
v_num integer;
BEGIN 
    select into v_num "number" from sys.version ORDER BY "number" desc limit 1;
    if NOT FOUND THEN
        RAISE WARNING 'first verstion';
    ELSE
        if v_num>i_ver THEN
            RAISE EXCEPTION 'database version too high';
        end if;
    END IF;
    INSERT INTO sys.version("number","comment") values(i_ver,i_comment);
END;
$$;


--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: billing; Owner: -
--

CREATE SEQUENCE billing.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: -
--

ALTER SEQUENCE billing.accounts_id_seq OWNED BY billing.accounts.id;


--
-- Name: cdr_batches; Type: TABLE; Schema: billing; Owner: -
--

CREATE TABLE billing.cdr_batches (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    size integer NOT NULL,
    raw_data text
);


--
-- Name: invoice_periods; Type: TABLE; Schema: billing; Owner: -
--

CREATE TABLE billing.invoice_periods (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: invoice_periods_id_seq; Type: SEQUENCE; Schema: billing; Owner: -
--

CREATE SEQUENCE billing.invoice_periods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invoice_periods_id_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: -
--

ALTER SEQUENCE billing.invoice_periods_id_seq OWNED BY billing.invoice_periods.id;


--
-- Name: invoice_templates; Type: TABLE; Schema: billing; Owner: -
--

CREATE TABLE billing.invoice_templates (
    id integer NOT NULL,
    name character varying NOT NULL,
    filename character varying NOT NULL,
    data bytea,
    sha1 character varying,
    created_at timestamp with time zone
);


--
-- Name: invoices_templates_id_seq; Type: SEQUENCE; Schema: billing; Owner: -
--

CREATE SEQUENCE billing.invoices_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invoices_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: -
--

ALTER SEQUENCE billing.invoices_templates_id_seq OWNED BY billing.invoice_templates.id;


--
-- Name: payments; Type: TABLE; Schema: billing; Owner: -
--

CREATE TABLE billing.payments (
    account_id integer NOT NULL,
    amount numeric NOT NULL,
    notes character varying,
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: billing; Owner: -
--

CREATE SEQUENCE billing.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: -
--

ALTER SEQUENCE billing.payments_id_seq OWNED BY billing.payments.id;


--
-- Name: area_prefixes; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.area_prefixes (
    id bigint NOT NULL,
    area_id integer NOT NULL,
    prefix character varying NOT NULL
);


--
-- Name: area_prefixes_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.area_prefixes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: area_prefixes_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.area_prefixes_id_seq OWNED BY class4.area_prefixes.id;


--
-- Name: areas; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.areas (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.areas_id_seq OWNED BY class4.areas.id;


--
-- Name: numberlist_items; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.numberlist_items (
    id integer NOT NULL,
    numberlist_id smallint NOT NULL,
    key character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    action_id smallint,
    src_rewrite_rule character varying,
    src_rewrite_result character varying,
    dst_rewrite_rule character varying,
    dst_rewrite_result character varying,
    tag_action_id smallint,
    tag_action_value smallint[] DEFAULT '{}'::smallint[] NOT NULL,
    number_min_length smallint DEFAULT 0 NOT NULL,
    number_max_length smallint DEFAULT 100 NOT NULL,
    lua_script_id smallint,
    CONSTRAINT numberlist_items_max_number_length CHECK ((number_max_length >= 0)),
    CONSTRAINT numberlist_items_min_number_length CHECK ((number_min_length >= 0))
);


--
-- Name: blacklist_items_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.blacklist_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blacklist_items_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.blacklist_items_id_seq OWNED BY class4.numberlist_items.id;


--
-- Name: numberlists; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.numberlists (
    id smallint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    mode_id smallint DEFAULT 1 NOT NULL,
    default_action_id smallint DEFAULT 1 NOT NULL,
    default_src_rewrite_rule character varying,
    default_src_rewrite_result character varying,
    default_dst_rewrite_rule character varying,
    default_dst_rewrite_result character varying,
    tag_action_id smallint,
    tag_action_value smallint[] DEFAULT '{}'::smallint[] NOT NULL,
    lua_script_id smallint,
    external_id bigint
);


--
-- Name: blacklists_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.blacklists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blacklists_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.blacklists_id_seq OWNED BY class4.numberlists.id;


--
-- Name: codec_group_codecs; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.codec_group_codecs (
    id integer NOT NULL,
    codec_group_id integer NOT NULL,
    codec_id integer NOT NULL,
    priority integer DEFAULT 100 NOT NULL,
    dynamic_payload_type integer,
    format_parameters character varying
);


--
-- Name: codec_group_codecs_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.codec_group_codecs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: codec_group_codecs_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.codec_group_codecs_id_seq OWNED BY class4.codec_group_codecs.id;


--
-- Name: codec_groups; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.codec_groups (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: codec_groups_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.codec_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: codec_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.codec_groups_id_seq OWNED BY class4.codec_groups.id;


--
-- Name: codecs; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.codecs (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: codecs_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.codecs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: codecs_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.codecs_id_seq OWNED BY class4.codecs.id;


--
-- Name: customers_auth; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.customers_auth (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    rateplan_id integer NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    account_id integer,
    gateway_id integer NOT NULL,
    src_rewrite_rule character varying,
    src_rewrite_result character varying,
    dst_rewrite_rule character varying,
    dst_rewrite_result character varying,
    name character varying NOT NULL,
    dump_level_id integer DEFAULT 0 NOT NULL,
    capacity smallint,
    pop_id integer,
    src_name_rewrite_rule character varying,
    src_name_rewrite_result character varying,
    diversion_policy_id integer DEFAULT 1 NOT NULL,
    diversion_rewrite_rule character varying,
    diversion_rewrite_result character varying,
    dst_numberlist_id smallint,
    src_numberlist_id smallint,
    routing_plan_id integer NOT NULL,
    allow_receive_rate_limit boolean DEFAULT false NOT NULL,
    send_billing_information boolean DEFAULT false NOT NULL,
    radius_auth_profile_id smallint,
    enable_audio_recording boolean DEFAULT false NOT NULL,
    src_number_radius_rewrite_rule character varying,
    src_number_radius_rewrite_result character varying,
    dst_number_radius_rewrite_rule character varying,
    dst_number_radius_rewrite_result character varying,
    radius_accounting_profile_id smallint,
    transport_protocol_id smallint,
    dst_number_max_length smallint DEFAULT 100 NOT NULL,
    check_account_balance boolean DEFAULT true NOT NULL,
    require_incoming_auth boolean DEFAULT false NOT NULL,
    dst_number_min_length smallint DEFAULT 0 NOT NULL,
    tag_action_id smallint,
    tag_action_value smallint[] DEFAULT '{}'::smallint[] NOT NULL,
    ip inet[] DEFAULT '{127.0.0.0/8}'::inet[],
    src_prefix character varying[] DEFAULT '{""}'::character varying[],
    dst_prefix character varying[] DEFAULT '{""}'::character varying[],
    uri_domain character varying[] DEFAULT '{}'::character varying[],
    from_domain character varying[] DEFAULT '{}'::character varying[],
    to_domain character varying[] DEFAULT '{}'::character varying[],
    x_yeti_auth character varying[] DEFAULT '{}'::character varying[],
    external_id bigint,
    reject_calls boolean DEFAULT false NOT NULL,
    src_number_max_length smallint DEFAULT 100 NOT NULL,
    src_number_min_length smallint DEFAULT 0 NOT NULL,
    lua_script_id smallint,
    src_number_field_id smallint DEFAULT 1 NOT NULL,
    src_name_field_id smallint DEFAULT 1 NOT NULL,
    dst_number_field_id smallint DEFAULT 1 NOT NULL,
    CONSTRAINT ip_not_empty CHECK ((ip <> '{}'::inet[]))
);


--
-- Name: customers_auth_dst_number_fields; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.customers_auth_dst_number_fields (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: customers_auth_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.customers_auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_auth_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.customers_auth_id_seq OWNED BY class4.customers_auth.id;


--
-- Name: customers_auth_normalized; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.customers_auth_normalized (
    id integer NOT NULL,
    customers_auth_id integer NOT NULL,
    customer_id integer NOT NULL,
    rateplan_id integer NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    ip inet NOT NULL,
    account_id integer,
    gateway_id integer NOT NULL,
    src_rewrite_rule character varying,
    src_rewrite_result character varying,
    dst_rewrite_rule character varying,
    dst_rewrite_result character varying,
    src_prefix character varying DEFAULT ''::character varying NOT NULL,
    dst_prefix character varying DEFAULT ''::character varying NOT NULL,
    x_yeti_auth character varying,
    name character varying NOT NULL,
    dump_level_id integer DEFAULT 0 NOT NULL,
    capacity smallint,
    pop_id integer,
    uri_domain character varying,
    src_name_rewrite_rule character varying,
    src_name_rewrite_result character varying,
    diversion_policy_id integer DEFAULT 1 NOT NULL,
    diversion_rewrite_rule character varying,
    diversion_rewrite_result character varying,
    dst_numberlist_id smallint,
    src_numberlist_id smallint,
    routing_plan_id integer NOT NULL,
    allow_receive_rate_limit boolean DEFAULT false NOT NULL,
    send_billing_information boolean DEFAULT false NOT NULL,
    radius_auth_profile_id smallint,
    enable_audio_recording boolean DEFAULT false NOT NULL,
    src_number_radius_rewrite_rule character varying,
    src_number_radius_rewrite_result character varying,
    dst_number_radius_rewrite_rule character varying,
    dst_number_radius_rewrite_result character varying,
    radius_accounting_profile_id smallint,
    from_domain character varying,
    to_domain character varying,
    transport_protocol_id smallint,
    dst_number_min_length smallint DEFAULT 0 NOT NULL,
    dst_number_max_length smallint DEFAULT 100 NOT NULL,
    check_account_balance boolean DEFAULT true NOT NULL,
    require_incoming_auth boolean DEFAULT false NOT NULL,
    tag_action_id smallint,
    tag_action_value smallint[] DEFAULT '{}'::smallint[] NOT NULL,
    external_id bigint,
    reject_calls boolean DEFAULT false NOT NULL,
    src_number_max_length smallint DEFAULT 100 NOT NULL,
    src_number_min_length smallint DEFAULT 0 NOT NULL,
    lua_script_id smallint,
    src_number_field_id smallint DEFAULT 1 NOT NULL,
    src_name_field_id smallint DEFAULT 1 NOT NULL,
    dst_number_field_id smallint DEFAULT 1 NOT NULL,
    CONSTRAINT customers_auth_max_dst_number_length CHECK ((dst_number_min_length >= 0)),
    CONSTRAINT customers_auth_max_src_number_length CHECK ((src_number_max_length >= 0)),
    CONSTRAINT customers_auth_min_dst_number_length CHECK ((dst_number_min_length >= 0)),
    CONSTRAINT customers_auth_min_src_number_length CHECK ((src_number_min_length >= 0))
);


--
-- Name: customers_auth_normalized_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.customers_auth_normalized_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_auth_normalized_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.customers_auth_normalized_id_seq OWNED BY class4.customers_auth_normalized.id;


--
-- Name: customers_auth_src_name_fields; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.customers_auth_src_name_fields (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: customers_auth_src_number_fields; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.customers_auth_src_number_fields (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: destination_next_rates; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.destination_next_rates (
    id bigint NOT NULL,
    destination_id bigint NOT NULL,
    initial_rate numeric NOT NULL,
    next_rate numeric NOT NULL,
    initial_interval smallint NOT NULL,
    next_interval smallint NOT NULL,
    connect_fee numeric NOT NULL,
    apply_time timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    applied boolean DEFAULT false NOT NULL,
    external_id bigint
);


--
-- Name: destination_next_rates_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.destination_next_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: destination_next_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.destination_next_rates_id_seq OWNED BY class4.destination_next_rates.id;


--
-- Name: destination_rate_policy; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.destination_rate_policy (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: destinations_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.destinations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: destinations_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.destinations_id_seq OWNED BY class4.destinations.id;


--
-- Name: dialpeer_next_rates; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.dialpeer_next_rates (
    id bigint NOT NULL,
    dialpeer_id bigint NOT NULL,
    next_rate numeric NOT NULL,
    initial_interval smallint NOT NULL,
    next_interval smallint NOT NULL,
    connect_fee numeric NOT NULL,
    apply_time timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    applied boolean DEFAULT false NOT NULL,
    external_id bigint,
    initial_rate numeric NOT NULL,
    CONSTRAINT dialpeer_next_rate_positive_initial_interval CHECK ((next_interval > 0)),
    CONSTRAINT dialpeer_next_rate_positive_next_interval CHECK ((next_interval > 0))
);


--
-- Name: dialpeer_next_rates_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.dialpeer_next_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dialpeer_next_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.dialpeer_next_rates_id_seq OWNED BY class4.dialpeer_next_rates.id;


--
-- Name: dialpeers_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.dialpeers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dialpeers_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.dialpeers_id_seq OWNED BY class4.dialpeers.id;


--
-- Name: disconnect_code; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.disconnect_code (
    id integer NOT NULL,
    namespace_id integer NOT NULL,
    stop_hunting boolean DEFAULT true NOT NULL,
    pass_reason_to_originator boolean DEFAULT false NOT NULL,
    code integer NOT NULL,
    reason character varying NOT NULL,
    rewrited_code integer,
    rewrited_reason character varying,
    success boolean DEFAULT false NOT NULL,
    successnozerolen boolean DEFAULT false NOT NULL,
    store_cdr boolean DEFAULT true NOT NULL,
    silently_drop boolean DEFAULT false NOT NULL
);


--
-- Name: disconnect_code_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.disconnect_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: disconnect_code_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.disconnect_code_id_seq OWNED BY class4.disconnect_code.id;


--
-- Name: disconnect_policy_code; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.disconnect_policy_code (
    id integer NOT NULL,
    policy_id integer NOT NULL,
    code_id integer NOT NULL,
    stop_hunting boolean DEFAULT true NOT NULL,
    pass_reason_to_originator boolean DEFAULT false NOT NULL,
    rewrited_code integer,
    rewrited_reason character varying
);


--
-- Name: disconnect_code_policy_codes_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.disconnect_code_policy_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: disconnect_code_policy_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.disconnect_code_policy_codes_id_seq OWNED BY class4.disconnect_policy_code.id;


--
-- Name: disconnect_policy; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.disconnect_policy (
    id integer NOT NULL,
    name character varying
);


--
-- Name: disconnect_code_policy_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.disconnect_code_policy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: disconnect_code_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.disconnect_code_policy_id_seq OWNED BY class4.disconnect_policy.id;


--
-- Name: disconnect_initiators; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.disconnect_initiators (
    id integer NOT NULL,
    name character varying
);


--
-- Name: diversion_policy; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.diversion_policy (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: dtmf_receive_modes; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.dtmf_receive_modes (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: dtmf_send_modes; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.dtmf_send_modes (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: dump_level; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.dump_level (
    id integer NOT NULL,
    name character varying NOT NULL,
    log_sip boolean DEFAULT false NOT NULL,
    log_rtp boolean DEFAULT false NOT NULL
);


--
-- Name: filter_types; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.filter_types (
    id integer NOT NULL,
    name character varying
);


--
-- Name: gateway_group_balancing_modes; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.gateway_group_balancing_modes (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: gateway_groups; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.gateway_groups (
    id integer NOT NULL,
    vendor_id integer NOT NULL,
    name character varying NOT NULL,
    prefer_same_pop boolean DEFAULT true NOT NULL,
    balancing_mode_id smallint DEFAULT 1 NOT NULL
);


--
-- Name: gateway_groups_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.gateway_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gateway_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.gateway_groups_id_seq OWNED BY class4.gateway_groups.id;


--
-- Name: gateway_inband_dtmf_filtering_modes; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.gateway_inband_dtmf_filtering_modes (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: gateway_media_encryption_modes; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.gateway_media_encryption_modes (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: gateway_network_protocol_priorities; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.gateway_network_protocol_priorities (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: gateway_rel100_modes; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.gateway_rel100_modes (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: gateways_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.gateways_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gateways_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.gateways_id_seq OWNED BY class4.gateways.id;


--
-- Name: lnp_cache; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.lnp_cache (
    id integer NOT NULL,
    dst character varying NOT NULL,
    lrn character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    expires_at timestamp with time zone,
    database_id smallint,
    data character varying,
    tag character varying
);


--
-- Name: lnp_cache_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.lnp_cache_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lnp_cache_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.lnp_cache_id_seq OWNED BY class4.lnp_cache.id;


--
-- Name: lnp_databases; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.lnp_databases (
    id smallint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp with time zone,
    database_type character varying,
    database_id smallint NOT NULL
);


--
-- Name: COLUMN lnp_databases.database_type; Type: COMMENT; Schema: class4; Owner: -
--

COMMENT ON COLUMN class4.lnp_databases.database_type IS 'One of Lnp::DatabaseThinq, Lnp::DatabaseSipRedirect, Lnp::DatabaseCsv';


--
-- Name: lnp_databases_30x_redirect; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.lnp_databases_30x_redirect (
    id smallint NOT NULL,
    host character varying NOT NULL,
    port integer,
    timeout smallint DEFAULT 300 NOT NULL
);


--
-- Name: lnp_databases_30x_redirect_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.lnp_databases_30x_redirect_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lnp_databases_30x_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.lnp_databases_30x_redirect_id_seq OWNED BY class4.lnp_databases_30x_redirect.id;


--
-- Name: lnp_databases_alcazar; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.lnp_databases_alcazar (
    id smallint NOT NULL,
    host character varying NOT NULL,
    port integer,
    timeout smallint DEFAULT 300 NOT NULL,
    key character varying NOT NULL,
    database_id integer
);


--
-- Name: lnp_databases_alcazar_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.lnp_databases_alcazar_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lnp_databases_alcazar_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.lnp_databases_alcazar_id_seq OWNED BY class4.lnp_databases_alcazar.id;


--
-- Name: lnp_databases_coure_anq; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.lnp_databases_coure_anq (
    id smallint NOT NULL,
    database_id integer,
    base_url character varying NOT NULL,
    timeout smallint DEFAULT 300 NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    country_code character varying NOT NULL,
    operators_map character varying
);


--
-- Name: lnp_databases_coure_anq_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.lnp_databases_coure_anq_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lnp_databases_coure_anq_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.lnp_databases_coure_anq_id_seq OWNED BY class4.lnp_databases_coure_anq.id;


--
-- Name: lnp_databases_csv; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.lnp_databases_csv (
    id smallint NOT NULL,
    csv_file_path character varying
);


--
-- Name: lnp_databases_csv_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.lnp_databases_csv_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lnp_databases_csv_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.lnp_databases_csv_id_seq OWNED BY class4.lnp_databases_csv.id;


--
-- Name: lnp_databases_database_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.lnp_databases_database_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lnp_databases_database_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.lnp_databases_database_id_seq OWNED BY class4.lnp_databases.database_id;


--
-- Name: lnp_databases_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.lnp_databases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lnp_databases_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.lnp_databases_id_seq OWNED BY class4.lnp_databases.id;


--
-- Name: lnp_databases_thinq; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.lnp_databases_thinq (
    id smallint NOT NULL,
    host character varying NOT NULL,
    port integer,
    timeout smallint DEFAULT 300 NOT NULL,
    username character varying,
    token character varying
);


--
-- Name: lnp_databases_thinq_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.lnp_databases_thinq_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lnp_databases_thinq_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.lnp_databases_thinq_id_seq OWNED BY class4.lnp_databases_thinq.id;


--
-- Name: numberlist_actions; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.numberlist_actions (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: numberlist_modes; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.numberlist_modes (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: radius_accounting_profile_interim_attributes; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.radius_accounting_profile_interim_attributes (
    id smallint NOT NULL,
    profile_id smallint NOT NULL,
    type_id smallint NOT NULL,
    name character varying NOT NULL,
    value character varying NOT NULL,
    format character varying NOT NULL,
    is_vsa boolean DEFAULT false NOT NULL,
    vsa_vendor_id integer,
    vsa_vendor_type smallint
);


--
-- Name: radius_accounting_profile_interim_attributes_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.radius_accounting_profile_interim_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: radius_accounting_profile_interim_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.radius_accounting_profile_interim_attributes_id_seq OWNED BY class4.radius_accounting_profile_interim_attributes.id;


--
-- Name: radius_accounting_profile_start_attributes; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.radius_accounting_profile_start_attributes (
    id smallint NOT NULL,
    profile_id smallint NOT NULL,
    type_id smallint NOT NULL,
    name character varying NOT NULL,
    value character varying NOT NULL,
    format character varying NOT NULL,
    is_vsa boolean DEFAULT false NOT NULL,
    vsa_vendor_id integer,
    vsa_vendor_type smallint
);


--
-- Name: radius_accounting_profile_start_attributes_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.radius_accounting_profile_start_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: radius_accounting_profile_start_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.radius_accounting_profile_start_attributes_id_seq OWNED BY class4.radius_accounting_profile_start_attributes.id;


--
-- Name: radius_accounting_profile_stop_attributes; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.radius_accounting_profile_stop_attributes (
    id smallint NOT NULL,
    profile_id smallint NOT NULL,
    type_id smallint NOT NULL,
    name character varying NOT NULL,
    value character varying NOT NULL,
    format character varying NOT NULL,
    is_vsa boolean DEFAULT false NOT NULL,
    vsa_vendor_id integer,
    vsa_vendor_type smallint
);


--
-- Name: radius_accounting_profile_stop_attributes_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.radius_accounting_profile_stop_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: radius_accounting_profile_stop_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.radius_accounting_profile_stop_attributes_id_seq OWNED BY class4.radius_accounting_profile_stop_attributes.id;


--
-- Name: radius_accounting_profiles; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.radius_accounting_profiles (
    id smallint NOT NULL,
    name character varying NOT NULL,
    server character varying NOT NULL,
    port integer NOT NULL,
    secret character varying NOT NULL,
    timeout smallint DEFAULT 100 NOT NULL,
    attempts smallint DEFAULT 2 NOT NULL,
    enable_start_accounting boolean DEFAULT false NOT NULL,
    enable_interim_accounting boolean DEFAULT false NOT NULL,
    interim_accounting_interval smallint DEFAULT 30 NOT NULL,
    enable_stop_accounting boolean DEFAULT true NOT NULL
);


--
-- Name: radius_accounting_profiles_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.radius_accounting_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: radius_accounting_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.radius_accounting_profiles_id_seq OWNED BY class4.radius_accounting_profiles.id;


--
-- Name: radius_auth_profile_attributes; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.radius_auth_profile_attributes (
    id smallint NOT NULL,
    profile_id smallint NOT NULL,
    type_id smallint NOT NULL,
    name character varying NOT NULL,
    value character varying NOT NULL,
    format character varying NOT NULL,
    is_vsa boolean DEFAULT false NOT NULL,
    vsa_vendor_id integer,
    vsa_vendor_type smallint
);


--
-- Name: radius_auth_profile_attributes_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.radius_auth_profile_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: radius_auth_profile_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.radius_auth_profile_attributes_id_seq OWNED BY class4.radius_auth_profile_attributes.id;


--
-- Name: radius_auth_profiles; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.radius_auth_profiles (
    id smallint NOT NULL,
    name character varying NOT NULL,
    server character varying NOT NULL,
    port integer NOT NULL,
    secret character varying NOT NULL,
    reject_on_error boolean DEFAULT true NOT NULL,
    timeout smallint DEFAULT 100 NOT NULL,
    attempts smallint DEFAULT 2 NOT NULL
);


--
-- Name: radius_auth_profiles_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.radius_auth_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: radius_auth_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.radius_auth_profiles_id_seq OWNED BY class4.radius_auth_profiles.id;


--
-- Name: rate_groups; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.rate_groups (
    id integer NOT NULL,
    name character varying NOT NULL,
    external_id bigint
);


--
-- Name: rate_groups_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.rate_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rate_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.rate_groups_id_seq OWNED BY class4.rate_groups.id;


--
-- Name: rate_plan_groups; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.rate_plan_groups (
    id integer NOT NULL,
    rateplan_id integer NOT NULL,
    rate_group_id integer NOT NULL
);


--
-- Name: rate_plan_groups_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.rate_plan_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rate_plan_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.rate_plan_groups_id_seq OWNED BY class4.rate_plan_groups.id;


--
-- Name: rate_profit_control_modes; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.rate_profit_control_modes (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: rateplans; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.rateplans (
    id integer NOT NULL,
    name character varying,
    profit_control_mode_id smallint DEFAULT 1 NOT NULL,
    send_quality_alarms_to integer[],
    uuid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    external_id bigint
);


--
-- Name: rateplans_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.rateplans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rateplans_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.rateplans_id_seq OWNED BY class4.rateplans.id;


--
-- Name: registrations; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.registrations (
    id integer NOT NULL,
    name character varying NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    pop_id integer,
    node_id integer,
    domain character varying,
    username character varying NOT NULL,
    display_username character varying,
    auth_user character varying,
    proxy character varying,
    contact character varying,
    auth_password character varying,
    expire integer,
    force_expire boolean DEFAULT false NOT NULL,
    retry_delay smallint DEFAULT 5 NOT NULL,
    max_attempts smallint,
    transport_protocol_id smallint DEFAULT 1 NOT NULL,
    proxy_transport_protocol_id smallint DEFAULT 1 NOT NULL,
    sip_schema_id smallint DEFAULT 1 NOT NULL
);


--
-- Name: registrations_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.registrations_id_seq OWNED BY class4.registrations.id;


--
-- Name: routeset_discriminators; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.routeset_discriminators (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: routeset_discriminators_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.routeset_discriminators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routeset_discriminators_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.routeset_discriminators_id_seq OWNED BY class4.routeset_discriminators.id;


--
-- Name: routing_groups; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.routing_groups (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: routing_groups_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.routing_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routing_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.routing_groups_id_seq OWNED BY class4.routing_groups.id;


--
-- Name: routing_plan_groups; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.routing_plan_groups (
    id integer NOT NULL,
    routing_plan_id integer NOT NULL,
    routing_group_id integer NOT NULL
);


--
-- Name: routing_plan_groups_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.routing_plan_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routing_plan_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.routing_plan_groups_id_seq OWNED BY class4.routing_plan_groups.id;


--
-- Name: routing_plan_lnp_rules; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.routing_plan_lnp_rules (
    id integer NOT NULL,
    routing_plan_id integer NOT NULL,
    dst_prefix character varying DEFAULT ''::character varying NOT NULL,
    database_id smallint NOT NULL,
    created_at timestamp with time zone,
    lrn_rewrite_rule character varying,
    lrn_rewrite_result character varying,
    req_dst_rewrite_rule character varying,
    req_dst_rewrite_result character varying
);


--
-- Name: routing_plan_lnp_rules_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.routing_plan_lnp_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routing_plan_lnp_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.routing_plan_lnp_rules_id_seq OWNED BY class4.routing_plan_lnp_rules.id;


--
-- Name: routing_plan_static_routes; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.routing_plan_static_routes (
    id integer NOT NULL,
    routing_plan_id integer NOT NULL,
    prefix character varying DEFAULT ''::character varying NOT NULL,
    vendor_id integer NOT NULL,
    priority smallint DEFAULT 100 NOT NULL,
    network_prefix_id integer,
    weight smallint DEFAULT 100 NOT NULL
);


--
-- Name: routing_plan_static_routes_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.routing_plan_static_routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routing_plan_static_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.routing_plan_static_routes_id_seq OWNED BY class4.routing_plan_static_routes.id;


--
-- Name: routing_plans; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.routing_plans (
    id integer NOT NULL,
    name character varying NOT NULL,
    sorting_id integer DEFAULT 1 NOT NULL,
    rate_delta_max numeric DEFAULT 0 NOT NULL,
    use_lnp boolean DEFAULT false NOT NULL,
    max_rerouting_attempts smallint DEFAULT 10 NOT NULL,
    external_id bigint,
    validate_dst_number_format boolean DEFAULT false NOT NULL,
    validate_dst_number_network boolean DEFAULT false NOT NULL
);


--
-- Name: routing_plans_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.routing_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routing_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.routing_plans_id_seq OWNED BY class4.routing_plans.id;


--
-- Name: routing_tag_detection_rules; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.routing_tag_detection_rules (
    id smallint NOT NULL,
    dst_area_id integer,
    src_area_id integer,
    tag_action_id smallint,
    tag_action_value smallint[] DEFAULT '{}'::smallint[] NOT NULL,
    routing_tag_ids smallint[] DEFAULT '{}'::smallint[] NOT NULL,
    routing_tag_mode_id smallint DEFAULT 0 NOT NULL,
    src_prefix character varying DEFAULT ''::character varying NOT NULL,
    dst_prefix character varying DEFAULT ''::character varying NOT NULL
);


--
-- Name: routing_tag_detection_rules_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.routing_tag_detection_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routing_tag_detection_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.routing_tag_detection_rules_id_seq OWNED BY class4.routing_tag_detection_rules.id;


--
-- Name: routing_tag_modes; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.routing_tag_modes (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: routing_tags; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.routing_tags (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: routing_tags_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.routing_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routing_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.routing_tags_id_seq OWNED BY class4.routing_tags.id;


--
-- Name: sdp_c_location; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.sdp_c_location (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: session_refresh_methods; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.session_refresh_methods (
    id integer NOT NULL,
    value character varying NOT NULL,
    name character varying
);


--
-- Name: session_refresh_methods_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.session_refresh_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: session_refresh_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.session_refresh_methods_id_seq OWNED BY class4.session_refresh_methods.id;


--
-- Name: sip_options_probers; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.sip_options_probers (
    id integer NOT NULL,
    name character varying NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    pop_id smallint,
    node_id smallint,
    ruri_domain character varying NOT NULL,
    ruri_username character varying NOT NULL,
    transport_protocol_id smallint DEFAULT 1 NOT NULL,
    sip_schema_id smallint DEFAULT 1 NOT NULL,
    from_uri character varying,
    to_uri character varying,
    contact_uri character varying,
    proxy character varying,
    proxy_transport_protocol_id smallint DEFAULT 1 NOT NULL,
    "interval" smallint DEFAULT 60 NOT NULL,
    append_headers character varying,
    sip_interface_name character varying,
    auth_username character varying,
    auth_password character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: sip_options_probers_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.sip_options_probers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_options_probers_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.sip_options_probers_id_seq OWNED BY class4.sip_options_probers.id;


--
-- Name: sortings; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.sortings (
    id integer NOT NULL,
    name character varying,
    description character varying,
    use_static_routes boolean DEFAULT false NOT NULL
);


--
-- Name: sortings_id_seq; Type: SEQUENCE; Schema: class4; Owner: -
--

CREATE SEQUENCE class4.sortings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sortings_id_seq; Type: SEQUENCE OWNED BY; Schema: class4; Owner: -
--

ALTER SEQUENCE class4.sortings_id_seq OWNED BY class4.sortings.id;


--
-- Name: tag_actions; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.tag_actions (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: transport_protocols; Type: TABLE; Schema: class4; Owner: -
--

CREATE TABLE class4.transport_protocols (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: import_accounts; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_accounts (
    id bigint NOT NULL,
    o_id integer,
    contractor_name character varying,
    contractor_id integer,
    balance numeric,
    min_balance numeric,
    max_balance numeric,
    name character varying,
    origination_capacity integer,
    termination_capacity integer,
    error_string character varying,
    invoice_period_id smallint,
    invoice_period_name character varying,
    autogenerate_vendor_invoices boolean DEFAULT false NOT NULL,
    autogenerate_customer_invoices boolean DEFAULT false NOT NULL,
    balance_high_threshold numeric,
    balance_low_threshold numeric,
    total_capacity smallint,
    destination_rate_limit numeric,
    vat numeric,
    max_call_duration integer,
    is_changed boolean
);


--
-- Name: import_accounts_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_accounts_id_seq OWNED BY data_import.import_accounts.id;


--
-- Name: import_codec_group_codecs; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_codec_group_codecs (
    id bigint NOT NULL,
    o_id integer,
    codec_group_name character varying,
    codec_group_id integer,
    codec_name character varying,
    codec_id integer,
    priority integer,
    error_string character varying,
    is_changed boolean
);


--
-- Name: import_codec_group_codecs_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_codec_group_codecs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_codec_group_codecs_id_seq; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_codec_group_codecs_id_seq OWNED BY data_import.import_codec_group_codecs.id;


--
-- Name: import_codec_groups; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_codec_groups (
    id bigint NOT NULL,
    o_id integer,
    name character varying,
    error_string character varying,
    is_changed boolean
);


--
-- Name: import_codec_groups_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_codec_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_codec_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_codec_groups_id_seq OWNED BY data_import.import_codec_groups.id;


--
-- Name: import_contractors; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_contractors (
    id bigint NOT NULL,
    o_id integer,
    name character varying,
    vendor boolean,
    customer boolean,
    enabled boolean,
    error_string character varying,
    description character varying,
    address character varying,
    phones character varying,
    smtp_connection_id integer,
    smtp_connection_name character varying,
    is_changed boolean
);


--
-- Name: import_contractors_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_contractors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_contractors_id_seq; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_contractors_id_seq OWNED BY data_import.import_contractors.id;


--
-- Name: import_customers_auth; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_customers_auth (
    id bigint NOT NULL,
    o_id bigint,
    customer_name character varying,
    customer_id integer,
    routing_group_name character varying,
    routing_group_id integer,
    rateplan_name character varying,
    rateplan_id integer,
    enabled boolean,
    account_name character varying,
    account_id integer,
    gateway_name character varying,
    gateway_id integer,
    src_rewrite_rule character varying,
    src_rewrite_result character varying,
    dst_rewrite_rule character varying,
    dst_rewrite_result character varying,
    src_prefix character varying,
    dst_prefix character varying,
    x_yeti_auth character varying,
    name character varying,
    dump_level_id integer,
    dump_level_name character varying,
    capacity integer,
    ip character varying,
    uri_domain character varying,
    pop_name character varying,
    pop_id integer,
    diversion_policy_id integer,
    diversion_policy_name character varying,
    diversion_rewrite_result character varying,
    diversion_rewrite_rule character varying,
    src_name_rewrite_result character varying,
    src_name_rewrite_rule character varying,
    error_string character varying,
    dst_numberlist_id integer,
    dst_numberlist_name character varying,
    src_numberlist_id integer,
    src_numberlist_name character varying,
    allow_receive_rate_limit boolean DEFAULT false NOT NULL,
    send_billing_information boolean DEFAULT false NOT NULL,
    routing_plan_id integer,
    routing_plan_name character varying,
    radius_auth_profile_id smallint,
    radius_auth_profile_name character varying,
    radius_accounting_profile_id smallint,
    radius_accounting_profile_name character varying,
    src_number_radius_rewrite_rule character varying,
    src_number_radius_rewrite_result character varying,
    dst_number_radius_rewrite_rule character varying,
    dst_number_radius_rewrite_result character varying,
    enable_audio_recording boolean,
    from_domain character varying,
    to_domain character varying,
    transport_protocol_id smallint,
    transport_protocol_name character varying,
    min_dst_number_length smallint,
    max_dst_number_length smallint,
    check_account_balance boolean,
    require_incoming_auth boolean,
    tag_action_id smallint,
    tag_action_value smallint[] DEFAULT '{}'::smallint[] NOT NULL,
    tag_action_name character varying,
    tag_action_value_names character varying,
    dst_number_min_length integer,
    dst_number_max_length integer,
    reject_calls boolean,
    src_number_max_length smallint,
    src_number_min_length smallint,
    lua_script_id smallint,
    lua_script_name character varying,
    is_changed boolean,
    src_number_field_id smallint,
    src_number_field_name character varying,
    src_name_field_id smallint,
    src_name_field_name smallint,
    dst_number_field_id smallint,
    dst_number_field_name smallint
);


--
-- Name: import_customers_auth_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_customers_auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_customers_auth_id_seq; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_customers_auth_id_seq OWNED BY data_import.import_customers_auth.id;


--
-- Name: import_destinations; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_destinations (
    id bigint NOT NULL,
    o_id bigint,
    prefix character varying,
    rate_group_name character varying,
    rate_group_id integer,
    connect_fee numeric,
    enabled boolean,
    reject_calls boolean,
    initial_interval integer,
    next_interval integer,
    initial_rate numeric,
    next_rate numeric,
    rate_policy_id integer,
    dp_margin_fixed numeric,
    dp_margin_percent numeric,
    rate_policy_name character varying,
    use_dp_intervals boolean,
    error_string character varying,
    valid_from timestamp with time zone,
    valid_till timestamp with time zone,
    profit_control_mode_id smallint,
    profit_control_mode_name character varying,
    network_prefix_id integer,
    asr_limit real,
    acd_limit real,
    short_calls_limit real,
    reverse_billing boolean,
    routing_tag_ids smallint[] DEFAULT '{}'::smallint[] NOT NULL,
    routing_tag_names character varying,
    dst_number_min_length integer,
    dst_number_max_length integer,
    routing_tag_mode_id smallint,
    routing_tag_mode_name character varying,
    is_changed boolean
);


--
-- Name: import_destinations_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_destinations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_destinations_id_seq; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_destinations_id_seq OWNED BY data_import.import_destinations.id;


--
-- Name: import_dialpeers; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_dialpeers (
    id bigint NOT NULL,
    o_id bigint,
    enabled boolean,
    prefix character varying,
    src_rewrite_rule character varying,
    dst_rewrite_rule character varying,
    gateway_id integer,
    gateway_name character varying,
    routing_group_id integer,
    routing_group_name character varying,
    connect_fee numeric,
    vendor_id integer,
    vendor_name character varying,
    account_id integer,
    account_name character varying,
    src_rewrite_result character varying,
    dst_rewrite_result character varying,
    locked boolean,
    priority integer,
    asr_limit real,
    acd_limit real,
    initial_interval integer,
    next_interval integer,
    initial_rate numeric,
    next_rate numeric,
    lcr_rate_multiplier numeric,
    capacity integer,
    valid_from timestamp without time zone,
    valid_till timestamp without time zone,
    gateway_group_name character varying,
    gateway_group_id integer,
    error_string character varying,
    force_hit_rate double precision,
    short_calls_limit real DEFAULT 1 NOT NULL,
    exclusive_route boolean,
    reverse_billing boolean,
    routing_tag_ids smallint[] DEFAULT '{}'::smallint[] NOT NULL,
    routing_tag_names character varying,
    dst_number_min_length integer,
    dst_number_max_length integer,
    routing_tag_mode_id smallint,
    routing_tag_mode_name character varying,
    routeset_discriminator_id smallint,
    routeset_discriminator_name character varying,
    is_changed boolean
);


--
-- Name: import_dialpeers_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_dialpeers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_dialpeers_id_seq; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_dialpeers_id_seq OWNED BY data_import.import_dialpeers.id;


--
-- Name: import_disconnect_policies; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_disconnect_policies (
    id bigint NOT NULL,
    o_id integer,
    name character varying,
    error_string character varying,
    is_changed boolean
);


--
-- Name: import_disconnect_policies_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_disconnect_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_disconnect_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_disconnect_policies_id_seq OWNED BY data_import.import_disconnect_policies.id;


--
-- Name: import_gateway_groups; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_gateway_groups (
    id bigint NOT NULL,
    o_id integer,
    name character varying,
    vendor_name character varying,
    vendor_id integer,
    prefer_same_pop boolean,
    error_string character varying,
    balancing_mode_id smallint,
    balancing_mode_name character varying,
    is_changed boolean
);


--
-- Name: import_gateway_groups_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_gateway_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_gateway_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_gateway_groups_id_seq OWNED BY data_import.import_gateway_groups.id;


--
-- Name: import_gateways; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_gateways (
    host character varying,
    port integer,
    src_rewrite_rule character varying,
    dst_rewrite_rule character varying,
    acd_limit real,
    asr_limit real,
    enabled boolean,
    name character varying,
    auth_enabled boolean,
    auth_user character varying,
    auth_password character varying,
    term_outbound_proxy character varying,
    term_next_hop_for_replies boolean,
    term_use_outbound_proxy boolean,
    contractor_id integer,
    allow_termination boolean,
    allow_origination boolean,
    anonymize_sdp boolean,
    proxy_media boolean,
    transparent_seqno boolean,
    transparent_ssrc boolean,
    sst_enabled boolean,
    sst_minimum_timer integer,
    sst_maximum_timer integer,
    sst_accept501 boolean,
    session_refresh_method_id integer,
    sst_session_expires integer,
    term_force_outbound_proxy boolean,
    locked boolean,
    codecs_payload_order character varying,
    codecs_prefer_transcoding_for character varying,
    src_rewrite_result character varying,
    dst_rewrite_result character varying,
    term_next_hop character varying,
    orig_next_hop character varying,
    orig_append_headers_req character varying,
    term_append_headers_req character varying,
    dialog_nat_handling boolean,
    orig_force_outbound_proxy boolean,
    orig_use_outbound_proxy boolean,
    orig_outbound_proxy character varying,
    prefer_existing_codecs boolean,
    force_symmetric_rtp boolean,
    transparent_dialog_id boolean,
    sdp_alines_filter_type_id integer,
    sdp_alines_filter_list character varying,
    gateway_group_id integer,
    orig_disconnect_policy_id integer,
    term_disconnect_policy_id integer,
    diversion_policy_id integer,
    diversion_rewrite_rule character varying,
    diversion_rewrite_result character varying,
    src_name_rewrite_rule character varying,
    src_name_rewrite_result character varying,
    priority integer,
    pop_id integer,
    id integer NOT NULL,
    o_id integer,
    gateway_group_name character varying,
    contractor_name character varying,
    pop_name character varying,
    session_refresh_method_name character varying,
    sdp_alines_filter_type_name character varying,
    orig_disconnect_policy_name character varying,
    term_disconnect_policy_name character varying,
    diversion_policy_name character varying,
    error_string character varying,
    codec_group_id integer,
    codec_group_name character varying,
    single_codec_in_200ok boolean,
    ringing_timeout integer,
    symmetric_rtp_nonstop boolean,
    symmetric_rtp_ignore_rtcp boolean,
    resolve_ruri boolean,
    force_dtmf_relay boolean,
    relay_options boolean,
    rtp_ping boolean,
    filter_noaudio_streams boolean,
    relay_reinvite boolean,
    sdp_c_location_id integer,
    sdp_c_location_name character varying,
    auth_from_user character varying,
    auth_from_domain character varying,
    relay_hold boolean,
    rtp_timeout integer,
    relay_prack boolean,
    rtp_relay_timestamp_aligning boolean,
    allow_1xx_without_to_tag boolean,
    sip_timer_b integer,
    dns_srv_failover_timer integer,
    rtp_force_relay_cn boolean,
    sensor_id smallint,
    sensor_name character varying,
    sensor_level_id smallint,
    sensor_level_name character varying,
    dtmf_send_mode_id smallint,
    dtmf_send_mode_name character varying,
    dtmf_receive_mode_id smallint,
    dtmf_receive_mode_name character varying,
    transport_protocol_id smallint,
    term_proxy_transport_protocol_id smallint,
    orig_proxy_transport_protocol_id smallint,
    transport_protocol_name character varying,
    term_proxy_transport_protocol_name character varying,
    orig_proxy_transport_protocol_name character varying,
    short_calls_limit real,
    origination_capacity smallint,
    termination_capacity smallint,
    rel100_mode_id smallint,
    rel100_mode_name character varying,
    is_shared boolean,
    incoming_auth_username character varying,
    incoming_auth_password character varying,
    relay_update boolean,
    suppress_early_media boolean,
    send_lnp_information boolean,
    force_one_way_early_media boolean,
    max_30x_redirects integer,
    rx_inband_dtmf_filtering_mode_id smallint,
    rx_inband_dtmf_filtering_mode_name character varying,
    tx_inband_dtmf_filtering_mode_id smallint,
    tx_inband_dtmf_filtering_mode_name character varying,
    weight smallint,
    sip_schema_id smallint,
    sip_schema_name character varying,
    network_protocol_priority_id smallint,
    network_protocol_priority_name character varying,
    media_encryption_mode_id smallint,
    media_encryption_mode_name character varying,
    preserve_anonymous_from_domain boolean,
    termination_src_numberlist_id smallint,
    termination_src_numberlist_name character varying,
    termination_dst_numberlist_id smallint,
    termination_dst_numberlist_name character varying,
    lua_script_id smallint,
    lua_script_name character varying,
    use_registered_aor boolean,
    is_changed boolean
);


--
-- Name: import_gateways_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_gateways_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_gateways_id_seq1; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_gateways_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_gateways_id_seq1; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_gateways_id_seq1 OWNED BY data_import.import_gateways.id;


--
-- Name: import_numberlist_items; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_numberlist_items (
    id integer NOT NULL,
    o_id integer,
    error_string character varying,
    numberlist_id smallint,
    numberlist_name character varying,
    key character varying,
    action_id integer,
    action_name character varying,
    src_rewrite_rule character varying,
    src_rewrite_result character varying,
    dst_rewrite_rule character varying,
    dst_rewrite_result character varying,
    tag_action_id integer,
    tag_action_name character varying,
    tag_action_value smallint[] DEFAULT '{}'::smallint[] NOT NULL,
    tag_action_value_names character varying,
    number_min_length smallint,
    number_max_length smallint,
    lua_script_id smallint,
    lua_script_name character varying,
    is_changed boolean
);


--
-- Name: import_numberlist_items_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_numberlist_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_numberlist_items_id_seq; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_numberlist_items_id_seq OWNED BY data_import.import_numberlist_items.id;


--
-- Name: import_numberlists; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_numberlists (
    id integer NOT NULL,
    o_id smallint,
    error_string character varying,
    name character varying,
    mode_id integer,
    mode_name character varying,
    default_action_id integer,
    default_action_name character varying,
    default_src_rewrite_rule character varying,
    default_src_rewrite_result character varying,
    default_dst_rewrite_rule character varying,
    default_dst_rewrite_result character varying,
    tag_action_id integer,
    tag_action_name character varying,
    tag_action_value smallint[] DEFAULT '{}'::smallint[] NOT NULL,
    tag_action_value_names character varying,
    lua_script_id smallint,
    lua_script_name character varying,
    is_changed boolean
);


--
-- Name: import_numberlists_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_numberlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_numberlists_id_seq; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_numberlists_id_seq OWNED BY data_import.import_numberlists.id;


--
-- Name: import_rate_groups; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_rate_groups (
    id bigint NOT NULL,
    o_id integer,
    name character varying,
    error_string character varying,
    is_changed boolean
);


--
-- Name: import_rate_groups_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_rate_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_rate_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_rate_groups_id_seq OWNED BY data_import.import_rate_groups.id;


--
-- Name: import_rateplans; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_rateplans (
    id bigint NOT NULL,
    o_id integer,
    name character varying,
    error_string character varying,
    profit_control_mode_id integer,
    profit_control_mode_name character varying,
    is_changed boolean
);


--
-- Name: import_rateplans_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_rateplans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_rateplans_id_seq; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_rateplans_id_seq OWNED BY data_import.import_rateplans.id;


--
-- Name: import_registrations; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_registrations (
    id bigint NOT NULL,
    o_id integer,
    name character varying,
    enabled boolean,
    pop_name character varying,
    pop_id integer,
    node_name character varying,
    node_id integer,
    domain character varying,
    username character varying,
    display_username character varying,
    auth_user character varying,
    proxy character varying,
    contact character varying,
    auth_password character varying,
    expire integer,
    force_expire boolean,
    error_string character varying,
    retry_delay integer,
    max_attempts integer,
    transport_protocol_id smallint,
    proxy_transport_protocol_id smallint,
    transport_protocol_name character varying,
    proxy_transport_protocol_name character varying,
    is_changed boolean,
    sip_schema_id smallint,
    sip_schema_name character varying
);


--
-- Name: import_registrations_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_registrations_id_seq OWNED BY data_import.import_registrations.id;


--
-- Name: import_routing_groups; Type: TABLE; Schema: data_import; Owner: -
--

CREATE TABLE data_import.import_routing_groups (
    id bigint NOT NULL,
    o_id integer,
    name character varying,
    error_string character varying,
    is_changed boolean
);


--
-- Name: import_routing_groups_id_seq; Type: SEQUENCE; Schema: data_import; Owner: -
--

CREATE SEQUENCE data_import.import_routing_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_routing_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: data_import; Owner: -
--

ALTER SEQUENCE data_import.import_routing_groups_id_seq OWNED BY data_import.import_routing_groups.id;


--
-- Name: active_admin_comments; Type: TABLE; Schema: gui; Owner: -
--

CREATE TABLE gui.active_admin_comments (
    id integer NOT NULL,
    resource_id character varying(255) NOT NULL,
    resource_type character varying(255) NOT NULL,
    author_id integer,
    author_type character varying(255),
    body text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    namespace character varying(255)
);


--
-- Name: admin_notes_id_seq; Type: SEQUENCE; Schema: gui; Owner: -
--

CREATE SEQUENCE gui.admin_notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: gui; Owner: -
--

ALTER SEQUENCE gui.admin_notes_id_seq OWNED BY gui.active_admin_comments.id;


--
-- Name: admin_users; Type: TABLE; Schema: gui; Owner: -
--

CREATE TABLE gui.admin_users (
    id integer NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp with time zone,
    remember_created_at timestamp with time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    enabled boolean DEFAULT true,
    username character varying NOT NULL,
    ssh_key text,
    stateful_filters boolean DEFAULT false NOT NULL,
    visible_columns json DEFAULT '{}'::json NOT NULL,
    per_page json DEFAULT '{}'::json NOT NULL,
    saved_filters json DEFAULT '{}'::json NOT NULL,
    roles character varying[] NOT NULL
);


--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: gui; Owner: -
--

CREATE SEQUENCE gui.admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: gui; Owner: -
--

ALTER SEQUENCE gui.admin_users_id_seq OWNED BY gui.admin_users.id;


--
-- Name: background_threads; Type: TABLE; Schema: gui; Owner: -
--

CREATE TABLE gui.background_threads (
    id integer NOT NULL,
    name character varying,
    num integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    data_count bigint,
    data_processed bigint,
    exception text
);


--
-- Name: background_threads_id_seq; Type: SEQUENCE; Schema: gui; Owner: -
--

CREATE SEQUENCE gui.background_threads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: background_threads_id_seq; Type: SEQUENCE OWNED BY; Schema: gui; Owner: -
--

ALTER SEQUENCE gui.background_threads_id_seq OWNED BY gui.background_threads.id;


--
-- Name: sessions; Type: TABLE; Schema: gui; Owner: -
--

CREATE TABLE gui.sessions (
    id integer NOT NULL,
    session_id character varying(255) NOT NULL,
    data text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: gui; Owner: -
--

CREATE SEQUENCE gui.sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: gui; Owner: -
--

ALTER SEQUENCE gui.sessions_id_seq OWNED BY gui.sessions.id;


--
-- Name: versions; Type: TABLE; Schema: gui; Owner: -
--

CREATE TABLE gui.versions (
    id integer NOT NULL,
    item_type character varying(255) NOT NULL,
    item_id bigint NOT NULL,
    event character varying(255) NOT NULL,
    whodunnit character varying(255),
    object text,
    created_at timestamp with time zone,
    ip character varying(255),
    object_changes text,
    txid bigint DEFAULT txid_current()
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: gui; Owner: -
--

CREATE SEQUENCE gui.versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: gui; Owner: -
--

ALTER SEQUENCE gui.versions_id_seq OWNED BY gui.versions.id;


--
-- Name: api_requests; Type: TABLE; Schema: logs; Owner: -
--

CREATE TABLE logs.api_requests (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    path character varying,
    method character varying,
    status integer,
    controller character varying,
    action character varying,
    page_duration real,
    db_duration real,
    params text,
    request_body text,
    response_body text,
    request_headers text,
    response_headers text
)
PARTITION BY RANGE (created_at);


--
-- Name: api_requests_id_seq; Type: SEQUENCE; Schema: logs; Owner: -
--

CREATE SEQUENCE logs.api_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: api_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: logs; Owner: -
--

ALTER SEQUENCE logs.api_requests_id_seq OWNED BY logs.api_requests.id;


--
-- Name: balance_notifications; Type: TABLE; Schema: logs; Owner: -
--

CREATE TABLE logs.balance_notifications (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    is_processed boolean DEFAULT false NOT NULL,
    processed_at timestamp with time zone,
    direction character varying,
    action character varying,
    data json
);


--
-- Name: balance_notifications_id_seq; Type: SEQUENCE; Schema: logs; Owner: -
--

CREATE SEQUENCE logs.balance_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: balance_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: logs; Owner: -
--

ALTER SEQUENCE logs.balance_notifications_id_seq OWNED BY logs.balance_notifications.id;


--
-- Name: logic_log; Type: TABLE; Schema: logs; Owner: -
--

CREATE TABLE logs.logic_log (
    id bigint NOT NULL,
    source character varying NOT NULL,
    level integer NOT NULL,
    msg text,
    txid bigint DEFAULT txid_current() NOT NULL,
    "timestamp" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: logic_log_id_seq; Type: SEQUENCE; Schema: logs; Owner: -
--

CREATE SEQUENCE logs.logic_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logic_log_id_seq; Type: SEQUENCE OWNED BY; Schema: logs; Owner: -
--

ALTER SEQUENCE logs.logic_log_id_seq OWNED BY logs.logic_log.id;


--
-- Name: alerts; Type: TABLE; Schema: notifications; Owner: -
--

CREATE TABLE notifications.alerts (
    id integer NOT NULL,
    event character varying NOT NULL,
    send_to integer[]
);


--
-- Name: alerts_id_seq; Type: SEQUENCE; Schema: notifications; Owner: -
--

CREATE SEQUENCE notifications.alerts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alerts_id_seq; Type: SEQUENCE OWNED BY; Schema: notifications; Owner: -
--

ALTER SEQUENCE notifications.alerts_id_seq OWNED BY notifications.alerts.id;


--
-- Name: attachments; Type: TABLE; Schema: notifications; Owner: -
--

CREATE TABLE notifications.attachments (
    id integer NOT NULL,
    filename character varying NOT NULL,
    data bytea
);


--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: notifications; Owner: -
--

CREATE SEQUENCE notifications.attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: notifications; Owner: -
--

ALTER SEQUENCE notifications.attachments_id_seq OWNED BY notifications.attachments.id;


--
-- Name: contacts; Type: TABLE; Schema: notifications; Owner: -
--

CREATE TABLE notifications.contacts (
    id integer NOT NULL,
    contractor_id integer,
    admin_user_id integer,
    email character varying NOT NULL,
    notes character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: notifications; Owner: -
--

CREATE SEQUENCE notifications.contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: notifications; Owner: -
--

ALTER SEQUENCE notifications.contacts_id_seq OWNED BY notifications.contacts.id;


--
-- Name: email_logs; Type: TABLE; Schema: notifications; Owner: -
--

CREATE TABLE notifications.email_logs (
    id bigint NOT NULL,
    batch_id bigint,
    created_at timestamp with time zone,
    sent_at timestamp with time zone,
    contact_id integer,
    smtp_connection_id integer,
    mail_to character varying NOT NULL,
    mail_from character varying NOT NULL,
    subject character varying NOT NULL,
    msg character varying,
    error character varying,
    attachment_id integer[]
);


--
-- Name: email_log_id_seq; Type: SEQUENCE; Schema: notifications; Owner: -
--

CREATE SEQUENCE notifications.email_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_log_id_seq; Type: SEQUENCE OWNED BY; Schema: notifications; Owner: -
--

ALTER SEQUENCE notifications.email_log_id_seq OWNED BY notifications.email_logs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contractors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contractors (
    id integer NOT NULL,
    name character varying,
    enabled boolean,
    vendor boolean,
    customer boolean,
    description character varying,
    address character varying,
    phones character varying,
    smtp_connection_id integer,
    external_id bigint
);


--
-- Name: contractors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contractors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contractors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contractors_id_seq OWNED BY public.contractors.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: dialpeers_stats; Type: TABLE; Schema: runtime_stats; Owner: -
--

CREATE UNLOGGED TABLE runtime_stats.dialpeers_stats (
    dialpeer_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    calls bigint NOT NULL,
    calls_success bigint NOT NULL,
    calls_fail bigint NOT NULL,
    total_duration bigint NOT NULL,
    asr real,
    acd real,
    locked_at timestamp with time zone,
    unlocked_at timestamp with time zone,
    id bigint NOT NULL
);


--
-- Name: dialpeers_stats_id_seq; Type: SEQUENCE; Schema: runtime_stats; Owner: -
--

CREATE SEQUENCE runtime_stats.dialpeers_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dialpeers_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: runtime_stats; Owner: -
--

ALTER SEQUENCE runtime_stats.dialpeers_stats_id_seq OWNED BY runtime_stats.dialpeers_stats.id;


--
-- Name: gateways_stats; Type: TABLE; Schema: runtime_stats; Owner: -
--

CREATE UNLOGGED TABLE runtime_stats.gateways_stats (
    id integer NOT NULL,
    gateway_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    calls bigint NOT NULL,
    calls_success bigint NOT NULL,
    calls_fail bigint NOT NULL,
    total_duration bigint NOT NULL,
    asr real,
    acd real,
    locked_at timestamp with time zone,
    unlocked_at timestamp with time zone
);


--
-- Name: gateways_stats_id_seq; Type: SEQUENCE; Schema: runtime_stats; Owner: -
--

CREATE SEQUENCE runtime_stats.gateways_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gateways_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: runtime_stats; Owner: -
--

ALTER SEQUENCE runtime_stats.gateways_stats_id_seq OWNED BY runtime_stats.gateways_stats.id;


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: switch18; Owner: -
--

CREATE SEQUENCE switch18.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_action; Type: TABLE; Schema: switch18; Owner: -
--

CREATE TABLE switch18.resource_action (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: resource_type_id_seq; Type: SEQUENCE; Schema: switch18; Owner: -
--

CREATE SEQUENCE switch18.resource_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_type_id_seq; Type: SEQUENCE OWNED BY; Schema: switch18; Owner: -
--

ALTER SEQUENCE switch18.resource_type_id_seq OWNED BY switch18.resource_type.id;


--
-- Name: switch_in_interface_id_seq; Type: SEQUENCE; Schema: switch18; Owner: -
--

CREATE SEQUENCE switch18.switch_in_interface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: switch_interface_out; Type: TABLE; Schema: switch18; Owner: -
--

CREATE TABLE switch18.switch_interface_out (
    id integer NOT NULL,
    name character varying,
    type character varying,
    custom boolean NOT NULL,
    rank integer NOT NULL,
    for_radius boolean DEFAULT true NOT NULL
);


--
-- Name: switch_interface_id_seq; Type: SEQUENCE; Schema: switch18; Owner: -
--

CREATE SEQUENCE switch18.switch_interface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: switch_interface_id_seq; Type: SEQUENCE OWNED BY; Schema: switch18; Owner: -
--

ALTER SEQUENCE switch18.switch_interface_id_seq OWNED BY switch18.switch_interface_out.id;


--
-- Name: switch_interface_in; Type: TABLE; Schema: switch18; Owner: -
--

CREATE TABLE switch18.switch_interface_in (
    id integer DEFAULT nextval('switch18.switch_in_interface_id_seq'::regclass) NOT NULL,
    name character varying,
    type character varying,
    rank integer NOT NULL,
    format character varying,
    hashkey boolean DEFAULT false NOT NULL,
    param character varying
);


--
-- Name: trusted_headers; Type: TABLE; Schema: switch18; Owner: -
--

CREATE TABLE switch18.trusted_headers (
    id integer NOT NULL,
    name character varying,
    rank integer NOT NULL
);


--
-- Name: trusted_headers_id_seq; Type: SEQUENCE; Schema: switch18; Owner: -
--

CREATE SEQUENCE switch18.trusted_headers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trusted_headers_id_seq; Type: SEQUENCE OWNED BY; Schema: switch18; Owner: -
--

ALTER SEQUENCE switch18.trusted_headers_id_seq OWNED BY switch18.trusted_headers.id;


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: switch19; Owner: -
--

CREATE SEQUENCE switch19.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_action; Type: TABLE; Schema: switch19; Owner: -
--

CREATE TABLE switch19.resource_action (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: resource_type_id_seq; Type: SEQUENCE; Schema: switch19; Owner: -
--

CREATE SEQUENCE switch19.resource_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_type_id_seq; Type: SEQUENCE OWNED BY; Schema: switch19; Owner: -
--

ALTER SEQUENCE switch19.resource_type_id_seq OWNED BY switch19.resource_type.id;


--
-- Name: switch_in_interface_id_seq; Type: SEQUENCE; Schema: switch19; Owner: -
--

CREATE SEQUENCE switch19.switch_in_interface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: switch_interface_out; Type: TABLE; Schema: switch19; Owner: -
--

CREATE TABLE switch19.switch_interface_out (
    id integer NOT NULL,
    name character varying,
    type character varying,
    custom boolean NOT NULL,
    rank integer NOT NULL,
    for_radius boolean DEFAULT true NOT NULL
);


--
-- Name: switch_interface_id_seq; Type: SEQUENCE; Schema: switch19; Owner: -
--

CREATE SEQUENCE switch19.switch_interface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: switch_interface_id_seq; Type: SEQUENCE OWNED BY; Schema: switch19; Owner: -
--

ALTER SEQUENCE switch19.switch_interface_id_seq OWNED BY switch19.switch_interface_out.id;


--
-- Name: switch_interface_in; Type: TABLE; Schema: switch19; Owner: -
--

CREATE TABLE switch19.switch_interface_in (
    id integer DEFAULT nextval('switch19.switch_in_interface_id_seq'::regclass) NOT NULL,
    name character varying,
    type character varying,
    rank integer NOT NULL,
    format character varying,
    hashkey boolean DEFAULT false NOT NULL,
    param character varying
);


--
-- Name: trusted_headers; Type: TABLE; Schema: switch19; Owner: -
--

CREATE TABLE switch19.trusted_headers (
    id integer NOT NULL,
    name character varying,
    rank integer NOT NULL
);


--
-- Name: trusted_headers_id_seq; Type: SEQUENCE; Schema: switch19; Owner: -
--

CREATE SEQUENCE switch19.trusted_headers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trusted_headers_id_seq; Type: SEQUENCE OWNED BY; Schema: switch19; Owner: -
--

ALTER SEQUENCE switch19.trusted_headers_id_seq OWNED BY switch19.trusted_headers.id;


--
-- Name: active_currencies; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.active_currencies (
    id integer NOT NULL,
    currency_id smallint NOT NULL,
    is_base boolean DEFAULT false NOT NULL,
    enable_autoupdate boolean DEFAULT true NOT NULL,
    description character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    rate numeric
);


--
-- Name: active_currencies_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.active_currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.active_currencies_id_seq OWNED BY sys.active_currencies.id;


--
-- Name: api_access; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.api_access (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    login character varying NOT NULL,
    password_digest character varying NOT NULL,
    account_ids integer[] DEFAULT '{}'::integer[] NOT NULL,
    allowed_ips inet[] DEFAULT '{0.0.0.0/0}'::inet[] NOT NULL
);


--
-- Name: api_access_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.api_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: api_access_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.api_access_id_seq OWNED BY sys.api_access.id;


--
-- Name: api_log_config; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.api_log_config (
    id integer NOT NULL,
    controller character varying NOT NULL,
    debug boolean DEFAULT false NOT NULL
);


--
-- Name: api_log_config_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.api_log_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: api_log_config_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.api_log_config_id_seq OWNED BY sys.api_log_config.id;


--
-- Name: cdr_exports; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.cdr_exports (
    id integer NOT NULL,
    status character varying NOT NULL,
    fields character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    filters json DEFAULT '{}'::json NOT NULL,
    callback_url character varying,
    type character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    rows_count integer
);


--
-- Name: cdr_exports_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.cdr_exports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cdr_exports_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.cdr_exports_id_seq OWNED BY sys.cdr_exports.id;


--
-- Name: cdr_tables; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.cdr_tables (
    id integer NOT NULL,
    name character varying NOT NULL,
    readable boolean DEFAULT true NOT NULL,
    writable boolean DEFAULT false NOT NULL,
    date_start character varying NOT NULL,
    date_stop character varying NOT NULL
);


--
-- Name: cdrtables_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.cdrtables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cdrtables_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.cdrtables_id_seq OWNED BY sys.cdr_tables.id;


--
-- Name: countries; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.countries (
    id integer NOT NULL,
    name character varying NOT NULL,
    iso2 character varying(2) NOT NULL
);


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.countries_id_seq OWNED BY sys.countries.id;


--
-- Name: currencies; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.currencies (
    id smallint NOT NULL,
    name character varying NOT NULL,
    country_id integer,
    code character varying(3) NOT NULL,
    num_code character varying(3) NOT NULL
);


--
-- Name: currencies_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.currencies_id_seq OWNED BY sys.currencies.id;


--
-- Name: delayed_jobs; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.delayed_jobs (
    id integer NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    attempts integer DEFAULT 0 NOT NULL,
    handler text NOT NULL,
    last_error text,
    run_at timestamp with time zone,
    locked_at timestamp with time zone,
    failed_at timestamp with time zone,
    locked_by character varying(255),
    queue character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.delayed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.delayed_jobs_id_seq OWNED BY sys.delayed_jobs.id;


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.events (
    id integer DEFAULT nextval('sys.events_id_seq'::regclass) NOT NULL,
    command character varying NOT NULL,
    retries integer DEFAULT 0 NOT NULL,
    node_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone,
    last_error character varying
);


--
-- Name: guiconfig; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.guiconfig (
    rows_per_page character varying DEFAULT '50,100'::character varying NOT NULL,
    id integer NOT NULL,
    cdr_unload_dir character varying,
    cdr_unload_uri character varying,
    max_records integer DEFAULT 100500 NOT NULL,
    import_max_threads integer DEFAULT 4 NOT NULL,
    import_helpers_dir character varying DEFAULT '/tmp'::character varying,
    active_calls_require_filter boolean DEFAULT true NOT NULL,
    registrations_require_filter boolean DEFAULT true NOT NULL,
    active_calls_show_chart boolean DEFAULT false NOT NULL,
    active_calls_autorefresh_enable boolean DEFAULT false NOT NULL,
    max_call_duration integer DEFAULT 7200 NOT NULL,
    random_disconnect_enable boolean DEFAULT false NOT NULL,
    random_disconnect_length integer DEFAULT 7000 NOT NULL,
    drop_call_if_lnp_fail boolean DEFAULT false NOT NULL,
    short_call_length integer DEFAULT 15 NOT NULL,
    termination_stats_window integer DEFAULT 24 NOT NULL,
    lnp_cache_ttl integer DEFAULT 10800 NOT NULL,
    quality_control_min_calls integer DEFAULT 100 NOT NULL,
    quality_control_min_duration integer DEFAULT 3600 NOT NULL,
    lnp_e2e_timeout smallint DEFAULT 1000 NOT NULL,
    web_url character varying DEFAULT 'http://127.0.0.1'::character varying NOT NULL
);


--
-- Name: guiconfig_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.guiconfig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: guiconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.guiconfig_id_seq OWNED BY sys.guiconfig.id;


--
-- Name: jobs; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.jobs (
    id integer NOT NULL,
    type character varying NOT NULL,
    description character varying,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    running boolean DEFAULT false NOT NULL
);


--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.jobs_id_seq OWNED BY sys.jobs.id;


--
-- Name: lnp_resolvers; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.lnp_resolvers (
    id integer NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    port integer NOT NULL
);


--
-- Name: lnp_resolvers_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.lnp_resolvers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lnp_resolvers_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.lnp_resolvers_id_seq OWNED BY sys.lnp_resolvers.id;


--
-- Name: load_balancers; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.load_balancers (
    id smallint NOT NULL,
    name character varying NOT NULL,
    signalling_ip character varying NOT NULL
);


--
-- Name: load_balancers_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.load_balancers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: load_balancers_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.load_balancers_id_seq OWNED BY sys.load_balancers.id;


--
-- Name: lua_scripts; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.lua_scripts (
    id smallint NOT NULL,
    name character varying NOT NULL,
    source character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: lua_scripts_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.lua_scripts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lua_scripts_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.lua_scripts_id_seq OWNED BY sys.lua_scripts.id;


--
-- Name: network_prefixes_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.network_prefixes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: network_prefixes_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.network_prefixes_id_seq OWNED BY sys.network_prefixes.id;


--
-- Name: network_types; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.network_types (
    id smallint NOT NULL,
    name character varying NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v1() NOT NULL
);


--
-- Name: network_types_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.network_types_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: network_types_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.network_types_id_seq OWNED BY sys.network_types.id;


--
-- Name: networks; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.networks (
    id integer NOT NULL,
    name character varying NOT NULL,
    type_id smallint NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v1() NOT NULL
);


--
-- Name: networks_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.networks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: networks_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.networks_id_seq OWNED BY sys.networks.id;


--
-- Name: nodes; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.nodes (
    id integer NOT NULL,
    name character varying,
    pop_id integer NOT NULL,
    rpc_endpoint character varying
);


--
-- Name: pops; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.pops (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: sensor_levels; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.sensor_levels (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: sensor_modes; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.sensor_modes (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: sensors; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.sensors (
    id smallint NOT NULL,
    name character varying NOT NULL,
    mode_id integer NOT NULL,
    source_interface character varying,
    target_mac macaddr,
    use_routing boolean NOT NULL,
    target_ip inet,
    source_ip inet,
    target_port integer,
    hep_capture_id integer
);


--
-- Name: sensors_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.sensors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sensors_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.sensors_id_seq OWNED BY sys.sensors.id;


--
-- Name: sip_schemas; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.sip_schemas (
    id smallint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: smtp_connections; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.smtp_connections (
    id integer NOT NULL,
    name character varying NOT NULL,
    host character varying NOT NULL,
    port integer DEFAULT 25 NOT NULL,
    from_address character varying NOT NULL,
    auth_user character varying,
    auth_password character varying,
    global boolean DEFAULT true NOT NULL,
    auth_type character varying DEFAULT 'plain'::character varying NOT NULL
);


--
-- Name: smtp_connections_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.smtp_connections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: smtp_connections_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.smtp_connections_id_seq OWNED BY sys.smtp_connections.id;


--
-- Name: timezones; Type: TABLE; Schema: sys; Owner: -
--

CREATE TABLE sys.timezones (
    id integer NOT NULL,
    name character varying NOT NULL,
    abbrev character varying,
    utc_offset interval,
    is_dst boolean
);


--
-- Name: timezones_id_seq; Type: SEQUENCE; Schema: sys; Owner: -
--

CREATE SEQUENCE sys.timezones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: timezones_id_seq; Type: SEQUENCE OWNED BY; Schema: sys; Owner: -
--

ALTER SEQUENCE sys.timezones_id_seq OWNED BY sys.timezones.id;


--
-- Name: accounts id; Type: DEFAULT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.accounts ALTER COLUMN id SET DEFAULT nextval('billing.accounts_id_seq'::regclass);


--
-- Name: invoice_periods id; Type: DEFAULT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.invoice_periods ALTER COLUMN id SET DEFAULT nextval('billing.invoice_periods_id_seq'::regclass);


--
-- Name: invoice_templates id; Type: DEFAULT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.invoice_templates ALTER COLUMN id SET DEFAULT nextval('billing.invoices_templates_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.payments ALTER COLUMN id SET DEFAULT nextval('billing.payments_id_seq'::regclass);


--
-- Name: area_prefixes id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.area_prefixes ALTER COLUMN id SET DEFAULT nextval('class4.area_prefixes_id_seq'::regclass);


--
-- Name: areas id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.areas ALTER COLUMN id SET DEFAULT nextval('class4.areas_id_seq'::regclass);


--
-- Name: codec_group_codecs id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.codec_group_codecs ALTER COLUMN id SET DEFAULT nextval('class4.codec_group_codecs_id_seq'::regclass);


--
-- Name: codec_groups id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.codec_groups ALTER COLUMN id SET DEFAULT nextval('class4.codec_groups_id_seq'::regclass);


--
-- Name: codecs id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.codecs ALTER COLUMN id SET DEFAULT nextval('class4.codecs_id_seq'::regclass);


--
-- Name: customers_auth id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth ALTER COLUMN id SET DEFAULT nextval('class4.customers_auth_id_seq'::regclass);


--
-- Name: customers_auth_normalized id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth_normalized ALTER COLUMN id SET DEFAULT nextval('class4.customers_auth_normalized_id_seq'::regclass);


--
-- Name: destination_next_rates id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.destination_next_rates ALTER COLUMN id SET DEFAULT nextval('class4.destination_next_rates_id_seq'::regclass);


--
-- Name: destinations id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.destinations ALTER COLUMN id SET DEFAULT nextval('class4.destinations_id_seq'::regclass);


--
-- Name: dialpeer_next_rates id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dialpeer_next_rates ALTER COLUMN id SET DEFAULT nextval('class4.dialpeer_next_rates_id_seq'::regclass);


--
-- Name: dialpeers id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dialpeers ALTER COLUMN id SET DEFAULT nextval('class4.dialpeers_id_seq'::regclass);


--
-- Name: disconnect_code id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.disconnect_code ALTER COLUMN id SET DEFAULT nextval('class4.disconnect_code_id_seq'::regclass);


--
-- Name: disconnect_policy id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.disconnect_policy ALTER COLUMN id SET DEFAULT nextval('class4.disconnect_code_policy_id_seq'::regclass);


--
-- Name: disconnect_policy_code id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.disconnect_policy_code ALTER COLUMN id SET DEFAULT nextval('class4.disconnect_code_policy_codes_id_seq'::regclass);


--
-- Name: gateway_groups id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateway_groups ALTER COLUMN id SET DEFAULT nextval('class4.gateway_groups_id_seq'::regclass);


--
-- Name: gateways id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways ALTER COLUMN id SET DEFAULT nextval('class4.gateways_id_seq'::regclass);


--
-- Name: lnp_cache id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_cache ALTER COLUMN id SET DEFAULT nextval('class4.lnp_cache_id_seq'::regclass);


--
-- Name: lnp_databases id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_databases ALTER COLUMN id SET DEFAULT nextval('class4.lnp_databases_id_seq'::regclass);


--
-- Name: lnp_databases database_id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_databases ALTER COLUMN database_id SET DEFAULT nextval('class4.lnp_databases_database_id_seq'::regclass);


--
-- Name: lnp_databases_30x_redirect id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_databases_30x_redirect ALTER COLUMN id SET DEFAULT nextval('class4.lnp_databases_30x_redirect_id_seq'::regclass);


--
-- Name: lnp_databases_alcazar id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_databases_alcazar ALTER COLUMN id SET DEFAULT nextval('class4.lnp_databases_alcazar_id_seq'::regclass);


--
-- Name: lnp_databases_coure_anq id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_databases_coure_anq ALTER COLUMN id SET DEFAULT nextval('class4.lnp_databases_coure_anq_id_seq'::regclass);


--
-- Name: lnp_databases_csv id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_databases_csv ALTER COLUMN id SET DEFAULT nextval('class4.lnp_databases_csv_id_seq'::regclass);


--
-- Name: lnp_databases_thinq id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_databases_thinq ALTER COLUMN id SET DEFAULT nextval('class4.lnp_databases_thinq_id_seq'::regclass);


--
-- Name: numberlist_items id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlist_items ALTER COLUMN id SET DEFAULT nextval('class4.blacklist_items_id_seq'::regclass);


--
-- Name: numberlists id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlists ALTER COLUMN id SET DEFAULT nextval('class4.blacklists_id_seq'::regclass);


--
-- Name: radius_accounting_profile_interim_attributes id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_accounting_profile_interim_attributes ALTER COLUMN id SET DEFAULT nextval('class4.radius_accounting_profile_interim_attributes_id_seq'::regclass);


--
-- Name: radius_accounting_profile_start_attributes id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_accounting_profile_start_attributes ALTER COLUMN id SET DEFAULT nextval('class4.radius_accounting_profile_start_attributes_id_seq'::regclass);


--
-- Name: radius_accounting_profile_stop_attributes id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_accounting_profile_stop_attributes ALTER COLUMN id SET DEFAULT nextval('class4.radius_accounting_profile_stop_attributes_id_seq'::regclass);


--
-- Name: radius_accounting_profiles id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_accounting_profiles ALTER COLUMN id SET DEFAULT nextval('class4.radius_accounting_profiles_id_seq'::regclass);


--
-- Name: radius_auth_profile_attributes id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_auth_profile_attributes ALTER COLUMN id SET DEFAULT nextval('class4.radius_auth_profile_attributes_id_seq'::regclass);


--
-- Name: radius_auth_profiles id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_auth_profiles ALTER COLUMN id SET DEFAULT nextval('class4.radius_auth_profiles_id_seq'::regclass);


--
-- Name: rate_groups id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rate_groups ALTER COLUMN id SET DEFAULT nextval('class4.rate_groups_id_seq'::regclass);


--
-- Name: rate_plan_groups id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rate_plan_groups ALTER COLUMN id SET DEFAULT nextval('class4.rate_plan_groups_id_seq'::regclass);


--
-- Name: rateplans id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rateplans ALTER COLUMN id SET DEFAULT nextval('class4.rateplans_id_seq'::regclass);


--
-- Name: registrations id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.registrations ALTER COLUMN id SET DEFAULT nextval('class4.registrations_id_seq'::regclass);


--
-- Name: routeset_discriminators id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routeset_discriminators ALTER COLUMN id SET DEFAULT nextval('class4.routeset_discriminators_id_seq'::regclass);


--
-- Name: routing_groups id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_groups ALTER COLUMN id SET DEFAULT nextval('class4.routing_groups_id_seq'::regclass);


--
-- Name: routing_plan_groups id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plan_groups ALTER COLUMN id SET DEFAULT nextval('class4.routing_plan_groups_id_seq'::regclass);


--
-- Name: routing_plan_lnp_rules id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plan_lnp_rules ALTER COLUMN id SET DEFAULT nextval('class4.routing_plan_lnp_rules_id_seq'::regclass);


--
-- Name: routing_plan_static_routes id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plan_static_routes ALTER COLUMN id SET DEFAULT nextval('class4.routing_plan_static_routes_id_seq'::regclass);


--
-- Name: routing_plans id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plans ALTER COLUMN id SET DEFAULT nextval('class4.routing_plans_id_seq'::regclass);


--
-- Name: routing_tag_detection_rules id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_tag_detection_rules ALTER COLUMN id SET DEFAULT nextval('class4.routing_tag_detection_rules_id_seq'::regclass);


--
-- Name: routing_tags id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_tags ALTER COLUMN id SET DEFAULT nextval('class4.routing_tags_id_seq'::regclass);


--
-- Name: session_refresh_methods id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.session_refresh_methods ALTER COLUMN id SET DEFAULT nextval('class4.session_refresh_methods_id_seq'::regclass);


--
-- Name: sip_options_probers id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.sip_options_probers ALTER COLUMN id SET DEFAULT nextval('class4.sip_options_probers_id_seq'::regclass);


--
-- Name: sortings id; Type: DEFAULT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.sortings ALTER COLUMN id SET DEFAULT nextval('class4.sortings_id_seq'::regclass);


--
-- Name: import_accounts id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_accounts ALTER COLUMN id SET DEFAULT nextval('data_import.import_accounts_id_seq'::regclass);


--
-- Name: import_codec_group_codecs id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_codec_group_codecs ALTER COLUMN id SET DEFAULT nextval('data_import.import_codec_group_codecs_id_seq'::regclass);


--
-- Name: import_codec_groups id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_codec_groups ALTER COLUMN id SET DEFAULT nextval('data_import.import_codec_groups_id_seq'::regclass);


--
-- Name: import_contractors id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_contractors ALTER COLUMN id SET DEFAULT nextval('data_import.import_contractors_id_seq'::regclass);


--
-- Name: import_customers_auth id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_customers_auth ALTER COLUMN id SET DEFAULT nextval('data_import.import_customers_auth_id_seq'::regclass);


--
-- Name: import_destinations id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_destinations ALTER COLUMN id SET DEFAULT nextval('data_import.import_destinations_id_seq'::regclass);


--
-- Name: import_dialpeers id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_dialpeers ALTER COLUMN id SET DEFAULT nextval('data_import.import_dialpeers_id_seq'::regclass);


--
-- Name: import_disconnect_policies id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_disconnect_policies ALTER COLUMN id SET DEFAULT nextval('data_import.import_disconnect_policies_id_seq'::regclass);


--
-- Name: import_gateway_groups id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_gateway_groups ALTER COLUMN id SET DEFAULT nextval('data_import.import_gateway_groups_id_seq'::regclass);


--
-- Name: import_gateways id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_gateways ALTER COLUMN id SET DEFAULT nextval('data_import.import_gateways_id_seq1'::regclass);


--
-- Name: import_numberlist_items id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_numberlist_items ALTER COLUMN id SET DEFAULT nextval('data_import.import_numberlist_items_id_seq'::regclass);


--
-- Name: import_numberlists id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_numberlists ALTER COLUMN id SET DEFAULT nextval('data_import.import_numberlists_id_seq'::regclass);


--
-- Name: import_rate_groups id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_rate_groups ALTER COLUMN id SET DEFAULT nextval('data_import.import_rate_groups_id_seq'::regclass);


--
-- Name: import_rateplans id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_rateplans ALTER COLUMN id SET DEFAULT nextval('data_import.import_rateplans_id_seq'::regclass);


--
-- Name: import_registrations id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_registrations ALTER COLUMN id SET DEFAULT nextval('data_import.import_registrations_id_seq'::regclass);


--
-- Name: import_routing_groups id; Type: DEFAULT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_routing_groups ALTER COLUMN id SET DEFAULT nextval('data_import.import_routing_groups_id_seq'::regclass);


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: gui; Owner: -
--

ALTER TABLE ONLY gui.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('gui.admin_notes_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: gui; Owner: -
--

ALTER TABLE ONLY gui.admin_users ALTER COLUMN id SET DEFAULT nextval('gui.admin_users_id_seq'::regclass);


--
-- Name: background_threads id; Type: DEFAULT; Schema: gui; Owner: -
--

ALTER TABLE ONLY gui.background_threads ALTER COLUMN id SET DEFAULT nextval('gui.background_threads_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: gui; Owner: -
--

ALTER TABLE ONLY gui.sessions ALTER COLUMN id SET DEFAULT nextval('gui.sessions_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: gui; Owner: -
--

ALTER TABLE ONLY gui.versions ALTER COLUMN id SET DEFAULT nextval('gui.versions_id_seq'::regclass);


--
-- Name: api_requests id; Type: DEFAULT; Schema: logs; Owner: -
--

ALTER TABLE ONLY logs.api_requests ALTER COLUMN id SET DEFAULT nextval('logs.api_requests_id_seq'::regclass);


--
-- Name: balance_notifications id; Type: DEFAULT; Schema: logs; Owner: -
--

ALTER TABLE ONLY logs.balance_notifications ALTER COLUMN id SET DEFAULT nextval('logs.balance_notifications_id_seq'::regclass);


--
-- Name: logic_log id; Type: DEFAULT; Schema: logs; Owner: -
--

ALTER TABLE ONLY logs.logic_log ALTER COLUMN id SET DEFAULT nextval('logs.logic_log_id_seq'::regclass);


--
-- Name: alerts id; Type: DEFAULT; Schema: notifications; Owner: -
--

ALTER TABLE ONLY notifications.alerts ALTER COLUMN id SET DEFAULT nextval('notifications.alerts_id_seq'::regclass);


--
-- Name: attachments id; Type: DEFAULT; Schema: notifications; Owner: -
--

ALTER TABLE ONLY notifications.attachments ALTER COLUMN id SET DEFAULT nextval('notifications.attachments_id_seq'::regclass);


--
-- Name: contacts id; Type: DEFAULT; Schema: notifications; Owner: -
--

ALTER TABLE ONLY notifications.contacts ALTER COLUMN id SET DEFAULT nextval('notifications.contacts_id_seq'::regclass);


--
-- Name: email_logs id; Type: DEFAULT; Schema: notifications; Owner: -
--

ALTER TABLE ONLY notifications.email_logs ALTER COLUMN id SET DEFAULT nextval('notifications.email_log_id_seq'::regclass);


--
-- Name: contractors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contractors ALTER COLUMN id SET DEFAULT nextval('public.contractors_id_seq'::regclass);


--
-- Name: dialpeers_stats id; Type: DEFAULT; Schema: runtime_stats; Owner: -
--

ALTER TABLE ONLY runtime_stats.dialpeers_stats ALTER COLUMN id SET DEFAULT nextval('runtime_stats.dialpeers_stats_id_seq'::regclass);


--
-- Name: gateways_stats id; Type: DEFAULT; Schema: runtime_stats; Owner: -
--

ALTER TABLE ONLY runtime_stats.gateways_stats ALTER COLUMN id SET DEFAULT nextval('runtime_stats.gateways_stats_id_seq'::regclass);


--
-- Name: resource_type id; Type: DEFAULT; Schema: switch18; Owner: -
--

ALTER TABLE ONLY switch18.resource_type ALTER COLUMN id SET DEFAULT nextval('switch18.resource_type_id_seq'::regclass);


--
-- Name: switch_interface_out id; Type: DEFAULT; Schema: switch18; Owner: -
--

ALTER TABLE ONLY switch18.switch_interface_out ALTER COLUMN id SET DEFAULT nextval('switch18.switch_interface_id_seq'::regclass);


--
-- Name: trusted_headers id; Type: DEFAULT; Schema: switch18; Owner: -
--

ALTER TABLE ONLY switch18.trusted_headers ALTER COLUMN id SET DEFAULT nextval('switch18.trusted_headers_id_seq'::regclass);


--
-- Name: resource_type id; Type: DEFAULT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.resource_type ALTER COLUMN id SET DEFAULT nextval('switch19.resource_type_id_seq'::regclass);


--
-- Name: switch_interface_out id; Type: DEFAULT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.switch_interface_out ALTER COLUMN id SET DEFAULT nextval('switch19.switch_interface_id_seq'::regclass);


--
-- Name: trusted_headers id; Type: DEFAULT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.trusted_headers ALTER COLUMN id SET DEFAULT nextval('switch19.trusted_headers_id_seq'::regclass);


--
-- Name: active_currencies id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.active_currencies ALTER COLUMN id SET DEFAULT nextval('sys.active_currencies_id_seq'::regclass);


--
-- Name: api_access id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.api_access ALTER COLUMN id SET DEFAULT nextval('sys.api_access_id_seq'::regclass);


--
-- Name: api_log_config id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.api_log_config ALTER COLUMN id SET DEFAULT nextval('sys.api_log_config_id_seq'::regclass);


--
-- Name: cdr_exports id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.cdr_exports ALTER COLUMN id SET DEFAULT nextval('sys.cdr_exports_id_seq'::regclass);


--
-- Name: cdr_tables id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.cdr_tables ALTER COLUMN id SET DEFAULT nextval('sys.cdrtables_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.countries ALTER COLUMN id SET DEFAULT nextval('sys.countries_id_seq'::regclass);


--
-- Name: currencies id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.currencies ALTER COLUMN id SET DEFAULT nextval('sys.currencies_id_seq'::regclass);


--
-- Name: delayed_jobs id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.delayed_jobs ALTER COLUMN id SET DEFAULT nextval('sys.delayed_jobs_id_seq'::regclass);


--
-- Name: guiconfig id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.guiconfig ALTER COLUMN id SET DEFAULT nextval('sys.guiconfig_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.jobs ALTER COLUMN id SET DEFAULT nextval('sys.jobs_id_seq'::regclass);


--
-- Name: lnp_resolvers id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.lnp_resolvers ALTER COLUMN id SET DEFAULT nextval('sys.lnp_resolvers_id_seq'::regclass);


--
-- Name: load_balancers id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.load_balancers ALTER COLUMN id SET DEFAULT nextval('sys.load_balancers_id_seq'::regclass);


--
-- Name: lua_scripts id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.lua_scripts ALTER COLUMN id SET DEFAULT nextval('sys.lua_scripts_id_seq'::regclass);


--
-- Name: network_prefixes id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.network_prefixes ALTER COLUMN id SET DEFAULT nextval('sys.network_prefixes_id_seq'::regclass);


--
-- Name: network_types id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.network_types ALTER COLUMN id SET DEFAULT nextval('sys.network_types_id_seq'::regclass);


--
-- Name: networks id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.networks ALTER COLUMN id SET DEFAULT nextval('sys.networks_id_seq'::regclass);


--
-- Name: sensors id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.sensors ALTER COLUMN id SET DEFAULT nextval('sys.sensors_id_seq'::regclass);


--
-- Name: smtp_connections id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.smtp_connections ALTER COLUMN id SET DEFAULT nextval('sys.smtp_connections_id_seq'::regclass);


--
-- Name: timezones id; Type: DEFAULT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.timezones ALTER COLUMN id SET DEFAULT nextval('sys.timezones_id_seq'::regclass);


--
-- Name: accounts accounts_external_id_key; Type: CONSTRAINT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.accounts
    ADD CONSTRAINT accounts_external_id_key UNIQUE (external_id);


--
-- Name: accounts accounts_name_key; Type: CONSTRAINT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.accounts
    ADD CONSTRAINT accounts_name_key UNIQUE (name);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: accounts accounts_uuid_key; Type: CONSTRAINT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.accounts
    ADD CONSTRAINT accounts_uuid_key UNIQUE (uuid);


--
-- Name: cdr_batches cdr_batches_pkey; Type: CONSTRAINT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.cdr_batches
    ADD CONSTRAINT cdr_batches_pkey PRIMARY KEY (id);


--
-- Name: invoice_periods invoice_periods_name_key; Type: CONSTRAINT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.invoice_periods
    ADD CONSTRAINT invoice_periods_name_key UNIQUE (name);


--
-- Name: invoice_periods invoice_periods_pkey; Type: CONSTRAINT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.invoice_periods
    ADD CONSTRAINT invoice_periods_pkey PRIMARY KEY (id);


--
-- Name: invoice_templates invoices_templates_name_key; Type: CONSTRAINT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.invoice_templates
    ADD CONSTRAINT invoices_templates_name_key UNIQUE (name);


--
-- Name: invoice_templates invoices_templates_pkey; Type: CONSTRAINT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.invoice_templates
    ADD CONSTRAINT invoices_templates_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: area_prefixes area_prefixes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.area_prefixes
    ADD CONSTRAINT area_prefixes_pkey PRIMARY KEY (id);


--
-- Name: area_prefixes area_prefixes_prefix_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.area_prefixes
    ADD CONSTRAINT area_prefixes_prefix_key UNIQUE (prefix);


--
-- Name: areas areas_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.areas
    ADD CONSTRAINT areas_name_key UNIQUE (name);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: numberlist_items blacklist_items_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlist_items
    ADD CONSTRAINT blacklist_items_pkey PRIMARY KEY (id);


--
-- Name: numberlist_modes blacklist_modes_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlist_modes
    ADD CONSTRAINT blacklist_modes_name_key UNIQUE (name);


--
-- Name: numberlist_modes blacklist_modes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlist_modes
    ADD CONSTRAINT blacklist_modes_pkey PRIMARY KEY (id);


--
-- Name: numberlists blacklists_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlists
    ADD CONSTRAINT blacklists_name_key UNIQUE (name);


--
-- Name: numberlists blacklists_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlists
    ADD CONSTRAINT blacklists_pkey PRIMARY KEY (id);


--
-- Name: codec_group_codecs codec_group_codecs_codec_group_id_codec_id_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.codec_group_codecs
    ADD CONSTRAINT codec_group_codecs_codec_group_id_codec_id_key UNIQUE (codec_group_id, codec_id);


--
-- Name: codec_group_codecs codec_group_codecs_codec_group_id_priority_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.codec_group_codecs
    ADD CONSTRAINT codec_group_codecs_codec_group_id_priority_key UNIQUE (codec_group_id, priority);


--
-- Name: codec_group_codecs codec_group_codecs_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.codec_group_codecs
    ADD CONSTRAINT codec_group_codecs_pkey PRIMARY KEY (id);


--
-- Name: codec_groups codec_groups_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.codec_groups
    ADD CONSTRAINT codec_groups_name_key UNIQUE (name);


--
-- Name: codec_groups codec_groups_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.codec_groups
    ADD CONSTRAINT codec_groups_pkey PRIMARY KEY (id);


--
-- Name: codecs codecs_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.codecs
    ADD CONSTRAINT codecs_name_key UNIQUE (name);


--
-- Name: codecs codecs_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.codecs
    ADD CONSTRAINT codecs_pkey PRIMARY KEY (id);


--
-- Name: customers_auth_dst_number_fields customers_auth_dst_number_fields_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth_dst_number_fields
    ADD CONSTRAINT customers_auth_dst_number_fields_name_key UNIQUE (name);


--
-- Name: customers_auth_dst_number_fields customers_auth_dst_number_fields_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth_dst_number_fields
    ADD CONSTRAINT customers_auth_dst_number_fields_pkey PRIMARY KEY (id);


--
-- Name: customers_auth customers_auth_external_id_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_external_id_key UNIQUE (external_id);


--
-- Name: customers_auth customers_auth_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_name_key UNIQUE (name);


--
-- Name: customers_auth_normalized customers_auth_normalized_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth_normalized
    ADD CONSTRAINT customers_auth_normalized_pkey PRIMARY KEY (id);


--
-- Name: customers_auth customers_auth_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_pkey PRIMARY KEY (id);


--
-- Name: customers_auth_src_name_fields customers_auth_src_name_fields_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth_src_name_fields
    ADD CONSTRAINT customers_auth_src_name_fields_name_key UNIQUE (name);


--
-- Name: customers_auth_src_name_fields customers_auth_src_name_fields_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth_src_name_fields
    ADD CONSTRAINT customers_auth_src_name_fields_pkey PRIMARY KEY (id);


--
-- Name: customers_auth_src_number_fields customers_auth_src_number_fields_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth_src_number_fields
    ADD CONSTRAINT customers_auth_src_number_fields_name_key UNIQUE (name);


--
-- Name: customers_auth_src_number_fields customers_auth_src_number_fields_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth_src_number_fields
    ADD CONSTRAINT customers_auth_src_number_fields_pkey PRIMARY KEY (id);


--
-- Name: destination_next_rates destination_next_rates_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.destination_next_rates
    ADD CONSTRAINT destination_next_rates_pkey PRIMARY KEY (id);


--
-- Name: destination_rate_policy destination_rate_policy_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.destination_rate_policy
    ADD CONSTRAINT destination_rate_policy_name_key UNIQUE (name);


--
-- Name: destination_rate_policy destination_rate_policy_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.destination_rate_policy
    ADD CONSTRAINT destination_rate_policy_pkey PRIMARY KEY (id);


--
-- Name: destinations destinations_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.destinations
    ADD CONSTRAINT destinations_pkey PRIMARY KEY (id);


--
-- Name: destinations destinations_uuid_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.destinations
    ADD CONSTRAINT destinations_uuid_key UNIQUE (uuid);


--
-- Name: dialpeer_next_rates dialpeer_next_rates_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dialpeer_next_rates
    ADD CONSTRAINT dialpeer_next_rates_pkey PRIMARY KEY (id);


--
-- Name: dialpeers dialpeers_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dialpeers
    ADD CONSTRAINT dialpeers_pkey PRIMARY KEY (id);


--
-- Name: disconnect_code_namespace disconnect_code_namespace_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.disconnect_code_namespace
    ADD CONSTRAINT disconnect_code_namespace_name_key UNIQUE (name);


--
-- Name: disconnect_code_namespace disconnect_code_namespace_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.disconnect_code_namespace
    ADD CONSTRAINT disconnect_code_namespace_pkey PRIMARY KEY (id);


--
-- Name: disconnect_code disconnect_code_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.disconnect_code
    ADD CONSTRAINT disconnect_code_pkey PRIMARY KEY (id);


--
-- Name: disconnect_policy_code disconnect_code_policy_codes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.disconnect_policy_code
    ADD CONSTRAINT disconnect_code_policy_codes_pkey PRIMARY KEY (id);


--
-- Name: disconnect_policy disconnect_code_policy_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.disconnect_policy
    ADD CONSTRAINT disconnect_code_policy_name_key UNIQUE (name);


--
-- Name: disconnect_policy disconnect_code_policy_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.disconnect_policy
    ADD CONSTRAINT disconnect_code_policy_pkey PRIMARY KEY (id);


--
-- Name: disconnect_initiators disconnect_initiators_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.disconnect_initiators
    ADD CONSTRAINT disconnect_initiators_pkey PRIMARY KEY (id);


--
-- Name: diversion_policy diversion_policy_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.diversion_policy
    ADD CONSTRAINT diversion_policy_name_key UNIQUE (name);


--
-- Name: diversion_policy diversion_policy_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.diversion_policy
    ADD CONSTRAINT diversion_policy_pkey PRIMARY KEY (id);


--
-- Name: dtmf_receive_modes dtmf_receive_modes_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dtmf_receive_modes
    ADD CONSTRAINT dtmf_receive_modes_name_key UNIQUE (name);


--
-- Name: dtmf_receive_modes dtmf_receive_modes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dtmf_receive_modes
    ADD CONSTRAINT dtmf_receive_modes_pkey PRIMARY KEY (id);


--
-- Name: dtmf_send_modes dtmf_send_modes_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dtmf_send_modes
    ADD CONSTRAINT dtmf_send_modes_name_key UNIQUE (name);


--
-- Name: dtmf_send_modes dtmf_send_modes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dtmf_send_modes
    ADD CONSTRAINT dtmf_send_modes_pkey PRIMARY KEY (id);


--
-- Name: dump_level dump_level_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dump_level
    ADD CONSTRAINT dump_level_name_key UNIQUE (name);


--
-- Name: dump_level dump_level_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dump_level
    ADD CONSTRAINT dump_level_pkey PRIMARY KEY (id);


--
-- Name: filter_types filter_types_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.filter_types
    ADD CONSTRAINT filter_types_pkey PRIMARY KEY (id);


--
-- Name: gateway_group_balancing_modes gateway_group_balancing_modes_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateway_group_balancing_modes
    ADD CONSTRAINT gateway_group_balancing_modes_name_key UNIQUE (name);


--
-- Name: gateway_group_balancing_modes gateway_group_balancing_modes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateway_group_balancing_modes
    ADD CONSTRAINT gateway_group_balancing_modes_pkey PRIMARY KEY (id);


--
-- Name: gateway_groups gateway_groups_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateway_groups
    ADD CONSTRAINT gateway_groups_name_key UNIQUE (name);


--
-- Name: gateway_groups gateway_groups_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateway_groups
    ADD CONSTRAINT gateway_groups_pkey PRIMARY KEY (id);


--
-- Name: gateway_inband_dtmf_filtering_modes gateway_inband_dtmf_filtering_modes_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateway_inband_dtmf_filtering_modes
    ADD CONSTRAINT gateway_inband_dtmf_filtering_modes_name_key UNIQUE (name);


--
-- Name: gateway_inband_dtmf_filtering_modes gateway_inband_dtmf_filtering_modes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateway_inband_dtmf_filtering_modes
    ADD CONSTRAINT gateway_inband_dtmf_filtering_modes_pkey PRIMARY KEY (id);


--
-- Name: gateway_media_encryption_modes gateway_media_encryption_modes_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateway_media_encryption_modes
    ADD CONSTRAINT gateway_media_encryption_modes_name_key UNIQUE (name);


--
-- Name: gateway_media_encryption_modes gateway_media_encryption_modes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateway_media_encryption_modes
    ADD CONSTRAINT gateway_media_encryption_modes_pkey PRIMARY KEY (id);


--
-- Name: gateway_network_protocol_priorities gateway_network_protocol_priorities_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateway_network_protocol_priorities
    ADD CONSTRAINT gateway_network_protocol_priorities_name_key UNIQUE (name);


--
-- Name: gateway_network_protocol_priorities gateway_network_protocol_priorities_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateway_network_protocol_priorities
    ADD CONSTRAINT gateway_network_protocol_priorities_pkey PRIMARY KEY (id);


--
-- Name: gateway_rel100_modes gateway_rel100_modes_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateway_rel100_modes
    ADD CONSTRAINT gateway_rel100_modes_name_key UNIQUE (name);


--
-- Name: gateway_rel100_modes gateway_rel100_modes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateway_rel100_modes
    ADD CONSTRAINT gateway_rel100_modes_pkey PRIMARY KEY (id);


--
-- Name: gateways gateways_name_unique; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_name_unique UNIQUE (name);


--
-- Name: gateways gateways_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_pkey PRIMARY KEY (id);


--
-- Name: lnp_cache lnp_cache_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_cache
    ADD CONSTRAINT lnp_cache_pkey PRIMARY KEY (id);


--
-- Name: lnp_databases_30x_redirect lnp_databases_30x_redirect_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_databases_30x_redirect
    ADD CONSTRAINT lnp_databases_30x_redirect_pkey PRIMARY KEY (id);


--
-- Name: lnp_databases_alcazar lnp_databases_alcazar_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_databases_alcazar
    ADD CONSTRAINT lnp_databases_alcazar_pkey PRIMARY KEY (id);


--
-- Name: lnp_databases_coure_anq lnp_databases_coure_anq_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_databases_coure_anq
    ADD CONSTRAINT lnp_databases_coure_anq_pkey PRIMARY KEY (id);


--
-- Name: lnp_databases_csv lnp_databases_csv_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_databases_csv
    ADD CONSTRAINT lnp_databases_csv_pkey PRIMARY KEY (id);


--
-- Name: lnp_databases lnp_databases_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_databases
    ADD CONSTRAINT lnp_databases_name_key UNIQUE (name);


--
-- Name: lnp_databases lnp_databases_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_databases
    ADD CONSTRAINT lnp_databases_pkey PRIMARY KEY (id);


--
-- Name: lnp_databases_thinq lnp_databases_thinq_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_databases_thinq
    ADD CONSTRAINT lnp_databases_thinq_pkey PRIMARY KEY (id);


--
-- Name: numberlist_actions numberlist_actions_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlist_actions
    ADD CONSTRAINT numberlist_actions_name_key UNIQUE (name);


--
-- Name: numberlist_actions numberlist_actions_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlist_actions
    ADD CONSTRAINT numberlist_actions_pkey PRIMARY KEY (id);


--
-- Name: numberlists numberlists_external_id_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlists
    ADD CONSTRAINT numberlists_external_id_key UNIQUE (external_id);


--
-- Name: radius_accounting_profile_interim_attributes radius_accounting_profile_interim_attributes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_accounting_profile_interim_attributes
    ADD CONSTRAINT radius_accounting_profile_interim_attributes_pkey PRIMARY KEY (id);


--
-- Name: radius_accounting_profile_start_attributes radius_accounting_profile_start_attributes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_accounting_profile_start_attributes
    ADD CONSTRAINT radius_accounting_profile_start_attributes_pkey PRIMARY KEY (id);


--
-- Name: radius_accounting_profile_stop_attributes radius_accounting_profile_stop_attributes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_accounting_profile_stop_attributes
    ADD CONSTRAINT radius_accounting_profile_stop_attributes_pkey PRIMARY KEY (id);


--
-- Name: radius_accounting_profiles radius_accounting_profiles_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_accounting_profiles
    ADD CONSTRAINT radius_accounting_profiles_name_key UNIQUE (name);


--
-- Name: radius_accounting_profiles radius_accounting_profiles_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_accounting_profiles
    ADD CONSTRAINT radius_accounting_profiles_pkey PRIMARY KEY (id);


--
-- Name: radius_auth_profile_attributes radius_auth_profile_attributes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_auth_profile_attributes
    ADD CONSTRAINT radius_auth_profile_attributes_pkey PRIMARY KEY (id);


--
-- Name: radius_auth_profiles radius_auth_profiles_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_auth_profiles
    ADD CONSTRAINT radius_auth_profiles_name_key UNIQUE (name);


--
-- Name: radius_auth_profiles radius_auth_profiles_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_auth_profiles
    ADD CONSTRAINT radius_auth_profiles_pkey PRIMARY KEY (id);


--
-- Name: rate_groups rate_groups_external_id_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rate_groups
    ADD CONSTRAINT rate_groups_external_id_key UNIQUE (external_id);


--
-- Name: rate_groups rate_groups_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rate_groups
    ADD CONSTRAINT rate_groups_name_key UNIQUE (name);


--
-- Name: rate_groups rate_groups_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rate_groups
    ADD CONSTRAINT rate_groups_pkey PRIMARY KEY (id);


--
-- Name: rate_plan_groups rate_plan_groups_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rate_plan_groups
    ADD CONSTRAINT rate_plan_groups_pkey PRIMARY KEY (id);


--
-- Name: rate_profit_control_modes rate_profit_control_modes_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rate_profit_control_modes
    ADD CONSTRAINT rate_profit_control_modes_name_key UNIQUE (name);


--
-- Name: rate_profit_control_modes rate_profit_control_modes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rate_profit_control_modes
    ADD CONSTRAINT rate_profit_control_modes_pkey PRIMARY KEY (id);


--
-- Name: rateplans rateplans_external_id_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rateplans
    ADD CONSTRAINT rateplans_external_id_key UNIQUE (external_id);


--
-- Name: rateplans rateplans_name_unique; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rateplans
    ADD CONSTRAINT rateplans_name_unique UNIQUE (name);


--
-- Name: rateplans rateplans_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rateplans
    ADD CONSTRAINT rateplans_pkey PRIMARY KEY (id);


--
-- Name: rateplans rateplans_uuid_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rateplans
    ADD CONSTRAINT rateplans_uuid_key UNIQUE (uuid);


--
-- Name: registrations registrations_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.registrations
    ADD CONSTRAINT registrations_name_key UNIQUE (name);


--
-- Name: registrations registrations_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.registrations
    ADD CONSTRAINT registrations_pkey PRIMARY KEY (id);


--
-- Name: routeset_discriminators routeset_discriminators_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routeset_discriminators
    ADD CONSTRAINT routeset_discriminators_name_key UNIQUE (name);


--
-- Name: routeset_discriminators routeset_discriminators_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routeset_discriminators
    ADD CONSTRAINT routeset_discriminators_pkey PRIMARY KEY (id);


--
-- Name: routing_groups routing_groups_name_unique; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_groups
    ADD CONSTRAINT routing_groups_name_unique UNIQUE (name);


--
-- Name: routing_groups routing_groups_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_groups
    ADD CONSTRAINT routing_groups_pkey PRIMARY KEY (id);


--
-- Name: routing_plan_groups routing_plan_groups_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plan_groups
    ADD CONSTRAINT routing_plan_groups_pkey PRIMARY KEY (id);


--
-- Name: routing_plan_groups routing_plan_groups_routing_plan_id_routing_group_id_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plan_groups
    ADD CONSTRAINT routing_plan_groups_routing_plan_id_routing_group_id_key UNIQUE (routing_plan_id, routing_group_id);


--
-- Name: routing_plan_lnp_rules routing_plan_lnp_rules_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plan_lnp_rules
    ADD CONSTRAINT routing_plan_lnp_rules_pkey PRIMARY KEY (id);


--
-- Name: routing_plan_static_routes routing_plan_static_routes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plan_static_routes
    ADD CONSTRAINT routing_plan_static_routes_pkey PRIMARY KEY (id);


--
-- Name: routing_plans routing_plans_external_id_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plans
    ADD CONSTRAINT routing_plans_external_id_key UNIQUE (external_id);


--
-- Name: routing_plans routing_plans_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plans
    ADD CONSTRAINT routing_plans_name_key UNIQUE (name);


--
-- Name: routing_plans routing_plans_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plans
    ADD CONSTRAINT routing_plans_pkey PRIMARY KEY (id);


--
-- Name: routing_tag_detection_rules routing_tag_detection_rules_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_tag_detection_rules
    ADD CONSTRAINT routing_tag_detection_rules_pkey PRIMARY KEY (id);


--
-- Name: routing_tag_modes routing_tag_modes_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_tag_modes
    ADD CONSTRAINT routing_tag_modes_name_key UNIQUE (name);


--
-- Name: routing_tag_modes routing_tag_modes_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_tag_modes
    ADD CONSTRAINT routing_tag_modes_pkey PRIMARY KEY (id);


--
-- Name: routing_tags routing_tags_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_tags
    ADD CONSTRAINT routing_tags_name_key UNIQUE (name);


--
-- Name: routing_tags routing_tags_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_tags
    ADD CONSTRAINT routing_tags_pkey PRIMARY KEY (id);


--
-- Name: sdp_c_location sdp_c_location_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.sdp_c_location
    ADD CONSTRAINT sdp_c_location_name_key UNIQUE (name);


--
-- Name: sdp_c_location sdp_c_location_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.sdp_c_location
    ADD CONSTRAINT sdp_c_location_pkey PRIMARY KEY (id);


--
-- Name: session_refresh_methods session_refresh_methods_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.session_refresh_methods
    ADD CONSTRAINT session_refresh_methods_pkey PRIMARY KEY (id);


--
-- Name: sip_options_probers sip_options_probers_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.sip_options_probers
    ADD CONSTRAINT sip_options_probers_name_key UNIQUE (name);


--
-- Name: sip_options_probers sip_options_probers_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.sip_options_probers
    ADD CONSTRAINT sip_options_probers_pkey PRIMARY KEY (id);


--
-- Name: sortings sortings_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.sortings
    ADD CONSTRAINT sortings_pkey PRIMARY KEY (id);


--
-- Name: tag_actions tag_actions_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.tag_actions
    ADD CONSTRAINT tag_actions_name_key UNIQUE (name);


--
-- Name: tag_actions tag_actions_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.tag_actions
    ADD CONSTRAINT tag_actions_pkey PRIMARY KEY (id);


--
-- Name: transport_protocols transport_protocols_name_key; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.transport_protocols
    ADD CONSTRAINT transport_protocols_name_key UNIQUE (name);


--
-- Name: transport_protocols transport_protocols_pkey; Type: CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.transport_protocols
    ADD CONSTRAINT transport_protocols_pkey PRIMARY KEY (id);


--
-- Name: import_accounts import_accounts_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_accounts
    ADD CONSTRAINT import_accounts_pkey PRIMARY KEY (id);


--
-- Name: import_codec_group_codecs import_codec_group_codecs_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_codec_group_codecs
    ADD CONSTRAINT import_codec_group_codecs_pkey PRIMARY KEY (id);


--
-- Name: import_codec_groups import_codec_groups_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_codec_groups
    ADD CONSTRAINT import_codec_groups_pkey PRIMARY KEY (id);


--
-- Name: import_contractors import_contractors_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_contractors
    ADD CONSTRAINT import_contractors_pkey PRIMARY KEY (id);


--
-- Name: import_customers_auth import_customers_auth_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_customers_auth
    ADD CONSTRAINT import_customers_auth_pkey PRIMARY KEY (id);


--
-- Name: import_destinations import_destinations_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_destinations
    ADD CONSTRAINT import_destinations_pkey PRIMARY KEY (id);


--
-- Name: import_dialpeers import_dialpeers_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_dialpeers
    ADD CONSTRAINT import_dialpeers_pkey PRIMARY KEY (id);


--
-- Name: import_disconnect_policies import_disconnect_policies_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_disconnect_policies
    ADD CONSTRAINT import_disconnect_policies_pkey PRIMARY KEY (id);


--
-- Name: import_gateway_groups import_gateway_groups_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_gateway_groups
    ADD CONSTRAINT import_gateway_groups_pkey PRIMARY KEY (id);


--
-- Name: import_gateways import_gateways_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_gateways
    ADD CONSTRAINT import_gateways_pkey PRIMARY KEY (id);


--
-- Name: import_numberlist_items import_numberlist_items_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_numberlist_items
    ADD CONSTRAINT import_numberlist_items_pkey PRIMARY KEY (id);


--
-- Name: import_numberlists import_numberlists_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_numberlists
    ADD CONSTRAINT import_numberlists_pkey PRIMARY KEY (id);


--
-- Name: import_rate_groups import_rate_groups_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_rate_groups
    ADD CONSTRAINT import_rate_groups_pkey PRIMARY KEY (id);


--
-- Name: import_rateplans import_rateplans_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_rateplans
    ADD CONSTRAINT import_rateplans_pkey PRIMARY KEY (id);


--
-- Name: import_registrations import_registrations_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_registrations
    ADD CONSTRAINT import_registrations_pkey PRIMARY KEY (id);


--
-- Name: import_routing_groups import_routing_groups_pkey; Type: CONSTRAINT; Schema: data_import; Owner: -
--

ALTER TABLE ONLY data_import.import_routing_groups
    ADD CONSTRAINT import_routing_groups_pkey PRIMARY KEY (id);


--
-- Name: active_admin_comments admin_notes_pkey; Type: CONSTRAINT; Schema: gui; Owner: -
--

ALTER TABLE ONLY gui.active_admin_comments
    ADD CONSTRAINT admin_notes_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: gui; Owner: -
--

ALTER TABLE ONLY gui.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_username_key; Type: CONSTRAINT; Schema: gui; Owner: -
--

ALTER TABLE ONLY gui.admin_users
    ADD CONSTRAINT admin_users_username_key UNIQUE (username);


--
-- Name: background_threads background_threads_pkey; Type: CONSTRAINT; Schema: gui; Owner: -
--

ALTER TABLE ONLY gui.background_threads
    ADD CONSTRAINT background_threads_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: gui; Owner: -
--

ALTER TABLE ONLY gui.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_session_id_key; Type: CONSTRAINT; Schema: gui; Owner: -
--

ALTER TABLE ONLY gui.sessions
    ADD CONSTRAINT sessions_session_id_key UNIQUE (session_id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: gui; Owner: -
--

ALTER TABLE ONLY gui.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: api_requests api_requests_pkey; Type: CONSTRAINT; Schema: logs; Owner: -
--

ALTER TABLE ONLY logs.api_requests
    ADD CONSTRAINT api_requests_pkey PRIMARY KEY (id, created_at);


--
-- Name: balance_notifications balance_notifications_pkey; Type: CONSTRAINT; Schema: logs; Owner: -
--

ALTER TABLE ONLY logs.balance_notifications
    ADD CONSTRAINT balance_notifications_pkey PRIMARY KEY (id);


--
-- Name: logic_log logic_log_pkey; Type: CONSTRAINT; Schema: logs; Owner: -
--

ALTER TABLE ONLY logs.logic_log
    ADD CONSTRAINT logic_log_pkey PRIMARY KEY (id);


--
-- Name: alerts alerts_event_key; Type: CONSTRAINT; Schema: notifications; Owner: -
--

ALTER TABLE ONLY notifications.alerts
    ADD CONSTRAINT alerts_event_key UNIQUE (event);


--
-- Name: alerts alerts_pkey; Type: CONSTRAINT; Schema: notifications; Owner: -
--

ALTER TABLE ONLY notifications.alerts
    ADD CONSTRAINT alerts_pkey PRIMARY KEY (id);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: notifications; Owner: -
--

ALTER TABLE ONLY notifications.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: notifications; Owner: -
--

ALTER TABLE ONLY notifications.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: email_logs email_log_pkey; Type: CONSTRAINT; Schema: notifications; Owner: -
--

ALTER TABLE ONLY notifications.email_logs
    ADD CONSTRAINT email_log_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: contractors contractors_external_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contractors
    ADD CONSTRAINT contractors_external_id_key UNIQUE (external_id);


--
-- Name: contractors contractors_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contractors
    ADD CONSTRAINT contractors_name_unique UNIQUE (name);


--
-- Name: contractors contractors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contractors
    ADD CONSTRAINT contractors_pkey PRIMARY KEY (id);


--
-- Name: dialpeers_stats dialpeers_stats_pkey; Type: CONSTRAINT; Schema: runtime_stats; Owner: -
--

ALTER TABLE ONLY runtime_stats.dialpeers_stats
    ADD CONSTRAINT dialpeers_stats_pkey PRIMARY KEY (id);


--
-- Name: gateways_stats gateways_stats_pkey; Type: CONSTRAINT; Schema: runtime_stats; Owner: -
--

ALTER TABLE ONLY runtime_stats.gateways_stats
    ADD CONSTRAINT gateways_stats_pkey PRIMARY KEY (id);


--
-- Name: dialpeers_stats unique_dp; Type: CONSTRAINT; Schema: runtime_stats; Owner: -
--

ALTER TABLE ONLY runtime_stats.dialpeers_stats
    ADD CONSTRAINT unique_dp UNIQUE (dialpeer_id);


--
-- Name: gateways_stats unique_gw; Type: CONSTRAINT; Schema: runtime_stats; Owner: -
--

ALTER TABLE ONLY runtime_stats.gateways_stats
    ADD CONSTRAINT unique_gw UNIQUE (gateway_id);


--
-- Name: resource_action resource_action_name_key; Type: CONSTRAINT; Schema: switch18; Owner: -
--

ALTER TABLE ONLY switch18.resource_action
    ADD CONSTRAINT resource_action_name_key UNIQUE (name);


--
-- Name: resource_action resource_action_pkey; Type: CONSTRAINT; Schema: switch18; Owner: -
--

ALTER TABLE ONLY switch18.resource_action
    ADD CONSTRAINT resource_action_pkey PRIMARY KEY (id);


--
-- Name: resource_type resource_type_name_key; Type: CONSTRAINT; Schema: switch18; Owner: -
--

ALTER TABLE ONLY switch18.resource_type
    ADD CONSTRAINT resource_type_name_key UNIQUE (name);


--
-- Name: resource_type resource_type_pkey; Type: CONSTRAINT; Schema: switch18; Owner: -
--

ALTER TABLE ONLY switch18.resource_type
    ADD CONSTRAINT resource_type_pkey PRIMARY KEY (id);


--
-- Name: switch_interface_in switch_in_interface_pkey; Type: CONSTRAINT; Schema: switch18; Owner: -
--

ALTER TABLE ONLY switch18.switch_interface_in
    ADD CONSTRAINT switch_in_interface_pkey PRIMARY KEY (id);


--
-- Name: switch_interface_in switch_in_interface_rank_key; Type: CONSTRAINT; Schema: switch18; Owner: -
--

ALTER TABLE ONLY switch18.switch_interface_in
    ADD CONSTRAINT switch_in_interface_rank_key UNIQUE (rank);


--
-- Name: switch_interface_out switch_interface_pkey; Type: CONSTRAINT; Schema: switch18; Owner: -
--

ALTER TABLE ONLY switch18.switch_interface_out
    ADD CONSTRAINT switch_interface_pkey PRIMARY KEY (id);


--
-- Name: switch_interface_out switch_interface_rank_key; Type: CONSTRAINT; Schema: switch18; Owner: -
--

ALTER TABLE ONLY switch18.switch_interface_out
    ADD CONSTRAINT switch_interface_rank_key UNIQUE (rank);


--
-- Name: trusted_headers trusted_headers_pkey; Type: CONSTRAINT; Schema: switch18; Owner: -
--

ALTER TABLE ONLY switch18.trusted_headers
    ADD CONSTRAINT trusted_headers_pkey PRIMARY KEY (id);


--
-- Name: resource_action resource_action_name_key; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.resource_action
    ADD CONSTRAINT resource_action_name_key UNIQUE (name);


--
-- Name: resource_action resource_action_pkey; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.resource_action
    ADD CONSTRAINT resource_action_pkey PRIMARY KEY (id);


--
-- Name: resource_type resource_type_name_key; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.resource_type
    ADD CONSTRAINT resource_type_name_key UNIQUE (name);


--
-- Name: resource_type resource_type_pkey; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.resource_type
    ADD CONSTRAINT resource_type_pkey PRIMARY KEY (id);


--
-- Name: switch_interface_in switch_in_interface_pkey; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.switch_interface_in
    ADD CONSTRAINT switch_in_interface_pkey PRIMARY KEY (id);


--
-- Name: switch_interface_in switch_in_interface_rank_key; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.switch_interface_in
    ADD CONSTRAINT switch_in_interface_rank_key UNIQUE (rank);


--
-- Name: switch_interface_out switch_interface_pkey; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.switch_interface_out
    ADD CONSTRAINT switch_interface_pkey PRIMARY KEY (id);


--
-- Name: switch_interface_out switch_interface_rank_key; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.switch_interface_out
    ADD CONSTRAINT switch_interface_rank_key UNIQUE (rank);


--
-- Name: trusted_headers trusted_headers_pkey; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.trusted_headers
    ADD CONSTRAINT trusted_headers_pkey PRIMARY KEY (id);


--
-- Name: active_currencies active_currencies_currency_id_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.active_currencies
    ADD CONSTRAINT active_currencies_currency_id_key UNIQUE (currency_id);


--
-- Name: active_currencies active_currencies_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.active_currencies
    ADD CONSTRAINT active_currencies_pkey PRIMARY KEY (id);


--
-- Name: api_access api_access_login_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.api_access
    ADD CONSTRAINT api_access_login_key UNIQUE (login);


--
-- Name: api_access api_access_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.api_access
    ADD CONSTRAINT api_access_pkey PRIMARY KEY (id);


--
-- Name: api_log_config api_log_config_controller_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.api_log_config
    ADD CONSTRAINT api_log_config_controller_key UNIQUE (controller);


--
-- Name: api_log_config api_log_config_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.api_log_config
    ADD CONSTRAINT api_log_config_pkey PRIMARY KEY (id);


--
-- Name: cdr_exports cdr_exports_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.cdr_exports
    ADD CONSTRAINT cdr_exports_pkey PRIMARY KEY (id);


--
-- Name: cdr_tables cdrtables_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.cdr_tables
    ADD CONSTRAINT cdrtables_pkey PRIMARY KEY (id);


--
-- Name: countries countries_name_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: currencies currencies_name_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.currencies
    ADD CONSTRAINT currencies_name_key UNIQUE (name);


--
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs delayed_jobs_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: guiconfig guiconfig_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.guiconfig
    ADD CONSTRAINT guiconfig_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_type_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.jobs
    ADD CONSTRAINT jobs_type_key UNIQUE (type);


--
-- Name: lnp_resolvers lnp_resolvers_name_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.lnp_resolvers
    ADD CONSTRAINT lnp_resolvers_name_key UNIQUE (name);


--
-- Name: lnp_resolvers lnp_resolvers_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.lnp_resolvers
    ADD CONSTRAINT lnp_resolvers_pkey PRIMARY KEY (id);


--
-- Name: load_balancers load_balancers_name_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.load_balancers
    ADD CONSTRAINT load_balancers_name_key UNIQUE (name);


--
-- Name: load_balancers load_balancers_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.load_balancers
    ADD CONSTRAINT load_balancers_pkey PRIMARY KEY (id);


--
-- Name: load_balancers load_balancers_signalling_ip_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.load_balancers
    ADD CONSTRAINT load_balancers_signalling_ip_key UNIQUE (signalling_ip);


--
-- Name: lua_scripts lua_scripts_name_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.lua_scripts
    ADD CONSTRAINT lua_scripts_name_key UNIQUE (name);


--
-- Name: lua_scripts lua_scripts_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.lua_scripts
    ADD CONSTRAINT lua_scripts_pkey PRIMARY KEY (id);


--
-- Name: network_prefixes network_prefixes_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.network_prefixes
    ADD CONSTRAINT network_prefixes_pkey PRIMARY KEY (id);


--
-- Name: network_prefixes network_prefixes_prefix_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.network_prefixes
    ADD CONSTRAINT network_prefixes_prefix_key UNIQUE (prefix);


--
-- Name: network_prefixes network_prefixes_uuid_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.network_prefixes
    ADD CONSTRAINT network_prefixes_uuid_key UNIQUE (uuid);


--
-- Name: network_types network_types_name_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.network_types
    ADD CONSTRAINT network_types_name_key UNIQUE (name);


--
-- Name: network_types network_types_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.network_types
    ADD CONSTRAINT network_types_pkey PRIMARY KEY (id);


--
-- Name: network_types network_types_uuid_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.network_types
    ADD CONSTRAINT network_types_uuid_key UNIQUE (uuid);


--
-- Name: networks networks_name_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.networks
    ADD CONSTRAINT networks_name_key UNIQUE (name);


--
-- Name: networks networks_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.networks
    ADD CONSTRAINT networks_pkey PRIMARY KEY (id);


--
-- Name: networks networks_uuid_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.networks
    ADD CONSTRAINT networks_uuid_key UNIQUE (uuid);


--
-- Name: nodes node_name_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.nodes
    ADD CONSTRAINT node_name_key UNIQUE (name);


--
-- Name: nodes node_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.nodes
    ADD CONSTRAINT node_pkey PRIMARY KEY (id);


--
-- Name: nodes nodes_rpc_endpoint_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.nodes
    ADD CONSTRAINT nodes_rpc_endpoint_key UNIQUE (rpc_endpoint);


--
-- Name: pops pop_name_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.pops
    ADD CONSTRAINT pop_name_key UNIQUE (name);


--
-- Name: pops pop_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.pops
    ADD CONSTRAINT pop_pkey PRIMARY KEY (id);


--
-- Name: sensor_levels sensor_levels_name_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.sensor_levels
    ADD CONSTRAINT sensor_levels_name_key UNIQUE (name);


--
-- Name: sensor_levels sensor_levels_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.sensor_levels
    ADD CONSTRAINT sensor_levels_pkey PRIMARY KEY (id);


--
-- Name: sensor_modes sensor_modes_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.sensor_modes
    ADD CONSTRAINT sensor_modes_pkey PRIMARY KEY (id);


--
-- Name: sensors sensors_name_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.sensors
    ADD CONSTRAINT sensors_name_key UNIQUE (name);


--
-- Name: sensors sensors_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.sensors
    ADD CONSTRAINT sensors_pkey PRIMARY KEY (id);


--
-- Name: sip_schemas sip_schemas_name_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.sip_schemas
    ADD CONSTRAINT sip_schemas_name_key UNIQUE (name);


--
-- Name: sip_schemas sip_schemas_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.sip_schemas
    ADD CONSTRAINT sip_schemas_pkey PRIMARY KEY (id);


--
-- Name: smtp_connections smtp_connections_name_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.smtp_connections
    ADD CONSTRAINT smtp_connections_name_key UNIQUE (name);


--
-- Name: smtp_connections smtp_connections_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.smtp_connections
    ADD CONSTRAINT smtp_connections_pkey PRIMARY KEY (id);


--
-- Name: timezones timezones_name_key; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.timezones
    ADD CONSTRAINT timezones_name_key UNIQUE (name);


--
-- Name: timezones timezones_pkey; Type: CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.timezones
    ADD CONSTRAINT timezones_pkey PRIMARY KEY (id);


--
-- Name: blacklist_items_blacklist_id_key_idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE UNIQUE INDEX blacklist_items_blacklist_id_key_idx ON class4.numberlist_items USING btree (numberlist_id, key);


--
-- Name: blacklist_items_blacklist_id_prefix_range_idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE INDEX blacklist_items_blacklist_id_prefix_range_idx ON class4.numberlist_items USING gist (numberlist_id, ((key)::public.prefix_range));


--
-- Name: customers_auth_normalized_ip_prefix_range_prefix_range1_idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE INDEX customers_auth_normalized_ip_prefix_range_prefix_range1_idx ON class4.customers_auth_normalized USING gist (ip, ((dst_prefix)::public.prefix_range), ((src_prefix)::public.prefix_range));


--
-- Name: customers_auth_normalized_prefix_range_prefix_range1_idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE INDEX customers_auth_normalized_prefix_range_prefix_range1_idx ON class4.customers_auth_normalized USING gist (((dst_prefix)::public.prefix_range), ((src_prefix)::public.prefix_range)) WHERE enabled;


--
-- Name: destinations_prefix_range_idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE INDEX destinations_prefix_range_idx ON class4.destinations USING gist (((prefix)::public.prefix_range));


--
-- Name: dialpeers_external_id_idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE INDEX dialpeers_external_id_idx ON class4.dialpeers USING btree (external_id);


--
-- Name: dialpeers_prefix_range_idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE INDEX dialpeers_prefix_range_idx ON class4.dialpeers USING gist (((prefix)::public.prefix_range));


--
-- Name: dialpeers_prefix_range_valid_from_valid_till_idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE INDEX dialpeers_prefix_range_valid_from_valid_till_idx ON class4.dialpeers USING gist (((prefix)::public.prefix_range), valid_from, valid_till) WHERE enabled;


--
-- Name: dialpeers_prefix_range_valid_from_valid_till_idx1; Type: INDEX; Schema: class4; Owner: -
--

CREATE INDEX dialpeers_prefix_range_valid_from_valid_till_idx1 ON class4.dialpeers USING gist (((prefix)::public.prefix_range), valid_from, valid_till) WHERE (enabled AND (NOT locked));


--
-- Name: disconnect_code_code_success_successnozerolen_idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE INDEX disconnect_code_code_success_successnozerolen_idx ON class4.disconnect_code USING btree (code, success, successnozerolen);


--
-- Name: index_class4.lnp_databases_on_database_id_and_database_type; Type: INDEX; Schema: class4; Owner: -
--

CREATE UNIQUE INDEX "index_class4.lnp_databases_on_database_id_and_database_type" ON class4.lnp_databases USING btree (database_id, database_type);


--
-- Name: lnp_cache_dst_database_id_idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE UNIQUE INDEX lnp_cache_dst_database_id_idx ON class4.lnp_cache USING btree (dst, database_id);


--
-- Name: lnp_cache_expires_at_idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE INDEX lnp_cache_expires_at_idx ON class4.lnp_cache USING btree (expires_at);


--
-- Name: rate_plan_groups_rateplan_id_rate_group_id_idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE UNIQUE INDEX rate_plan_groups_rateplan_id_rate_group_id_idx ON class4.rate_plan_groups USING btree (rateplan_id, rate_group_id);


--
-- Name: routing_plan_lnp_rules_prefix_range_routing_plan_id_idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE INDEX routing_plan_lnp_rules_prefix_range_routing_plan_id_idx ON class4.routing_plan_lnp_rules USING gist (((dst_prefix)::public.prefix_range), routing_plan_id);


--
-- Name: routing_plan_lnp_rules_routing_plan_id_dst_prefix_database__idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE UNIQUE INDEX routing_plan_lnp_rules_routing_plan_id_dst_prefix_database__idx ON class4.routing_plan_lnp_rules USING btree (routing_plan_id, dst_prefix, database_id);


--
-- Name: routing_plan_static_routes_prefix_range_vendor_id_routing_p_idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE INDEX routing_plan_static_routes_prefix_range_vendor_id_routing_p_idx ON class4.routing_plan_static_routes USING gist (((prefix)::public.prefix_range), vendor_id, routing_plan_id);


--
-- Name: routing_tag_detection_rules_prefix_range_idx; Type: INDEX; Schema: class4; Owner: -
--

CREATE INDEX routing_tag_detection_rules_prefix_range_idx ON class4.routing_tag_detection_rules USING gist (((src_prefix)::public.prefix_range), ((dst_prefix)::public.prefix_range));


--
-- Name: admin_users_username_idx; Type: INDEX; Schema: gui; Owner: -
--

CREATE UNIQUE INDEX admin_users_username_idx ON gui.admin_users USING btree (username);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: gui; Owner: -
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON gui.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: gui; Owner: -
--

CREATE INDEX index_active_admin_comments_on_namespace ON gui.active_admin_comments USING btree (namespace);


--
-- Name: index_admin_notes_on_resource_type_and_resource_id; Type: INDEX; Schema: gui; Owner: -
--

CREATE INDEX index_admin_notes_on_resource_type_and_resource_id ON gui.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: gui; Owner: -
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON gui.admin_users USING btree (reset_password_token);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: gui; Owner: -
--

CREATE INDEX index_versions_on_item_type_and_item_id ON gui.versions USING btree (item_type, item_id);


--
-- Name: sessions_updated_at_idx; Type: INDEX; Schema: gui; Owner: -
--

CREATE INDEX sessions_updated_at_idx ON gui.sessions USING btree (updated_at);


--
-- Name: api_requests_created_at_idx; Type: INDEX; Schema: logs; Owner: -
--

CREATE INDEX api_requests_created_at_idx ON ONLY logs.api_requests USING btree (created_at);


--
-- Name: api_requests_id_idx; Type: INDEX; Schema: logs; Owner: -
--

CREATE INDEX api_requests_id_idx ON ONLY logs.api_requests USING btree (id);


--
-- Name: unique_public.schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "unique_public.schema_migrations" ON public.schema_migrations USING btree (version);


--
-- Name: cdr_tables_name_idx; Type: INDEX; Schema: sys; Owner: -
--

CREATE UNIQUE INDEX cdr_tables_name_idx ON sys.cdr_tables USING btree (name);


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: sys; Owner: -
--

CREATE INDEX delayed_jobs_priority ON sys.delayed_jobs USING btree (priority, run_at);


--
-- Name: network_prefixes_prefix_range_idx; Type: INDEX; Schema: sys; Owner: -
--

CREATE INDEX network_prefixes_prefix_range_idx ON sys.network_prefixes USING gist (((prefix)::public.prefix_range));


--
-- Name: accounts account_notification_tgf; Type: TRIGGER; Schema: billing; Owner: -
--

CREATE TRIGGER account_notification_tgf AFTER INSERT OR UPDATE ON billing.accounts FOR EACH ROW EXECUTE FUNCTION billing.account_change_iu_tgf();


--
-- Name: accounts accounts_contractor_id_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.accounts
    ADD CONSTRAINT accounts_contractor_id_fkey FOREIGN KEY (contractor_id) REFERENCES public.contractors(id);


--
-- Name: accounts accounts_invoice_period_id_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.accounts
    ADD CONSTRAINT accounts_invoice_period_id_fkey FOREIGN KEY (customer_invoice_period_id) REFERENCES billing.invoice_periods(id);


--
-- Name: accounts accounts_timezone_id_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.accounts
    ADD CONSTRAINT accounts_timezone_id_fkey FOREIGN KEY (timezone_id) REFERENCES sys.timezones(id);


--
-- Name: accounts accounts_vendor_invoice_period_id_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.accounts
    ADD CONSTRAINT accounts_vendor_invoice_period_id_fkey FOREIGN KEY (vendor_invoice_period_id) REFERENCES billing.invoice_periods(id);


--
-- Name: payments payments_account_id_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: -
--

ALTER TABLE ONLY billing.payments
    ADD CONSTRAINT payments_account_id_fkey FOREIGN KEY (account_id) REFERENCES billing.accounts(id);


--
-- Name: area_prefixes area_prefixes_area_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.area_prefixes
    ADD CONSTRAINT area_prefixes_area_id_fkey FOREIGN KEY (area_id) REFERENCES class4.areas(id);


--
-- Name: numberlist_items blacklist_items_blacklist_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlist_items
    ADD CONSTRAINT blacklist_items_blacklist_id_fkey FOREIGN KEY (numberlist_id) REFERENCES class4.numberlists(id);


--
-- Name: numberlists blacklists_mode_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlists
    ADD CONSTRAINT blacklists_mode_id_fkey FOREIGN KEY (mode_id) REFERENCES class4.numberlist_modes(id);


--
-- Name: codec_group_codecs codec_group_codecs_codec_group_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.codec_group_codecs
    ADD CONSTRAINT codec_group_codecs_codec_group_id_fkey FOREIGN KEY (codec_group_id) REFERENCES class4.codec_groups(id);


--
-- Name: codec_group_codecs codec_group_codecs_codec_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.codec_group_codecs
    ADD CONSTRAINT codec_group_codecs_codec_id_fkey FOREIGN KEY (codec_id) REFERENCES class4.codecs(id);


--
-- Name: customers_auth customers_auth_account_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_account_id_fkey FOREIGN KEY (account_id) REFERENCES billing.accounts(id);


--
-- Name: customers_auth customers_auth_customer_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.contractors(id);


--
-- Name: customers_auth customers_auth_diversion_policy_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_diversion_policy_id_fkey FOREIGN KEY (diversion_policy_id) REFERENCES class4.diversion_policy(id);


--
-- Name: customers_auth customers_auth_dst_blacklist_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_dst_blacklist_id_fkey FOREIGN KEY (dst_numberlist_id) REFERENCES class4.numberlists(id);


--
-- Name: customers_auth customers_auth_dst_number_field_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_dst_number_field_id_fkey FOREIGN KEY (dst_number_field_id) REFERENCES class4.customers_auth_dst_number_fields(id);


--
-- Name: customers_auth customers_auth_dump_level_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_dump_level_id_fkey FOREIGN KEY (dump_level_id) REFERENCES class4.dump_level(id);


--
-- Name: customers_auth customers_auth_gateway_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_gateway_id_fkey FOREIGN KEY (gateway_id) REFERENCES class4.gateways(id);


--
-- Name: customers_auth customers_auth_lua_script_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_lua_script_id_fkey FOREIGN KEY (lua_script_id) REFERENCES sys.lua_scripts(id);


--
-- Name: customers_auth_normalized customers_auth_normalized_customers_auth_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth_normalized
    ADD CONSTRAINT customers_auth_normalized_customers_auth_id_fkey FOREIGN KEY (customers_auth_id) REFERENCES class4.customers_auth(id);


--
-- Name: customers_auth customers_auth_pop_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_pop_id_fkey FOREIGN KEY (pop_id) REFERENCES sys.pops(id);


--
-- Name: customers_auth customers_auth_radius_accounting_profile_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_radius_accounting_profile_id_fkey FOREIGN KEY (radius_accounting_profile_id) REFERENCES class4.radius_accounting_profiles(id);


--
-- Name: customers_auth customers_auth_radius_auth_profile_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_radius_auth_profile_id_fkey FOREIGN KEY (radius_auth_profile_id) REFERENCES class4.radius_auth_profiles(id);


--
-- Name: customers_auth customers_auth_rateplan_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_rateplan_id_fkey FOREIGN KEY (rateplan_id) REFERENCES class4.rateplans(id);


--
-- Name: customers_auth customers_auth_routing_plan_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_routing_plan_id_fkey FOREIGN KEY (routing_plan_id) REFERENCES class4.routing_plans(id);


--
-- Name: customers_auth customers_auth_src_blacklist_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_src_blacklist_id_fkey FOREIGN KEY (src_numberlist_id) REFERENCES class4.numberlists(id);


--
-- Name: customers_auth customers_auth_src_name_field_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_src_name_field_id_fkey FOREIGN KEY (src_name_field_id) REFERENCES class4.customers_auth_src_name_fields(id);


--
-- Name: customers_auth customers_auth_src_number_field_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_src_number_field_id_fkey FOREIGN KEY (src_number_field_id) REFERENCES class4.customers_auth_src_number_fields(id);


--
-- Name: customers_auth customers_auth_tag_action_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_tag_action_id_fkey FOREIGN KEY (tag_action_id) REFERENCES class4.tag_actions(id);


--
-- Name: customers_auth customers_auth_transport_protocol_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.customers_auth
    ADD CONSTRAINT customers_auth_transport_protocol_id_fkey FOREIGN KEY (transport_protocol_id) REFERENCES class4.transport_protocols(id);


--
-- Name: destination_next_rates destination_next_rates_destination_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.destination_next_rates
    ADD CONSTRAINT destination_next_rates_destination_id_fkey FOREIGN KEY (destination_id) REFERENCES class4.destinations(id);


--
-- Name: destinations destinations_profit_control_mode_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.destinations
    ADD CONSTRAINT destinations_profit_control_mode_id_fkey FOREIGN KEY (profit_control_mode_id) REFERENCES class4.rate_profit_control_modes(id);


--
-- Name: destinations destinations_rate_group_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.destinations
    ADD CONSTRAINT destinations_rate_group_id_fkey FOREIGN KEY (rate_group_id) REFERENCES class4.rate_groups(id);


--
-- Name: destinations destinations_rate_policy_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.destinations
    ADD CONSTRAINT destinations_rate_policy_id_fkey FOREIGN KEY (rate_policy_id) REFERENCES class4.destination_rate_policy(id);


--
-- Name: destinations destinations_routing_tag_mode_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.destinations
    ADD CONSTRAINT destinations_routing_tag_mode_id_fkey FOREIGN KEY (routing_tag_mode_id) REFERENCES class4.routing_tag_modes(id);


--
-- Name: dialpeer_next_rates dialpeer_next_rates_dialpeer_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dialpeer_next_rates
    ADD CONSTRAINT dialpeer_next_rates_dialpeer_id_fkey FOREIGN KEY (dialpeer_id) REFERENCES class4.dialpeers(id);


--
-- Name: dialpeers dialpeers_account_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dialpeers
    ADD CONSTRAINT dialpeers_account_id_fkey FOREIGN KEY (account_id) REFERENCES billing.accounts(id);


--
-- Name: dialpeers dialpeers_gateway_group_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dialpeers
    ADD CONSTRAINT dialpeers_gateway_group_id_fkey FOREIGN KEY (gateway_group_id) REFERENCES class4.gateway_groups(id);


--
-- Name: dialpeers dialpeers_gateway_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dialpeers
    ADD CONSTRAINT dialpeers_gateway_id_fkey FOREIGN KEY (gateway_id) REFERENCES class4.gateways(id);


--
-- Name: dialpeers dialpeers_routeset_discriminator_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dialpeers
    ADD CONSTRAINT dialpeers_routeset_discriminator_id_fkey FOREIGN KEY (routeset_discriminator_id) REFERENCES class4.routeset_discriminators(id);


--
-- Name: dialpeers dialpeers_routing_group_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dialpeers
    ADD CONSTRAINT dialpeers_routing_group_id_fkey FOREIGN KEY (routing_group_id) REFERENCES class4.routing_groups(id);


--
-- Name: dialpeers dialpeers_routing_tag_mode_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dialpeers
    ADD CONSTRAINT dialpeers_routing_tag_mode_id_fkey FOREIGN KEY (routing_tag_mode_id) REFERENCES class4.routing_tag_modes(id);


--
-- Name: dialpeers dialpeers_vendor_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.dialpeers
    ADD CONSTRAINT dialpeers_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.contractors(id);


--
-- Name: disconnect_code disconnect_code_namespace_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.disconnect_code
    ADD CONSTRAINT disconnect_code_namespace_id_fkey FOREIGN KEY (namespace_id) REFERENCES class4.disconnect_code_namespace(id);


--
-- Name: disconnect_policy_code disconnect_code_policy_codes_code_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.disconnect_policy_code
    ADD CONSTRAINT disconnect_code_policy_codes_code_id_fkey FOREIGN KEY (code_id) REFERENCES class4.disconnect_code(id);


--
-- Name: disconnect_policy_code disconnect_code_policy_codes_policy_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.disconnect_policy_code
    ADD CONSTRAINT disconnect_code_policy_codes_policy_id_fkey FOREIGN KEY (policy_id) REFERENCES class4.disconnect_policy(id);


--
-- Name: gateway_groups gateway_groups_balancing_mode_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateway_groups
    ADD CONSTRAINT gateway_groups_balancing_mode_id_fkey FOREIGN KEY (balancing_mode_id) REFERENCES class4.gateway_group_balancing_modes(id);


--
-- Name: gateway_groups gateway_groups_contractor_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateway_groups
    ADD CONSTRAINT gateway_groups_contractor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.contractors(id);


--
-- Name: gateways gateways_codec_group_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_codec_group_id_fkey FOREIGN KEY (codec_group_id) REFERENCES class4.codec_groups(id);


--
-- Name: gateways gateways_contractor_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_contractor_id_fkey FOREIGN KEY (contractor_id) REFERENCES public.contractors(id);


--
-- Name: gateways gateways_diversion_policy_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_diversion_policy_id_fkey FOREIGN KEY (diversion_policy_id) REFERENCES class4.diversion_policy(id);


--
-- Name: gateways gateways_dtmf_receive_mode_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_dtmf_receive_mode_id_fkey FOREIGN KEY (dtmf_receive_mode_id) REFERENCES class4.dtmf_receive_modes(id);


--
-- Name: gateways gateways_dtmf_send_mode_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_dtmf_send_mode_id_fkey FOREIGN KEY (dtmf_send_mode_id) REFERENCES class4.dtmf_send_modes(id);


--
-- Name: gateways gateways_gateway_group_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_gateway_group_id_fkey FOREIGN KEY (gateway_group_id) REFERENCES class4.gateway_groups(id);


--
-- Name: gateways gateways_lua_script_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_lua_script_id_fkey FOREIGN KEY (lua_script_id) REFERENCES sys.lua_scripts(id);


--
-- Name: gateways gateways_media_encryption_mode_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_media_encryption_mode_id_fkey FOREIGN KEY (media_encryption_mode_id) REFERENCES class4.gateway_media_encryption_modes(id);


--
-- Name: gateways gateways_network_protocol_priority_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_network_protocol_priority_id_fkey FOREIGN KEY (network_protocol_priority_id) REFERENCES class4.gateway_network_protocol_priorities(id);


--
-- Name: gateways gateways_orig_disconnect_policy_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_orig_disconnect_policy_id_fkey FOREIGN KEY (orig_disconnect_policy_id) REFERENCES class4.disconnect_policy(id);


--
-- Name: gateways gateways_orig_proxy_transport_protocol_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_orig_proxy_transport_protocol_id_fkey FOREIGN KEY (orig_proxy_transport_protocol_id) REFERENCES class4.transport_protocols(id);


--
-- Name: gateways gateways_pop_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_pop_id_fkey FOREIGN KEY (pop_id) REFERENCES sys.pops(id);


--
-- Name: gateways gateways_radius_accounting_profile_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_radius_accounting_profile_id_fkey FOREIGN KEY (radius_accounting_profile_id) REFERENCES class4.radius_accounting_profiles(id);


--
-- Name: gateways gateways_rel100_mode_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_rel100_mode_id_fkey FOREIGN KEY (rel100_mode_id) REFERENCES class4.gateway_rel100_modes(id);


--
-- Name: gateways gateways_rx_inband_dtmf_filtering_mode_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_rx_inband_dtmf_filtering_mode_id_fkey FOREIGN KEY (rx_inband_dtmf_filtering_mode_id) REFERENCES class4.gateway_inband_dtmf_filtering_modes(id);


--
-- Name: gateways gateways_sdp_alines_filter_type_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_sdp_alines_filter_type_id_fkey FOREIGN KEY (sdp_alines_filter_type_id) REFERENCES class4.filter_types(id);


--
-- Name: gateways gateways_sdp_c_location_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_sdp_c_location_id_fkey FOREIGN KEY (sdp_c_location_id) REFERENCES class4.sdp_c_location(id);


--
-- Name: gateways gateways_sensor_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES sys.sensors(id);


--
-- Name: gateways gateways_sensor_level_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_sensor_level_id_fkey FOREIGN KEY (sensor_level_id) REFERENCES sys.sensor_levels(id);


--
-- Name: gateways gateways_session_refresh_method_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_session_refresh_method_id_fkey FOREIGN KEY (session_refresh_method_id) REFERENCES class4.session_refresh_methods(id);


--
-- Name: gateways gateways_sip_schema_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_sip_schema_id_fkey FOREIGN KEY (sip_schema_id) REFERENCES sys.sip_schemas(id);


--
-- Name: gateways gateways_term_disconnect_policy_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_term_disconnect_policy_id_fkey FOREIGN KEY (term_disconnect_policy_id) REFERENCES class4.disconnect_policy(id);


--
-- Name: gateways gateways_term_proxy_transport_protocol_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_term_proxy_transport_protocol_id_fkey FOREIGN KEY (term_proxy_transport_protocol_id) REFERENCES class4.transport_protocols(id);


--
-- Name: gateways gateways_transport_protocol_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_transport_protocol_id_fkey FOREIGN KEY (transport_protocol_id) REFERENCES class4.transport_protocols(id);


--
-- Name: gateways gateways_tx_inband_dtmf_filtering_mode_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.gateways
    ADD CONSTRAINT gateways_tx_inband_dtmf_filtering_mode_id_fkey FOREIGN KEY (tx_inband_dtmf_filtering_mode_id) REFERENCES class4.gateway_inband_dtmf_filtering_modes(id);


--
-- Name: lnp_cache lnp_cache_database_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.lnp_cache
    ADD CONSTRAINT lnp_cache_database_id_fkey FOREIGN KEY (database_id) REFERENCES class4.lnp_databases(id);


--
-- Name: numberlist_items numberlist_items_action_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlist_items
    ADD CONSTRAINT numberlist_items_action_id_fkey FOREIGN KEY (action_id) REFERENCES class4.numberlist_actions(id);


--
-- Name: numberlist_items numberlist_items_lua_script_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlist_items
    ADD CONSTRAINT numberlist_items_lua_script_id_fkey FOREIGN KEY (lua_script_id) REFERENCES sys.lua_scripts(id);


--
-- Name: numberlist_items numberlist_items_tag_action_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlist_items
    ADD CONSTRAINT numberlist_items_tag_action_id_fkey FOREIGN KEY (tag_action_id) REFERENCES class4.tag_actions(id);


--
-- Name: numberlists numberlists_default_action_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlists
    ADD CONSTRAINT numberlists_default_action_id_fkey FOREIGN KEY (default_action_id) REFERENCES class4.numberlist_actions(id);


--
-- Name: numberlists numberlists_lua_script_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlists
    ADD CONSTRAINT numberlists_lua_script_id_fkey FOREIGN KEY (lua_script_id) REFERENCES sys.lua_scripts(id);


--
-- Name: numberlists numberlists_tag_action_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.numberlists
    ADD CONSTRAINT numberlists_tag_action_id_fkey FOREIGN KEY (tag_action_id) REFERENCES class4.tag_actions(id);


--
-- Name: radius_accounting_profile_interim_attributes radius_accounting_profile_interim_attributes_profile_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_accounting_profile_interim_attributes
    ADD CONSTRAINT radius_accounting_profile_interim_attributes_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES class4.radius_accounting_profiles(id);


--
-- Name: radius_accounting_profile_start_attributes radius_accounting_profile_start_attributes_profile_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_accounting_profile_start_attributes
    ADD CONSTRAINT radius_accounting_profile_start_attributes_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES class4.radius_accounting_profiles(id);


--
-- Name: radius_accounting_profile_stop_attributes radius_accounting_profile_stop_attributes_profile_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_accounting_profile_stop_attributes
    ADD CONSTRAINT radius_accounting_profile_stop_attributes_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES class4.radius_accounting_profiles(id);


--
-- Name: radius_auth_profile_attributes radius_auth_profile_attributes_profile_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.radius_auth_profile_attributes
    ADD CONSTRAINT radius_auth_profile_attributes_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES class4.radius_auth_profiles(id);


--
-- Name: rate_plan_groups rate_plan_groups_rate_group_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rate_plan_groups
    ADD CONSTRAINT rate_plan_groups_rate_group_id_fkey FOREIGN KEY (rate_group_id) REFERENCES class4.rate_groups(id);


--
-- Name: rate_plan_groups rate_plan_groups_rateplan_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rate_plan_groups
    ADD CONSTRAINT rate_plan_groups_rateplan_id_fkey FOREIGN KEY (rateplan_id) REFERENCES class4.rateplans(id);


--
-- Name: rateplans rateplans_profit_control_mode_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.rateplans
    ADD CONSTRAINT rateplans_profit_control_mode_id_fkey FOREIGN KEY (profit_control_mode_id) REFERENCES class4.rate_profit_control_modes(id);


--
-- Name: registrations registrations_node_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.registrations
    ADD CONSTRAINT registrations_node_id_fkey FOREIGN KEY (node_id) REFERENCES sys.nodes(id);


--
-- Name: registrations registrations_pop_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.registrations
    ADD CONSTRAINT registrations_pop_id_fkey FOREIGN KEY (pop_id) REFERENCES sys.pops(id);


--
-- Name: registrations registrations_proxy_transport_protocol_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.registrations
    ADD CONSTRAINT registrations_proxy_transport_protocol_id_fkey FOREIGN KEY (proxy_transport_protocol_id) REFERENCES class4.transport_protocols(id);


--
-- Name: registrations registrations_sip_schema_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.registrations
    ADD CONSTRAINT registrations_sip_schema_id_fkey FOREIGN KEY (sip_schema_id) REFERENCES sys.sip_schemas(id);


--
-- Name: registrations registrations_transport_protocol_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.registrations
    ADD CONSTRAINT registrations_transport_protocol_id_fkey FOREIGN KEY (transport_protocol_id) REFERENCES class4.transport_protocols(id);


--
-- Name: routing_plan_groups routing_plan_groups_routing_group_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plan_groups
    ADD CONSTRAINT routing_plan_groups_routing_group_id_fkey FOREIGN KEY (routing_group_id) REFERENCES class4.routing_groups(id);


--
-- Name: routing_plan_groups routing_plan_groups_routing_plan_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plan_groups
    ADD CONSTRAINT routing_plan_groups_routing_plan_id_fkey FOREIGN KEY (routing_plan_id) REFERENCES class4.routing_plans(id);


--
-- Name: routing_plan_lnp_rules routing_plan_lnp_rules_database_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plan_lnp_rules
    ADD CONSTRAINT routing_plan_lnp_rules_database_id_fkey FOREIGN KEY (database_id) REFERENCES class4.lnp_databases(id);


--
-- Name: routing_plan_static_routes routing_plan_static_routes_routing_plan_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plan_static_routes
    ADD CONSTRAINT routing_plan_static_routes_routing_plan_id_fkey FOREIGN KEY (routing_plan_id) REFERENCES class4.routing_plans(id);


--
-- Name: routing_plan_static_routes routing_plan_static_routes_vendor_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plan_static_routes
    ADD CONSTRAINT routing_plan_static_routes_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.contractors(id);


--
-- Name: routing_plans routing_plans_sorting_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_plans
    ADD CONSTRAINT routing_plans_sorting_id_fkey FOREIGN KEY (sorting_id) REFERENCES class4.sortings(id);


--
-- Name: routing_tag_detection_rules routing_tag_detection_rules_dst_area_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_tag_detection_rules
    ADD CONSTRAINT routing_tag_detection_rules_dst_area_id_fkey FOREIGN KEY (dst_area_id) REFERENCES class4.areas(id);


--
-- Name: routing_tag_detection_rules routing_tag_detection_rules_routing_tag_mode_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_tag_detection_rules
    ADD CONSTRAINT routing_tag_detection_rules_routing_tag_mode_id_fkey FOREIGN KEY (routing_tag_mode_id) REFERENCES class4.routing_tag_modes(id);


--
-- Name: routing_tag_detection_rules routing_tag_detection_rules_src_area_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_tag_detection_rules
    ADD CONSTRAINT routing_tag_detection_rules_src_area_id_fkey FOREIGN KEY (src_area_id) REFERENCES class4.areas(id);


--
-- Name: routing_tag_detection_rules routing_tag_detection_rules_tag_action_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.routing_tag_detection_rules
    ADD CONSTRAINT routing_tag_detection_rules_tag_action_id_fkey FOREIGN KEY (tag_action_id) REFERENCES class4.tag_actions(id);


--
-- Name: sip_options_probers sip_options_probers_node_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.sip_options_probers
    ADD CONSTRAINT sip_options_probers_node_id_fkey FOREIGN KEY (node_id) REFERENCES sys.nodes(id);


--
-- Name: sip_options_probers sip_options_probers_pop_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.sip_options_probers
    ADD CONSTRAINT sip_options_probers_pop_id_fkey FOREIGN KEY (pop_id) REFERENCES sys.pops(id);


--
-- Name: sip_options_probers sip_options_probers_proxy_transport_protocol_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.sip_options_probers
    ADD CONSTRAINT sip_options_probers_proxy_transport_protocol_id_fkey FOREIGN KEY (proxy_transport_protocol_id) REFERENCES class4.transport_protocols(id);


--
-- Name: sip_options_probers sip_options_probers_sip_schema_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.sip_options_probers
    ADD CONSTRAINT sip_options_probers_sip_schema_id_fkey FOREIGN KEY (sip_schema_id) REFERENCES sys.sip_schemas(id);


--
-- Name: sip_options_probers sip_options_probers_transport_protocol_id_fkey; Type: FK CONSTRAINT; Schema: class4; Owner: -
--

ALTER TABLE ONLY class4.sip_options_probers
    ADD CONSTRAINT sip_options_probers_transport_protocol_id_fkey FOREIGN KEY (transport_protocol_id) REFERENCES class4.transport_protocols(id);


--
-- Name: contacts contacts_admin_user_id_fkey; Type: FK CONSTRAINT; Schema: notifications; Owner: -
--

ALTER TABLE ONLY notifications.contacts
    ADD CONSTRAINT contacts_admin_user_id_fkey FOREIGN KEY (admin_user_id) REFERENCES gui.admin_users(id);


--
-- Name: contacts contacts_contractor_id_fkey; Type: FK CONSTRAINT; Schema: notifications; Owner: -
--

ALTER TABLE ONLY notifications.contacts
    ADD CONSTRAINT contacts_contractor_id_fkey FOREIGN KEY (contractor_id) REFERENCES public.contractors(id);


--
-- Name: contractors contractors_smtp_connection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contractors
    ADD CONSTRAINT contractors_smtp_connection_id_fkey FOREIGN KEY (smtp_connection_id) REFERENCES sys.smtp_connections(id);


--
-- Name: resource_type resource_type_action_id_fkey; Type: FK CONSTRAINT; Schema: switch18; Owner: -
--

ALTER TABLE ONLY switch18.resource_type
    ADD CONSTRAINT resource_type_action_id_fkey FOREIGN KEY (action_id) REFERENCES switch18.resource_action(id);


--
-- Name: resource_type resource_type_action_id_fkey; Type: FK CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.resource_type
    ADD CONSTRAINT resource_type_action_id_fkey FOREIGN KEY (action_id) REFERENCES switch19.resource_action(id);


--
-- Name: active_currencies active_currencies_currency_id_fkey; Type: FK CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.active_currencies
    ADD CONSTRAINT active_currencies_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES sys.currencies(id);


--
-- Name: api_access api_access_customer_id_fkey; Type: FK CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.api_access
    ADD CONSTRAINT api_access_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.contractors(id);


--
-- Name: currencies currencies_country_id_fkey; Type: FK CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.currencies
    ADD CONSTRAINT currencies_country_id_fkey FOREIGN KEY (country_id) REFERENCES sys.countries(id);


--
-- Name: events events_node_id_fkey; Type: FK CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.events
    ADD CONSTRAINT events_node_id_fkey FOREIGN KEY (node_id) REFERENCES sys.nodes(id);


--
-- Name: network_prefixes network_prefixes_country_id_fkey; Type: FK CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.network_prefixes
    ADD CONSTRAINT network_prefixes_country_id_fkey FOREIGN KEY (country_id) REFERENCES sys.countries(id);


--
-- Name: network_prefixes network_prefixes_network_id_fkey; Type: FK CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.network_prefixes
    ADD CONSTRAINT network_prefixes_network_id_fkey FOREIGN KEY (network_id) REFERENCES sys.networks(id);


--
-- Name: networks networks_type_id_fkey; Type: FK CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.networks
    ADD CONSTRAINT networks_type_id_fkey FOREIGN KEY (type_id) REFERENCES sys.network_types(id);


--
-- Name: nodes node_pop_id_fkey; Type: FK CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.nodes
    ADD CONSTRAINT node_pop_id_fkey FOREIGN KEY (pop_id) REFERENCES sys.pops(id);


--
-- Name: sensors sensors_mode_id_fkey; Type: FK CONSTRAINT; Schema: sys; Owner: -
--

ALTER TABLE ONLY sys.sensors
    ADD CONSTRAINT sensors_mode_id_fkey FOREIGN KEY (mode_id) REFERENCES sys.sensor_modes(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO gui, public, switch, billing, class4, runtime_stats, sys, logs, data_import;

INSERT INTO "public"."schema_migrations" (version) VALUES
('20170822151410'),
('20170822151442'),
('20170825100629'),
('20170907201109'),
('20170907203538'),
('20170907203628'),
('20170907203638'),
('20170919200403'),
('20171020164700'),
('20171031211812'),
('20171102183313'),
('20171209201956'),
('20171226210121'),
('20171231175152'),
('20180101202120'),
('20180119133842'),
('20180209140554'),
('20180212105355'),
('20180215094913'),
('20180305132729'),
('20180312205051'),
('20180313135314'),
('20180316061214'),
('20180318143341'),
('20180320120746'),
('20180403104223'),
('20180404135210'),
('20180405132225'),
('20180416121932'),
('20180418101559'),
('20180425203717'),
('20180426090808'),
('20180427194327'),
('20180512225402'),
('20180516095652'),
('20180620093010'),
('20180805100536'),
('20181011105642'),
('20181018164004'),
('20181114213545'),
('20181202175700'),
('20181203204823'),
('20190308190806'),
('20190318173242'),
('20190324161035'),
('20190326070548'),
('20190327134613'),
('20190428191918'),
('20190622131912'),
('20190629193852'),
('20190706114700'),
('20190707141219'),
('20190904174903'),
('20190919080917'),
('20191016183312'),
('20191018180427'),
('20200105131431'),
('20200202154005'),
('20200412135211'),
('20200425110642'),
('20200504210442'),
('20200630132440'),
('20200803202810'),
('20201015195346'),
('20201015202253'),
('20201023122436'),
('20201103092516'),
('20201111201356'),
('20201226161344'),
('20210116152459');


