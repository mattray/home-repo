name 'beaglebone'

include_policy 'base', path: './base.lock.json'

run_list 'mattray::beaglebone'

override['chef_client']['config']['minimal_ohai'] = true
override['ohai']['disabled_plugins'] = [ 'dmi' ]
