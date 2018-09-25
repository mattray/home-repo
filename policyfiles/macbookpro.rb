name 'macbookpro'

include_policy 'base', path: './base.lock.json'

default_source :supermarket

cookbook 'mattray', git: 'https://github.com/mattray/mattray-cookbook.git'

run_list 'mattray::macbookpro', 'chef_client_updater'
