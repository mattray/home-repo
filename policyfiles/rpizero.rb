name 'rpizero'

include_policy 'base', path: './base.lock.json'

cookbook 'mattray', git: 'https://github.com/mattray/mattray-cookbook.git'

run_list 'mattray::raspberrypi'

override['ohai']['disabled_plugins'] = [ ':dmi' ]
