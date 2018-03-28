-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 5.99.1-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.5
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson0-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-login-dev [linux-any], libsystemd-journal-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 7a84bc008c64ab00153756c2696ecffcd41e0881 1454240 pulseaudio_5.99.1.orig.tar.xz
 85da0e320c8cfee9730f94f72e1562ae819f99c7 30552 pulseaudio_5.99.1-1.debian.tar.xz
Checksums-Sha256:
 589d3623c5458b2b831a107c49d16da69afed5b2cfa545353da90df1a3e84fbf 1454240 pulseaudio_5.99.1.orig.tar.xz
 79cae43cdea317f8a5b5ace02fae5707ba26126a63a7e2a473d73e9069776fbe 30552 pulseaudio_5.99.1-1.debian.tar.xz
Files:
 ce6fae362378d5b1c7d4d52235dc8219 1454240 pulseaudio_5.99.1.orig.tar.xz
 222e206b05b726980d45f2de9df594c3 30552 pulseaudio_5.99.1-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJUfw82AAoJEKO6uuJAjdbPnC0P/1WEAa76WcxjtNB7SgxxCaxC
FbxFnXNhDoNKZtZDei53IsSoUZS5kb2AaUBjREcp3cc2JqfdgVcrVwwgEfETjkMs
YnT15qkJXRpnWd6QPJg+Eumv0CEUdoYPsl3DvfutaoFG/nRNpTSWfPiezt5ugYRp
4LjSR+tJTI31438NWRmjdYt3oNVL3R093XfLQ0nr1ihqL9drTqFqKIuPWHsS84iM
xulCrFRK/SkEiSHKco0SE1wd3GWv+VGeP6G1UVrF6QPJ3C2rvcErSEqF/UsW2lzM
zbOuO+DOJSZanhsZaFNpqEHA58lFKzeurR+/FJmTszShNJJ5ulZchWup1QMuUkql
ORAWGhxkvFtsg5Cnt1SZ68/WqhHBLy9z1W/a/XAF4kXNy5K5s7c1OYnuFeuxNE10
xcs2VFjpOPsNbeNPBvmKNUPRm/QGIc3BE4BVAFEpulAW3fzoWo75I9muvdwhy5cr
UQipDbhLkLiGv8hkG0yV+SDegRVbZVCO2C+++5qEkDOffvc/DUxZZ0r5uEBIPb+/
MGq8diLRfKBj2+pDdvdTX5os9eZ0fEbXBMeOUpBVyWMdihKpBSYz4JzIxvpvJK1z
W9W4Xddne+29B4aQBFGh3gTo9HtPe6t9lQ9f5ZS0esHBcVPgnkNsN3/1KpgjIzY0
bVHcd3Ivdqosp6QyOs72
=UDdl
-----END PGP SIGNATURE-----
