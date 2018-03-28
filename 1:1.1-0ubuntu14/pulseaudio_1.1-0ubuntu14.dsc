-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 1.0
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 1:1.1-0ubuntu14
Maintainer: Ubuntu Core Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: CJ van den Berg <cj@vdbonline.com>, Sjoerd Simons <sjoerd@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.8.1
Vcs-Bzr: http://bazaar.launchpad.net/~ubuntu-audio-dev/pulseaudio/ubuntu.precise
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
 acfd86b40f9574e419d33f1dbaef7e172a6b6011 2221090 pulseaudio_1.1.orig.tar.gz
 c80fc5d5484987e8c44c5465b5f71f6c820a4ab6 121651 pulseaudio_1.1-0ubuntu14.diff.gz
Checksums-Sha256: 
 9b480bbb8c33feffeca7343fe56bf972d47b988d5c6e20b28eb742186b0bfc47 2221090 pulseaudio_1.1.orig.tar.gz
 f6e77fd70d2422d0e1c51c9975bafef31ca59841b6f96aaa0df6eb6cb559bd52 121651 pulseaudio_1.1-0ubuntu14.diff.gz
Files: 
 1b76932ca7c4b2aa992941e41ed4594b 2221090 pulseaudio_1.1.orig.tar.gz
 f4c6fee2969d197f00bbdb99aea3c583 121651 pulseaudio_1.1-0ubuntu14.diff.gz
Debian-Vcs-Browser: http://git.debian.org/?p=pkg-pulseaudio/pulseaudio.git
Debian-Vcs-Git: git://git.debian.org/git/pkg-pulseaudio/pulseaudio.git
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk97sf8ACgkQjVefwtBjIM4UpwCgy9Ab2a5IzRQ0bgFYi1WnlWsK
OZIAnAuEhX3kN3rJlYSSlgoHN3Ng5xAs
=kFIw
-----END PGP SIGNATURE-----
