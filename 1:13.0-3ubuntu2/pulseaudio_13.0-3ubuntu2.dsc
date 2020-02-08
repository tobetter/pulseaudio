-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:13.0-3ubuntu2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.4.1
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper-compat (= 12), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), liblircclient-dev, libsnapd-glib-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
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
 dd07a49f09821913c5ed1b131ea7f85f27085d0b 1901768 pulseaudio_13.0.orig.tar.xz
 b241476815ea762c7c5c7af650ad8ba00321c403 83280 pulseaudio_13.0-3ubuntu2.debian.tar.xz
Checksums-Sha256:
 961b23ca1acfd28f2bc87414c27bb40e12436efcf2158d29721b1e89f3f28057 1901768 pulseaudio_13.0.orig.tar.xz
 56dcda885739d63f16d46c916d404cdfdd6fdac6b612a713f9fdf51e503add54 83280 pulseaudio_13.0-3ubuntu2.debian.tar.xz
Files:
 e41d606f90254ed45c90520faf83d95c 1901768 pulseaudio_13.0.orig.tar.xz
 a89ce19a0541ee2512ef7235d251ac78 83280 pulseaudio_13.0-3ubuntu2.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEE1WVxuIqLuvFAv2PWvX6qYHePpvUFAl4+nVMQHGRva29AdWJ1
bnR1LmNvbQAKCRC9fqpgd4+m9eU+D/42dA1aUEOWm9R2Z3jK6gJIffJk8UUVQ6dB
XBP9rQ4zsDvU3R/3xMgyr2/+p2AXGeCZ1IT+h8l/VA2njAxyuPNqDxCh85Cm6F1M
VPeQvl0XBXwfYCbTmM4wjq1nrng3vDJVV2kF9wBJJX06CJxHqIYTRT4p/14kYRQI
RJNJjSYph9VmcQUKTr8neS1mIkO5bXO0OX+xNpU1ekxYGTP5f+IKdRIGwK1JBjCT
2uivU+fW3LPRlP9rjfIGeRHLyVUNnPmxhHZPeC/uAoJNLRNZCNSxjdTtisXsVD6H
F69UhmVo3sBcL4s7ELwmEfooxHS8deqMvIvzOL9BoJ2lfko29sutEUgXglq7TlwX
U1e4CvEk9s0bmLopJXnAh8rcdAj8+Bwj8zEuUDVUjr4YRsoPH0T276V56BLoYU+U
FzEKU2LZdSPLLk1EFMu/4GGrmrO1PVg+cP9KVCrnpE+qm01ozVzycLHwyIxdtMpG
UNHeLQ89YibRLIQ7SA6fg7JV6u/sMseviOgSrJq535eBuDN+XO1nQPgs74S3Hmw0
GB/Mmhl6GF5Kc/cXNPjyKGBduQmJM/ZwM75qjiyi793X5z+KkIq+yEnBz5ZOGt12
iHK5hfbxQghG/HGRw9+pwn+grLuZBoOU/W31OCYBN1Qs3b1FcqUnLWeGUjKITyPj
11f1i/is1w==
=yLDn
-----END PGP SIGNATURE-----
