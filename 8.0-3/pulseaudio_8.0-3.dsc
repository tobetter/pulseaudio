-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-udev, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-module-x11, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 8.0-3
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.7
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Build-Depends: debhelper (>= 9.20141010), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any profile=!stage1
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-udev deb sound optional arch=linux-any
 pulseaudio-module-x11 deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 1399a2f6288ad743184b6c2192129fef033343ac 1517656 pulseaudio_8.0.orig.tar.xz
 8f91b0807e16a19155537eff6a00a84e9a5e9587 30956 pulseaudio_8.0-3.debian.tar.xz
Checksums-Sha256:
 690eefe28633466cfd1ab9d85ebfa9376f6b622deec6bfee5091ac9737cd1989 1517656 pulseaudio_8.0.orig.tar.xz
 f05fdf3bfd2de09f2db4bcaa54fdc1d0e456fbb139095edf7cf06692b813eb0b 30956 pulseaudio_8.0-3.debian.tar.xz
Files:
 8678442ba0bb4b4c33ac6f62542962df 1517656 pulseaudio_8.0.orig.tar.xz
 b6e2012d3eca0b3269825e90aaa2a67c 30956 pulseaudio_8.0-3.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJXGo9eAAoJEKO6uuJAjdbPLmMP/3C682ySuhJo4Cg/iy43qlBG
m/nDSv2Y+EnjgbPUHOib9YxzGhlOW7GGNYK9zG/ykRzUTy8yIZVEVo0uQOk+7qsP
A2GrBdwiZmdVGriymHPpOR0ALetjsiuEaa7a9BROSS6UC0xPAnzyaUYK7QwUMzPP
rpuYAQYe38D6dgQL9MgSRl0Jsub337E8RcNCgiAdL+w/IcJX/dsBJV4MgFqnasAC
ToAX4HKrSm2AotbVMXsemMFga8giJjYI2mXkoWpEb4GCkH11na6515fa1YTdqDXa
fdxCllhHoUEFQabj2nZnCXNmeyenE96mI8YsayfjoW941kH6nVkkw16lHkbQcGmM
o23kz1msLplkfvk7iVSl8Xqm5MuDr4RX5wEgRvFrFSUxpTPx6qvrEjWkoVOAUMHW
XZjBMHN5ve0G5veUTeIsr1UpPF4K99cbpkMfqMDctf7iZkpbpItjxBXLwh3AQzfa
UdpXJRnagHPiUNAnQYMAOayZqYUqrQfUWD8M34HQeZKaT0nS5UPPjoxMCTOzQCZq
cYaHkm3QLAjqMWXhhWpsa/90QMRACmFgDOb3CPWNAimlyn93gaEoF0FCKorGItfU
7czD5vfp3sRPBhxon6njuQgMtVRWNlDHN4No0IiNiYOHSUvb0L3IBIISd2KLhm/U
KE7vVA3gYMLvZMWwQfDP
=16EV
-----END PGP SIGNATURE-----
