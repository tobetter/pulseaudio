-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 5.99.2-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson0-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 8e8db69ce01c9c12409af27b86d5e9505a1a666d 1454516 pulseaudio_5.99.2.orig.tar.xz
 bf33883f3ac68d05716b31388efb53fac45f1ee1 29676 pulseaudio_5.99.2-1.debian.tar.xz
Checksums-Sha256:
 877fbc19c5928ade11c948814d0d444673c39a8ec5571d331642f3327d2c86fe 1454516 pulseaudio_5.99.2.orig.tar.xz
 63df67695f6dbb476876f04e7e00696950b897cccc0098f4861bccc8af4a507b 29676 pulseaudio_5.99.2-1.debian.tar.xz
Files:
 7525a41b1279e7b01baf94f764945c1f 1454516 pulseaudio_5.99.2.orig.tar.xz
 2528e10898e694565a9a5bd2c3aef167 29676 pulseaudio_5.99.2-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJUmgpTAAoJEKO6uuJAjdbPsFUP/3eJ2RLwYEVtxdacyYxTWUlm
s0tFYCXWBPXmHhknr4XtBQN1sf7LZEIbXehk0WZKZpz2iYTJbaQ5slcwwanm/XIo
NQWL0kCpbfBMs78FjwCo+ZjhkwCYyhop1cJUey6qe9qsIee3TqkOvWSPwmZeaZa5
EpaSSHW6UuHmjEtzyqe9Tj/PYNM9nBjMwEdFmeEWrZE/Q95wlYk9M9o0pC1wHv4a
GW438ynRdi6ETx8fLGETPqT/HtiEmaQwu5tghQbbM2kmFV5vsd6BQQy3DpCX39PZ
sboV2oHU2sJ5ivxJwnRG8ajydzDUUxH+uEDJg8lQpdPev/tc2PS+EvX8QhlupW4v
Wj2AUOvHp8kA35+6N43crVJl0TrS3tetf7QW0UuSMod7FnlcytGlt/j547WxHhdU
k66H0iYLWNHKc8A9j5PdGj0LeTirTqYSR0TjmRYIeAOsMQMvmfBwUwLyneW+eUOc
lLVCI8T3yf/0Wa3ZqLFrWLsyU9Y1oi02qrMwdse3OeDaN+HdTAHCD427hPdr0By3
+bWDSUXO/4Txjpw76S/vdB7YCINgRWDFUnPHGl859IygdnXO1MYZUANby3o9XMeH
FJEDJTb9iieM9VPllmt7A0GzQlU30lEQOvo4aN2SCO45X9C9TiR/Y7bYyGMa2VET
y2n02deFa8HirVzWB1Lw
=Rc+v
-----END PGP SIGNATURE-----