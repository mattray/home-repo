name 'x86'

include_policy 'debian', path: './debian.lock.json'

default_source :supermarket

run_list 'audit_time_window', 'chef_client_updater::default', 'leds_handler::default'

default['audit_time_window']['profiles']['linux-baseline']['url'] = 'https://github.com/dev-sec/linux-baseline'
default['audit_time_window']['profiles']['linux-baseline']['start'] = ['0300', '1500']
default['audit_time_window']['profiles']['linux-baseline']['end'] = ['0330', '1530']
