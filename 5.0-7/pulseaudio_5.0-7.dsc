-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 5.0-7
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.5
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson0-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-login-dev [linux-any], libsystemd-journal-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 e420931a0b9cf37331cd06e30ba415046317ab85 1455428 pulseaudio_5.0.orig.tar.xz
 71ff914de63be27bdd2ca32cd2bd01aedfa30a4b 34200 pulseaudio_5.0-7.debian.tar.xz
Checksums-Sha256:
 99c13a8b1249ddbd724f195579df79484e9af6418cecf6a15f003a7f36caf939 1455428 pulseaudio_5.0.orig.tar.xz
 6a210a120d4acfa1d901e515697fe41593fff93a800d64d2560a701fb20b8c97 34200 pulseaudio_5.0-7.debian.tar.xz
Files:
 c43749838612f4860465e83ed62ca38e 1455428 pulseaudio_5.0.orig.tar.xz
 aa3b3b1449ab6a72f079a54d25367b0d 34200 pulseaudio_5.0-7.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJT4O2zAAoJEKO6uuJAjdbPWtYP/0Pq4BrML0vHOmXWIi1/LoIt
HQu/H3klWXIcnNE8wsoyA9rJWNJ2yTEwUYAORtl2sCKZPDPhZH9y6ePYnWaXQdd4
4yyWzxR0m9k96GYhaL2d8x+9BJcf9wAcD7IxozlF9tQTQ8sAK4LGUxG1HZ8rES2/
POtJehAmGYBQ+/3ep8gStR/8W90RVK1zEDJHG+Z53tReCedmpAYtFexTfdI/LGzU
iJVtsouT4/tOCRA2KLv2/HLN+95RcLNo8XKFK3C2EUCkHOnFI91oa4BrbDhLf8JJ
YDywdjLNSs3b72Sr555IYA8PlJ5krdkXvIG1lXHCl2m5yMxqGtIXJ52SNYn7uCzh
m78GFuTzk3cj7uN1vOmsVLjOO9wFtNiEizoT+Y6shiBP1+DswG2L5GAsyh3dRhm7
JEizBYf63uOS9QMA1Ib6Vag2QBYFHifko1qOgsG4o4wSCEui0ee9sCqSPv1kYxQr
fixGZA2XQygJrksI4+uM5tGwm5tRv2xirl6xXCjcxYYypi9U8MLqs+QdJz6TetL/
xUGsA9Hr7lw6wvxEFb5w/+LbTq5udBc9Hm5Pkd0CGBeTZe8BWrouQ2EKwa1wZhOz
v3K9rsLQWFsZGwdpdwJ4fKJ95oPlQUyn1aO14u2TSwvyPKJ7XVcPUp4rKtyKl4Ei
+wJEAdSrb7ftwByRi7Gk
=NWkd
-----END PGP SIGNATURE-----
