name 'beaglebone'

include_policy 'debian', path: './debian.lock.json'
include_policy 'rpi', path: './rpi.lock.json'

default_source :supermarket

run_list 'apt::cacher-client', 'mattray::beaglebone'
