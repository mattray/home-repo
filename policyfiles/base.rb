name 'base'

default_source :supermarket

cookbook 'mattray', git: 'https://github.com/mattray/mattray-cookbook.git'

run_list 'chef-client::config', 'chef-client::service', 'chef-client::delete_validation', 'ntp', 'openssh', 'mattray'

override['chef_client']['config']['http_retry_delay'] = 10
override['chef_client']['config']['interval'] = 600
override['chef_client']['config']['splay'] = 100
override['chef_client']['config']['verbose_logging'] = true
override['chef_client']['init_style'] = 'systemd'
override['chef_client']['systemd']['timer'] = true
override['ntp']['servers'] = ['0.au.pool.ntp.org', '1.au.pool.ntp.org', '2.au.pool.ntp.org', '3.au.pool.ntp.org']
override['ntp']['sync_hw_clock'] = true
