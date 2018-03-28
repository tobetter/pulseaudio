-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-droid, pulseaudio-module-trust-store, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:10.0-1ubuntu2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.8
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: android-headers-19 (>= 23) [armhf i386 amd64], android-headers-22 (>= 23) [armhf i386 amd64], debhelper (>= 9.20141010), check, dh-autoreconf, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libandroid-properties-dev [armhf i386 amd64], libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libdbus-cpp-dev [armhf i386 amd64], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libhardware-dev [armhf i386 amd64], libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libtrust-store-dev [armhf i386 amd64], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-equalizer deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any profile=!stage1
 pulseaudio-module-droid deb sound extra arch=armhf,i386,amd64
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-trust-store deb sound extra arch=armhf,i386,amd64
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 ab7cc41a2dc2b9da0794e3a51a4eb7e82e7da511 1608040 pulseaudio_10.0.orig.tar.xz
 ab3594e7ae3c39b5d7dba097d3c9de9de41c8af7 139328 pulseaudio_10.0-1ubuntu2.debian.tar.xz
Checksums-Sha256:
 a3186824de9f0d2095ded5d0d0db0405dc73133983c2fbb37291547e37462f57 1608040 pulseaudio_10.0.orig.tar.xz
 1c778da2f0a8336df54d3751ecc977be262c8e3c5fdfca7669ba0aa1d0bc9259 139328 pulseaudio_10.0-1ubuntu2.debian.tar.xz
Files:
 4950d2799bf55ab91f6b7f990b7f0971 1608040 pulseaudio_10.0.orig.tar.xz
 2051dade7a75a541e5311e752009f812 139328 pulseaudio_10.0-1ubuntu2.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQIvBAEBCgAZBQJY3AArEhxtdGVycnlAdWJ1bnR1LmNvbQAKCRAbUOyjc/PyM+cm
D/0TVJaTo0tCYrojoHcYzdrwhldMq1tMWCgmI8eCZ4kM3XwcUiAxYayH5Hf1k5Ri
zgcYJswidc3W1stR6Kw5c5Jotw6SCc37bjlgJ6qXlyQrEkfvrrQYq6GgyaXBg0QA
1b9VOj9FZJWScseNcYZCMa24leYv7x2D/IDyqqLhRutXyCpcTlzUNCzFy9AvAQ5P
WsnHPvBKkmfliqFC77lxbzwnIoHY6IGQTruBHJLevRLeA/1J87QrlwBbTfZW63vH
AsYLDeCAXPx9EOo0VjBj9XTy/GMX5lKJBxCU4u8pvFRE8EDs3MmUy5s2bIqIv3mn
3KvcQWURU0WfMO5v42CtwJgX3zREbBAKX+HvKC2YExLz5gU9uNphrYCznT3I90Rt
m+4uczsbMPrV2TPR4MXBsxw22F6GIZPysSjzzv/kmutsl9dvs9sdS2gEfKblbECW
hzl9/7uq5TaQzJUlgHQgW8+EymPJIHguTKABXl2uuoruQqTjkxEZKWe+8gNKuQlm
1V0FyQSDtCAp5xlw6+mTrX2oVhkQARNPP3wOM5/d8h0HGa6TYGtL8Vt4lHhQuHXL
t0n1zvaqB/CucmUbHjOuPG0L2OZ/V0JMd/ojqdGvXL1pOfsDXIQ2vrYQk6He4oPv
vSYg2iH4o2l9iONCFm9YXmgDYmRVg+N8xFon2FknlpinUQ==
=GWDf
-----END PGP SIGNATURE-----
