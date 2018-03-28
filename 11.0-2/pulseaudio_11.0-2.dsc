-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 11.0-2
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.0
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 9.20141010), check, dh-autoreconf, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 df04f9ffb3fc1de9255f8b88e5d824fcd942607d 1648128 pulseaudio_11.0.orig.tar.xz
 41d64d5a85b2abeab4573e62878351fe751f7aeb 45764 pulseaudio_11.0-2.debian.tar.xz
Checksums-Sha256:
 072305d4018fc5e75bb1b45ee6b938fa52fc9fd27493bf327415ef89ed14c969 1648128 pulseaudio_11.0.orig.tar.xz
 b75ba78b8a26024917c8024e6d9ce72d55546bf275bb5ea1d17ca7be17f0a3bf 45764 pulseaudio_11.0-2.debian.tar.xz
Files:
 c5fe1cd05f5306b1a0fba5099f0e9e37 1648128 pulseaudio_11.0.orig.tar.xz
 2d5c58e478ea093840ceae6bddf80b6d 45764 pulseaudio_11.0-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAlm5uzYUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s+uBxAAhrhB1bRWxb6rlJhufZG0Mtq2E/oS
Rlb12H8ZOBdQtJReB0k3eFcxHTDLVRS8ehbOM2tIxaXHN2xzABFoahpzcQmuX6Bp
/Rvr4CoSzMAMblZubkl1NWvIlZd7wkvh+netLzDlM6c6z3euW7eOJEPlyapo+tUQ
kO2ybi2jzeKMlslDcwinI2T5EBRb2r66/apZV15PkwQy5kh4Yyw6RNtP47JuLmKH
X7mj/+/l2y70ifcjGuKpY9U4ReioZWWrhqOXaLCx2sDwptKr29FVbwfztfbM7M2f
W+N5lezUvUxNYBLS2bLSn5xWnzUMyVlX8rqexVQO1NDRL4WmIoArJzDcsF1CgbTw
dl+mE4mP5SUPDXrlyy2Vr3O13AASXrKMr8+WKL9xW6SLKaR5XEGy1mEzAE3YLBZL
jkTdSxehBeEgTFWLl0ehXzDJ++ZkpXHeqx+aONVd2gXIFbHed0o4tMCbfAdJJSzV
yV8gTavPrnPrJRXYzVSI97Mxsv0A3fRdxvUaJQHvgT4j9h9gtbNM9i30cNRdc4Ve
HQlARQUaywOQRCrsQgh3joVIXyf4xH73Iz1qwCdniNEyoCxMHyRswxOZQxDkr+4+
beE5I0Wiy0ELIPM/qn1tZvK/0VKWdoExvkdbD+sQ36FOhB71rGxFzo++VvFoSmnA
4z5h9H1tsGvljAg=
=7Ddh
-----END PGP SIGNATURE-----
