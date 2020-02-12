name 'rpi'

default_source :supermarket
cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'leds_handler::default', 'mattray::raspberrypi'

override['ohai']['disabled_plugins'] = [ 'dmi' ]
