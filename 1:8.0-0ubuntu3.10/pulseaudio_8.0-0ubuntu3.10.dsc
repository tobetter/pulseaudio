-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-droid, pulseaudio-module-trust-store, pulseaudio-module-bluetooth, pulseaudio-module-x11, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:8.0-0ubuntu3.10
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio?h=ubuntu-xenial
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio?h=ubuntu-xenial
Testsuite: autopkgtest
Build-Depends: android-headers-19 (>= 23) [armhf i386 amd64], android-headers-22 (>= 23) [armhf i386 amd64], debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, intltool, libapparmor-dev [linux-any], libandroid-properties-dev [armhf i386 amd64], libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.40) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libdbus-cpp-dev [armhf i386 amd64], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libhardware-dev [armhf i386 amd64], libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libtrust-store-dev [armhf i386 amd64], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any
 pulseaudio-module-droid deb sound extra arch=armhf,i386,amd64
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-trust-store deb sound extra arch=armhf,i386,amd64
 pulseaudio-module-x11 deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 1399a2f6288ad743184b6c2192129fef033343ac 1517656 pulseaudio_8.0.orig.tar.xz
 57bda11c5fbe6184ed6454dbd10081ad8f3f516e 151208 pulseaudio_8.0-0ubuntu3.10.debian.tar.xz
Checksums-Sha256:
 690eefe28633466cfd1ab9d85ebfa9376f6b622deec6bfee5091ac9737cd1989 1517656 pulseaudio_8.0.orig.tar.xz
 eedb80db434a98bca95c04f38d22844cbd61c5bac3f0a136bbb72af0e8fa8b68 151208 pulseaudio_8.0-0ubuntu3.10.debian.tar.xz
Files:
 8678442ba0bb4b4c33ac6f62542962df 1517656 pulseaudio_8.0.orig.tar.xz
 572d867bfab75aaead0b3d869c94458e 151208 pulseaudio_8.0-0ubuntu3.10.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlrphFcACgkQQxo87aLX0pIlhQCg2UmpotbnMV0uD8TGvIgZCvTG
NSMAnA8vcO6AWfqPg+M4ETAaDEBgdaE4
=AVZO
-----END PGP SIGNATURE-----