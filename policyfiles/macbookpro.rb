name 'macbookpro'

include_policy 'x86', path: './x86.lock.json'

default_source :supermarket

cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'mattray::macbookpro'
