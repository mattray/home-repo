name 'base'

default_source :supermarket

# cookbook 'mattray', git: 'https://github.com/mattray/mattray-cookbook.git'
cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'audit', 'chef-client::config', 'chef-client::service', 'chef-client::delete_validation', 'ntp', 'openssh', 'mattray'

default['chef_client']['init_style'] = 'systemd'
default['chef_client']['interval'] = 1800
default['chef_client']['splay'] = 100
default['ntp']['servers'] = ['0.au.pool.ntp.org', '1.au.pool.ntp.org', '2.au.pool.ntp.org', '3.au.pool.ntp.org']

# https://docs.chef.io/data_collection_without_server.html
default['chef_client']['config']['data_collector.server_url'] = 'https://ndnd.bottlebru.sh/data-collector/v0/'
default['chef_client']['config']['data_collector.token'] = '35V9X1VO0VRSeUjukPmBsihvwXI='

default['chef_client']['config']['chef_license'] = 'accept'

default['audit']['reporter'] = 'chef-automate'
default['audit']['interval']['enabled'] = true
default['audit']['interval']['time'] = 30 # 48 times a day

default['apt']['cacher_client']['cacher_server']['host'] = 'cubert'
default['apt']['cacher_client']['cacher_server']['port'] = 3142
default['apt']['cacher_client']['cacher_server']['proxy_ssl'] = true

default['audit']['profiles']['linux-patch-baseline']['url'] = 'https://github.com/dev-sec/linux-patch-baseline'
default['audit']['profiles']['uptime']['url'] = 'https://github.com/mattray/uptime-profile/'
