-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 1:3.0-0ubuntu4b2
Maintainer: Ubuntu Core Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Martin-Éric Racine <martin-eric.racine@iki.fi>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.8.1
Vcs-Bzr: http://bazaar.launchpad.net/~ubuntu-audio-dev/pulseaudio/ubuntu
Build-Depends: debhelper (>= 8.1.3), cdbs (>= 0.4.93), dh-autoreconf, dh-translations, intltool, libasound2-dev (>= 1.0.19) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.40) [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk2.0-dev, libice-dev, libjack-dev (>= 0.117.0), libjson0-dev, liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsbc-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libtdb-dev, libudev-dev (>= 143) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 c804db84d2380754ef83fead5c3de7ec98bc2549 63080 pulseaudio_3.0-0ubuntu4b2.debian.tar.xz
Checksums-Sha256: 
 c90bfda29605942d08e3e218ef10e3c660506a06651a616bfbb6a6df8392836d 1367468 pulseaudio_3.0.orig.tar.xz
 a1c07e79cfb9321d2016a51b15a2efcf00a8b155b6d99f781b7b04b2789182e5 63080 pulseaudio_3.0-0ubuntu4b2.debian.tar.xz
Files: 
 47fd7eca8479c757822bee68a1feef25 1367468 pulseaudio_3.0.orig.tar.xz
 6957dd454288556989660208cedb79aa 63080 pulseaudio_3.0-0ubuntu4b2.debian.tar.xz
Debian-Vcs-Browser: http://git.debian.org/?p=pkg-pulseaudio/pulseaudio.git
Debian-Vcs-Git: git://git.debian.org/git/pkg-pulseaudio/pulseaudio.git
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRQZdZAAoJEPmIJawmtHufuYQP/0cBLwst7GGzlKt5lhQQgNx/
dNCNUXW1+rYhRHdUmhE1nIYLUaX1PjvOfc5wBkpe9Y1oMdQ9Ylk8IwCLbO8f1Uk5
7E5M04yyfTr2Ug+ObIIIvAjmOO1mlgsYMe2JLtNTVbScr01rQouw3LfxM0nMsJHC
zJdyzJy+P8+ogOTQ/fV2i5SWgwMXfyA4tkVCQ1LKxCpnBtkBLLTee3jDkrYKxJLS
oMAS+3ZFFJ37r/Uvta3yo4qSIDf+LOat3rRjaUWzyj37E6DwqPGyt7lgwiXbyeRM
TW+hDF+vigbnpOY3ZONhxJd/PWvR0dEIrLg35QUXgpU9GIeg8J177jEpDHjYpxdL
jfL8BzC7FEnnNbnGl7JlkvA89UD6toAN43b7y/OiWjMlvDxktQnldIevFljP+7Op
A+YIiaK3E95PoG2d/6iDwkTOzl9LU1asGwgatWFVSXFjH3AEXJMWwE+P1rn2y7dt
TmzVZPqU3PdqwFRk27QqxxLhE4CbRIueSqBvD/Wgd3JDYyHBqq0UkVtdaVWFmLAy
+XB/kQlFYxQxH5BXMBzNI8mkdSWC+fE8GpVzYAYRQ/+Q2ZO46XZU88dAxf730Zqo
p/vuP/cIUvWY6C6No98nW4asgGvR47hR/qluaOOujkYQAY73QIIWsOjJWydgG35n
qcBshQMNyVEktLyX+UeF
=JCr5
-----END PGP SIGNATURE-----
