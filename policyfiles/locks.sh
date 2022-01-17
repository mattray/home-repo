#!/usr/bin/env bash

# rebuilds policyfiles and distributes archives

set -xeuo pipefail #echo on, stop on failures

rm -rf ./*json ./*tgz

# all running against Hosted Chef
# (chef install chef-server.rb; chef push home chef-server.lock.json) &

# # banjo
# (chef install centos.rb; chef push home centos.lock.json) &

# wernstrom,  mom, walt, larry, igner, nixon, umbriel
(chef install base.rb; chef push home base.lock.json)

# cubert
(chef install beaglebone.rb; chef push home beaglebone.lock.json) &

# morbo
(chef install workstation.rb; chef push home workstation.lock.json) &

wait

rm -f *.lock.json

wait

terminal-notifier -title CHEF -message "Policies Uploaded" >> /dev/null
