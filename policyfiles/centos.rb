name 'centos'

default_source :supermarket

cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'mattray', 'mattray::raspberrypi', 'chef-client::config', 'openssh', 'ntp', 'leds_handler'

default['ntp']['servers'] = ['10.0.0.1']

override['ohai']['disabled_plugins'] = %w(dmi shard_seed)
