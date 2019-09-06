name 'x86'

include_policy 'base', path: './base.lock.json'

default_source :supermarket

run_list 'apt::cacher-client', 'chef_client_updater::default'
