-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 5.0-6
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.5
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), dh-autoreconf, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson0-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-login-dev [linux-any], libsystemd-journal-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 e420931a0b9cf37331cd06e30ba415046317ab85 1455428 pulseaudio_5.0.orig.tar.xz
 3144ef6f189fa30487156e2f3831b80b9cce9982 33448 pulseaudio_5.0-6.debian.tar.xz
Checksums-Sha256:
 99c13a8b1249ddbd724f195579df79484e9af6418cecf6a15f003a7f36caf939 1455428 pulseaudio_5.0.orig.tar.xz
 7dac01ddf767584f37bafefa2cbc8d75e7841d5dcefbc4777af1d6d62663b856 33448 pulseaudio_5.0-6.debian.tar.xz
Files:
 c43749838612f4860465e83ed62ca38e 1455428 pulseaudio_5.0.orig.tar.xz
 a1fdda21ebd192cfe05e4108e9305ffa 33448 pulseaudio_5.0-6.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJT4CHdAAoJEKO6uuJAjdbPck4P/3cGp/MZSDseDcuyabgM5Nqt
f7UT4S+I40EstJZNG8sSNVJrrMNHaAzTm/ilaB9RrhDgw2kmSjc41XL2Fby4X3F4
04y6JbBPvAI+NQFuayS/81XgUqqDxk2iVhtFGGH+h8CHYWl7GyYUSPg8KxWX/rhO
Pde03eS4hyz3QbPGoSaHMjj8YpJQL03UsUwcacKNRIdCwyn06T422GXmYuFtZbjl
kTVBxnnJ+TD4sKA8zAckW0e5qAtBULOCy8wuDakihIKE5UnjIh505EVDRI6WLLXK
8Kh5RswnqNpCn62+LKPyf6ChMSSEyraCTNdOnMuINljP8/HoeXYFygdjusN3Puqm
KUhkiA9yoyxozMZM+2juLPlokIfqkI9eaydQOqLKFFo7B2jGvp4vBtTCj8OvxV0m
Vdjs5a04ipsHdv5JAtsFw9hng/o3W1xFcPbf4SmqraUr6Qq/DOiLYNpkH14VtgLt
4NU5Q23mCpavmWgsKFkXbrbwtrPXLFfgju5DS/e6yFxgZlPyfuYBgKRQDIBTHoZV
2TsiodSB42SfmVmFaf2JBGPhM+GhPlNmRKfcPGoNX1SEy3IBTm16ZXxC7m6SxksZ
QnlFDenYs9AaMSBKWCqBEOFnMpHSkMGPLtAbOGIuZ/rkEuuLXABtv2I+NCLL9+Ol
RnDXLGKVtxfRwz2eyp6M
=cwAa
-----END PGP SIGNATURE-----
