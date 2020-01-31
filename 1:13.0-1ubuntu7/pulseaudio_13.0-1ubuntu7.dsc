-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:13.0-1ubuntu7
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.2.1
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper-compat (= 12), check, dh-exec, dh-python, python2, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), liblircclient-dev, libsnapd-glib-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
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
 68fc8158740e1d6d9366e5104ca7455be0d3de36 82160 pulseaudio_13.0-1ubuntu7.debian.tar.xz
Checksums-Sha256:
 961b23ca1acfd28f2bc87414c27bb40e12436efcf2158d29721b1e89f3f28057 1901768 pulseaudio_13.0.orig.tar.xz
 480579fa149c4cd815f6f27d695fa9d51a6e7be1f53ecbc607b2d2a8723e89d7 82160 pulseaudio_13.0-1ubuntu7.debian.tar.xz
Files:
 e41d606f90254ed45c90520faf83d95c 1901768 pulseaudio_13.0.orig.tar.xz
 f465dbd06cc3a5d2fea6cdbafafdc70f 82160 pulseaudio_13.0-1ubuntu7.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEE1WVxuIqLuvFAv2PWvX6qYHePpvUFAl4XK6QQHGRva29AdWJ1
bnR1LmNvbQAKCRC9fqpgd4+m9Z6fD/sGiVu+bQ/mwr92SpoayRQgtoyLKGuce6Mw
M+xlE1Q7hf28ODwcv8HrZsA3DIZ/W7DfY/CWCICF1hTI+Ry20sKVwwphzhuV4EEh
yI2Ivw6TytiXmuSKla+2EG8Gkdlc4Fijb8s9LyQbMvrTcH7vv6rG+fCQqGzPF/dk
kOZC7E30u5kXSQfJNmQWtQvo4s0HOkIhBaUl5T8fKKRjQ7ELYUYPDcxCdC7oED6P
J/x3mseC7ohCzDq95Icj2m/9EYdpxFVTv+WG5lglTpMIEnrKDHWwmzjV2SIPnGZf
08bcLoaXyUGsnjUjdv5tm1N+xiWjXA6Z3CMHGv+7suZeij7mqbs3smBONH5NP+h+
17argfld/FUZo7vC8aoKsK3mV76RXf3H6nvHtAJhseFa17cYKSYcT7ukyDCKf2er
MUDO7BS/IrgjSgoXvX8UWmT1wfONrLjFeeuCnMZIQtojSSjzzFv2+D06cf2bb+pA
cn+ATrI6UzVE9WnxfePHDRMDPwxoxwE8HrR+ew1wPHAN0hVxVFl5kkyEaQXR6pBy
wF+CKHveKTKQpsMeiuwd9pQigxBseDW6tZ5XHx/6nCPK8iV2rP+Xa3WxgStKBQsm
s1MJm/YniPF4Ntjk4/g4J2WshCluPSjSoUMTXCbv0Fk5dCbAq6ADdIicl8zRGFE/
raFxG168zw==
=wR1I
-----END PGP SIGNATURE-----
