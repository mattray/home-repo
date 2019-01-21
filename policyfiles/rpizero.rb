name 'rpizero'

include_policy 'base', path: './base.lock.json'

run_list 'mattray::raspberrypi'

override['ohai']['disabled_plugins'] = [ ':dmi' ]
