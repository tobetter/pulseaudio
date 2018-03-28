-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 1:3.0-0ubuntu8
Maintainer: Ubuntu Core Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Martin-Éric Racine <martin-eric.racine@iki.fi>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.8.1
Vcs-Bzr: http://bazaar.launchpad.net/~ubuntu-audio-dev/pulseaudio/ubuntu
Build-Depends: debhelper (>= 8.1.3), cdbs (>= 0.4.93), dh-autoreconf, dh-translations, intltool, libasound2-dev (>= 1.0.19) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.40) [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk2.0-dev, libice-dev, libjack-dev (>= 0.117.0), libjson0-dev, liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsbc-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libtdb-dev, libudev-dev (>= 143) [linux-any], libsystemd-daemon-dev [linux-any], libsystemd-login-dev [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 87d7d1bc0e07dcf1c9c38413b59343f0126e45df 1367468 pulseaudio_3.0.orig.tar.xz
 4c056fe0058b241aaaab67559622710858bab944 66924 pulseaudio_3.0-0ubuntu8.debian.tar.xz
Checksums-Sha256: 
 c90bfda29605942d08e3e218ef10e3c660506a06651a616bfbb6a6df8392836d 1367468 pulseaudio_3.0.orig.tar.xz
 7f414a742d1c60ca0c16b093d4f245e7563d01ba65e317a85f11061b24b2698b 66924 pulseaudio_3.0-0ubuntu8.debian.tar.xz
Files: 
 47fd7eca8479c757822bee68a1feef25 1367468 pulseaudio_3.0.orig.tar.xz
 e32757975918a0f1214b0fe3467348c9 66924 pulseaudio_3.0-0ubuntu8.debian.tar.xz
Debian-Vcs-Browser: http://git.debian.org/?p=pkg-pulseaudio/pulseaudio.git
Debian-Vcs-Git: git://git.debian.org/git/pkg-pulseaudio/pulseaudio.git
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRtj2gAAoJEHNgbJmxYiOjoV0P/Rd+3BLzV/J6tlg+kbYRkq/l
GYAf5rDk1U6gWVOF7hUVbuEgn2Y7mH9Gbsii+DmVY/h1KdofGixMOJfjYtv7ZhKb
U8OGeXWSJCM43z5xDHEfgKGCR913Kv/M5ubRKJXDY5g//v4wVnQ3gtbwYQ4+csjC
VOknKI6Li9BEu68GBzOYUZdgqP0JsWHck5dGR6E5BdP974vkf9i1u2rvImRfpbrQ
r3/toYdsb56rJ+3smaF8xE+818BzbQw6n3poNreaYDDcrqOfbPvNFpojpHpK26qS
ZzC0X/rPAEyrcsNzfu6fgI7hXo+HEoShM08Med777w8FBDUoeH/e8StcvgDwj6CW
/3tvD9tqPKT3dknvpzppkzCZBw/fb3h7tteWDTX2oOBF2eECNtyMVH3zlMCQeoFh
Uq41qI4bAHxtb4cHAmoHxBEn67K7eFHmZJPpOk3qcpumyGpk15sdf2IyErexuE4E
eAHIs2c64iJZhKqE0yOTYEkIuHS29tPQEagdazo6R30ESMAhfI+jIwv/z9Hh02Lh
cxpVgUv7e2MRTGTF8pBZDC0BVpuwKy07JUxgCZ1p3aKbC02gH53VGHfAos1zv34S
e+im+HZQXE3t3TKql5WcvGluREzYUEEOl3YDqi9C34UxtzdwnRObraJy5RC+PVL0
qesN0z5Lf1GaMKt0ThR+
=M+Gy
-----END PGP SIGNATURE-----
