-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-droid, pulseaudio-module-trust-store, pulseaudio-module-bluetooth, pulseaudio-module-x11, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:8.0-2ubuntu3
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.7
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: android-headers-19 (>= 23) [armhf i386 amd64], android-headers-22 (>= 23) [armhf i386 amd64], debhelper (>= 9.20141010), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libandroid-properties-dev [armhf i386 amd64], libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libdbus-cpp-dev [armhf i386 amd64], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libhardware-dev [armhf i386 amd64], libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libtrust-store-dev [armhf i386 amd64], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any profile=!stage1
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
 820057b5f5e9b6ec982726336e129e8c8974f9d6 138292 pulseaudio_8.0-2ubuntu3.debian.tar.xz
Checksums-Sha256:
 690eefe28633466cfd1ab9d85ebfa9376f6b622deec6bfee5091ac9737cd1989 1517656 pulseaudio_8.0.orig.tar.xz
 06492fef81caeebae1404956ef6a847c417cf82d27c0e1fce3dab0e41b68e96b 138292 pulseaudio_8.0-2ubuntu3.debian.tar.xz
Files:
 8678442ba0bb4b4c33ac6f62542962df 1517656 pulseaudio_8.0.orig.tar.xz
 345db36d1581426f923576d68dfdbc1a 138292 pulseaudio_8.0-2ubuntu3.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXgh4tAAoJEFaNMPMhshM94W8P/3FTYEYHoEA1T4HHq6oX8uXQ
5vzesGWfJ6baaZYPK03y8EDgwVsWu3k2Tjro7SxZV12iEkJM5d61d5f/u466tDI4
DSjkN0g81r1InzDIQjYhjdLJ9nAf4S0gzoJc60LMyTyLVT7m8hrsUCNRAg/h2rXa
AvOjgJMWIDBxm469KakFDVR0BJ7OkcqMoNohM1+67OkltCzseavX2gMws5VCyh00
G+UE+cTJpn6mIOM+aKYsCNlz/g6SYBLnTD9F2JmjyQptns1MgqApKcYq6BjdhGlA
O8mrGMkz71DLZUbw/zo6hGrasfKYNsoDdbKvxQnJJA3PfeegONuZbyaUqL/Cpuau
mfwAx8M7upX/NYrrEcKb2O0RdVVO/bIRwVpWbs7czMffKCUp1NygSgYN6sS3SKRM
SP2Ke+OHWgCuf6UrcQUwMBlA0QD4xvKJduGWcR+EAtmWQl28rC1lmpDn6vO2Fzi5
AHEtwR8ugSo60sxh7/nzRb2rSbglQdAks8+LhklE39rtrazeFcgB2faHDH9eaUvo
E/J4cwnee55Hk/4f0mYffXJyagWObNiVUPeuyi1t35IHN3Ndi/z8bYhwJEVzXo/+
J2i383GYbxHGPQ/93EWK5nCNqPNMJcP6Zdn0Paj90+QNSGBH5EEC5Zsu7mcI5oOj
SXeM0TmKBoSb/Xdsiucj
=AumW
-----END PGP SIGNATURE-----
