name 'centos'

include_policy 'base', path: './base.lock.json'
include_policy 'rpi', path: './rpi.lock.json'

default_source :supermarket

run_list 'chrony::client'

default['chrony']['servers'] = ['10.0.0.1']
