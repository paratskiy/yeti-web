class Switch19 < ActiveRecord::Migration[5.2]

  def down
    execute %q{
      drop schema switch19 cascade;

      create schema switch13;
      create schema switch14;
      create schema switch15;
      create schema switch16;
      create schema switch17;

      }
  end


  def up
    execute %q{
      drop schema switch13 cascade;
      drop schema switch14 cascade;
      drop schema switch15 cascade;
      drop schema switch16 cascade;
      drop schema switch17 cascade;

CREATE SCHEMA switch19;

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

CREATE TYPE switch19.lnp_resolve AS (
	lrn text,
	tag text
);

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


CREATE FUNCTION switch19.check_event(i_event_id integer) RETURNS boolean
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  PERFORM id from sys.events where id=i_event_id;
  return FOUND;
END;
$$;


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


CREATE FUNCTION switch19.lnp_resolve(i_database_id smallint, i_dst character varying) RETURNS character varying
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  return lrn from yeti_ext.lnp_resolve_tagged(i_database_id::int, i_dst);
END;
$$;


CREATE FUNCTION switch19.lnp_resolve_tagged(i_database_id smallint, i_dst character varying) RETURNS switch19.lnp_resolve
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  return yeti_ext.lnp_resolve_tagged(i_database_id::int, i_dst);
END;
$$;


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


CREATE FUNCTION switch19.load_disconnect_code_namespace() RETURNS SETOF class4.disconnect_code_namespace
    LANGUAGE plpgsql COST 10
    AS $$

BEGIN
  RETURN QUERY SELECT * from class4.disconnect_code_namespace order by id;
END;
$$;


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


CREATE FUNCTION switch19.load_interface_in() RETURNS TABLE(varname character varying, vartype character varying, varformat character varying, varhashkey boolean, varparam character varying)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN QUERY SELECT "name","type","format","hashkey","param" from switch_interface_in order by rank asc;
END;
$$;


CREATE FUNCTION switch19.load_interface_out() RETURNS TABLE(varname character varying, vartype character varying, forcdr boolean, forradius boolean)
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RETURN QUERY SELECT "name","type","custom","for_radius" from switch19.switch_interface_out order by rank asc;
END;
$$;


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


SET default_tablespace = '';

SET default_table_access_method = heap;


CREATE TABLE switch19.resource_type (
    id integer NOT NULL,
    name character varying NOT NULL,
    internal_code_id integer NOT NULL,
    action_id integer DEFAULT 1 NOT NULL
);



CREATE FUNCTION switch19.load_resource_types() RETURNS SETOF switch19.resource_type
    LANGUAGE plpgsql COST 10 ROWS 10
    AS $$

BEGIN
  RETURN QUERY SELECT * from resource_type;
END;
$$;



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



CREATE FUNCTION switch19.load_trusted_headers(i_node_id integer) RETURNS TABLE(o_name character varying)
    LANGUAGE plpgsql COST 10 ROWS 100
    AS $$
BEGIN
  RETURN QUERY    SELECT "name" from trusted_headers order by rank asc;
end;
$$;



CREATE FUNCTION switch19.lua_clear_cache() RETURNS void
    LANGUAGE pllua
    AS $$
        if shared.functions_cache ~= nil then
          for k in pairs(shared.functions_cache) do
            shared.functions_cache[k] = nil
          end
        end
      $$;



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



CREATE FUNCTION switch19.process_gw(
  i_profile switch19.callprofile_ty,
  i_destination class4.destinations,
  i_dp class4.dialpeers,
  i_customer_acc billing.accounts,
  i_customer_gw class4.gateways,
  i_vendor_acc billing.accounts,
  i_vendor_gw class4.gateways,
  i_send_billing_information boolean,
  i_max_call_length integer
) RETURNS switch19.callprofile_ty
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



CREATE FUNCTION switch19.tracelog(i_in class4.destinations) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $$
BEGIN
  RAISE INFO'switch19.tracelog: % : %',clock_timestamp()::char(25),i_in;
END;
$$;


--
-- TOC entry 1152 (class 1255 OID 17942)
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
-- TOC entry 514 (class 1259 OID 19052)
-- Name: events_id_seq; Type: SEQUENCE; Schema: switch19; Owner: -
--

CREATE SEQUENCE switch19.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 515 (class 1259 OID 19054)
-- Name: resource_action; Type: TABLE; Schema: switch19; Owner: -
--

CREATE TABLE switch19.resource_action (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 516 (class 1259 OID 19060)
-- Name: resource_type_id_seq; Type: SEQUENCE; Schema: switch19; Owner: -
--

CREATE SEQUENCE switch19.resource_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 516
-- Name: resource_type_id_seq; Type: SEQUENCE OWNED BY; Schema: switch19; Owner: -
--

ALTER SEQUENCE switch19.resource_type_id_seq OWNED BY switch19.resource_type.id;


--
-- TOC entry 517 (class 1259 OID 19062)
-- Name: switch_in_interface_id_seq; Type: SEQUENCE; Schema: switch19; Owner: -
--

CREATE SEQUENCE switch19.switch_in_interface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 518 (class 1259 OID 19064)
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
-- TOC entry 519 (class 1259 OID 19071)
-- Name: switch_interface_id_seq; Type: SEQUENCE; Schema: switch19; Owner: -
--

CREATE SEQUENCE switch19.switch_interface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 519
-- Name: switch_interface_id_seq; Type: SEQUENCE OWNED BY; Schema: switch19; Owner: -
--

ALTER SEQUENCE switch19.switch_interface_id_seq OWNED BY switch19.switch_interface_out.id;


--
-- TOC entry 520 (class 1259 OID 19073)
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
-- TOC entry 521 (class 1259 OID 19081)
-- Name: trusted_headers; Type: TABLE; Schema: switch19; Owner: -
--

CREATE TABLE switch19.trusted_headers (
    id integer NOT NULL,
    name character varying,
    rank integer NOT NULL
);


--
-- TOC entry 522 (class 1259 OID 19087)
-- Name: trusted_headers_id_seq; Type: SEQUENCE; Schema: switch19; Owner: -
--

CREATE SEQUENCE switch19.trusted_headers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 522
-- Name: trusted_headers_id_seq; Type: SEQUENCE OWNED BY; Schema: switch19; Owner: -
--

ALTER SEQUENCE switch19.trusted_headers_id_seq OWNED BY switch19.trusted_headers.id;


--
-- TOC entry 4651 (class 2604 OID 19410)
-- Name: resource_type id; Type: DEFAULT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.resource_type ALTER COLUMN id SET DEFAULT nextval('switch19.resource_type_id_seq'::regclass);


--
-- TOC entry 4653 (class 2604 OID 19411)
-- Name: switch_interface_out id; Type: DEFAULT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.switch_interface_out ALTER COLUMN id SET DEFAULT nextval('switch19.switch_interface_id_seq'::regclass);


--
-- TOC entry 4656 (class 2604 OID 19412)
-- Name: trusted_headers id; Type: DEFAULT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.trusted_headers ALTER COLUMN id SET DEFAULT nextval('switch19.trusted_headers_id_seq'::regclass);


--
-- TOC entry 4808 (class 0 OID 19054)
-- Dependencies: 515
-- Data for Name: resource_action; Type: TABLE DATA; Schema: switch19; Owner: -
--

INSERT INTO switch19.resource_action (id, name) VALUES (1, 'Reject');
INSERT INTO switch19.resource_action (id, name) VALUES (2, 'Try next route');
INSERT INTO switch19.resource_action (id, name) VALUES (3, 'Accept');


--
-- TOC entry 4806 (class 0 OID 17909)
-- Dependencies: 283
-- Data for Name: resource_type; Type: TABLE DATA; Schema: switch19; Owner: -
--

INSERT INTO switch19.resource_type (id, name, internal_code_id, action_id) VALUES (1, 'Customer account', 1506, 1);
INSERT INTO switch19.resource_type (id, name, internal_code_id, action_id) VALUES (3, 'Customer auth', 1507, 1);
INSERT INTO switch19.resource_type (id, name, internal_code_id, action_id) VALUES (4, 'Customer gateway', 1508, 1);
INSERT INTO switch19.resource_type (id, name, internal_code_id, action_id) VALUES (2, 'Vendor account', 1509, 2);
INSERT INTO switch19.resource_type (id, name, internal_code_id, action_id) VALUES (5, 'Vendor gateway', 1510, 2);
INSERT INTO switch19.resource_type (id, name, internal_code_id, action_id) VALUES (6, 'Dialpeer', 1511, 2);
INSERT INTO switch19.resource_type (id, name, internal_code_id, action_id) VALUES (7, 'Account total capacity', 1512, 1);


--
-- TOC entry 4813 (class 0 OID 19073)
-- Dependencies: 520
-- Data for Name: switch_interface_in; Type: TABLE DATA; Schema: switch19; Owner: -
--

INSERT INTO switch19.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (2, 'Diversion', 'varchar', 2, 'uri_user', false, NULL);
INSERT INTO switch19.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (1, 'X-YETI-AUTH', 'varchar', 1, NULL, true, NULL);
INSERT INTO switch19.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (3, 'X-ORIG-IP', 'varchar', 3, NULL, true, NULL);
INSERT INTO switch19.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (4, 'X-ORIG-PORT', 'integer', 4, NULL, true, NULL);
INSERT INTO switch19.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (5, 'X-ORIG-PROTO', 'integer', 5, NULL, true, NULL);
INSERT INTO switch19.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (6, 'P-Asserted-Identity', 'varchar', 6, NULL, true, NULL);
INSERT INTO switch19.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (9, 'Remote-Party-ID', 'varchar', 9, NULL, true, NULL);
INSERT INTO switch19.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (10, 'RPID-Privacy', 'varchar', 10, NULL, true, NULL);
INSERT INTO switch19.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (8, 'P-Preferred-Identity', 'varchar', 7, NULL, true, NULL);
INSERT INTO switch19.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (7, 'Privacy', 'varchar', 8, NULL, true, NULL);


--
-- TOC entry 4811 (class 0 OID 19064)
-- Dependencies: 518
-- Data for Name: switch_interface_out; Type: TABLE DATA; Schema: switch19; Owner: -
--

INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (890, 'src_number_radius', 'varchar', false, 1050, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (891, 'dst_number_radius', 'varchar', false, 1051, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (892, 'orig_gw_name', 'varchar', false, 1052, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (895, 'customer_name', 'varchar', false, 1055, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (894, 'customer_auth_name', 'varchar', true, 1054, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (896, 'customer_account_name', 'varchar', false, 1056, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (900, 'aleg_radius_acc_profile_id', 'smallint', false, 1024, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (901, 'bleg_radius_acc_profile_id', 'smallint', false, 1025, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (739, 'ruri', 'varchar', false, 10, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (899, 'record_audio', 'boolean', false, 1023, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (741, 'from', 'varchar', false, 30, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (744, 'call_id', 'varchar', false, 60, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (746, 'dlg_nat_handling', 'boolean', false, 80, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (747, 'force_outbound_proxy', 'boolean', false, 90, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (748, 'outbound_proxy', 'varchar', false, 100, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (749, 'aleg_force_outbound_proxy', 'boolean', false, 110, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (750, 'aleg_outbound_proxy', 'varchar', false, 120, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (751, 'next_hop', 'varchar', false, 130, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (752, 'next_hop_1st_req', 'boolean', false, 140, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (753, 'aleg_next_hop', 'varchar', false, 150, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (762, 'enable_session_timer', 'boolean', false, 240, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (763, 'enable_aleg_session_timer', 'boolean', false, 250, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (764, 'session_expires', 'integer', false, 260, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (765, 'minimum_timer', 'integer', false, 270, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (766, 'maximum_timer', 'integer', false, 280, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (768, 'accept_501_reply', 'varchar', false, 300, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (769, 'aleg_session_expires', 'integer', false, 310, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (770, 'aleg_minimum_timer', 'integer', false, 320, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (771, 'aleg_maximum_timer', 'integer', false, 330, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (773, 'aleg_accept_501_reply', 'varchar', false, 350, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (774, 'enable_auth', 'boolean', false, 360, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (775, 'auth_user', 'varchar', false, 370, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (776, 'auth_pwd', 'varchar', false, 380, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (777, 'enable_aleg_auth', 'boolean', false, 390, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (778, 'auth_aleg_user', 'varchar', false, 400, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (779, 'auth_aleg_pwd', 'varchar', false, 410, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (780, 'append_headers', 'varchar', false, 420, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (781, 'append_headers_req', 'varchar', false, 430, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (782, 'aleg_append_headers_req', 'varchar', false, 440, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (784, 'enable_rtprelay', 'boolean', false, 460, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (787, 'rtprelay_interface', 'varchar', false, 490, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (788, 'aleg_rtprelay_interface', 'varchar', false, 500, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (791, 'outbound_interface', 'varchar', false, 530, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (792, 'aleg_outbound_interface', 'varchar', false, 540, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (793, 'contact_displayname', 'varchar', false, 550, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (794, 'contact_user', 'varchar', false, 560, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (795, 'contact_host', 'varchar', false, 570, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (796, 'contact_port', 'smallint', false, 580, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (817, 'time_limit', 'integer', false, 790, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (818, 'resources', 'varchar', false, 800, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (742, 'to', 'varchar', false, 40, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (783, 'disconnect_code_id', 'integer', false, 450, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (772, 'aleg_session_refresh_method_id', 'integer', false, 340, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (812, 'dump_level_id', 'integer', false, 740, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (767, 'session_refresh_method_id', 'integer', false, 290, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (837, 'src_name_in', 'varchar', true, 1880, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (838, 'src_name_out', 'varchar', true, 1890, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (839, 'diversion_in', 'varchar', true, 1900, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (840, 'diversion_out', 'varchar', true, 1910, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (846, 'auth_orig_ip', 'inet', true, 1920, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (713, 'customer_auth_id', 'integer', true, 1700, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (845, 'aleg_single_codec_in_200ok', 'boolean', false, 911, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (758, 'sdp_filter_type_id', 'integer', false, 200, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (847, 'auth_orig_port', 'integer', true, 1930, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (760, 'sdp_alines_filter_type_id', 'integer', false, 220, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (759, 'sdp_filter_list', 'varchar', false, 210, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (761, 'sdp_alines_filter_list', 'varchar', false, 230, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (841, 'aleg_policy_id', 'integer', false, 840, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (842, 'bleg_policy_id', 'integer', false, 850, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (843, 'aleg_codecs_group_id', 'integer', false, 900, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (844, 'bleg_codecs_group_id', 'integer', false, 910, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (848, 'bleg_single_codec_in_200ok', 'boolean', false, 912, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (709, 'customer_id', 'integer', true, 1650, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (710, 'vendor_id', 'integer', true, 1660, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (711, 'customer_acc_id', 'integer', true, 1670, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (712, 'vendor_acc_id', 'integer', true, 1690, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (827, 'destination_next_rate', 'numeric', true, 1771, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (831, 'destination_next_interval', 'integer', true, 1773, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (830, 'destination_initial_interval', 'integer', true, 1772, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (832, 'destination_rate_policy_id', 'smallint', true, 1774, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (833, 'dialpeer_initial_interval', 'integer', true, 1775, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (834, 'dialpeer_next_interval', 'integer', true, 1776, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (835, 'dialpeer_next_rate', 'numeric', true, 1777, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (821, 'cache_time', 'integer', false, 810, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (849, 'ringing_timeout', 'integer', false, 913, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (924, 'try_avoid_transcoding', 'boolean', false, 620, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (925, 'rtprelay_dtmf_filtering', 'boolean', false, 630, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (926, 'rtprelay_dtmf_detection', 'boolean', false, 640, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (927, 'patch_ruri_next_hop', 'boolean', false, 920, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (929, 'rtprelay_force_dtmf_relay', 'boolean', false, 930, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (933, 'aleg_force_symmetric_rtp', 'boolean', false, 935, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (934, 'bleg_force_symmetric_rtp', 'boolean', false, 940, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (937, 'aleg_symmetric_rtp_nonstop', 'boolean', false, 945, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (939, 'bleg_symmetric_rtp_nonstop', 'boolean', false, 950, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (940, 'aleg_symmetric_rtp_ignore_rtcp', 'boolean', false, 955, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (941, 'bleg_symmetric_rtp_ignore_rtcp', 'boolean', false, 960, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (942, 'aleg_rtp_ping', 'boolean', false, 965, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (943, 'bleg_rtp_ping', 'boolean', false, 970, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (946, 'aleg_relay_options', 'boolean', false, 975, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (948, 'bleg_relay_options', 'boolean', false, 980, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (949, 'filter_noaudio_streams', 'boolean', false, 985, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (954, 'aleg_sdp_c_location_id', 'integer', false, 996, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (955, 'bleg_sdp_c_location_id', 'integer', false, 997, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (958, 'trusted_hdrs_gw', 'boolean', false, 998, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (959, 'aleg_append_headers_reply', 'varchar', false, 999, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (961, 'bleg_sdp_alines_filter_list', 'varchar', false, 1000, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (963, 'bleg_sdp_alines_filter_type_id', 'integer', false, 1001, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (715, 'dialpeer_id', 'bigint', true, 1720, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (716, 'orig_gw_id', 'integer', true, 1730, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (717, 'term_gw_id', 'integer', true, 1740, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (718, 'routing_group_id', 'integer', true, 1750, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (719, 'rateplan_id', 'integer', true, 1760, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (721, 'destination_fee', 'numeric', true, 1780, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (723, 'dialpeer_fee', 'numeric', true, 1800, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (726, 'dst_prefix_in', 'varchar', true, 1840, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (727, 'dst_prefix_out', 'varchar', true, 1850, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (728, 'src_prefix_in', 'varchar', true, 1860, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (729, 'src_prefix_out', 'varchar', true, 1870, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (824, 'reply_translations', 'varchar', false, 820, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (720, 'destination_initial_rate', 'numeric', true, 1770, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (722, 'dialpeer_initial_rate', 'numeric', true, 1790, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (850, 'global_tag', 'varchar', false, 914, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (852, 'dead_rtp_time', 'integer', false, 1003, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (854, 'rtp_relay_timestamp_aligning', 'boolean', false, 1005, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (855, 'allow_1xx_wo2tag', 'boolean', false, 1006, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (856, 'invite_timeout', 'integer', false, 1007, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (857, 'srv_failover_timeout', 'integer', false, 1008, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (859, 'rtp_force_relay_cn', 'boolean', false, 1009, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (861, 'dst_country_id', 'integer', true, 1931, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (862, 'dst_network_id', 'integer', true, 1932, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (863, 'aleg_sensor_id', 'smallint', false, 1010, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (866, 'aleg_sensor_level_id', 'smallint', false, 1011, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (867, 'bleg_sensor_id', 'smallint', false, 1012, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (868, 'bleg_sensor_level_id', 'smallint', false, 1013, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (869, 'dst_prefix_routing', 'varchar', true, 1933, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (870, 'src_prefix_routing', 'varchar', true, 1934, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (871, 'routing_plan_id', 'integer', true, 1935, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (872, 'aleg_dtmf_send_mode_id', 'integer', false, 1014, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (873, 'bleg_dtmf_send_mode_id', 'integer', false, 1015, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (874, 'aleg_dtmf_recv_modes', 'integer', false, 1016, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (875, 'bleg_dtmf_recv_modes', 'integer', false, 1017, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (876, 'suppress_early_media', 'boolean', false, 1018, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (877, 'aleg_relay_update', 'boolean', false, 1019, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (878, 'bleg_relay_update', 'boolean', false, 1020, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (951, 'aleg_relay_reinvite', 'boolean', false, 990, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (879, 'bleg_relay_reinvite', 'boolean', false, 991, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (880, 'aleg_relay_hold', 'boolean', false, 992, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (881, 'bleg_relay_hold', 'boolean', false, 993, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (882, 'aleg_relay_prack', 'boolean', false, 994, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (883, 'bleg_relay_prack', 'boolean', false, 995, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (884, 'destination_prefix', 'varchar', true, 1711, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (885, 'dialpeer_prefix', 'varchar', true, 1721, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (886, 'lrn', 'varchar', true, 1936, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (887, 'lnp_database_id', 'smallint', true, 1937, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (888, 'force_one_way_early_media', 'boolean', false, 1021, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (889, 'radius_auth_profile_id', 'smallint', false, 1022, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (904, 'term_gw_name', 'varchar', false, 1057, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (909, 'transit_headers_b2a', 'varchar', false, 1027, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (907, 'transit_headers_a2b', 'varchar', false, 1026, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (714, 'destination_id', 'bigint', true, 1710, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (910, 'from_domain', 'varchar', true, 1938, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (911, 'to_domain', 'varchar', true, 1939, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (912, 'ruri_domain', 'varchar', true, 1940, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (913, 'fake_180_timer', 'smallint', false, 1060, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (914, 'src_area_id', 'integer', true, 1941, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (915, 'dst_area_id', 'integer', true, 1942, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (917, 'bleg_transport_protocol_id', 'smallint', false, 21, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (918, 'aleg_outbound_proxy_transport_protocol_id', 'smallint', false, 121, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (919, 'bleg_outbound_proxy_transport_protocol_id', 'smallint', false, 101, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (920, 'auth_orig_protocol_id', 'smallint', true, 1919, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (921, 'aleg_rel100_mode_id', 'smallint', false, 1061, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (922, 'bleg_rel100_mode_id', 'smallint', false, 1062, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (923, 'pai_in', 'varchar', true, 1944, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1000, 'ppi_in', 'varchar', true, 1945, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1002, 'privacy_in', 'varchar', true, 1946, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1003, 'rpid_in', 'varchar', true, 1947, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1005, 'rpid_privacy_in', 'varchar', true, 1948, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1006, 'pai_out', 'varchar', true, 1949, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1007, 'ppi_out', 'varchar', true, 1950, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1008, 'privacy_out', 'varchar', true, 1951, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1009, 'rpid_out', 'varchar', true, 1952, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1010, 'rpid_privacy_out', 'varchar', true, 1953, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1011, 'bleg_max_30x_redirects', 'smallint', false, 1063, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1012, 'bleg_max_transfers', 'smallint', false, 1064, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1013, 'customer_acc_check_balance', 'boolean', true, 1954, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1014, 'destination_reverse_billing', 'boolean', true, 1955, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1015, 'dialpeer_reverse_billing', 'boolean', true, 1956, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1016, 'aleg_auth_required', 'boolean', false, 1065, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (916, 'routing_tag_ids', 'smallint[]', true, 1943, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1018, 'customer_auth_external_id', 'bigint', true, 1957, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1019, 'customer_external_id', 'bigint', true, 1958, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1020, 'vendor_external_id', 'bigint', true, 1959, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1021, 'customer_acc_external_id', 'bigint', true, 1960, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1022, 'vendor_acc_external_id', 'bigint', true, 1970, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (905, 'orig_gw_external_id', 'bigint', true, 1971, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (906, 'term_gw_external_id', 'bigint', true, 1972, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1023, 'customer_acc_vat', 'numeric', true, 1973, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1024, 'aleg_rtp_filter_inband_dtmf', 'boolean', false, 1066, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1025, 'bleg_rtp_filter_inband_dtmf', 'boolean', false, 1067, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1026, 'registration_auth_id', 'integer', false, 1068, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1027, 'bleg_protocol_priority_id', 'smallint', false, 1069, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1028, 'aleg_media_encryption_mode_id', 'smallint', false, 1070, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1029, 'bleg_media_encryption_mode_id', 'smallint', false, 1071, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1030, 'aleg_sip_acl', 'varchar[]', false, 1072, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1031, 'aleg_rtp_acl', 'varchar[]', false, 1073, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1032, 'bleg_sip_acl', 'varchar[]', false, 1074, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1033, 'bleg_rtp_acl', 'varchar[]', false, 1075, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1034, 'registered_aor_id', 'integer', false, 1076, false);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1035, 'src_country_id', 'integer', true, 1974, true);
INSERT INTO switch19.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1036, 'src_network_id', 'integer', true, 1975, true);

--
-- TOC entry 4814 (class 0 OID 19081)
-- Dependencies: 521
-- Data for Name: trusted_headers; Type: TABLE DATA; Schema: switch19; Owner: -
--



--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 514
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: switch19; Owner: -
--

SELECT pg_catalog.setval('switch19.events_id_seq', 280, true);


--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 516
-- Name: resource_type_id_seq; Type: SEQUENCE SET; Schema: switch19; Owner: -
--

SELECT pg_catalog.setval('switch19.resource_type_id_seq', 6, true);


--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 517
-- Name: switch_in_interface_id_seq; Type: SEQUENCE SET; Schema: switch19; Owner: -
--

SELECT pg_catalog.setval('switch19.switch_in_interface_id_seq', 10, true);


--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 519
-- Name: switch_interface_id_seq; Type: SEQUENCE SET; Schema: switch19; Owner: -
--

SELECT pg_catalog.setval('switch19.switch_interface_id_seq', 1036, true);


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 522
-- Name: trusted_headers_id_seq; Type: SEQUENCE SET; Schema: switch19; Owner: -
--

SELECT pg_catalog.setval('switch19.trusted_headers_id_seq', 2, true);


--
-- TOC entry 4662 (class 2606 OID 19861)
-- Name: resource_action resource_action_name_key; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.resource_action
    ADD CONSTRAINT resource_action_name_key UNIQUE (name);


--
-- TOC entry 4664 (class 2606 OID 19863)
-- Name: resource_action resource_action_pkey; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.resource_action
    ADD CONSTRAINT resource_action_pkey PRIMARY KEY (id);


--
-- TOC entry 4658 (class 2606 OID 19865)
-- Name: resource_type resource_type_name_key; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.resource_type
    ADD CONSTRAINT resource_type_name_key UNIQUE (name);


--
-- TOC entry 4660 (class 2606 OID 19867)
-- Name: resource_type resource_type_pkey; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.resource_type
    ADD CONSTRAINT resource_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4670 (class 2606 OID 19869)
-- Name: switch_interface_in switch_in_interface_pkey; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.switch_interface_in
    ADD CONSTRAINT switch_in_interface_pkey PRIMARY KEY (id);


--
-- TOC entry 4672 (class 2606 OID 19871)
-- Name: switch_interface_in switch_in_interface_rank_key; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.switch_interface_in
    ADD CONSTRAINT switch_in_interface_rank_key UNIQUE (rank);


--
-- TOC entry 4666 (class 2606 OID 19873)
-- Name: switch_interface_out switch_interface_pkey; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.switch_interface_out
    ADD CONSTRAINT switch_interface_pkey PRIMARY KEY (id);


--
-- TOC entry 4668 (class 2606 OID 19875)
-- Name: switch_interface_out switch_interface_rank_key; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.switch_interface_out
    ADD CONSTRAINT switch_interface_rank_key UNIQUE (rank);


--
-- TOC entry 4674 (class 2606 OID 19877)
-- Name: trusted_headers trusted_headers_pkey; Type: CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.trusted_headers
    ADD CONSTRAINT trusted_headers_pkey PRIMARY KEY (id);


--
-- TOC entry 4675 (class 2606 OID 20578)
-- Name: resource_type resource_type_action_id_fkey; Type: FK CONSTRAINT; Schema: switch19; Owner: -
--

ALTER TABLE ONLY switch19.resource_type
    ADD CONSTRAINT resource_type_action_id_fkey FOREIGN KEY (action_id) REFERENCES switch19.resource_action(id);

set search_path TO switch19;
SELECT * from switch19.preprocess_all();
set search_path TO gui, public, switch, billing, class4, runtime_stats, sys, logs, data_import;

}
  end

end

