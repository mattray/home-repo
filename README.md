Raspberry Pi devices are tagged with `rpi` and this is used in the `mattray` cookbook for additional hardware tuning.

Members of the cluster are tagged with `cluster` and hardware-specific recipes are accessed via tagging as well.

This is the repo for Matt's home machines. They are managed by Policyfiles, with the following tasks:

* cubert: beaglebone policyfile. BeagleBone Black, provides apt-cacher-ng service and [Chef/Cinc builder](https://mattray.github.io/arm) Arm7l builds, running Debian 11.
* igner, larry, mom, ndnd, nixon, walt, yancy: base policyfile with `cluster` tag. Debian 11
* umbriel: base policyfile. [FlightAware](https://flightaware.com/adsb/stats/user/MattRay). Raspberry Pi 3 running Raspbian 10
* wernstrom: base policyfile. [Chef/Cinc builder](https://mattray.github.io/arm). Raspberry Pi Zero W running Raspbian 10
