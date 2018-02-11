FactoryGirl.define do
  factory :importing_customers_auth, class: Importing::CustomersAuth do
    o_id nil
    customer_name nil
    customer_id nil
    rateplan_name nil
    rateplan_id nil
    enabled true
    ip nil
    account_name nil
    account_id nil
    gateway_name nil
    gateway_id nil
    src_rewrite_rule nil
    src_rewrite_result nil
    dst_rewrite_rule nil
    dst_rewrite_result nil
    src_prefix ''
    dst_prefix ''
    x_yeti_auth nil
    name nil
    dump_level_name nil
    dump_level_id 1
    capacity 1
    pop_name nil
    pop_id nil
    uri_domain nil
    src_name_rewrite_rule nil
    src_name_rewrite_result nil
    diversion_policy_name nil
    diversion_policy_id 1
    diversion_rewrite_rule nil
    diversion_rewrite_result nil
    dst_numberlist_id nil
    dst_numberlist_name nil
    src_numberlist_id nil
    src_numberlist_name nil
    routing_plan_name nil
    routing_plan_id nil
    allow_receive_rate_limit false
    send_billing_information false
    error_string nil
    enable_audio_recording false
    check_account_balance true
    require_incoming_auth false
  end
end
