-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-module-x11, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 7.99.1-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-x11 deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 e5ad51227c4833e7c1955683fd4cf9ec7f4bf8df 1515824 pulseaudio_7.99.1.orig.tar.xz
 55ce07ba111d3121efebd626b9c3bc5ecea09306 30580 pulseaudio_7.99.1-1.debian.tar.xz
Checksums-Sha256:
 a82ac3702a4a0432dd3849af9198af0c981be856c3b6f36767266e33fc14e464 1515824 pulseaudio_7.99.1.orig.tar.xz
 78e63bd6da6f4d6a1850fcd0bf415c83e7579fbe5d7fae8cdf49a09a680f1dfa 30580 pulseaudio_7.99.1-1.debian.tar.xz
Files:
 257bf53e4cb00227d7d1abb964655c7c 1515824 pulseaudio_7.99.1.orig.tar.xz
 1bf3743bbba29112e3e6afbde610a356 30580 pulseaudio_7.99.1-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJWgcq3AAoJEKO6uuJAjdbPtFcP/1dvv6JNQiUdaTY6P+LUNRpp
xJtb57XtEqu62ds0GQEl9FXy/IKqtVfLjC34hpPAlpS9j/nYdUJuljIpEswEkvy9
Hgyf75jFvI7vOHfjgs48LveaBHohtXodVecmcNW3DCs0gCgB2MJWgNjK3wYQHNMh
X3NZJJkcCIHHb12aCmeW/ic0hw8oBNB64l8HcZOORzepMQhUZqNBMB9kyDi3Mb5m
+TBSX8KUM6fL1F7TQBo4ovgmtKlj9lkYA9FVvSgzlL0MIZu4N1iPmZ5Rq/CX3N1O
4IyjfsBnY8xE0SHuPshtMuh5+yKvQrojycND+foEkCQZIaeveCvxOEpMUQ/F7pVL
6/F18IRdg1u1naOzvZhS8B0d4txa7zMm0eOxWmRWjxw2/dRi2zj3/LWf3/N9gOKR
P3hIBnYBpUU6Q5KPHFBx89uI0ZNVgtgg3Su6vIdVUOvhjbFWk1lsj8yxrVb1+9i4
TBKnnTSfgaqNnAD3CjVQADFycNU4FEg8U956g8dgxqiqB8zzMvRajPxZ2u/V7INK
RR9AQA0WnKi99RGvmfbxcGRtzCqdQUYXrh/36XuiKOFhJARvdvLRrML46n6qSybY
ElwUOlDQTHxgT1EfyBtduiplsnFmSBKKnvkrSLLTofhp1s3d1XCYCuEAqWx9+3ux
7ZRUVEIu4UJrHjcwMxSC
=LgWQ
-----END PGP SIGNATURE-----
