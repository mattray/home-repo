name 'beaglebone'

include_policy 'base', path: './base.lock.json'

default_source :supermarket

cookbook 'leds_handler', git: 'https://github.com/mattray/leds_handler-cookbook.git'

run_list 'leds_handler::default', 'apt::cacher-ng', 'apt::cacher-client', 'mattray::beaglebone'

override['ohai']['disabled_plugins'] = [ 'dmi' ]
override['apt']['cacher_dir'] = '/emmc'
