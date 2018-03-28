-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev
Architecture: any
Version: 1.1-3.2
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.2
Vcs-Browser: http://git.debian.org/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://git.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 8.1.3), cdbs, quilt, m4, dh-autoreconf, libltdl-dev (>= 2.2.6a-2), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libglib2.0-dev, libcap-dev [!kfreebsd-i386 !kfreebsd-amd64 !hurd-i386], libasound2-dev (>= 1.0.19) [!kfreebsd-i386 !kfreebsd-amd64 !hurd-i386], libavahi-client-dev, libjack-dev (>= 0.117.0), libwrap0-dev, liblircclient-dev, libgconf2-dev, libudev-dev (>= 143) [!kfreebsd-i386 !kfreebsd-amd64 !hurd-i386], libasyncns-dev, libatomic-ops-dev, libspeexdsp-dev (>= 1.2~rc1), libbluetooth-dev (>= 4.40) [!kfreebsd-i386 !kfreebsd-amd64 !hurd-i386], libtdb-dev, intltool, libgtk2.0-dev, libxtst-dev, libssl-dev, libx11-xcb-dev, libice-dev, libxcb1-dev (>= 1.6), libjson0-dev, liborc-0.4-dev (>= 1:0.4.11), libfftw3-dev
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
 3a9c4d6311c46716ec890e930c99a49d4d17fd70 1283904 pulseaudio_1.1.orig.tar.xz
 314620bd05c62808d10af7037f8593e6762cfff7 27972 pulseaudio_1.1-3.2.debian.tar.xz
Checksums-Sha256: 
 776b9263c6f7c7448b6f10f77ddbdac208030fe546c3358757c2de809f5b011a 1283904 pulseaudio_1.1.orig.tar.xz
 0df9e99ed624a6a5d1e2ec124fe3766cecec8b1a0b30b76e6eef5cdd04659ee7 27972 pulseaudio_1.1-3.2.debian.tar.xz
Files: 
 c90864fa782b2574f4bcaf4239e5ba7d 1283904 pulseaudio_1.1.orig.tar.xz
 6d42d7f89969c95666bb6c59b2e4e72b 27972 pulseaudio_1.1-3.2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iF4EAREKAAYFAk+eqc4ACgkQUesQhRznqyghswEAwyPkVb4Eqc5lJQBXmVN4PG7x
3tkw5hW+oiW0+UDEmAAA/1SV3X2Ks2adoVX3kVXoX+kjDjf0PSKdAs8e/yh/id48
=nlTB
-----END PGP SIGNATURE-----
