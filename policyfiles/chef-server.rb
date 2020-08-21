name 'chef-server'

include_policy 'effortless', path: './effortless.lock.json'

default_source :supermarket

cookbook 'managed_chef_server', path: '/Users/mattray/ws/cookbooks/managed_chef_server'
cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'mattray', 'mattray::macbookpro', 'chef-client::config', 'apt::cacher-client', 'openssh', 'chef_client_updater', 'leds_handler', 'managed_chef_server', 'managed_chef_server::managed_organization', 'managed_chef_server::policyfile_loader', 'managed_chef_server::backup', 'mattray::minecraft'
named_run_list :policies, 'managed_chef_server::policyfile_loader'

default['chef_client']['config']['chef_license'] = 'accept'
default['chef_client']['config']['data_collector.server_url'] = 'https://roberto.bottlebru.sh/data-collector/v0/'
default['chef_client']['config']['data_collector.token'] = 'u9nHhP6ZcLtYixoNSdUbJz5eNFg='

default['apt']['cacher_client']['cacher_server']['host'] = 'cubert'
default['apt']['cacher_client']['cacher_server']['port'] = 3142
default['apt']['cacher_client']['cacher_server']['proxy_ssl'] = true

# Chef Server settings
default['chef-server']['accept_license'] = true
default['chef-server']['package_source'] = '/root/chef-server-core_13.1.13-1_amd64.deb'
default['chef-workstation']['package_source'] = '/root/chef-workstation_0.17.5-1_amd64.deb'
default['mcs']['data_collector']['proxy'] = true
default['mcs']['data_collector']['root_url'] = 'https://roberto.bottlebru.sh/data-collector/v0/'
default['mcs']['data_collector']['token'] = 'u9nHhP6ZcLtYixoNSdUbJz5eNFg='
default['mcs']['managed_user']['email'] = 'matt@chef.io'
default['mcs']['policyfile']['dir'] = '/var/chef/policyfiles/'
default['mcs']['policyfile']['group'] = 'ndnd-home'
default['mcs']['skip_test'] = true
