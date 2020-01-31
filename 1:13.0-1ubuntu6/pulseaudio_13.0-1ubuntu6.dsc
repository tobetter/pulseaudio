-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:13.0-1ubuntu6
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.2.1
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper-compat (= 12), check, dh-exec, dh-python, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), liblircclient-dev, libsnapd-glib-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
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
 5eaddf85b53e741f4cd92b6aef509d3f7d8ebce9 82140 pulseaudio_13.0-1ubuntu6.debian.tar.xz
Checksums-Sha256:
 961b23ca1acfd28f2bc87414c27bb40e12436efcf2158d29721b1e89f3f28057 1901768 pulseaudio_13.0.orig.tar.xz
 073039600a227f091f556cea9476d9d077a77be0524b59f48b4d503440274e43 82140 pulseaudio_13.0-1ubuntu6.debian.tar.xz
Files:
 e41d606f90254ed45c90520faf83d95c 1901768 pulseaudio_13.0.orig.tar.xz
 91d31a33a9b1564accfd94f4a25ab413 82140 pulseaudio_13.0-1ubuntu6.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEE1WVxuIqLuvFAv2PWvX6qYHePpvUFAl4XJpAQHGRva29AdWJ1
bnR1LmNvbQAKCRC9fqpgd4+m9bnuEACmOKwZLsnwPcVleq2G1AjIMgWCjuFJurej
dgHD63OJqh2OwFanmeyW1dLuOOZxe40yh4c+uE95xAJFxdRGrHIRzRGE34bLv96q
3Z6P75K0svh79SUu7zJkDJ8h1bmDAQoWon5HxD0lujiXercMFZeH6QCRQK9uLf2N
JXDafELu0gzaLsrGpMrNcbxLwp9AiUFXa6mRBlncIb/zTWUVCPce0yJAnNGXunow
3lo0SBWOm7teiyU+BLvrsrdV4W0ZUMyagfbm6LLgsvbgDUDTZeOdIb5mw/isTU9G
/wIWG1Wz/LbhusJWK8tA6tAHq8gV1oex7w1myp7m/5P/BKZIYub9fOXYa1r7n/xA
2fsiUo7rL85awbLo9PsF1ZSRLo81GWPJZUSEDrq71XKM4/jZrpnvD0LBYwItf0Vo
6JRidRNvLo2sjSP6qzBtvi6gvTJ6nKWdN5WeHY1gcBTH+nqJQRawjii6kdcrLaWa
rWCZtadoiKE2ed5oDW+xiTffnGk9qt5aCFZa77K64+dnPAg5yhVJNp+l3xAl7Fjf
S52xfkPpA+Cmt+Xf+G2ZZLA/a0V3Fo/Ql8F/jGae4nA4hJCYrTy0Qm/sRD1H1OTa
/zHbROcHfxdQwsccInBHzSyKCi+TUqMOy1TyIo4jE98/sjh1PXTj6GV01wEZhZx2
P7fysvlJEw==
=xUZF
-----END PGP SIGNATURE-----
