set -e
rm -rf ~/.chefdk/cache *json *tgz

# ndnd runs against Hosted Chef
(chef install chef-server.rb; chef push home chef-server.lock.json) &

# don't upload these
chef install base.rb
chef install debian.rb
chef install rpi.rb
chef install x86.rb
chef install automate.rb
chef install raspbian.rb
chef install centos.rb
chef install beaglebone.rb

# crushinator
chef export x86.lock.json --archive .

# inez
chef export automate.lock.json --archive .

# guenter, hyperchicken, wernstrom
chef export raspbian.lock.json --archive .

# banjo
chef export centos.lock.json --archive .

# # cubert
chef export beaglebone.lock.json --archive .

rm -f base.lock.json chef-server.lock.json debian.lock.json rpi.lock.json
scp *tgz ndnd:/var/chef/policyfiles/ &
scp *lock.json ndnd:/var/chef/policyfiles/ &
