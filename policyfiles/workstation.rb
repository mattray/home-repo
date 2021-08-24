name 'workstation'

default_source :supermarket

cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'
cookbook 'starship', path: '/Users/mattray/ws/cookbooks/starship'
cookbook 'systemd_timesyncd', path: '/Users/mattray/ws/cookbooks/systemd_timesyncd'

run_list 'mattray', 'chef-client::config', 'openssh', 'systemd_timesyncd', 'starship'

default['systemd_timesyncd']['ntp'] = ['10.0.0.1']
