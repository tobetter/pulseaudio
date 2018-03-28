-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-droid, pulseaudio-module-droid-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 1:4.0-0ubuntu17
Maintainer: Ubuntu Core Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Martin-Éric Racine <martin-eric.racine@iki.fi>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.8.1
Vcs-Bzr: http://bazaar.launchpad.net/~ubuntu-audio-dev/pulseaudio/ubuntu
Testsuite: autopkgtest
Build-Depends: debhelper (>= 8.1.3), cdbs (>= 0.4.93), dh-autoreconf, dh-translations, intltool, libasound2-dev (>= 1.0.19) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.40) [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk2.0-dev, libhardware-dev [armhf i386 amd64], libice-dev, libjack-dev (>= 0.117.0), libjson0-dev, liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsbc-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libtdb-dev, libudev-dev (>= 143) [linux-any], libsystemd-daemon-dev [linux-any], libsystemd-login-dev [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse-mainloop-glib0-dbg deb debug extra arch=any
 libpulse0 deb libs optional arch=any
 libpulse0-dbg deb debug extra arch=any
 libpulsedsp deb sound optional arch=any
 libpulsedsp-dbg deb debug extra arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-dbg deb debug extra arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-esound-compat-dbg deb debug extra arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any
 pulseaudio-module-bluetooth-dbg deb debug extra arch=linux-any
 pulseaudio-module-droid deb sound extra arch=armhf,i386,amd64
 pulseaudio-module-droid-dbg deb debug extra arch=armhf,i386,amd64
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-gconf-dbg deb debug extra arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-jack-dbg deb debug extra arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-lirc-dbg deb debug extra arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-raop-dbg deb debug extra arch=any
 pulseaudio-module-x11 deb sound optional arch=any
 pulseaudio-module-x11-dbg deb debug extra arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-module-zeroconf-dbg deb debug extra arch=any
 pulseaudio-utils deb sound optional arch=any
 pulseaudio-utils-dbg deb debug extra arch=any
Checksums-Sha1:
 9f0769dcb25318ba3faaa453fd2ed0c509fa9c5c 1392072 pulseaudio_4.0.orig.tar.xz
 24bd57ea84f7db9b8167c3f6bf8d7d2482d70a05 93528 pulseaudio_4.0-0ubuntu17.debian.tar.xz
Checksums-Sha256:
 35ceb36bb1822fe54f0b5e4863b4f486769fdfb8ff2111f01fd8778928f9cdae 1392072 pulseaudio_4.0.orig.tar.xz
 80e03f9956c90593a08fb1ad2d921b94a5c9be1110c4eabdabe1d281b727566b 93528 pulseaudio_4.0-0ubuntu17.debian.tar.xz
Files:
 591f211db2790a7e4d222f2dc6858db3 1392072 pulseaudio_4.0.orig.tar.xz
 30825f7c0b071f5518daae15135b5b60 93528 pulseaudio_4.0-0ubuntu17.debian.tar.xz
Debian-Vcs-Browser: http://git.debian.org/?p=pkg-pulseaudio/pulseaudio.git
Debian-Vcs-Git: git://git.debian.org/git/pkg-pulseaudio/pulseaudio.git
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTzeQfAAoJEHNgbJmxYiOjfskP/jsWqTA+z2Y7f1zhZ+eaxP+N
VS70aBae0VSyWlN+gkgeBgS66LnjuaBOXJz2PFTCKbSBw+NZPNZNenulUizZFXy4
0Usm3/IWv2YeUSqfyM/8LLYFlGddxmdkpYQIipXbyyitQpAaiXSSbUC6zmzP8IR3
og39LK3iO6Nx41mG34/eqtNspdse5IluBqPtl4r85CBqk8r5Gxiu7nkQrtts0kL3
nd0iIcGehwuhjZ1jYuEkm2kYrlsvwyxnK6j483bcP62hPK6j3HSk55z8vwzKob82
C6nz4SnmxwCqNWMImfG6Mxt37evOBbcRb7WltpTuIlz4v/45SGnejiHX6saNvD3c
LrvpBeVAe4YSWXn0sZrTalEIlAUc5SFo7wTIk24akTNubQxaR9uAmd4xImc3lGqd
gUFxHKi2Zd7cW7kaghwvT0dc3dYl5dUFTGr+YI6fDhdNOSpk9LR6VAh1pwBpDvDu
207Ih7MfLSdJHbF65kXPcDEcu4cxCzqF23gAcdtXisT03/gZ8pRWenZPA26zB5wN
Z2fe9PKW5J2hV0I6qMC5VUIN/y1MuDSu4eeARgv+M5EX8nhWpU9CuHfHpbBmc+dx
4KfZOvDhJmQ9y4NzVsYtFyYHnQaHTTbcOTgHso1DyktnK9JFM7sIXWZt0wHUlpv5
w9/HBXAUVvOBAfcBgY3R
=jhTh
-----END PGP SIGNATURE-----
