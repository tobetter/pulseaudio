-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-module-x11, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 7.99.2-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-x11 deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 b3b90489161c424202b841639a37c8e2357fa4c8 1517396 pulseaudio_7.99.2.orig.tar.xz
 ad92842144c62927eac076ea1b0c63bb740d199f 30000 pulseaudio_7.99.2-1.debian.tar.xz
Checksums-Sha256:
 72810b3379a91bb06e5d925282acdb174ca5da419829317d81a46a1627a0c6aa 1517396 pulseaudio_7.99.2.orig.tar.xz
 48cd07ccc6eac59d4ac58c0e5c46a13163e9c1e70fd6c0d274be64b3dc66da5a 30000 pulseaudio_7.99.2-1.debian.tar.xz
Files:
 0028dea2cc88be8e874b63e9d1f4bd17 1517396 pulseaudio_7.99.2.orig.tar.xz
 9f8ab06b5ead1f026cf12416947ee4f0 30000 pulseaudio_7.99.2-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJWnZ65AAoJEKO6uuJAjdbPcaEP/2XjAE7KO067T3etiFvkkzNi
o0JoerbtzZdTEmBAtjibcSTKHT4IumLHVlrN/tPZzl+2yB7jpEPBiaIvW+gmWCzI
IybcpBzXIbaQc9ZsBVGvbRJP+hAdq+eJqGjZfb55v4zLyNwPgaFw9qOnBq72id30
8d77uI1Z3Df1Fn9YgJTbiaahfwfWZ2ErrXkkBu4cIgU/gwgBw78cv7oHDTXRIbFE
OxD5A3rbSVaUZQHelmqy6/qBw81tu0OimFEczxQPLu75TjK0fe+9Vb/YJ8YhwUn6
rumtAPRt4iJkBcVZYRSojtaLB/erNCyFWyBcqhEhlv20oZ7HndOYPXzjT1EJA3iM
BODR02JyoTsyqVkLjz7yoxpD9S9rC894q3iALk99/c98NHguJYpGZgz0gjIzSyOJ
0s+gUrSBG83Kl21VkTdh30RkOnEnGTfAAKFCtnzDJEyF+BNfCbV+BVHMEiqfwh+1
IjSAkbevKoplA8EOPlx8Rmpl2afpl5TQHR7ozU0xG3KsxRj+JNwyIOtdRUWMnUSS
fXN6z2R3ZEegaSOi2+ruX9tkWd8tUa04iiCr3awqFA5DAbJIpcoQeRFkWpaOYgWI
aCuwsa6xAdGYkcNCc10kBoCml/CjYRxPDJLYZvXVvlgNz41fUyVfRg2DZOG/TErd
r+hDHii9rnpWzuXOdjZ5
=+5B6
-----END PGP SIGNATURE-----
