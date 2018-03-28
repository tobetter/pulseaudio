-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 1:2.0-0ubuntu2
Maintainer: Ubuntu Core Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: CJ van den Berg <cj@vdbonline.com>, Sjoerd Simons <sjoerd@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.8.1
Vcs-Bzr: http://bazaar.launchpad.net/~ubuntu-audio-dev/pulseaudio/ubuntu.quantal
Build-Depends: debhelper (>= 8.1.3), cdbs (>= 0.4.93), quilt, m4, libltdl-dev, libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libglib2.0-dev, libasound2-dev (>= 1.0.19) [!kfreebsd-i386 !kfreebsd-amd64 !hurd-i386], libavahi-client-dev, libjack-dev, libwrap0-dev, libasyncns-dev, liblircclient-dev, libgconf2-dev, libspeexdsp-dev (>= 1.2~rc1), liborc-0.4-dev, libbluetooth-dev (>= 3.0) [!kfreebsd-i386 !kfreebsd-amd64 !hurd-i386], libtdb-dev, intltool, libgtk2.0-dev, libxtst-dev, libssl-dev, libudev-dev (>= 143), libice-dev, libxi-dev, x11proto-core-dev, libxcb1-dev (>= 1.6), libx11-xcb-dev, automake, autoconf, libtool, libjson0-dev, dh-autoreconf, dh-translations
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
 a999d2cd8044651c8bd610079bb74eab808484bf 1353708 pulseaudio_2.0.orig.tar.xz
 3ebb169014fc28ec73772399f6278b0f807b86cf 59480 pulseaudio_2.0-0ubuntu2.debian.tar.xz
Checksums-Sha256: 
 28b42edd42f4879a6884af5f0ec11801ac001eb7582881215b36649aa37e2061 1353708 pulseaudio_2.0.orig.tar.xz
 739e797500dc9300cafa9c80002e2cff8327c7c714e45a4553ae8adff84a77e3 59480 pulseaudio_2.0-0ubuntu2.debian.tar.xz
Files: 
 9bbde657c353fe675c3b693054175a8e 1353708 pulseaudio_2.0.orig.tar.xz
 d405ee15eff98c68133b47be58dd2e6c 59480 pulseaudio_2.0-0ubuntu2.debian.tar.xz
Debian-Vcs-Browser: http://git.debian.org/?p=pkg-pulseaudio/pulseaudio.git
Debian-Vcs-Git: git://git.debian.org/git/pkg-pulseaudio/pulseaudio.git
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJQCdWmAAoJEFOMB2b0vLOOz64H/jRLS163gLavd9ZXB47Fm0s5
z2U6QIKNAuneljkPCSjXMJyzDp//VIjB87DeXFJeCQmFFHG3Aqm+lHZgkITfxexe
mZIBeQ2Zsww1BEHDk84SAb0kEm63xbmyCzUozNAI0gNkIEjrlos7eF9URmDGkTHJ
foKgNRdGiR5/HbEibyRCZ9Y47sWA8ZmNaF04gFS7ixo7C6nDPTlywm8DFzbIcoqv
DYXctIaWbudWTXZmTV/jUWRz0zNIFE2X+Q32LnaCejzQDqpNwVIt10avG2RUZbA4
68l2DTlfcdvp19/T/TZVUGWiy9XFydxKhKNLHHo/3xzdNwnBl+ZZGkq3FXV0mmA=
=VnbI
-----END PGP SIGNATURE-----
