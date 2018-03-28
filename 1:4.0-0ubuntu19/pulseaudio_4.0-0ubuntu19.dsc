-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-droid, pulseaudio-module-droid-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 1:4.0-0ubuntu19
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
 1fa96ed40098072efd4a0928a5ca6f8fc0067752 94860 pulseaudio_4.0-0ubuntu19.debian.tar.xz
Checksums-Sha256:
 35ceb36bb1822fe54f0b5e4863b4f486769fdfb8ff2111f01fd8778928f9cdae 1392072 pulseaudio_4.0.orig.tar.xz
 f8300489cf465d26ce49cbd8aed5bad4172038c24739937fafee4fa0b2cde4dc 94860 pulseaudio_4.0-0ubuntu19.debian.tar.xz
Files:
 591f211db2790a7e4d222f2dc6858db3 1392072 pulseaudio_4.0.orig.tar.xz
 34de59a185964f8ac61ff67b4dd6c316 94860 pulseaudio_4.0-0ubuntu19.debian.tar.xz
Debian-Vcs-Browser: http://git.debian.org/?p=pkg-pulseaudio/pulseaudio.git
Debian-Vcs-Git: git://git.debian.org/git/pkg-pulseaudio/pulseaudio.git
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT9OXHAAoJEHNgbJmxYiOjNC0QAIGbZsl/dj5ZDY1liksK2OX7
nO4T3UcmLh+Gs0HpJOlR/XM62ahtPE8I06p0cRSKFMxqY+NEQRgVZ7mIHwlOtMPb
8eyUKPqHN1X5d5epTskPLlq3Et0DYLj0s39vhZrNWHk+Mx5HvT2DzBrJy0qLwwBd
neuYfRk+l+j1G1P4O+2aDUJTOFle1NaHblrIiIXehch/crfgiowflXtOQMFwkTYb
XR7JjTW3HPZbQ7oMFpRljSAjmTtk5g8LLCJQgLS0PD5EEXdmdQepDwGcIgXPKruK
0avLlaeaakMnbNmS1HhZMC01BYJ8phu42ONsErih0CFT/pwxDlYescieiqIWgbjZ
Pc0SVWB1pfF08hoGKC9QTqab3cswU31li4/BjkoVhAbUbPjBdjgdr52TBvcyD+aX
oSufewRgX1N3YOZ2PA4bo3e1LRVjHpsvVY3wXkCFjDN5j7tjosz2jKUK9DB+Fkny
AYnb9eQmoeWOq1c75a9CD0BsOUVj4VpfJ590eZaNpNY/9w7BjuF2n0+pu/gjbXMb
nuRDepU47zNFHQvMPSz30CzyobipicCz2SuMeNbOE1Yy+A+op4D+ns6QrCpNLVVA
xvVWj39svdhz8iLG+xmXvQfJsgXyPb76BQWMlTEGI3fjBI1EDkxzFArU9HMP/kgj
20sYyVjN6I8gVinPxnOI
=FS8/
-----END PGP SIGNATURE-----
