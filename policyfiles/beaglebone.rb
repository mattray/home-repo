name 'beaglebone'

include_policy 'base', path: './base.lock.json'

cookbook 'mattray', path: '../cookbooks/mattray'

run_list 'mattray::beaglebone'
