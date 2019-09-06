name 'beaglebone'

include_policy 'base', path: './base.lock.json'

default_source :supermarket

run_list 'apt::cacher-ng', 'apt::cacher-client', 'mattray::beaglebone'

override['ohai']['disabled_plugins'] = [ 'dmi' ]
override['apt']['cacher_dir'] = '/emmc'
