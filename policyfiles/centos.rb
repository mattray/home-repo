name 'centos'

include_policy 'base', path: './base.lock.json'

default_source :supermarket

cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'ntp', 'mattray::raspberrypi', 'leds_handler'

default['ntp']['servers'] = ['10.0.0.1']

override['ohai']['disabled_plugins'] = [ 'dmi' ]
