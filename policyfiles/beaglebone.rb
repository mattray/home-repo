name 'beaglebone'

include_policy 'base', path: './base.lock.json'

default_source :supermarket

cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'apt::cacher-ng', 'apt::cacher-client', 'mattray::beaglebone', 'leds_handler'

default['apt']['cacher_client']['cacher_server']['host'] = 'cubert'
default['apt']['cacher_client']['cacher_server']['port'] = 3142
default['apt']['cacher_client']['cacher_server']['proxy_ssl'] = true

override['apt']['cacher_dir'] = '/emmc'
override['ohai']['disabled_plugins'] = %w(dmi shard_seed)
