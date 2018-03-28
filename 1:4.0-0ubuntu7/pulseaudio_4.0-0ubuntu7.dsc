-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 1:4.0-0ubuntu7
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
 157f4e2e2bccbbc317e557b9a8551b38050ee316 70364 pulseaudio_4.0-0ubuntu7.debian.tar.xz
Checksums-Sha256: 
 35ceb36bb1822fe54f0b5e4863b4f486769fdfb8ff2111f01fd8778928f9cdae 1392072 pulseaudio_4.0.orig.tar.xz
 f99dc07c7f3c14f3fec1e097cc1e0a7d9c746cc20218d1e7292afc1510470cd4 70364 pulseaudio_4.0-0ubuntu7.debian.tar.xz
Files: 
 591f211db2790a7e4d222f2dc6858db3 1392072 pulseaudio_4.0.orig.tar.xz
 59ac0f442bb3acee55d60dd92c8b2521 70364 pulseaudio_4.0-0ubuntu7.debian.tar.xz
Debian-Vcs-Browser: http://git.debian.org/?p=pkg-pulseaudio/pulseaudio.git
Debian-Vcs-Git: git://git.debian.org/git/pkg-pulseaudio/pulseaudio.git
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Testsuite: autopkgtest

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSs+rdAAoJEHNgbJmxYiOj8o8QAKzO2fgzq8KL3dCBQPXb5RBQ
4nCTFkwDz1n4yCnRbBP7BBugK00+hjjpKuueT9IBAwFS3xWscaSTPanmNkHWr3dd
6SpYWZNIeSfSMAfCd8KeV3ANcHyKiuYRKV1XG8oNkAfvNFiaWUTCL4vxdLHa5dp4
tUdWcxO9mP8MELXbv2zvA9Yl5FV8Jq6sA5xmQgDYuCr/tx0Coyyaa/W5mGWH4+ss
SGSySEEWH9XMqjkDmRgU5OtyNp7DIUFhdIQ1fvoeptb2CMrXjNcjFu1I2ayu2t3p
SL7wNVlxbQGcn8Jtoaj8nWD641TyiWsDPSM3RaHT1EZ1CXtjbeC7sLL3Mc4bkzRV
HKFE3iLUcYJ9S8EG9fRGBsAY4cFuO0l1xltCQOkgq6rowY8ohfEPi3QA8i6gvfXw
R0lnf7ZPX+W3v0TXwK2+DJ4inZFvwu1aMF07b3L1Lqj34ewmsFpZrBPDPsjchItS
k14QX/dNLZbXvS+aKpJYz5jkntbM6a6k/+nxgAMbikDfJ3IomE3zMjvkNHM6ta3M
aJVcKHevhGYC2MKUlo3vSKzEAOZ/js7Aq30f/6pgudS108HnLEWmm4ZPecBoEUGd
jqTg4wMRDzMh6/rdnOyzuVdXaPlDiQXAunjY0YFLuwIYBLf0SNNwFgK4Kz4ikGbF
7kKhI5q7rAMg/GTfU3pc
=Gpre
-----END PGP SIGNATURE-----
