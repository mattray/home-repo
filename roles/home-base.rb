name "home-base"
description "Default run_list for Matts machines"
run_list(
  "recipe[chef-client::config]",
  "recipe[chef-client::service]",
  "recipe[chef-client::delete_validation]",
  "recipe[ntp]",
  "recipe[openssh]",
  "recipe[sudo]",
  "recipe[mattray]"
)
