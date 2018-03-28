-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 7.1-2
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse-mainloop-glib0-dbg deb debug extra arch=any
 libpulse0 deb libs optional arch=any
 libpulse0-dbg deb debug extra arch=any
 libpulsedsp deb sound optional arch=any
 libpulsedsp-dbg deb debug extra arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-dbg deb debug extra arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-esound-compat-dbg deb debug extra arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any
 pulseaudio-module-bluetooth-dbg deb debug extra arch=linux-any
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-gconf-dbg deb debug extra arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-jack-dbg deb debug extra arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-lirc-dbg deb debug extra arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-raop-dbg deb debug extra arch=any
 pulseaudio-module-x11 deb sound optional arch=any
 pulseaudio-module-x11-dbg deb debug extra arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-module-zeroconf-dbg deb debug extra arch=any
 pulseaudio-utils deb sound optional arch=any
 pulseaudio-utils-dbg deb debug extra arch=any
Checksums-Sha1:
 dc35a8aa66c513ac989319e13a18e317d8e432b3 1506504 pulseaudio_7.1.orig.tar.xz
 cc7dbbbc9e5b55c9531d96ae6f2c3fa4bb522914 30536 pulseaudio_7.1-2.debian.tar.xz
Checksums-Sha256:
 e667514a28328f92aceea754a224a0150dddfe7e9a71b4c6d31489220153b9d9 1506504 pulseaudio_7.1.orig.tar.xz
 f3e703c6e2723f9558adc7d54343158797746a00e2485178588f3da387828c51 30536 pulseaudio_7.1-2.debian.tar.xz
Files:
 9d0a9817b632cac8e3f3834d7eb1c99d 1506504 pulseaudio_7.1.orig.tar.xz
 b6305c37b70742c2523160ff3e095d5d 30536 pulseaudio_7.1-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJWPUE1AAoJEKO6uuJAjdbPBR0P/2WyD7uc9GbNHvkdXc642Pei
IkdLVQYtAKqSObnRPZ4551+hnWz8yLiLfSQhpdr+m52bs4HTZws0JH8dZnRnthw1
e/d4vTJxkhGVwN1FtykTbLWyAW2QkCRXtRPnrYVt549sxjs7bQP+Dt7JP10m+46c
jwHJvo1ay/8w6+1ufpbHNDQZUAHYa1YM4KoJICGEbtXiYw+N1xaoKZEMBdcCH5dn
QJQaMrsDe0qIH0Sh8iwPSNHGqWnBDHDXibbV2EnLMzYZV2Xq+AIWRvKSRm9IE86Z
DfaGaD5heNYo/Rz6VlarxOh8R3C1Y45A89rsdIjoN/g8UEU/ZkUxSf5JK8SGWIxw
IPwbjx91hTwsVKXjU+GYazUp0tmrdSNqccFep10Li8LGSzmg4QHKtLgarsbW+0KT
L5kxfCWoPEMiTyBHQj4FuP2tB+S8KwbJUZC/qJGvk3VITWE3qVtb7cm4LuloCpUp
n1DI5L+p+oJBsQv7DnH/vb6vVsOsEboKp+j1bseLXCPLUh4azyEmnEApJmsSj2Iy
EyrTbo8iAMxXBYENL3xEDQp0M20VOV8kI1oK1rYm30FUK7Yg1WxQ1Db4QnSvvn7Z
yznQwrcfwV2zJcu7UWbePMmLBBxuKQIp7gUS8avofZM+WCm23x/3p2HBENYP/wep
ewvO9wIIK3sMsg9JJ7Ng
=RLmB
-----END PGP SIGNATURE-----
