-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 13.0-2
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: https://www.pulseaudio.org
Standards-Version: 4.4.1
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
 b2c7abc8145f049b2fcd5c6b772d3e733618981e 32744 pulseaudio_13.0-2.debian.tar.xz
Checksums-Sha256:
 961b23ca1acfd28f2bc87414c27bb40e12436efcf2158d29721b1e89f3f28057 1901768 pulseaudio_13.0.orig.tar.xz
 c8e7d74e06c8c136508fcffa6961dd248a9a17728e908e437f6ceabeb4727ad8 32744 pulseaudio_13.0-2.debian.tar.xz
Files:
 e41d606f90254ed45c90520faf83d95c 1901768 pulseaudio_13.0.orig.tar.xz
 8454971ad6e5f1053cde2d5e146955c1 32744 pulseaudio_13.0-2.debian.tar.xz
Dgit: 4ed1856df0d8a6e2a5efb843424fb971b2397edd debian archive/debian/13.0-2 https://git.dgit.debian.org/pulseaudio

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAl2acLQUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s9lQQ/8CarbvijV4IBNgMRG7ldwnyfCLBtz
FrNNP07CFOdCRnT1hjJndVG7eDJ7A0ab3lAnyqN9FVCeSalWB3CL8+r54OhC8Pb3
1EuH/i7s52IEwVGgptgeW5NjrhQUBGrqtCZi5ce5Wsym+wyCH0R+wrBxkQCI7E5A
01gT+ttM2AtSAtkY3QqQio22y0Q0uQQ7v9/ZfgRWs5eABpyIAgV3IJG6uScTU9c3
ZJHC7A2NoS1VFzDpTxm8LJxNg/noZcAwl/p4Q+2NxhVe9ZBH0n9sDRCa0ywVj4oM
+GI0DOeJiBW+n6h1TzVS8FBEEmi+smEHcofsdnzOGDdvVuei7IiANhrV4VVG+Gd8
TozBHvFLmH2KvBeyqEs3ipT059uDakPpYVXCBQEMG52Ca6ZUyWxMwP2ynY/lIuIH
jCw8ujQpL4oFIEETMh5G62RLWmmCLAu1ey7VBgyuWdB96TKxV6D193hfotM+QtYv
/V190xZk90gGqv6Aimw0bbTCAvaLsRk6I+Bseh92VJw+HGcrlowXhWEY1fiDos5a
cDbKKOecftaP5O+u+Rm6oxhkGVCNVX9Li0GDn8FsiZ4m4NcJ+H2w8hOcRDE6461S
HzS8TuzLKbWMcPVuUAHW2mz5JINX+SnL8uVEIW+3BiARPuNYBvc+L69Rbb8lIoSi
tbUZW0wEOgRmOwo=
=dMHV
-----END PGP SIGNATURE-----
