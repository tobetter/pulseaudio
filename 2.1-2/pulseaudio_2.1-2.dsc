-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev
Architecture: any
Version: 2.1-2
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Martin-Éric Racine <martin-eric.racine@iki.fi>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.2
Vcs-Browser: http://git.debian.org/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://git.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 8.1.3), cdbs, m4, dh-autoreconf, libltdl-dev (>= 2.2.6a-2), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libglib2.0-dev, libcap-dev [linux-any], libasound2-dev (>= 1.0.19) [linux-any], libavahi-client-dev, libjack-dev (>= 0.117.0), libwrap0-dev, liblircclient-dev, libgconf2-dev, libudev-dev (>= 143) [linux-any], libasyncns-dev, libatomic-ops-dev, libspeexdsp-dev (>= 1.2~rc1), libbluetooth-dev (>= 4.40) [linux-any], libtdb-dev, intltool, libgtk2.0-dev, libxtst-dev, libssl-dev, libx11-xcb-dev, libice-dev, libxcb1-dev (>= 1.6), libjson0-dev, liborc-0.4-dev (>= 1:0.4.11), libfftw3-dev, libsystemd-daemon-dev [linux-any], libsystemd-login-dev [linux-any], libwebrtc-audio-processing-dev
Package-List: 
 libpulse-dev deb libdevel optional
 libpulse-mainloop-glib0 deb sound optional
 libpulse-mainloop-glib0-dbg deb debug extra
 libpulse0 deb libs optional
 libpulse0-dbg deb debug extra
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
 5defb410c2b1a975d4d87464effb2a4f7bd80b9f 1326496 pulseaudio_2.1.orig.tar.xz
 bcb2b98ce55eea1b5969f22ca147acabbc1db8fe 25404 pulseaudio_2.1-2.debian.tar.xz
Checksums-Sha256: 
 b8e06f8d7f15f390bb7c44e310896d1aed1f4d6bf976053de0ed477eceaf6c2a 1326496 pulseaudio_2.1.orig.tar.xz
 61ddfd80223e06b8c5a3828347c52636ba6fc10c6981b57e3f6f6665853f05e6 25404 pulseaudio_2.1-2.debian.tar.xz
Files: 
 a6ad4394b3316854c138cdb253352f4a 1326496 pulseaudio_2.1.orig.tar.xz
 946c1ba6df7e7e357376cedbff46d9d0 25404 pulseaudio_2.1-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlAjd+QACgkQgTd+SodosdKA6wCfQuFgG03C/es80mTgyAMlqFN7
D9IAn3AZvcrm65KgA1ACqR9pJmNR5Uhs
=4N48
-----END PGP SIGNATURE-----
