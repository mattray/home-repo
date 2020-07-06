name 'automate'

default_source :supermarket

cookbook 'managed_automate', path: '/Users/mattray/ws/cookbooks/managed_automate'
cookbook 'mattray', path: '/Users/mattray/ws/cookbooks/mattray'

run_list 'mattray', 'mattray::effortless-audit', 'chef-client::config', 'openssh', 'apt::cacher-client', 'systemd_timesyncd', 'mattray::macbookpro11', 'chef_client_updater', 'leds_handler', 'starship', 'managed_automate::upgrade', 'managed_automate::backup'

default['apt']['cacher_client']['cacher_server']['host'] = 'cubert'
default['apt']['cacher_client']['cacher_server']['port'] = 3142
default['apt']['cacher_client']['cacher_server']['proxy_ssl'] = true

default['chef_client']['config']['chef_license'] = 'accept'

default['systemd_timesyncd']['ntp'] = ['10.0.0.1']

default['ma']['chef-automate'] = '/root/chef-automate'
default['ma']['install']['file'] = '/home/mattray/automate-20200603114954.aib'
# default['ma']['restore']['file'] = '/root/automate-backup-20200612173001.tgz'
default['ma']['upgrade']['file'] = '/home/mattray/automate-20200617215626.aib'

default['ma']['backup']['export']['dir'] = '/storage/backups'
default['ma']['backup']['cron']['minute'] = '30'
default['ma']['backup']['cron']['hour'] = '3'
default['ma']['backup']['cron']['day'] = '*'

default['ma']['license']['file'] = '/root/a2.lic'

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
