name 'beaglebone'

include_policy 'base', path: './base.lock.json'

run_list 'mattray::beaglebone'

override['ohai']['disabled_plugins'] = [ 'dmi' ]
