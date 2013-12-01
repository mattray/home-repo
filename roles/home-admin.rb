name "home-admin"
description "Default run_list for the Admin node"
run_list(
  "recipe[apt::cacher-ng]",
  "recipe[apt::cacher-client]",
  "recipe[ntp]",
  "recipe[openssh]",
  "recipe[users::sysadmins]",
  "recipe[sudo]",
  "recipe[chef-client::config]",
  "recipe[chef-client::service]",
  "recipe[pxe_dust::server]"
  )
