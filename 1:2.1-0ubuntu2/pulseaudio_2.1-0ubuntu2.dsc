-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 1:2.1-0ubuntu2
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
 957399478456c1dd5632bc84e9ee06a07a9c4c9c 2353357 pulseaudio_2.1.orig.tar.gz
 e4ebb795c8d35045efdaa0249819bfa64ae88909 56424 pulseaudio_2.1-0ubuntu2.debian.tar.xz
Checksums-Sha256: 
 d89520237ae775cb6f7698d40d66b848cd98fd6b46880534e15282630db7e34d 2353357 pulseaudio_2.1.orig.tar.gz
 a264023c807669d6c3aecf01989399e0822b7a9016d40e90fbf9b189158091f6 56424 pulseaudio_2.1-0ubuntu2.debian.tar.xz
Files: 
 86912af7fd4f8aa67f83182c135b2a5c 2353357 pulseaudio_2.1.orig.tar.gz
 0bd25219d367e4490bfeda7062868bf2 56424 pulseaudio_2.1-0ubuntu2.debian.tar.xz
Debian-Vcs-Browser: http://git.debian.org/?p=pkg-pulseaudio/pulseaudio.git
Debian-Vcs-Git: git://git.debian.org/git/pkg-pulseaudio/pulseaudio.git
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlAojUkACgkQjVefwtBjIM6pYgCfRCZ9zZePBaDU7DJBw70tvVuX
UkoAoLIVNMFe3ZWe61LYKPJdXD18WBhb
=qGTj
-----END PGP SIGNATURE-----
