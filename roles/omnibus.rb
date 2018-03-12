name "omnibus"
description "Omnibus builder"

override_attributes(
  "omnibus" => { "toolchain_version" => "source" }
)

run_list(
  "recipe[omnibus::default]"
)
