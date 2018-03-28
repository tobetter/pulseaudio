-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 10.0-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.8
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
 ab7cc41a2dc2b9da0794e3a51a4eb7e82e7da511 1608040 pulseaudio_10.0.orig.tar.xz
 93d12f6d9f178f836406d9df6b35dd24233a5db6 31220 pulseaudio_10.0-1.debian.tar.xz
Checksums-Sha256:
 a3186824de9f0d2095ded5d0d0db0405dc73133983c2fbb37291547e37462f57 1608040 pulseaudio_10.0.orig.tar.xz
 8ea302059ad62885d747f81062e359bd01e9c53a4da800b9ef3970133d8f63bc 31220 pulseaudio_10.0-1.debian.tar.xz
Files:
 4950d2799bf55ab91f6b7f990b7f0971 1608040 pulseaudio_10.0.orig.tar.xz
 25783cde8ac3b8f3db016f88c33348d8 31220 pulseaudio_10.0-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAliBUNsUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s8+wA/5AQ+Uz46H54t7kjGTE9xVZh0Y+bau
qutLA3JdmGAL2tbl9cEeamzIeuUc0j4UUPmibPgZi9NH/lKYoP3xGE/exxyF1Wkn
qPBj0NCcD0PNvoiEJ1d1V8Cc72QTbTR8qErQQ+iIKIdmo4+ifAzgZZuOEdyYVyhb
A2aPweeJl2WvD/nv00PnSL7n8LkzVecfCX09RfP5/IoQWgQkI2Fegk8rpTNwmt0G
wg9mTGHO0l7UgchoPJIKSXnaiHZjYsmS1pOYSs0L9YcUiJOeWUlXms2mjMmcbe57
Ozs68KcgaVR4UnJFUbHvIqfV+BWkCDXB91Sucn9d56gf7ckLsNCsCbfgO96+fj6p
Rkc13IOREJKm6RnC10SXU3Mqg7WFZ9HifJu0JSwGVoUvqPxg0xuX5aRMkKzlprN2
JF8IF6Q0p9ZynlCpr5fWLG+vf3vOL0Xs/9PXaDT3J8OZWH5rbjWe6daFc4+QynzG
EMUlPLONIGa0s632XURXfsUeSb1so8p1DIBvSYzPTx4uVHLqsyQWm7pJboD/Dhpy
V/jZ1Zf5p2DN/5bCFzI5IMMLSQyBWKZooCQD46wnfK282nInJDoTzP2li/S6fKDy
l1oc4yuzrIe6/MGhzyMdoqUdENbqHAW6Dw2C4ZcKZuqsW9sF8gz7/FCNjrzu6/Nc
ejmzO1QkkjuObdg=
=ePni
-----END PGP SIGNATURE-----
