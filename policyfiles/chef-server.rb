name 'chef-server'

default_source :supermarket

cookbook 'managed_chef_server', path: '/Users/mattray/ws/cookbooks/managed_chef_server'
cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'
cookbook 'timesyncd', path: '/Users/mattray/ws/cookbooks/timesyncd'

run_list 'audit', 'mattray', 'chef-client::config', 'apt::cacher-client', 'timesyncd', 'mattray::macbookpro', 'openssh', 'chef_client_updater', 'leds_handler', 'managed_chef_server', 'managed_chef_server::managed_organization', 'managed_chef_server::policyfile_loader', 'starship'

default['audit']['interval']['enabled'] = true
default['audit']['interval']['time'] = 30 # 48 times a day
default['audit']['profiles']['linux-patch-baseline']['url'] = 'https://github.com/dev-sec/linux-patch-baseline'
default['audit']['profiles']['uptime']['url'] = 'https://github.com/mattray/uptime-profile/'
default['audit']['reporter'] = 'chef-automate'

default['chef_client']['config']['chef_license'] = 'accept'
default['chef_client']['config']['data_collector.server_url'] = 'https://inez.bottlebru.sh/data-collector/v0/'
default['chef_client']['config']['data_collector.token'] = '35V9X1VO0VRSeUjukPmBsihvwXI='

default['apt']['cacher_client']['cacher_server']['host'] = 'cubert'
default['apt']['cacher_client']['cacher_server']['port'] = 3142
default['apt']['cacher_client']['cacher_server']['proxy_ssl'] = true

default['timesyncd']['NTP'] = ['10.0.0.1']

# Chef Server settings
default['chef-server']['accept_license'] = true
default['chef-server']['package_source'] = '/root/chef-server-core_13.1.13-1_amd64.deb'
default['chef-workstation']['package_source'] = '/root/chef-workstation_0.17.5-1_amd64.deb'
default['mcs']['data_collector']['proxy'] = true
default['mcs']['data_collector']['root_url'] = 'https://inez.bottlebru.sh/data-collector/v0/'
default['mcs']['data_collector']['token'] = '35V9X1VO0VRSeUjukPmBsihvwXI='
default['mcs']['managed_user']['email'] = 'matt@chef.io'
default['mcs']['policyfile']['dir'] = '/var/chef/policyfiles/'
default['mcs']['policyfile']['group'] = 'ndnd-home'
default['mcs']['profiles']['root_url'] = 'https://inez.bottlebru.sh'
default['mcs']['skip_test'] = true

default['starship']['user']['mattray'] = 'bash'
default['starship']['user']['root'] = 'bash'
