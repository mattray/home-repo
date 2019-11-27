name 'rpi'

include_policy 'base', path: './base.lock.json'

default_source :supermarket

cookbook 'leds_handler', git: 'https://github.com/mattray/leds_handler-cookbook.git'

run_list 'leds_handler::default', 'mattray::raspberrypi'

override['ohai']['disabled_plugins'] = [ 'dmi' ]
