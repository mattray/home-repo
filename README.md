This is the repo for Matt's home machines. They are managed by Policyfiles, with the following tasks:

* banjo: centos policyfile. [Chef/Cinc builder](https://mattray.github.io/). Raspberry Pi 3 running CentOS 7
* crushinator: x86 policyfile, primarily a build/testing box. Debian 10
* cubert: beaglebone policyfile. BeagleBone Black running Debian 10
* guenter: raspbian policyfile. [FlightAware](https://flightaware.com/adsb/stats/user/MattRay). Raspberry Pi 3 running Raspbian 10
* hyperchicken: raspbian policyfile. [Chef/Cinc builder](https://mattray.github.io/). Raspberry Pi 4 running Raspbian 10
* inez: automate policyfile (not shared) that installs/upgrades Automate and uses the mattray::macbookair recipe. Debian 10
* ndnd: chef-server policyfile that installs/upgrades Chef Server, provides apt-cacher-ng service, uses the mattray::macbookpro recipe. Debian 10
* wernstrom: raspbian policyfile. [Chef/Cinc builder](https://mattray.github.io/). Raspberry Pi Zero W running Raspbian 10

# Migrating from Hosted Chef to internal Chef Infra Server on `ndnd`.
The `mattray::migrate` recipe handles most of the heavy lifting.
Bring over the ndnd SSL cert and the chef_managed_org-validator.pem
Move the client.pem out of the way
Change the /etc/chef/client.rb and it will fail the run, then succeed against the new host on the next run.
