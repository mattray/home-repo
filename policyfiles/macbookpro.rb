name 'macbookpro'

include_policy 'base', path: './base.lock.json'

run_list 'mattray::macbookpro', 'chef_client_updater::default'

default_source :supermarket
