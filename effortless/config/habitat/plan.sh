pkg_name=effortless-config-base
pkg_origin=mattray
pkg_version=0.1.2
pkg_maintainer="Matt Ray"
pkg_license=("Apache-2.0")
pkg_scaffolding="mattray/scaffolding-chef-infra"
pkg_svc_user=("root")
scaffold_policy_name="effortless-base"

#######################################
# Optional settings
#######################################

# You don't usually need to change these.
# This project provides highly tuned defaults for you.
# If you don't have a strong reason for overriding these
# Then it's a good idea to remove them.

# scaffold_policyfile_path="$PLAN_CONTEXT"
# allows you to use a policyfile in any location in your repo

# scaffold_chef_client="chef/chef-client"
# allows you to hard-pin to a version of the chef-infra-client

# scaffold_data_bags_path="$PLAN_CONTEXT/../data_bags"
# allows you to build data bags into the package

# scaffold_cacerts="origin/cacerts"
# allows you to specify a custom cacert package
