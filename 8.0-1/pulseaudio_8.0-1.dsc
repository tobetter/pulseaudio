-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-module-x11, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 8.0-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-x11 deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 1399a2f6288ad743184b6c2192129fef033343ac 1517656 pulseaudio_8.0.orig.tar.xz
 388885e14976f64ba013c3fe45a08d169a7aab60 30036 pulseaudio_8.0-1.debian.tar.xz
Checksums-Sha256:
 690eefe28633466cfd1ab9d85ebfa9376f6b622deec6bfee5091ac9737cd1989 1517656 pulseaudio_8.0.orig.tar.xz
 02be70e3d600660cfa7f275037c2e2a64156c0604e37a940ecdd9095edd34922 30036 pulseaudio_8.0-1.debian.tar.xz
Files:
 8678442ba0bb4b4c33ac6f62542962df 1517656 pulseaudio_8.0.orig.tar.xz
 5d9001f6806a0c785257efe6d7c53bf1 30036 pulseaudio_8.0-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJWwlaEAAoJEKO6uuJAjdbP2ykP+wcC+kvtaCVqVzGfV2YINn8r
o6DJ8cKHZ9lPDhU8RarCYC1aYoeNZb4+GF0K6Z7xTOdlpz+6H491LR2zm7gaYIBw
nQZ3Iuqme9XAiyes4jUl7bvErsUOWzu01RcQ4iQ0RCcrMsSF/pFRcqYPmTCeW06G
ba23ENRwZTh+PsLYgX6YPWTK/uIwSD1d7wh+jsBcTG8oV7KhsgKlrBKSm0GYiiV0
x4CYXnMYy1q426vBpHciBn40b0zhtf80OJ0atWhdT+9dypmTvwGd6sAmqUoV6Wyl
9l4O0BFRCQimLe18opU510YJI3ydE0iaPLyYye9hJuseNmoFSUqrDQAboLGA7dF1
vd1XRrmGDRLGUSR2ty3zfTCwx/bWgpRt6A6/qixmbhjMDcGfRf02BaL7uR61dBlv
a5gSg2qljJrOTZhnP6Owa27+WrLRznAvAOQ30UJIkB8XEgqxYdy/iUCa4bqQBKbK
nJ/juaykM27kgpNmL3bIxTX+WVAt2pTr+pXeHROe2BZORZX8xeJDBFy3GuRFLM7E
v1aXHSowJWKSfQ5vR6ZmyI5JBpTVh2XSjr1VGnKcFG1Zt34FC/LSH0j2cuaP1k2C
AcNuQivj/6U8n1/wK8pEF69TO3Z6rVnlZIClzDzzYxBb/GPDFwSD/xeXw29UcgGa
nJAxLi3W/5XSFG3Fxo2i
=Ehba
-----END PGP SIGNATURE-----
