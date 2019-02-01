name 'base'

default_source :supermarket

cookbook 'mattray', git: 'https://github.com/mattray/mattray-cookbook.git'

run_list 'audit', 'chef-client::config', 'chef-client::service', 'chef-client::delete_validation', 'ntp', 'openssh', 'mattray'

override['chef_client']['init_style'] = 'systemd'
override['chef_client']['interval'] = 1800
override['chef_client']['splay'] = 100
override['ntp']['servers'] = ['0.au.pool.ntp.org', '1.au.pool.ntp.org', '2.au.pool.ntp.org', '3.au.pool.ntp.org']

# https://docs.chef.io/data_collection_without_server.html
override['chef_client']['config']['data_collector.server_url'] = 'https://ndnd/data-collector/v0/'
override['chef_client']['config']['data_collector.token'] = '8ZzgdoqAPRWsW4XOHRiFx7Kbobk='
override['chef_client']['config']['data_collector.organization'] = 'home'
override['audit']['reporter'] = 'chef-automate'
override['audit']['interval']['enabled'] = true
override['audit']['interval']['time'] = 180 # 8 times a day

override['audit']['profiles']['linux-patch-baseline'] = { 'url': 'https://github.com/dev-sec/linux-patch-baseline/archive/0.4.0.zip' }
