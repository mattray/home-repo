name 'macos'

default_source :supermarket

cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'mattray', 'mattray::macos', 'chef-client::config', 'chef-client::service'

default['chef_client']['config']['log_location'] = '/tmp/chef.log'
