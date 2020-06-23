name 'chef-server'

default_source :supermarket

cookbook 'managed_chef_server', path: '/Users/mattray/ws/cookbooks/managed_chef_server'
cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'
cookbook 'timesyncd', path: '/Users/mattray/ws/cookbooks/timesyncd'

run_list 'mattray', 'mattray::effortless-audit', 'chef-client::config', 'apt::cacher-client', 'timesyncd', 'mattray::macbookpro', 'openssh', 'chef_client_updater', 'leds_handler', 'managed_chef_server', 'managed_chef_server::managed_organization', 'managed_chef_server::policyfile_loader', 'starship'
named_run_list :policies, 'managed_chef_server::policyfile_loader'

default['chef_client']['config']['chef_license'] = 'accept'
default['chef_client']['config']['data_collector.server_url'] = 'https://roberto.bottlebru.sh/data-collector/v0/'
default['chef_client']['config']['data_collector.token'] = 'mZ7HwczDoFkIljIQvhFiE22YRO4='

default['apt']['cacher_client']['cacher_server']['host'] = 'cubert'
default['apt']['cacher_client']['cacher_server']['port'] = 3142
default['apt']['cacher_client']['cacher_server']['proxy_ssl'] = true

default['timesyncd']['NTP'] = ['10.0.0.1']

# Chef Server settings
default['chef-server']['accept_license'] = true
default['chef-server']['package_source'] = '/root/chef-server-core_13.1.13-1_amd64.deb'
default['chef-workstation']['package_source'] = '/root/chef-workstation_0.17.5-1_amd64.deb'
default['mcs']['data_collector']['proxy'] = true
default['mcs']['data_collector']['root_url'] = 'https://roberto.bottlebru.sh/data-collector/v0/'
default['mcs']['data_collector']['token'] = 'mZ7HwczDoFkIljIQvhFiE22YRO4='
default['mcs']['managed_user']['email'] = 'matt@chef.io'
default['mcs']['policyfile']['dir'] = '/var/chef/policyfiles/'
default['mcs']['policyfile']['group'] = 'ndnd-home'
#default['mcs']['profiles']['root_url'] = 'https://roberto.bottlebru.sh'
default['mcs']['skip_test'] = true

default['starship']['user']['mattray']['shell'] = 'bash'
default['starship']['user']['mattray']['config'] = {
  "add_newline"=>false,
  "character"=>{"symbol"=>"$", "use_symbol_for_status"=>true, "error_symbol"=>"✗$", "style_success"=>"green", "style_failure"=>"red"},
  "aws"=>{"disabled"=>true},
  "cmd_duration"=>{"style"=>"cyan", "min_time"=>5000, "prefix"=>"time:"},
  "directory"=>{"style"=>"blue", "truncate_to_repo"=>false, "truncation_length"=>10, "prefix"=>"", "suffix"=>""},
  "git_branch"=>{"style"=>"green", "symbol"=>":", "prefix"=>"", "suffix"=>""},
  "git_status"=>
    {"style"=>"green", "ahead"=>"⇡", "behind"=>"⇣", "conflicted"=>"≠", "deleted"=>"✖", "diverged"=>"⇕", "modified"=>"Δ", "renamed"=>"»", "staged"=>"+", "stashed"=>"$", "untracked"=>"?", "show_sync_count"=>true},
  "hostname"=>{"style"=>"yellow", "ssh_only"=>false},
  "jobs"=>{"style"=>"black", "symbol"=>"✦", "threshold"=>1},
  "ruby"=>{"prefix"=>"", "suffix"=>"", "style"=>"red", "symbol"=>"ℜ:"},
  "terraform"=>{"prefix"=>"", "suffix"=>"", "style"=>"purple", "symbol"=>"Τ:"},
  "username"=>{"prefix"=>"", "suffix"=>"", "style_user"=>"white", "style_root"=>"red", "show_always"=>false, "disabled"=>false}
}
default['starship']['user']['root']['shell'] = 'bash'
default['starship']['user']['root']['config'] = {
  "add_newline"=>false,
  "character"=>{"symbol"=>"$", "use_symbol_for_status"=>true, "error_symbol"=>"✗$", "style_success"=>"green", "style_failure"=>"red"},
  "cmd_duration"=>{"style"=>"cyan", "min_time"=>5000, "prefix"=>"time:"},
  "directory"=>{"style"=>"blue", "truncate_to_repo"=>false, "truncation_length"=>10, "prefix"=>"", "suffix"=>""},
  "hostname"=>{"style"=>"yellow", "ssh_only"=>false},
  "jobs"=>{"style"=>"black", "symbol"=>"✦", "threshold"=>1},
  "username"=>{"prefix"=>"", "suffix"=>"", "style_user"=>"white", "style_root"=>"red", "show_always"=>true, "disabled"=>false}
}
