name 'workstation'

include_policy 'effortless', path: './effortless.lock.json'

default_source :supermarket

cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'mattray', 'chef-client::config', 'openssh', 'apt::cacher-client', 'chef_client_updater'

default['chef_client']['config']['chef_license'] = 'accept'

default['apt']['cacher_client']['cacher_server']['host'] = 'cubert'
default['apt']['cacher_client']['cacher_server']['port'] = 3142
default['apt']['cacher_client']['cacher_server']['proxy_ssl'] = true
