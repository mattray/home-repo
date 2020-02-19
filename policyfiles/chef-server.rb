name 'chef-server'

default_source :supermarket

cookbook 'leds_handler', path: '/Users/mattray/ws/cookbooks/leds_handler'
cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'
cookbook 'timesyncd', path: '/Users/mattray/ws/cookbooks/timesyncd'

run_list 'audit', 'leds_handler::default', 'mattray', 'mattray::macbookpro', 'timesyncd', 'openssh', 'apt::cacher-ng', 'apt::cacher-client', 'chef-client::config', 'chef-client::service', 'chef_client_updater::default', 'managed_chef_server', 'managed_chef_server::managed_organization', 'managed_chef_server::policyfile_loader'

override['apt']['cacher_client']['cacher_server']['host'] = 'ndnd'
override['apt']['cacher_client']['cacher_server']['port'] = 3142
override['apt']['cacher_client']['cacher_server']['proxy_ssl'] = true

override['audit']['interval']['enabled'] = true
override['audit']['interval']['time'] = 30 # 48 times a day
override['audit']['profiles']['linux-patch-baseline']['url'] = 'https://github.com/dev-sec/linux-patch-baseline'
override['audit']['profiles']['uptime']['url'] = 'https://github.com/mattray/uptime-profile/'
override['audit']['reporter'] = 'chef-automate'

# Chef Server settings
override['chef-server']['accept_license'] = true
override['chef-server']['package_source'] = '/root/chef-server-core_13.1.13-1_amd64.deb'
override['chef-workstation']['package_source'] = '/root/chef-workstation_0.15.18-1_amd64.deb'
override['mcs']['data_collector']['proxy'] = true
override['mcs']['data_collector']['root_url'] = 'https://inez.bottlebru.sh/data-collector/v0/'
override['mcs']['data_collector']['token'] = '35V9X1VO0VRSeUjukPmBsihvwXI='
override['mcs']['managed_user']['email'] = 'matt@chef.io'
override['mcs']['policyfile']['dir'] = '/var/chef/policyfiles/'
override['mcs']['policyfile']['group'] = 'ndnd-home'
override['mcs']['profiles']['root_url'] = 'https://inez.bottlebru.sh'
override['mcs']['skip_test'] = true

override['chef_client']['config']['chef_license'] = 'accept'
override['chef_client']['config']['data_collector.server_url'] = 'https://inez.bottlebru.sh/data-collector/v0/'
override['chef_client']['config']['data_collector.token'] = '35V9X1VO0VRSeUjukPmBsihvwXI='
override['chef_client']['init_style'] = 'systemd'
override['chef_client']['interval'] = 900 # every 15 minutes
override['chef_client']['splay'] = 100

override['timesyncd']['NTP'] = ['10.0.0.1']
