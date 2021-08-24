name 'chef-server'

# include_policy 'effortless', path: './effortless.lock.json'

default_source :supermarket

cookbook 'managed_chef_server', path: '/Users/mattray/ws/cookbooks/managed_chef_server'
cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'
cookbook 'starship', path: '/Users/mattray/ws/cookbooks/starship'
cookbook 'systemd_timesyncd', path: '/Users/mattray/ws/cookbooks/systemd_timesyncd'

#run_list 'mattray', 'apt::cacher-client', 'mattray::macbookpro', 'chef-client::config', 'chef_client_updater', 'openssh', 'systemd_timesyncd', 'audit', 'managed_chef_server', 'managed_chef_server::managed_organization', 'managed_chef_server::policyfile_loader', 'managed_chef_server::backup', 'managed_chef_server::upgrade', 'starship', 'leds_handler'
#run_list 'mattray', 'apt::cacher-client', 'mattray::macbookpro', 'chef-client::config', 'chef_client_updater', 'openssh', 'systemd_timesyncd', 'managed_chef_server', 'managed_chef_server::managed_organization', 'managed_chef_server::policyfile_loader', 'managed_chef_server::backup', 'managed_chef_server::upgrade', 'starship', 'leds_handler'

run_list 'mattray', 'apt::cacher-client', 'mattray::macbookpro', 'chef-client::config', 'openssh', 'systemd_timesyncd', 'starship', 'leds_handler'

named_run_list :policies, 'managed_chef_server::policyfile_loader'

default['chef_client']['config']['chef_license'] = 'accept'
# default['chef_client']['config']['data_collector.server_url'] = 'https://roberto.bottlebru.sh/data-collector/v0/'
# default['chef_client']['config']['data_collector.token'] = 'Xpl2nlK0wu_SjuIHiwT5dZ5kSus='

default['apt']['cacher_client']['cacher_server']['host'] = 'cubert'
default['apt']['cacher_client']['cacher_server']['port'] = 3142
default['apt']['cacher_client']['cacher_server']['proxy_ssl'] = true

# default['audit']['reporter'] = 'chef-server-automate'
# default['audit']['fetcher'] = 'chef-server'
# default['audit']['interval']['enabled'] = true
# default['audit']['interval']['time'] = 25 # 48 times a day
# default['audit']['profiles']['linux-patch-baseline']['url'] = 'https://github.com/dev-sec/linux-patch-baseline'
# default['audit']['profiles']['uptime']['url'] = 'https://github.com/mattray/uptime-profile'
# default['audit']['profiles']['chef_software']['url'] = 'https://github.com/mattray/chef_software-profile/archive/main.tar.gz'

default['systemd_timesyncd']['ntp'] = ['10.0.0.1']

# Chef Server settings
# default['chef-server']['accept_license'] = true
# default['chef-server']['package_source'] = '/root/chef-server-core_13.2.0-1_amd64.deb'
# default['mcs']['upgrade']['package_source'] = '/root/chef-server-core_14.3.14-1_amd64.deb'
#default['chef-workstation']['package_source'] = '/root/chef-workstation_0.17.5-1_amd64.deb'
# default['mcs']['data_collector']['proxy'] = true
# default['mcs']['data_collector']['root_url'] = 'https://roberto.bottlebru.sh/data-collector/v0/'
# default['mcs']['data_collector']['token'] = 'Xpl2nlK0wu_SjuIHiwT5dZ5kSus='
default['mcs']['managed_user']['email'] = 'matt@chef.io'
default['mcs']['policyfile']['dir'] = '/var/chef/policyfiles/'
default['mcs']['policyfile']['group'] = 'ndnd-home'
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
