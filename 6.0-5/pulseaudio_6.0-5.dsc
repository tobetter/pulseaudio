-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 6.0-5
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 6afb8d0d266ad0618c67c6c4f42683c6cb279edd 31180 pulseaudio_6.0-5.debian.tar.xz
Checksums-Sha256:
 b50640e0b80b1607600accfad2e45aabb79d379bf6354c9671efa2065477f6f6 1469248 pulseaudio_6.0.orig.tar.xz
 4db7aaad7b04f97d0f3d08acb9c70b910ab176a454736bd2c7a9798aa912db9b 31180 pulseaudio_6.0-5.debian.tar.xz
Files:
 b691e83b7434c678dffacfa3a027750e 1469248 pulseaudio_6.0.orig.tar.xz
 59e0b1cbd1a2cbf474183879b275d2f8 31180 pulseaudio_6.0-5.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJVv7AbAAoJEKO6uuJAjdbPRU0P/iIaFjZnE/dBYz9KYnTB6vV1
/L2Dg+AM2Bpq4c2gnUXcWZLG6sUdNYvt5o/dPiI2C7mGSXyU8m35szuiYHlu3nAa
56CKW2df/y4URwsmFq5+L+vCkiJaD/TBN+3Qa2NMi19lsJeiECgUs2oVmmgVsR6e
TGhtEnCnUaxc4ZT/zXI/m7XwBDcp/RZRw3RbE5phujhg+3DfHjby5n4INWCiWNvS
DsFpU6UqJ/W0DPodtZFzpTJpBSMUP4XgDQVugBk/WsfCXFAvrGPQUDr0Yh3+1/D3
OOcoOXCA21I2oSox4n8mNledRZ2mT9G/epjlwpzPs9fet/gRVOGeCrzcutvPy0Jm
e2U2kdw/iZLbH/pFCSpp0C34VvT2YDQskfO/KSgUl6nt3MxyEh/7UFM6FWJLzxqQ
771Py3KDIfr0afAFrndPL6qCGnhaTlz0ofMjmRxzQP+VAm8n8H8wO+Y7rBtJrUhT
+l/tmlVSuxeTrHoUuSmQtW+nprwchZDnNlnSDjAiMbwT2NDH1HJk34N/D/6m8XiH
dMbN8X0GtlCssy/SHpIOKDs3v8qEL4+/oVzJ/HO+xyApKPorEVoTPHUWWtfWiZaO
bVOCkmd63tV3+0Uey41PKupavu98iNRh+yVpR1eJOpw1ymNkyYYqygL6lmChT9YV
ch3pYQ530fZWYVhu9x9g
=Xvg1
-----END PGP SIGNATURE-----
