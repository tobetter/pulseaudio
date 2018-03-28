-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 7.0-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 b4a3d331bdd94eb97a299f7328950dec31cf2b6a 1505864 pulseaudio_7.0.orig.tar.xz
 f7e38fec8e2eaa596a0374078f888a0f82662b96 30124 pulseaudio_7.0-1.debian.tar.xz
Checksums-Sha256:
 ca1ae1377e8926bfc3ffe2aeb9f657f6c363a16f72861166fcf9454e3eeae8fa 1505864 pulseaudio_7.0.orig.tar.xz
 3908e6c140c3da9769e7db32c3042667b033eb5cffc74c0d8c97b521f052f7f8 30124 pulseaudio_7.0-1.debian.tar.xz
Files:
 09668b660ffb32f2639cfd6fdc9d3b37 1505864 pulseaudio_7.0.orig.tar.xz
 329073ad7bac6a911fbcbaf1f24bd3de 30124 pulseaudio_7.0-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJWBUQpAAoJEKO6uuJAjdbPp+gP/2zBZBIdA+0rbrZXo9gK0vuB
+Qorw0gElHLrYjWRztEz/eosAKgtMHR0o+Kwri6josFtAZRU2+e68s1iEQEgupgP
fzGcQ1960V98l2WSfy4YvckKR6tSjcZQUXj6/4mUxUSY7tOBhxhbeDe+VUaH0ad8
6wPWBKFP7GTjRPZs+RlOjbFjrwJOs7JZbwA6Nv55ec8H20F1L4unY4DDZaYNetOy
VR+fjHUt+uZJX2KGWXNMEjhto11t58NdbJwsrxyjvExdGB1IjQQ9sdO5RvDSw8V8
UIoyRrm6VigrqMyZftgAgCTWAoAGOS20zV0mGBdK9wUFI+OOy3Cu6z+PUQN5nDwV
1WWEXcMvXYOo7GWCr7WquBE18zDzxfBYh1EUyNdOM0Hrm+jlgaMyoTwo10BZHyjA
w3kB3mpbDPDZVRajbYHH9x0ScJ1KQ5A+3oL/Pc8Z4loduO7pW9KJr17FKqxDftea
P3Btap9TlF9LKTbk5UBmMLWl4Q45DZ6BUVnJZ33Sic4fH27eoLx8nL5vZ/jSWyBT
g2Eg5p+zOlarhUuU8NOBbJ+fU5cI9MtGYfswm5sdGKSwk3jK/f3OyLOG5SJ7JxqQ
3I1Dm6mT43R2aHI+LnB/yBc7BMc6IEAotVCJi7TJ6Uzswflmk4Kcl9bnrNP7vBTW
ofo2a4FbeRCTKcns6OV6
=WPYF
-----END PGP SIGNATURE-----
