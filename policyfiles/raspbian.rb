name 'raspbian'

include_policy 'base', path: './base.lock.json'

default_source :supermarket

cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'apt::cacher-client', 'ntp', 'mattray::raspberrypi', 'leds_handler'

default['apt']['cacher_client']['cacher_server']['host'] = 'cubert'
default['apt']['cacher_client']['cacher_server']['port'] = 3142
default['apt']['cacher_client']['cacher_server']['proxy_ssl'] = true

default['ntp']['servers'] = ['10.0.0.1']

override['ohai']['disabled_plugins'] = [ 'dmi' ]
