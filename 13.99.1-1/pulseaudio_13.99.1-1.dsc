-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 13.99.1-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: https://www.pulseaudio.org
Standards-Version: 4.5.0
Vcs-Browser: https://salsa.debian.org/pulseaudio-team/pulseaudio
Vcs-Git: https://salsa.debian.org/pulseaudio-team/pulseaudio.git
Testsuite: autopkgtest
Build-Depends: debhelper-compat (= 12), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libglib2.0-dev, libgstreamer1.0-dev, libgstreamer-plugins-base1.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev, liborc-0.4-dev, libsamplerate0-dev, libsndfile1-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-equalizer deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound optional arch=linux-any profile=!stage1
 pulseaudio-module-gsettings deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 3a8f0c81694eb423f7f9ab5f2cb16f81c0ffceb5 1955840 pulseaudio_13.99.1.orig.tar.xz
 ecd134276d112dc2fe8254bec775a784ff3f283f 34496 pulseaudio_13.99.1-1.debian.tar.xz
Checksums-Sha256:
 e6a111cc078e6039bf657a3fd1f73dc804c8ee362ca03a0732dc5c38c13e0a0c 1955840 pulseaudio_13.99.1.orig.tar.xz
 d71ccc76072a3fd135aa5ec5b5ea9dcb01e62836fc8e8591c6da69d7689c1cda 34496 pulseaudio_13.99.1-1.debian.tar.xz
Files:
 5cafff810bd6f0bf793912981ab0affa 1955840 pulseaudio_13.99.1.orig.tar.xz
 1a49d790506a6932db1ecc47bfa50d04 34496 pulseaudio_13.99.1-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJeTpeCAAoJED69RJA+2wSWhh8P/0LxLoDpPWmka0u9QF9e3uTa
k1xpu9kquXMSF003uA1nqR9LSxFvAs7jH+41CfahO0j9xM1SHiUoAa15gGmZAqem
+u2hg9ENUKMRwK4DGphyqqH3RzIFCuTxvDixcXAgq/StXQeoIDrNERYMlUsfSHlk
SjUrG6SeeQaoGIlEalP6WTMigGNHuhKcD3337wPemUqFmy2kA5QBzT1FyV0Z5KVr
yrLet5EQZsvlzxGFeS489cKNOgIwlG0pFY3C3fVxnOr4hWZTKaHPN3pghL7skWEv
mhaWaCAaGCEJpqnZ4pzXUk+y2EW91YUTJog82IOWVB6JNKk1yNRMKcEUd5sKlVvZ
jxLE4+n0qVuDf3gNXOEemY2HsYMv1rzZNNEUKDGiBpzteEJtQXUpyQ26Q+Uu8q9y
JZPo9ded5glxguQvX4YXdzCAbhIPV4kh0WMOIynXqV3tS6eRDkI/OcxdM+UC4shj
6Wda5hoTbDFcawC5XIZILvyT08+RQkrxmtRJ58WCvxSI3UOT5jK3/SKSx5dZGbak
Ob1sNL4IS8FfrRCF3+C+kviBm9E9APPSf4+bE+V9UGi3Ux5TvMCIf+R7hsgPXWo3
TJLD6Rb1YrnFgSPIC4oyOFiGG47VdKuZJjO9AOkpeR1MrO9u1rnvM7M7a7eY4UyD
0KwUFJEaTvXIXwm7WZsn
=lWUA
-----END PGP SIGNATURE-----
