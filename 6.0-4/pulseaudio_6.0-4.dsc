-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 6.0-4
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
 3607d523fb270d9b68463de30f5d9e17957f1088 1469248 pulseaudio_6.0.orig.tar.xz
 7b0d976d7cb43a5019535f5b8032432a5b2454d3 31136 pulseaudio_6.0-4.debian.tar.xz
Checksums-Sha256:
 b50640e0b80b1607600accfad2e45aabb79d379bf6354c9671efa2065477f6f6 1469248 pulseaudio_6.0.orig.tar.xz
 113d265dfee4409b7dcf8a1adfb1d0a21ed96098b5a06d5fa8ddd1019d2a804f 31136 pulseaudio_6.0-4.debian.tar.xz
Files:
 b691e83b7434c678dffacfa3a027750e 1469248 pulseaudio_6.0.orig.tar.xz
 066d4bab0b4118be9dd43d746475fc55 31136 pulseaudio_6.0-4.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJVv2pEAAoJEKO6uuJAjdbP26oP/RvOHvfyhs+rDc0CH3im6Evl
GfxrjFlsqqeV+pSoJILjoqsqlOMyobWHRv3Gs4D+TSIqQZojtTx9WiGaWqvFTpAt
NIlMQECS4K9GZ4sIP935npyCLDp3MGMFk3CaQHIRKja2VA9+ndIza9kmNnToV4oh
svqTzII4aq6VAJWaGVESi3mmJjdWYMjBGshgTBeJj3VDfV9TGYq32oFCbHMpUpB6
JPFF4aslHhvNL7nONMwci3tlbZNOlAYkAgCd4SfsEJV9qxDclir3RXMkLl/eaVzA
u0ZaTZCdFIi/ZixR0/y5XNC+Rpkf+N7lMUzuj2eW19anBMbJNVUAZbiZrPjY+62/
jYmDf+wB9g4zvmwfdfAo2Lvh3vnFtnnvvXKJriklTO9lmOIyf+kM463r0Qae6IVz
7HGMdjktpdoheA2W9RIC/xTOHt6hkAyzBETrOgklSZbRwX/3dj7S1eWPFk6MmFzy
x215H+RHjzRyl7cJcKdpX0QfxQKmdn2ztrc/R4acF7cDbtXR3Tdguw5wMJHQkYLX
y4+9+T5sidQYSs4U5bXLRQkqvexCO2zb51o6Q35OEoDJVHN3CHXVwhffDDlFMMvt
yKrli6bwxkFUsdTRND0xAWOaOEcO3z+Kuw/217SxRE7dvufezEXXfWXftdqFM7pg
A20crbPuMbRpqDXpFRR/
=RdSU
-----END PGP SIGNATURE-----
