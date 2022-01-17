name 'base'

default_source :supermarket

cookbook 'leds_handler', path: '/Users/mattray/ws/cookbooks/leds_handler'
cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'
cookbook 'systemd_timesyncd', path: '/Users/mattray/ws/cookbooks/systemd_timesyncd'

run_list 'mattray', 'apt::cacher-client', 'chef-client::config', 'openssh', 'systemd_timesyncd', 'leds_handler::leds_off'

default['apt']['cacher_client']['cacher_server']['host'] = 'cubert'
default['apt']['cacher_client']['cacher_server']['port'] = 3142
default['apt']['cacher_client']['cacher_server']['proxy_ssl'] = true

default['chef_client']['conf_dir'] = '/etc/cinc'
default['chef_client']['bin'] = '/opt/cinc/bin/chef-client'
default['mattray']['cinc']['version'] = '17.9.26'

default['systemd_timesyncd']['ntp'] = ['10.0.0.1']

override['ohai']['disabled_plugins'] = %w(dmi shard_seed)
