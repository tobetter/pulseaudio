-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 6.0-2
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 3607d523fb270d9b68463de30f5d9e17957f1088 1469248 pulseaudio_6.0.orig.tar.xz
 c69ed32da933eceaa1f37fbb53d603787c4a2e78 31036 pulseaudio_6.0-2.debian.tar.xz
Checksums-Sha256:
 b50640e0b80b1607600accfad2e45aabb79d379bf6354c9671efa2065477f6f6 1469248 pulseaudio_6.0.orig.tar.xz
 5c300d1268f26c3fe6d47f70af9a0713304efc614b9dd634df16baf50a7e66ed 31036 pulseaudio_6.0-2.debian.tar.xz
Files:
 b691e83b7434c678dffacfa3a027750e 1469248 pulseaudio_6.0.orig.tar.xz
 ea896010cebea50bb57d060af6ac3a2a 31036 pulseaudio_6.0-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJVPktLAAoJEKO6uuJAjdbPfsYP/1VIWmxSx0txELYXynvY5rPO
YPt41RmCJcHMcocIkTqRoYPK32/fJq5nvKwHWmbVkh2tTZv6tovgqdmGtuWLmvG3
YH7jzCvA1iOXXVHqTeEC4eR11LCT7hJ6QU4aSmsELAhrYSWtFcIT9DNxDpUFpsKa
Xm0ALplw28R9rdyZNbu8sbqZdAfwYNp9A/WCAB4tVZls+CmFGWnAu+LWjrGzAQPV
oa0+zb5SmQNcuKIVQ9iJAG7ZFritSbkej15lbNesje9wQgEa7BUvOQ+m4bbQcD+b
5ZGnIUBZoDDMfo28UMJ74BohLO/45nOEUn3PWdhsKntF59hXluUMcmJzGXnObdt/
dV4a0gGzu7403OAzeIvFlXihfUMvEJvw9LRp1ATLx5gpR1T5hXRffHDxWsMV3jQA
MPpFUkf9EhodcKH5hM3LKc5mPpP8Z5tsTjauTKaSFeeRNTgl4x/baBgFbn4kIqQp
z1LGEzfRt+tSPqXFHcTEF49yTkmeCu49CQetbcJiSG+uOrJBARFTBW3bQkvxkAYI
3WpNxuaUcCwZVRvGTrUM6LcxLfgrqMxF2g7e1sPC/cXeXEX6WHj99ff0mN5jPX0S
R/UlxUuo6SY5zf94AggE77Fd2dEVm+cybuV3wbBEyNNGIyTgOaY4O5O/rIFvEoYI
HxNYhda59sOLyGDqtqqn
=Ptaq
-----END PGP SIGNATURE-----
