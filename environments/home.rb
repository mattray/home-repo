name "home"
description "Home infrastructure."

override_attributes(
  "apt" => {
    "cacher-client" => {
      "restrict_environment" => true
    }
  },
  "authorization" => {
    "sudo" => {
      "groups" => ["admin", "wheel", "sysadmin"],
      "users" => ["mray"],
      "passwordless" => true,
      "include_sudoers_d" => true
    }
  },
  'chef_client' => {
    'config' => {
      'http_retry_delay' => 10,
      'log_level' => ':warn'
    }
  },
  'dnsmasq' => {
    'enable_dhcp' => true,
    'enable_dns' => false,
    'dhcp' => {
      'domain' => 'home.atx',
      'dhcp-boot' => 'pxelinux.0',
      'enable-tftp' => nil,
      'tftp-root' => '/var/lib/tftpboot',
      'tftp-secure' => nil
    }
  },
  "ntp" => {
    "sync_hw_clock" => true
  },
  "pxe_dust" => {
    "default" => {
      "domain" => "home.atx",
      "environment" => "home",
      "interfaces" => "\nauto eth0\niface eth0 inet dhcp\n"
    }
  }
  )

