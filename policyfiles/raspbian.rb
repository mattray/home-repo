name 'raspbian'

include_policy 'debian', path: './debian.lock.json'
include_policy 'rpi', path: './rpi.lock.json'

default_source :supermarket
cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'mattray::raspberrypi'
