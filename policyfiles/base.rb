name 'base'

default_source :supermarket

cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'audit', 'mattray', 'chef-client::config', 'openssh'

default['audit']['reporter'] = 'chef-server-automate'
default['audit']['fetcher'] = 'chef-server'
default['audit']['interval']['enabled'] = true
default['audit']['interval']['time'] = 30 # 48 times a day
default['audit']['profiles']['linux-patch-baseline']['url'] = 'https://github.com/dev-sec/linux-patch-baseline'
default['audit']['profiles']['uptime']['url'] = 'https://github.com/mattray/uptime-profile/'

default['chef_client']['config']['chef_license'] = 'accept'
