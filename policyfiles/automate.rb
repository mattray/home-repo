name 'automate'

include_policy 'effortless', path: './effortless.lock.json'

default_source :supermarket

cookbook 'managed_automate', path: '/Users/mattray/ws/cookbooks/managed_automate'
cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'mattray', 'mattray::macbookpro11', 'chef-client::config', 'openssh', 'apt::cacher-client', 'chef_client_updater', 'leds_handler', 'managed_automate::upgrade', 'managed_automate::backup'

default['apt']['cacher_client']['cacher_server']['host'] = 'cubert'
default['apt']['cacher_client']['cacher_server']['port'] = 3142
default['apt']['cacher_client']['cacher_server']['proxy_ssl'] = true

default['chef_client']['config']['chef_license'] = 'accept'

default['ma']['chef-automate'] = '/bin/chef-automate'
default['ma']['install']['file'] = '/home/mattray/automate-20200603114954.aib'
# default['ma']['restore']['file'] = '/root/automate-backup-20200612173001.tgz'
default['ma']['upgrade']['file'] = '/home/mattray/automate-20200811175306.aib'

default['ma']['backup']['export']['dir'] = '/storage/backups'
default['ma']['backup']['cron']['minute'] = '30'
default['ma']['backup']['cron']['hour'] = '3'
default['ma']['backup']['cron']['day'] = '*'

default['ma']['license']['file'] = '/root/a2.lic'
