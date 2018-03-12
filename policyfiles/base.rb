name 'base'

default_source :supermarket

cookbook 'mattray', path: '/Users/mray/ws/home-repo/cookbooks/mattray'

run_list 'chef-client::config', 'chef-client::service', 'chef-client::delete_validation', 'ntp', 'openssh', 'sudo', 'mattray'

override['authorization']['sudo']['groups'] = ['sudo']
override['authorization']['sudo']['include_sudoers_d'] = true
override['authorization']['sudo']['passwordless'] = true
override['authorization']['sudo']['users'] = ['mattray']
override['chef_client']['config']['client_fork'] = true
override['chef_client']['config']['color'] = false
override['chef_client']['config']['http_retry_delay'] = 10
override['chef_client']['config']['interval'] = 600
override['chef_client']['config']['log_level'] = ':warn'
override['chef_client']['config']['verbose_logging'] = true
override['ntp']['servers'] = ['0.au.pool.ntp.org', '1.au.pool.ntp.org', '2.au.pool.ntp.org', '3.au.pool.ntp.org']
override['ntp']['sync_hw_clock'] = true
