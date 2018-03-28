-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 5.0-9
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.5
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson0-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-login-dev [linux-any], libsystemd-journal-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 e420931a0b9cf37331cd06e30ba415046317ab85 1455428 pulseaudio_5.0.orig.tar.xz
 230ac01d62a8d1e4f1588a6b47cc92cf8d7c88f0 38080 pulseaudio_5.0-9.debian.tar.xz
Checksums-Sha256:
 99c13a8b1249ddbd724f195579df79484e9af6418cecf6a15f003a7f36caf939 1455428 pulseaudio_5.0.orig.tar.xz
 5e5d440013f9d59865e4b83805e8f7be3d3b0b55c3ff2cf1bad9852e22a6cfab 38080 pulseaudio_5.0-9.debian.tar.xz
Files:
 c43749838612f4860465e83ed62ca38e 1455428 pulseaudio_5.0.orig.tar.xz
 5150b1751f3096c96b1fe2bf4fac91d2 38080 pulseaudio_5.0-9.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJT746fAAoJEKO6uuJAjdbPg5IP/3lgrxUZQruhjiIlO7b09CWN
UgMrK03+yhdlTIy6yiPpg2pnOIoTIIXxbvsRocfOn6vZi8gNIxTyDHEvq6TszkGG
6jLQThVg7NKF0qmToDc4K3JRGorT3LHWBDWlnA9FKdcdWGa6clEpbVRWmqVVbQ+f
T2QzhR0cHOHXIMSQmBPX6ojjjOKNuPu8KdjOmmQqxXBiAlGkV50xgPHgvR0tj2ge
CumT90WfP/LQ81svlW2CkH4GF47V1P5+/jCVLYi77DzceuJ8shfnFXVEWcJFfB7m
zA13DzoeBwkb41MHVZ4EHFEaVrjqHyaudQtbZ6t9qfDr/SeyDKLZY3YxSYQc0oVe
Y/Tee80+C2gRuYyA/DdKvgZgU0zW5mB5E1Lfp5lkxSHgrwbbqIb0n7+Hzq93Ci45
eFolVl6sUKn+WW2hYg2m4WglO/pBM7E1SYFdkNn2i+FN6xlWehp+yS+wLIsoWDqb
hlxttDpKxXIj6X7XR4zNT6hAwcj5d4+Yp47+ZfBlhVrFNzd0P4KGGXdok84cfzPc
oMevAEUZpJRc3aoPhYXZFNPy/eT//7JoZZCxQugp+zucD8rdfShLz0gQmNAS53Cq
CJCNeQB/BljRAkZn40PvITQSTN1XSyurq0wJh7odZmA2vFUjq1Gx90vTpguDHH3d
5gmidUidjFiCM4JT5CkU
=MtNK
-----END PGP SIGNATURE-----
