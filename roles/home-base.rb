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

override_attributes(
  "chef_client" => {
    "config" => {
      "verbose_logging" => true,
      "client_fork" => true
    }
  }
)
