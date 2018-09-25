name 'bt'

include_policy 'beaglebone', path: './beaglebone.lock.json'

cookbook 'transmission-debian', git: 'https://github.com/mattray/transmission-debian-cookbook.git'

run_list 'transmission-debian::default'

# override['transmission-debian']['torrents'] =
#     [ 'https://cdimage.debian.org/debian-cd/9.5.0/armhf/bt-cd/debian-9.5.0-armhf-netinst.iso.torrent' ]

override['transmission-debian']['loglevel'] = 'debug'
override['transmission-debian']['message-level'] = 3
