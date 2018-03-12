name 'macbookpro'

default_source :supermarket

include_policy 'base', path: './base.lock.json'

cookbook 'mattray', path: '../cookbooks/mattray'

run_list 'mattray::macbookpro', 'chef_client_updater'
