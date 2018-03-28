-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 11.1-3
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.1
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 10), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 53bde72b6bfe715c19b1519db8845f7a58346b67 1648924 pulseaudio_11.1.orig.tar.xz
 6fbe9557c00f8ba1000a0309ec3d690fc3b347e6 42612 pulseaudio_11.1-3.debian.tar.xz
Checksums-Sha256:
 f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e 1648924 pulseaudio_11.1.orig.tar.xz
 178c34c2fab9ac1867185aedcc0329b5b758e7faff128da6574d27231f9de0b2 42612 pulseaudio_11.1-3.debian.tar.xz
Files:
 390de38231d5cdd6b43ada8939eb74f1 1648924 pulseaudio_11.1.orig.tar.xz
 a5670348e2a509cc6a4be3a09e0f5bb0 42612 pulseaudio_11.1-3.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAloZcwMUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s8t+A/8DeFKMbhWcHtlewbR/6tt5c7whKa5
rH4k9q4/nKDvktMWIaZD3FYPnnOwPQNXs/3z7HuFbLVT1xHS6Ba65OEGDA9SqVDJ
mxOqv6YdRdm8DRaq0b5jbub9ORNwXs3yWZbEAXVOipDxh1NYpRhinjXthLbAmxX2
ha/OAcQtKOlqHhKeu/ZNkzM//0nngy2mpzFHcgdJ0tH6LrIcP0ahJAi4yvjaKy0A
aua2EAjGHQQ7+zHkbziwILgLQq09U16Geqb3YyWxbpE173y4I7stVQGVyUtK3Slo
sbmZPo2edd15KOOzoUjiVBgJPmLroLgTSMYttBgBy/hmk0nKNz7/gOl/3OuoC4Hw
WU+o6MRHYDcohTFf4DmR8Z4EE/0qDbiNehiqjtEEWBciZKXqVsuIWDHkSxp6z3j8
Th+I4lr4IqFw4V9qmJjG/virnMMrAhGgplvcZYe61fXqLUu/CSSoKcXIW8VQh2WL
FgkzhU8dfRvI7O3p1C8HkZloKBcv2C9qopbsWtUCdZw8k7G10lM4hUG8WLClazQC
Q6yf5JOs8Pt2rrk483xVvOgduH2b6QRuWUwKzPVkoO/Jjw56ecR4/V1SPQHUzZsX
wY3x/FkRgkpUkiOrQbvO550Vqb0ubCXyf9ppfULuPEagcR7CXoOSKjaIpbL2DlDw
26UVXSUoYoFrffM=
=s6m5
-----END PGP SIGNATURE-----
