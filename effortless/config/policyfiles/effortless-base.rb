name 'effortless-base'

default_source :supermarket

run_list 'systemd_timesyncd', 'starship'

default['systemd_timesyncd']['ntp'] = ['10.0.0.1']

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
