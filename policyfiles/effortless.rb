name 'effortless'

default_source :supermarket

cookbook 'effortless_migration', path: '/Users/mattray/ws/cookbooks/effortless_migration'
cookbook 'habitat', path: '/Users/mattray/ws/cookbooks/habitat'

run_list 'effortless_migration', 'effortless_migration::audit', 'effortless_migration::config'
named_run_list :effortless, 'effortless_migration::audit', 'effortless_migration::config'

# effortless migration
default['effortless']['hab-sup']['org'] = 'effortless'
default['effortless']['hab-sup']['auto_update'] = true
default['effortless']['hab-sup']['event_stream_url'] = 'roberto.bottlebru.sh:4222'
default['effortless']['hab-sup']['event_stream_token'] = 'mZ7HwczDoFkIljIQvhFiE22YRO4='
default['effortless']['hab-sup']['event_stream_cert'] = '/etc/chef/trusted_certs/roberto_bottlebru_sh.crt'
default['effortless']['hab-sup']['event_stream_application'] = 'effortless'
default['effortless']['hab-sup']['event_stream_environment'] = 'home-lab'
default['effortless']['hab-sup']['event_stream_site'] = 'home-site'
