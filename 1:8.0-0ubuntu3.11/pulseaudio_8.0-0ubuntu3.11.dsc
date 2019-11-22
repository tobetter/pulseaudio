-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-droid, pulseaudio-module-trust-store, pulseaudio-module-bluetooth, pulseaudio-module-x11, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:8.0-0ubuntu3.11
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio?h=ubuntu-xenial
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio?h=ubuntu-xenial
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: android-headers-19 (>= 23) [armhf i386 amd64], android-headers-22 (>= 23) [armhf i386 amd64], debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, intltool, libapparmor-dev [linux-any], libandroid-properties-dev [armhf i386 amd64], libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.40) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libdbus-cpp-dev [armhf i386 amd64], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libhardware-dev [armhf i386 amd64], libgtk-3-dev, libice-dev, libjack-dev, liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsnapd-glib-dev (>= 1.44), libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libtrust-store-dev [armhf i386 amd64], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 5e952290f2a727252b221e2adef27f7afea49a74 160292 pulseaudio_8.0-0ubuntu3.11.debian.tar.xz
Checksums-Sha256:
 690eefe28633466cfd1ab9d85ebfa9376f6b622deec6bfee5091ac9737cd1989 1517656 pulseaudio_8.0.orig.tar.xz
 e1620318e6fcfb5da41935275fc07e4a3d5c98c629c9daf30b0bac49e3c4ee61 160292 pulseaudio_8.0-0ubuntu3.11.debian.tar.xz
Files:
 8678442ba0bb4b4c33ac6f62542962df 1517656 pulseaudio_8.0.orig.tar.xz
 043475b956212671d774a99e79b8a043 160292 pulseaudio_8.0-0ubuntu3.11.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQS3BQ0q0N8gcM8UAMNrQndJMip/nwUCXcV8cwAKCRBrQndJMip/
n4KsAJ9kN/AXU1l0E279exBWPyvEWDzaaQCdFUak5nkdjXCziePgyaVn2Octi2o=
=T67A
-----END PGP SIGNATURE-----
