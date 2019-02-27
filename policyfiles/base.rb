name 'base'

default_source :supermarket

cookbook 'mattray', git: 'https://github.com/mattray/mattray-cookbook.git'

run_list 'audit', 'chef-client::config', 'chef-client::service', 'chef-client::delete_validation', 'ntp', 'openssh', 'mattray'

default['chef_client']['init_style'] = 'systemd'
default['chef_client']['interval'] = 1800
default['chef_client']['splay'] = 100
default['ntp']['servers'] = ['0.au.pool.ntp.org', '1.au.pool.ntp.org', '2.au.pool.ntp.org', '3.au.pool.ntp.org']

# https://docs.chef.io/data_collection_without_server.html
default['chef_client']['config']['data_collector.server_url'] = 'https://ndnd/data-collector/v0/'
default['chef_client']['config']['data_collector.token'] = '8ZzgdoqAPRWsW4XOHRiFx7Kbobk='
default['chef_client']['config']['data_collector.organization'] = 'home'
default['audit']['reporter'] = 'chef-automate'
default['audit']['interval']['enabled'] = true
default['audit']['interval']['time'] = 120 # 12 times a day

default['audit']['profiles']['linux-patch-baseline']['url'] = 'https://github.com/dev-sec/linux-patch-baseline'
#default['audit']['profiles']['ssh-baseline']['url'] = 'https://github.com/dev-sec/ssh-baseline/archive/2.3.0.tar.gz'
