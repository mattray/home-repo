name 'beaglebone'

default_source :supermarket

run_list 'apt::cacher-ng', 'apt::cacher-client', 'mattray::beaglebone'

include_policy 'rpi', path: './rpi.lock.json'
include_policy 'debian', path: './debian.lock.json'

override['ohai']['disabled_plugins'] = [ 'dmi' ]
override['apt']['cacher_dir'] = '/emmc'
