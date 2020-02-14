name 'debian'

include_policy 'base', path: './base.lock.json'

default_source :supermarket

cookbook 'timesyncd', path: '/Users/mattray/ws/cookbooks/timesyncd'

run_list 'apt::cacher-client', 'timesyncd'

default['apt']['cacher_client']['cacher_server']['host'] = 'ndnd'
default['apt']['cacher_client']['cacher_server']['port'] = 3142
default['apt']['cacher_client']['cacher_server']['proxy_ssl'] = true

default['timesyncd']['NTP'] = ['10.0.0.1']
