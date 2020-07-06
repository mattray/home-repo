name 'macos'

default_source :supermarket

cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'audit', 'chef-client::config', 'chef-client::service', 'mattray', 'chef_client_updater', 'mattray::macos'

default['chef_client']['config']['chef_license'] = 'accept'

default['audit']['reporter'] = 'chef-server-automate'
default['audit']['fetcher'] = 'chef-server'
default['audit']['interval']['enabled'] = true
default['audit']['interval']['time'] = 60 # 24 times a day
default['audit']['profiles']['uptime']['url'] = 'https://github.com/mattray/uptime-profile/'
