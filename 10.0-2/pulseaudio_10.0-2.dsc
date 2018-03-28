-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 10.0-2
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.8
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 9.20141010), check, dh-autoreconf, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-equalizer deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any profile=!stage1
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 ab7cc41a2dc2b9da0794e3a51a4eb7e82e7da511 1608040 pulseaudio_10.0.orig.tar.xz
 2622ee114a1135c7de5ece2cda70cf1a7767b059 41412 pulseaudio_10.0-2.debian.tar.xz
Checksums-Sha256:
 a3186824de9f0d2095ded5d0d0db0405dc73133983c2fbb37291547e37462f57 1608040 pulseaudio_10.0.orig.tar.xz
 6e786cafd4319d34224d781627f704ff3272e6c1aabcc2da70047eb66d34d41a 41412 pulseaudio_10.0-2.debian.tar.xz
Files:
 4950d2799bf55ab91f6b7f990b7f0971 1608040 pulseaudio_10.0.orig.tar.xz
 d985e76cba1fe989521e5132313e1b74 41412 pulseaudio_10.0-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAllGpVoUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s+eMw//VLxb66le2YQlMM67MZFyiLVFQ5Kr
+VBqUnD1YRev1rKDuuAbakuCbFGUQbdFqufmtojKer9tXDJZDb4VxRq3znywnJfr
oBVPA0AHIWm378bPZfSHghiZn3RNyt4qJza8mHVPpdr48S/Z0p3f9zCKBsL+C+Cg
blwNPps2Jm/CDx6zYJFjetS4NKFUw97nHq5ZDRCT1MNJsfR59FknyZKcW77w/152
l23faUv10lE+wtdB8kLe/KA2vuz73ct3aD2SqfCbdyR3Wfnks0woxLV8+nh0AL/2
VA4U/6nQbiJDBhzV2Qgln7xZpkagNcHEWz3+1NZqjG38mmv0iVkxnCNlw9YYRRH0
81my+YRSevdoPD0qT+k5h05OA4nUWE2TTM2Ajt6dvRFz91Eh5JLp98uz0ppPvB+o
k5PO36Hx6S33a0RZvx7DzOtBKeWtWNXGJmw4DKXsDZ23loAJ5hqCzGrzCXYQ614F
Si4bTjx1SzQqUAaJjFnvwWNXfp9RNm5ZD65EbTmEA3vFqoMCjOe2e65gj8PpETRj
8394zkGad09wIfSe0e5+8ojnucIG23iBfpkwfn96EF+5T6+62AyWSodLXli6aRGh
RA+brM646whfA8uRg85FmVe1rp572VjBs2dHR+6kuVh+g5C1D0yH+ZABELwKGA86
5nLJejT9nezSBR4=
=VFF3
-----END PGP SIGNATURE-----
