name 'beaglebone'

include_policy 'base', policy_group: 'home', server: "https://api.chef.io/organizations/matt"

cookbook 'mattray', git: 'https://github.com/mattray/mattray-cookbook.git'

run_list 'mattray::beaglebone'
