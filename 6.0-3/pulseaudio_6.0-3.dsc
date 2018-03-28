-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 6.0-3
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 3607d523fb270d9b68463de30f5d9e17957f1088 1469248 pulseaudio_6.0.orig.tar.xz
 38b18619ee50025dd237e76e4dc274f7717c8c2e 31076 pulseaudio_6.0-3.debian.tar.xz
Checksums-Sha256:
 b50640e0b80b1607600accfad2e45aabb79d379bf6354c9671efa2065477f6f6 1469248 pulseaudio_6.0.orig.tar.xz
 b4837989fbcc338970da26e0a190626514f3a9a02f2e7a45199fb4ae06328324 31076 pulseaudio_6.0-3.debian.tar.xz
Files:
 b691e83b7434c678dffacfa3a027750e 1469248 pulseaudio_6.0.orig.tar.xz
 8923aff66e326400cabcf374b6796d83 31076 pulseaudio_6.0-3.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJVvARSAAoJEKO6uuJAjdbP75UP+gPaK+ipXHfSi4SodOPBQobn
KdRUdonOhGA65/t6wlwYAe3V4NQJxtoJ+sZX6bkkJCmHaKAi7UxfCDBiGbDd/9m9
n4wHNH6gRIhDtcRyZ0aBHjNwYyVLnsFwtAPdeX+ideOAxN71K5YXmRfivJbUvHVd
3+xLk/w3hVML6Oyzg+BIDTVyh0dc1ZnWzxhnqAqm7b3cBRs0ajXmMBmphxVA98zB
0q4UR6N/MrkTGW0Em5lM9IrJ7wZEO3zn7dzgD3/+WG8398AUG9oGk9y3ZEKRPNoV
hwx90zNuHUrGwZTsmosbKXqS7N9gJ96vE530Q+Y8W1Ne5E8A0H1shq6CAQC4ec1z
HJ4gOvwg5Kd90nAwoI+B4Fhe5BMTzD+aGlItwAM4P2pvR/eMYZZbe1wHcQzM43zy
Pmla+oTLXZBp2HUF4btfZ6JebY3iAShQlxFiTZmtRQd0DSSrHXsza5CMskUZiHMT
c9kj60akCk75EOQUGnIFgQho7dOgcPvoJUz7aZC9rAQUCq2+82LZkovNkj2yuTOR
juB/G2EcE0Vwv2RkrrFV2wWf1jZAaYCfNcrlFw9+ioMQL/onwUe8KVmM7cFdNt30
DGp5DSWaImaFcHl6pRhnECjVlFbfwMllWAHzCGkGxQP1ttSwAWlmTVkd3R74fP9Y
Wm3y5SqPSEnBDXkNysoo
=4mkX
-----END PGP SIGNATURE-----
