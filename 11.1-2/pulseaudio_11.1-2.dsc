-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 11.1-2
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.0
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 10), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-equalizer deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any profile=!stage1
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 53bde72b6bfe715c19b1519db8845f7a58346b67 1648924 pulseaudio_11.1.orig.tar.xz
 796cbb756b257fa2b525f14177e266091919aecb 42508 pulseaudio_11.1-2.debian.tar.xz
Checksums-Sha256:
 f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e 1648924 pulseaudio_11.1.orig.tar.xz
 4e088a11ffeac6eefea6429de6aacfdff8a20a1e84258b6040af1604381953c4 42508 pulseaudio_11.1-2.debian.tar.xz
Files:
 390de38231d5cdd6b43ada8939eb74f1 1648924 pulseaudio_11.1.orig.tar.xz
 5c199813c884b332b346d578ce909392 42508 pulseaudio_11.1-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAloPc0gUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s+lcA//TKraebm/CUsQZkIJSO3z6DBSGwQ+
rI8pxNDEvv6hmB5pNgoG+NdvlTDvCuv6dtWuKu/bn1n1YkwshLzlEC4CNzXBa24E
FmUQP1DXiK/luMNqnIw4vTdVU9NWUsFz27IxytpJcTHREHBmHvcu1t3SnksXDJ3f
6WVM+E01Q8wdQIigYlqN0ti0yBQUzFSlkHIL7e9quqvouBSnyj0x+bw1ZHN004XT
CS/irlzLdxF5YB/NZGomj0hyuY+D+JrXtCKfAld6mK3C6LgFEPDORiZ5sv2y6Zow
wDtnLGWRvWjsdxqQi/rJu7jHCDqWHtP1/f80CsGPQMSmXqwZ2Ma+/wxVkof4zXC9
W3tvntOn6efyZHc4Gh2NooA8H9mJfIrp0B+cMWU0nEkkL9N+mQsa2O1RXh3Pt4c4
oD1OL1SUmQTlXFjuESDk960ebMFUvI7sy39IxvTWGmQircDFZz03z0q83F/Q6vgA
05tw2ZrhES46a/gRMghvoM2Hbep619aFExv294c0NAY4gRW0+YGelbrgBypChW84
ONR3cqnKEomZXfIo8xAxwgdPRoxUNwK/izexbjk/zeK/YdTsw11Nwco7+OewN8Sz
8GZlxdFL1poAyEikVhu9hUKLsXdm01z/ENjiy2MPfWhHyuUxTgfx6LNa3h/BxtPH
bKF5ltKQicg4f5w=
=WG8u
-----END PGP SIGNATURE-----
