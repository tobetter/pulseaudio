-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 11.0-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.0
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 9.20141010), check, dh-autoreconf, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 df04f9ffb3fc1de9255f8b88e5d824fcd942607d 1648128 pulseaudio_11.0.orig.tar.xz
 fcf74497d73639489147595f41300877c881212a 41468 pulseaudio_11.0-1.debian.tar.xz
Checksums-Sha256:
 072305d4018fc5e75bb1b45ee6b938fa52fc9fd27493bf327415ef89ed14c969 1648128 pulseaudio_11.0.orig.tar.xz
 d43dd981ab169e41fd68d7310f65b541483008179abdaba9a0aa5bc9d62ccafd 41468 pulseaudio_11.0-1.debian.tar.xz
Files:
 c5fe1cd05f5306b1a0fba5099f0e9e37 1648128 pulseaudio_11.0.orig.tar.xz
 251c02c07af63a0985c853f68a280b31 41468 pulseaudio_11.0-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAlmv8EMUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s9boA/9Fm25qTOIZUlx9/0JZmAaAPZoBO0V
PSG5WjqGiCi0oL/aZBZ7YeJg0CR0Wn2U/LjPsy7Z5kRrqhM1VS933LQl2c3u/Dri
p8Zos3O+LGIE2no+trE257nkxxNVtHnL8pGOsdf1XLQz060mR4fXbEjjrAG1LHbo
tE5ehQOndUYmYnIbrZXArRsx1kgMUMAqr6SgyAPS68sCqZztotBfgUl9320bT1EW
e4te3YgIgA+xZHv9WHbED8Mfi0vIGTRh1eUm49I4YLvyJI/3Dr9lyARU0u+y4wYL
F4JJWj6dTj4vwpXDJDjUrg03Us0YjFaQrU0ntNqVH4iPzsBPyAwrLjPFsplEWjBG
OSz9QOqK4a/lC9Chb16TE01/zv/IAQ2IzoFPoUU6GX5bkJ5d5HO0AALYOc0oe3bv
tY+2Wvc8QJBYyJKJ4liBnuAI2L3koC03kZLCfk5y2E7x+ZLGkMwwd+nEH7BpcVbz
O1R7uszehKt7Wnt9dByCwYfbN4D1MlrMUhrdfqa8hbjzvjjbNqJQD/It6btJLYMj
Ds0OqLH7S+xNbtUqGiqOx5nTV308BEArY8EDKwBQ5r1nMhcjnknncj1aEY/8qVY1
kQKWU80mPi+SFmE2TxUVyobgemcc28TFWkzXp4gP7HFdKUUwy1hkLBzA2syOI0L1
AtACIvXi/OWa9uM=
=V0e+
-----END PGP SIGNATURE-----
