-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 9.0-2
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.8
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 9.20141010), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2), libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any profile=!stage1
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 d9a9d7cb667ed95ee1de4b6544d5c7444c5a0064 1537568 pulseaudio_9.0.orig.tar.xz
 0ca5c25f0c044443ebbe39145105e985b9ba2b29 30888 pulseaudio_9.0-2.debian.tar.xz
Checksums-Sha256:
 c3d3d66b827f18fbe903fe3df647013f09fc1e2191c035be1ee2d82a9e404686 1537568 pulseaudio_9.0.orig.tar.xz
 80effb5fabd708bc2d1b290af5a0d0cb3e74c2df9e9fddaf95b8433b0dec0ce6 30888 pulseaudio_9.0-2.debian.tar.xz
Files:
 da7162541b3a9bc20576dbd0d7d1489a 1537568 pulseaudio_9.0.orig.tar.xz
 9b63f4a300d9bb8ef77c2bd4d4f1b0c9 30888 pulseaudio_9.0-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIxBAEBCAAbBQJXrojvFBxmc2F0ZWxlckBkZWJpYW4ub3JnAAoJEKO6uuJAjdbP
NUQP/RDd8xg98u1P7INXeFwlSSZb+e9r4kcKCQQrmSYBMAjz8ZryEKbvEThbSD19
0HPl5Mw6fRagMWaj4R9bvdQNCUi/mlx7aE8xTa4haeDkqO6PlqvvU98NFuw2PJ7Z
HT+pJ25QKTQ0gn1si4xIGLAkBiQs+27RQ2+ScIEuPumCfBJUsn1PBO0NNUgC8ztT
w+VK1HY/nSfOE+DC/kmihh6g6UK39cswjZV/QoOrbTrEAGz3fvscopdyDmrEreaY
en+rbM3UKbt/2UPBD9sF3ZMBfysgg/GueuijGyS2m2atyadGabkTUi1dvwFq9QDN
WD3laOzJJ9qk15D1LjF6OzyU7XUiI3lW5gAE7MG/ia10CRDqV/znuz+y1F1hctT4
Cxf0AmPuzrHzVmuoMqCFTzsjV6Th7N7lKvXYQ9EgIYpNuW+q89a+8oTzxtc7qzIP
CNo1p/CO0iMMmaeuCNMKKSZOx4H1pfEfgYcsPr/wXiNYHrXS+wopu0Jojiotfcsy
xiMsgHFKWS3Hp8qiCX0EaM/vUAR2Wfsy/lncpGvinomKTj2UgkUMkpqEc1MCKg4s
kvzFnEuUT7ir3orIp5CsXNHtss0JxsJmbEKy/5/COQK09Dvyis5qeSCnefS+NUKL
WC6sHBQTQdf3dYPLfO9fc/GYiFEPdzz1vlrXdg7hiQqL02RI
=jY2k
-----END PGP SIGNATURE-----
