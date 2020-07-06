name 'centos'

default_source :supermarket

cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'audit', 'mattray', 'chef-client::config', 'openssh', 'ntp', 'mattray::raspberrypi', 'leds_handler'

default['audit']['reporter'] = 'chef-server-automate'
default['audit']['fetcher'] = 'chef-server'
default['audit']['interval']['enabled'] = true
default['audit']['interval']['time'] = 30 # 48 times a day
default['audit']['profiles']['linux-patch-baseline']['url'] = 'https://github.com/mattray/linux-patch-baseline/tree/debian_fix'
default['audit']['profiles']['uptime']['url'] = 'https://github.com/mattray/uptime-profile/'

default['chef_client']['config']['chef_license'] = 'accept'

default['ntp']['servers'] = ['10.0.0.1']

override['ohai']['disabled_plugins'] = [ 'dmi' ]
