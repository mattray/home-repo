name 'macbookpro'

default_source :supermarket

include_policy 'base', path: './base.lock.json'

cookbook 'mattray', git: 'https://github.com/mattray/mattray-cookbook.git'

run_list 'mattray::macbookpro', 'chef_client_updater'
