-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:12.2-0ubuntu3
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.3
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 10), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), liblircclient-dev, libsnapd-glib-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
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
 310a6245036a51df6585a7ebfac75b32e073aa88 1665092 pulseaudio_12.2.orig.tar.xz
 89eca006297400dafe5d0a90175963909785bc15 83276 pulseaudio_12.2-0ubuntu3.debian.tar.xz
Checksums-Sha256:
 809668ffc296043779c984f53461c2b3987a45b7a25eb2f0a1d11d9f23ba4055 1665092 pulseaudio_12.2.orig.tar.xz
 9960d1dcf6426d6b7767095aee73630b5e3284007a1297d0d2f82c0a66938d44 83276 pulseaudio_12.2-0ubuntu3.debian.tar.xz
Files:
 c42f1f1465e8df9859d023dc184734bf 1665092 pulseaudio_12.2.orig.tar.xz
 d63bf2af8ceb521889a4151fcce195f3 83276 pulseaudio_12.2-0ubuntu3.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iHgEARECADgWIQS3BQ0q0N8gcM8UAMNrQndJMip/nwUCW4amwBoca2VuLnZhbmRp
bmVAY2Fub25pY2FsLmNvbQAKCRBrQndJMip/n2b7AJ494AVZkXWbWTfn7H2ZZVIi
ZHx+bgCcCpbuMyp7WpM2LmAxBZNB5U5tnNc=
=i+0/
-----END PGP SIGNATURE-----
