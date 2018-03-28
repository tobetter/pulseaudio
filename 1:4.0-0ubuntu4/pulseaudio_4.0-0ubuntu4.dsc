-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 1:4.0-0ubuntu4
Maintainer: Ubuntu Core Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Martin-Éric Racine <martin-eric.racine@iki.fi>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.8.1
Vcs-Bzr: http://bazaar.launchpad.net/~ubuntu-audio-dev/pulseaudio/ubuntu
Build-Depends: debhelper (>= 8.1.3), cdbs (>= 0.4.93), dh-autoreconf, dh-translations, intltool, libasound2-dev (>= 1.0.19) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.40) [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk2.0-dev, libhardware-dev [armhf], libice-dev, libjack-dev (>= 0.117.0), libjson0-dev, liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsbc-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libtdb-dev, libudev-dev (>= 143) [linux-any], libsystemd-daemon-dev [linux-any], libsystemd-login-dev [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List: 
 libpulse-dev deb libdevel optional
 libpulse-mainloop-glib0 deb sound optional
 libpulse-mainloop-glib0-dbg deb debug extra
 libpulse0 deb libs optional
 libpulse0-dbg deb debug extra
 libpulsedsp deb sound optional
 libpulsedsp-dbg deb debug extra
 pulseaudio deb sound optional
 pulseaudio-dbg deb debug extra
 pulseaudio-esound-compat deb sound optional
 pulseaudio-esound-compat-dbg deb debug extra
 pulseaudio-module-bluetooth deb sound extra
 pulseaudio-module-bluetooth-dbg deb debug extra
 pulseaudio-module-gconf deb sound optional
 pulseaudio-module-gconf-dbg deb debug extra
 pulseaudio-module-jack deb sound optional
 pulseaudio-module-jack-dbg deb debug extra
 pulseaudio-module-lirc deb sound optional
 pulseaudio-module-lirc-dbg deb debug extra
 pulseaudio-module-raop deb sound optional
 pulseaudio-module-raop-dbg deb debug extra
 pulseaudio-module-x11 deb sound optional
 pulseaudio-module-x11-dbg deb debug extra
 pulseaudio-module-zeroconf deb sound optional
 pulseaudio-module-zeroconf-dbg deb debug extra
 pulseaudio-utils deb sound optional
 pulseaudio-utils-dbg deb debug extra
Checksums-Sha1: 
 9f0769dcb25318ba3faaa453fd2ed0c509fa9c5c 1392072 pulseaudio_4.0.orig.tar.xz
 c2cbfd6029d827a67f60d9a276c7327f01d04a0a 68596 pulseaudio_4.0-0ubuntu4.debian.tar.xz
Checksums-Sha256: 
 35ceb36bb1822fe54f0b5e4863b4f486769fdfb8ff2111f01fd8778928f9cdae 1392072 pulseaudio_4.0.orig.tar.xz
 c7a0dba74e812aa17e10913315db1da9c429d0feccbf9624a2289b751ebc6729 68596 pulseaudio_4.0-0ubuntu4.debian.tar.xz
Files: 
 591f211db2790a7e4d222f2dc6858db3 1392072 pulseaudio_4.0.orig.tar.xz
 7d20dc74d8c375855d4e27c8e790274d 68596 pulseaudio_4.0-0ubuntu4.debian.tar.xz
Debian-Vcs-Browser: http://git.debian.org/?p=pkg-pulseaudio/pulseaudio.git
Debian-Vcs-Git: git://git.debian.org/git/pkg-pulseaudio/pulseaudio.git
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Testsuite: autopkgtest

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJSQvxIAAoJEHNgbJmxYiOjiz4P/1WfQ8uJtoudCe/YM1ScdaZG
rcn5af509EICeYVLXfFvIs+zD5SQd4Z/8k78/pvUaUHHBJlIEAEYeIgksBI6cbQS
EGHVWexxaq8LS6Ofsd2m+WUIlwkCAKwXzoj0KKZmo7qZHet7VrXImv4xUoE1R4HT
IosmeaG1+tbyYTcXdoD73MiJ4nduqC9o1TG90CiH+I3gTa9qJ8dGCvBcV0KTQ/4a
qh4k81DnvvPvCK3sP4uZA0IAgqFbK1JJxW5wD7cKdm29u0e9wvhKKgsxgLe6IKnA
TTnHU9kKAhCuAsLx0qjZOm5qMkhDXJkoShf5TpJnpaADLN4ZPmV+2TOEQa9Zzxc5
o7bKEWMtNJAYFilr+//w2zkxc/kkBp7XN6OZQH4iWZGZklPQRpAxkLRB8nEpHpp7
RJUZM5UF2svvWl1fRSFWK+UmioWQbNts4I3sqoMjX4TXiykadDTeEKVj/nUwXJwL
S2kXNRvdvpnuK1tFkJm47n7sb611cI5cjjZqLqTo72OphPsoYtWMkv4nmi6k8PYB
lOdPITKBTHm8WOTItyxW6dsknQww4EVbjPwf9jo7R5fKKv0Cj41LQ2tEhWnCkDg1
EMqka1TTtYlg7SNt46iq+duzVx0b8uwTPdPRuBJENZIxtPjKTPqrxB+6DD7dQoSF
9IchlGXogl3VOY33CELE
=byjW
-----END PGP SIGNATURE-----
