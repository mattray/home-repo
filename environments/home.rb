name "home"
description "Home infrastructure."

override_attributes(
  "authorization" => {
    "sudo" => {
      "groups" => ["sudo"],
      "users" => ["mattray"],
      "passwordless" => true,
      "include_sudoers_d" => true
    }
  },
  'chef_client' => {
    'config' => {
      'interval' => 900,
      'http_retry_delay' => 10,
      'log_level' => ':warn'
    }
  },
  "ntp" => {
    "servers" => ["0.au.pool.ntp.org",
      "1.au.pool.ntp.org",
      "2.au.pool.ntp.org",
      "3.au.pool.ntp.org"],
    "sync_hw_clock" => true
  }
)
