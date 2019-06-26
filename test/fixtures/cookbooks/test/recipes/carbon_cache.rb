include_recipe 'socrata-graphite-fork::carbon'

socrata_graphite_fork_carbon_cache 'default' do
  config ({
    enable_logrotation: true,
    user: 'graphite',
    max_cache_size: 'inf',
    max_updates_per_second: 500,
    max_creates_per_minute: 50,
    line_receiver_interface: '0.0.0.0',
    line_receiver_port: 2003,
    udp_receiver_port: 2003,
    pickle_receiver_port: 2004,
    enable_udp_listener: true,
    cache_query_port: '7002',
    cache_write_strategy: 'sorted',
    use_flow_control: true,
    log_updates: false,
    log_cache_hits: false,
    whisper_autoflush: false,
  })
end

socrata_graphite_fork_carbon_cache 'a' do
  config ({
    line_receiver_port: 2004,
    udp_receiver_port: 2004,
    pickle_receiver_port: 2005,
    cache_query_port: 7003,
  })
end

socrata_graphite_fork_carbon_cache 'b' do
  config ({
    line_receiver_port: 2006,
    udp_receiver_port: 2006,
    pickle_receiver_port: 2007,
    cache_query_port: 7004,
  })
end

socrata_graphite_fork_storage_schema 'carbon' do
  config ({
    pattern: '^carbon.',
    retentions: '60:90d',
  })
end

socrata_graphite_fork_storage_schema 'default_1min_for_1day' do
  config ({
    pattern: '.*',
    retentions: '60s:1d',
  })
end

socrata_graphite_fork_service 'cache:a'
socrata_graphite_fork_service 'cache:b'
