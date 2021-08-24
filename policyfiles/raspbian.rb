name 'raspbian'

default_source :supermarket

cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'
cookbook 'systemd_timesyncd', path: '/Users/mattray/ws/cookbooks/systemd_timesyncd'

run_list 'mattray', 'apt::cacher-client', 'mattray::raspberrypi', 'chef-client::config', 'openssh', 'systemd_timesyncd', 'leds_handler'

default['apt']['cacher_client']['cacher_server']['host'] = 'cubert'
default['apt']['cacher_client']['cacher_server']['port'] = 3142
default['apt']['cacher_client']['cacher_server']['proxy_ssl'] = true

default['systemd_timesyncd']['ntp'] = ['10.0.0.1']

override['ohai']['disabled_plugins'] = %w(dmi shard_seed)
