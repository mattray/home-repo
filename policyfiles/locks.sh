set -e
rm -rf ~/.chefdk/cache
rm -rf *json
chef install base.rb
# chef push home base.lock.json
chef install debian.rb
# chef push home debian.lock.json
chef install rpi.rb
# chef push home rpi.lock.json

# crushinator
chef install x86.rb
chef push home x86.lock.json
# ndnd
chef install chef-server.rb
chef push home chef-server.lock.json
# inez
chef install automate.rb
chef push home automate.lock.json
# guenter, hyperchicken, wernstrom
chef install raspbian.rb
chef push home raspbian.lock.json
# banjo
chef install centos.rb
chef push home centos.lock.json
# # cubert
chef install beaglebone.rb
chef push home beaglebone.lock.json
