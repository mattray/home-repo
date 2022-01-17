name 'beaglebone'

include_policy 'base', path: './base.lock.json'

default_source :supermarket

run_list 'apt::cacher-ng'

override['apt']['cacher_dir'] = '/emmc'
