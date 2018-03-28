-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 9.99.1-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
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
 769453a2c87e1d58a07540fda8a0fd75eacfff52 1591040 pulseaudio_9.99.1.orig.tar.xz
 98dd3e0cc0b55b7600412dea5a5258e4a08b3572 30972 pulseaudio_9.99.1-1.debian.tar.xz
Checksums-Sha256:
 89d97575e2c7352ff12e031f24a851610f3cdda4b7e32455da2012fbe54cbaee 1591040 pulseaudio_9.99.1.orig.tar.xz
 14e7f4dd343a36bd7c1a37b4fc2d2a371515f8d7a5a14b44464d39c23a038a23 30972 pulseaudio_9.99.1-1.debian.tar.xz
Files:
 0044766c4a6465fd554649fc357e6152 1591040 pulseaudio_9.99.1.orig.tar.xz
 1d59094547a4fbb12b39e2aa15291dfd 30972 pulseaudio_9.99.1-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAlhuPQ4UHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s/D0xAApujDDfje/FTjbCd62s3kffk3aCDP
xUKVHLOQcLNhgMhHhG3IfxY2l1bOXJHOdRIIc36k8TlhuzhHUkI7AIy7p+y9ED6H
YRHJPhitOfbVWLftm5H1bkpqmAil7WVMTWfnJeIQKRpR1PpY8HxPL4k1ckMx9J0v
uUb6nl+QpsC/3hWIrkLYc9NIAz+mtmaO/ub+6bQifIrZdlhKZsnxiS5y6nqT+5+b
zxdw9FWttRonQ1pE8NsNwdlChPN9nMybe6XZb3hMSiCMEedTGWfDC8dtbjrwAwGl
XYEFxoYg4xnOhbaebx1GmP3SyWaD+uEr+1031uU80imDsNJ2ittL2mU5s9a0eeCH
oQWnGg96mK1B0m5EI3hVCtuEW4Nj5F2BvLck+MTeQg+/Hi6IUuKJ3XUGh2S+ptVC
1uw/f95fjqkkXp89gHHc7Fu24s/nvsu5ghJB/QC657g5yccBlnEwqOJd19E1UPEZ
4vR3ihbOURzJT6y7sYsvyuI9TjTzWHjUTc5lJn3jxyP7sZpCOiGcHDfX7jj7R46Q
Wa1sH7PMbRHfO1nYSJauz9iEV9NMT31IDPB4ftvRC5q4HvHixUghmJS9k1gxH1Ba
VzAqB+hlO29g4IAAujT6kDHcu77AyJ+Ghi21aokoiiDPpeM2KR40S/p+DsXH/0kA
XLzMkhug2ixmjnA=
=V4DP
-----END PGP SIGNATURE-----
