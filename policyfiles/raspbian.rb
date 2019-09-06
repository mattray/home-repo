name 'raspbian'

include_policy 'rpi', path: './rpi.lock.json'

default_source :supermarket

run_list 'apt::cacher-client'
