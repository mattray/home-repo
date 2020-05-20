name 'beaglebone'

include_policy 'base', path: './base.lock.json'

default_source :supermarket

cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'apt::cacher-client', 'ntp', 'mattray::beaglebone', 'leds_handler'

default['apt']['cacher_client']['cacher_server']['host'] = 'ndnd'
default['apt']['cacher_client']['cacher_server']['port'] = 3142
default['apt']['cacher_client']['cacher_server']['proxy_ssl'] = true

default['ntp']['servers'] = ['10.0.0.1']
default['ntp']['sync_hw_clock'] = true

override['ohai']['disabled_plugins'] = [ 'dmi' ]
