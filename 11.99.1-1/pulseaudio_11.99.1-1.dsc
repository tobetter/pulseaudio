-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 11.99.1-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.3
Vcs-Browser: https://salsa.debian.org/pulseaudio-team/pulseaudio
Vcs-Git: https://salsa.debian.org/pulseaudio-team/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 10), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev, liborc-0.4-dev, libsamplerate0-dev, libsndfile1-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-equalizer deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound optional arch=linux-any profile=!stage1
 pulseaudio-module-gsettings deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 f42fc78635e97dc6337408fb8dbf936b6ae0d34f 1655948 pulseaudio_11.99.1.orig.tar.xz
 956306a20fc2586e7651e13e9693da2c4d78b17a 32240 pulseaudio_11.99.1-1.debian.tar.xz
Checksums-Sha256:
 2b786deb178cc2c51e067b2f07096e2c89fd95e014049397e1ee4d5b2bcbd92a 1655948 pulseaudio_11.99.1.orig.tar.xz
 845e0f9a229e35385611d134059a12ca684a5cf41b3904cd297bfabc2043746c 32240 pulseaudio_11.99.1-1.debian.tar.xz
Files:
 28fa96ae95e5ab12f7f577f8c01ab195 1655948 pulseaudio_11.99.1.orig.tar.xz
 35217e9f82f112e3343d99d40da97865 32240 pulseaudio_11.99.1-1.debian.tar.xz
Dgit: dcdb5f76e3fbb5f9bb6737e26575615f0dc45db9 debian archive/debian/11.99.1-1 https://git.dgit.debian.org/pulseaudio

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAlr4cDcUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s9JQQ//TKWOt9H6PAE2qmI6hk1V107H904d
OxqWRoS1Yr6VVUjMIjukrqF5M0+UZbQPvBRWHZ2UKkDhEk6G/Eo8MRgYBs0zGgGm
E1nY53gLb5aNvhOlCpmjbPQsuP0HUtMooF/gFP6lQ3MYqzEpLJvNgEeFIxOH8lbU
+ze6n1qrhrWTxyOy+mTV4th4crZm40BHjuw1lE0RxB3DM1VBNPZoqCXTK4EEvbYK
rLtz9+33UYR+1kGUJjcIZAI21qztVDnkUlVlrIllMB2Bj/l0B5XTnE0SB7u/vrXw
1LnMSiNC+5o5rqL7gUoXZAR2TCxl5wC18i19oeAo5acF4fURPnOP98q8TIw5OPor
MOTxJq3jXJstOmp5WFLekDzMYD03H2tYIER/Myn7Gi5bhYaRRF2r7J+mkrqFdpJa
0GGA+XoMR+qjlRom56VQCAhJ1mPQYhvAaq+IEd77r17aYstbi42c/WRFq/EAg9IN
8hWsPc8Gq62P0cZnzoDAVJOMSEkIGetXWnCPs2VTgAZKgM8FqlxCZiGr4Q1M/vk4
6OGmVHbwp7DXvaa9qWzUHRDgoNGOqiiQmU0sZqgaJM3Fvar16lSBEEgoouZFyAOy
1LfY66c2X7cvNUvQkGRbn/HMyN+R3PCVJ0NzSNDcceNURrbsxrcsi+f4LzsojZIa
WzWWAe9th9jj7XE=
=SokK
-----END PGP SIGNATURE-----
