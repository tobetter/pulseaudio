-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 10.99.1-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.0.0
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
 5efa4d10a33c7aca6b50462bb133206dddd3dfc1 1635836 pulseaudio_10.99.1.orig.tar.xz
 b105bdb7a508869e2a8b1470a4944e89aec51bf9 41460 pulseaudio_10.99.1-1.debian.tar.xz
Checksums-Sha256:
 c9791844569d8d0adb468c183d0d9fb6ac12b9db34a4a078a7773c8bac993f32 1635836 pulseaudio_10.99.1.orig.tar.xz
 c456f79cf6865d12367d95e0250b76fb04e604657d5971d69089912ce563463f 41460 pulseaudio_10.99.1-1.debian.tar.xz
Files:
 ed61155c1ba8e22ad147024d0f284d06 1635836 pulseaudio_10.99.1.orig.tar.xz
 84746eac1f60c7e9f40fd8916c5203cc 41460 pulseaudio_10.99.1-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAll4o0sUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s/3YBAApK2jNV44znLpfh2evCkpexr3Tk4H
XKGDoIxCNWVDCoZ8DF6U9NKyM8wSlEWUTN+Ucks2nnRRwGEKickXpyEFBjd5nsno
vAK3jfVaOqfDOj1KaDsCcWZyLE6ILEVsuTYMVP8KLvf/Js29OkPCHZRMhGRsgyDx
VVsqneJqw0xiwnWwCstr5y35q0R+1h1rwDTk3LV2eDhjg1t/5kUCTwYVb4m3+L2L
bL8kllBdvgC6tflzCZ0w5DOy8Ax/yTWsI/C4DW69REW4eD2CJFhM1pOMU9kFIdQG
c8g4/cabUyZKjwLpBipKBnCPR1iGT9BOvdODO+D4B7ci0oUMMx81x4f0lsZ734Ci
AxT9otqkyVpO7uyjR0VEC5kjPsoIOhJUuGzSyOj7al9P5DQZAxBMDnhdcP178FLJ
hb4WTM+U2myc+BDBsO4VD1Yy4O7BPkZ+CRUPjC5RvgeOO6IYvawcaQIpxqb0+Kj3
BAn/g8kybw9nIJORLW/UoEu1IHEXkMgQtZjyqftv5aw5d4Xq8D6KBwSrRf21Xq1T
xO9MS8f9clovRqKjAMcU8ym+/X76lh1adczsXsXli8edUfdjNKhU1mCmNxHRcOT2
5GH12S503CE9I4OT2yHjP05EF0H2H8it7gtcIFdKDea+NvylV2IFmNgB/grlMXT3
/0f6pEJFbgHTgo8=
=mQlI
-----END PGP SIGNATURE-----
