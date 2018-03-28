-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 5.99.2-2
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson0-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 8e8db69ce01c9c12409af27b86d5e9505a1a666d 1454516 pulseaudio_5.99.2.orig.tar.xz
 7c148f7582d50ab17bb51c5ab850eaec351c98fb 29688 pulseaudio_5.99.2-2.debian.tar.xz
Checksums-Sha256:
 877fbc19c5928ade11c948814d0d444673c39a8ec5571d331642f3327d2c86fe 1454516 pulseaudio_5.99.2.orig.tar.xz
 83ed60b586a19c5dc996240641f4c65df22c7a4265259f245ce039c4335c26c9 29688 pulseaudio_5.99.2-2.debian.tar.xz
Files:
 7525a41b1279e7b01baf94f764945c1f 1454516 pulseaudio_5.99.2.orig.tar.xz
 bd619d3d23532a8821c952f3432150eb 29688 pulseaudio_5.99.2-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJUmzNyAAoJEKO6uuJAjdbPfFgP/j1i150ZDZGr6KTWraHk7kBS
x4WN7SnNAW+17MwsIsCs3LFYbtYZp/vqzwPHHV50CJvdPK2Ki7Rcvo/jCcNHd/9e
/hv2ka7M9y1h8jX/NjL0ZF9oIIgKVIaga6o7FJGRYU3y6zdEvl6sUbg3SLn8mlIP
2NY1ave/gCGRteu1p+sRQH+zeVq6foBld01mDhdOxRV4koYSFrBrj4oSKHY6YRhT
S/LNVN1epMjcOxR5Nj5jjTVJQy07s3BRu3jfFcW6QneLEQ+stkHUcRRzpBbqQHjV
3QwUzUbIHGfxnNJYoQcTX7uDLrmVZhj/nCn0MGkAn+5/FfEqiWY0R8Jbcn7gbHi9
MSnwx+osDPkeeryCFTPkM+AdsPEuzoaQElwD9ngtWYhrxRK89V43PtsudPOEWtzD
cOhCiwDhGJw0pfrOpNVxguwdwbNWJinTawjs609DZ7mbMhNVv2+jC6EQ2/nOGlz/
MHoM8LnVpfBDa8XmzZo8AjkUNEw8fC8cnjIZUzgg1jBF01APpGGUkGtK+rKIJa5I
dEJvRRaK9mthB0Fi05wxLqRrg4zehv+awgTpH8GzruGUtO8B8GMp+Zt7OBE/sE6/
Stlzwz3+CEwdp9OwB3EWzqOSUSAsqY+DNh40m7gMAYDs5SUm3VnfK3/etSkcvcsj
O+glfho5P5XcgaaNhb21
=ETEQ
-----END PGP SIGNATURE-----
