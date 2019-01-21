name 'macbookpro'

include_policy 'base', path: './base.lock.json'

default_source :supermarket

run_list 'mattray::macbookpro'
