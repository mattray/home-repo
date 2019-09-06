name 'rpi'

include_policy 'base', path: './base.lock.json'

default_source :supermarket

run_list 'mattray::raspberrypi'

override['ohai']['disabled_plugins'] = [ 'dmi' ]
