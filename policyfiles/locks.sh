set -e
rm -rf ~/.chefdk/cache
rm -rf *json
chef install rpi.rb
chef push home rpi.lock.json
chef install base.rb
chef push home base.lock.json
chef install centos.rb
chef push home centos.lock.json
chef install debian.rb
chef push home debian.lock.json
chef install beaglebone.rb
chef push home beaglebone.lock.json
chef install raspbian.rb
chef push home raspbian.lock.json
chef install x86.rb
chef push home x86.lock.json
chef install automate.rb
chef push home automate.lock.json
chef install automate-migrate.rb
chef push home automate-migrate.lock.json

# chef install macos.rb
# chef push home macos.lock.json
# chef install windows.rb
# chef push home windows.lock.json
