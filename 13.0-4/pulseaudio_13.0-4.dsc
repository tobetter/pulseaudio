-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 13.0-4
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: https://www.pulseaudio.org
Standards-Version: 4.5.0
Vcs-Browser: https://salsa.debian.org/pulseaudio-team/pulseaudio
Vcs-Git: https://salsa.debian.org/pulseaudio-team/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper-compat (= 12), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev, liborc-0.4-dev, libsamplerate0-dev, libsndfile1-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-equalizer deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound optional arch=linux-any profile=!stage1
 pulseaudio-module-gsettings deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 dd07a49f09821913c5ed1b131ea7f85f27085d0b 1901768 pulseaudio_13.0.orig.tar.xz
 9b26da708e29d10de7897baafee726ba539653a0 35212 pulseaudio_13.0-4.debian.tar.xz
Checksums-Sha256:
 961b23ca1acfd28f2bc87414c27bb40e12436efcf2158d29721b1e89f3f28057 1901768 pulseaudio_13.0.orig.tar.xz
 063920508d2992b58ff9d8dace7abc8eb4cb54f67e23ff3a68a3fc982bf5fa4b 35212 pulseaudio_13.0-4.debian.tar.xz
Files:
 e41d606f90254ed45c90520faf83d95c 1901768 pulseaudio_13.0.orig.tar.xz
 66f4a0516c3ff5ddd3de285c7f4122eb 35212 pulseaudio_13.0-4.debian.tar.xz
Dgit: d5b3feba04c9b8859d9895451440f5f9abeb5216 debian archive/debian/13.0-4 https://git.dgit.debian.org/pulseaudio

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAl40HMYUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s+2bg//YokiQUAh31pwYt9diXGowN13nVIF
IJ3RJZtDfVmU/Z71EKVjT15p6Aggf1XMudgna/O9N9g3NBtQdHDueeTEj4TnecmW
6N5g653N8E/GJah54fBTWOSiC77wzpnK8MUaRdGOa5y3goDJdvts7Le7wzMIOtMo
7VgswtorY9EPywLNweh2UFjj8XcchNK22IIflZgJtwSjcUrvKWIr7t/dtzUVdU8N
ozSuSSGWJrKuP86wlRwesMD9Iz9pvZsiZTRrW8wrmI8y+nB9yngidLHohZrTTlwK
fq3T3wYV615DXwAPFiAQyTf320bKF66Id34i0srqQSqmC2qBPIgvpMnIkNmzhAV3
xLghPrWd41mQqQ/znXdkcwVxwZWsvZFY8+ych1x6yWsSeiyD6T0OW0w5I/X2IF+E
bVYp4gVhaDH9CFCAo/78u17KcmER7Fph2X+aNLNzKYERdfpkBT7UXeSk2FuZIZzi
MX0NuYLl58HwNgkxME1S3EL1NThvnj/QdgCwvZkZo17I5nFWt6xTpr3NICfROSJx
jJDitSDDbPuP0g39Azy2Kfr+twZ+THiWZD4t7J6BhDhpEM1M9dBOspyedBmBTT1R
ZAbvJWMS3MU5dK7SgqGtLbs0f0PCYzm5pZ+LO/fAkeOEehy2Zmx7vTHKnqHspm6r
aYDh7hSyUIsPDRc=
=RFVE
-----END PGP SIGNATURE-----
