-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-module-x11, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 8.0-2
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
 pulseaudio-module-x11 deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 1399a2f6288ad743184b6c2192129fef033343ac 1517656 pulseaudio_8.0.orig.tar.xz
 22478b00fcf56ee0f17883f77d9403b58b94732d 30832 pulseaudio_8.0-2.debian.tar.xz
Checksums-Sha256:
 690eefe28633466cfd1ab9d85ebfa9376f6b622deec6bfee5091ac9737cd1989 1517656 pulseaudio_8.0.orig.tar.xz
 e6700708690d1a429a35b368b2a1afc49646f98d02a347fa331dc384a7aed65d 30832 pulseaudio_8.0-2.debian.tar.xz
Files:
 8678442ba0bb4b4c33ac6f62542962df 1517656 pulseaudio_8.0.orig.tar.xz
 0271fe5e652c067431a964ea6c89aa74 30832 pulseaudio_8.0-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJXAFkEAAoJEKO6uuJAjdbPN5cP/A82UQfj6yZvfaBDGvIdtM0p
2EYJKSlMTaH1xvNGHeL8VVZrfj3lGUe7BkMCutOTcwvCqNwXCKwcN3niX064pHAj
zodbpX+xXMK1cmXUopsFRoIViveK1Ki1erGkJgUj4vr46KGD3vs4TBDPHKK7Bgj+
AGrUQOTaEOf+dvw1mndr52gJI0T4Gd+mLuF4y9b/qwNeGIUxIncwLNZDVQMfjpTv
NGwbgLM3IaNo9JoFuUydreC1pJ07ChxwDfAA/slJoi+Ma54QQAb+cCo4J6u8Zu9P
DkUv4uB9tZaxS/8lfjUx9bg+o2w/3TitGh1Vt+0rbM9jBwLKV9si5P7sHU5gwgIA
ExqmKP6kApp0joadqE8Ua8n3Rbohy0wUveKHZt+xrKQJEz1NR/bHfcCIe76L3K4w
25puSKu1FiMVZPwch7g8Ofn7p10LaK6EeIZ0v/scJLSgib2GRclg3QsX4QArJH8i
w/ohWXXTxbq+XR44Jkhfh64N0yEZ7FENSJJdHwEYfKSttDHmm4yKSDhlpvDMgPxx
vb+Gs0Cbhf0dvet8or3nvkGgT+L4+MZ84+zR4K9S8S2SGhkZvgeo6+v1Bl0zTi2N
XAu6P0lURj4xxQKAnbHLlFJnjkqQY6ygZah8n9/xFWFCT1thD41nhWJxewWgm2Yp
DHzCbm53QvdliCkJb/np
=c6z+
-----END PGP SIGNATURE-----
