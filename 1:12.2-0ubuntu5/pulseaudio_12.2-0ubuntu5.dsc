-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:12.2-0ubuntu5
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.3
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 10), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), liblircclient-dev, libsnapd-glib-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-equalizer deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound optional arch=linux-any profile=!stage1
 pulseaudio-module-gsettings deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 310a6245036a51df6585a7ebfac75b32e073aa88 1665092 pulseaudio_12.2.orig.tar.xz
 e968395e098d5289127c6585c21d90c509fc34f5 85892 pulseaudio_12.2-0ubuntu5.debian.tar.xz
Checksums-Sha256:
 809668ffc296043779c984f53461c2b3987a45b7a25eb2f0a1d11d9f23ba4055 1665092 pulseaudio_12.2.orig.tar.xz
 d01f013508442c40b75dec6fdf66e1799cc5be20408ce982f9ae193b80d5d77f 85892 pulseaudio_12.2-0ubuntu5.debian.tar.xz
Files:
 c42f1f1465e8df9859d023dc184734bf 1665092 pulseaudio_12.2.orig.tar.xz
 628110139b117a4db68fa670f757a889 85892 pulseaudio_12.2-0ubuntu5.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQJGBAEBCgAwFiEEbi1BlW4M6OBFsyeqTc+O63QuJ8sFAlxia1oSHGNoaWx1a0B1
YnVudHUuY29tAAoJEE3Pjut0LifL23sP/11Io9kNzUIBpoXRYGb8bniSesAgZxWK
O9nsgCE21pq8Lbuu39Annizn1dsn7x1dxD/bhBhse5jMC2TRfkG1/8HqUce6/7dt
Po+nn13sQue3xtFbWrtDeb2AD0AgW32jDeVh8Tla88/pxdannSzrGeA+39Y3GXlL
8WsWAIl+6IHa/SsYxHsIG/ZIqfZO2KyxU2QcBCGrQURVWebKINV2NszP7EV/ZIse
zQ4EqQqOh7cyyL8fbWvTJA0KmfpIY+GfHOXoBCJgIEw6rlkQRkavXsLS7qKPUwYO
sPvkrZUFBTHLTeq5Yp/3kikur6qFYoGYyheIAPzW6kRrrNmZ+gHPg+Sd218u/+M4
cB/oJYhoTUOvUVZ5T6r9XS3aK2X9s5EG9D9R6o2Ufv8A3rpCoGSlz3JnaUAyxiwg
6bZG9U18zQsCSxGH7Py1E8ZWqvLsfpIWxS9S7e6+ooJkW2IgUpedEBkEUkn7JJOj
1VN9+Qr6io2dhJ5IoVvgddmA1SH+5V+HgWZfxkKK2zbtJp3HOI7GaXmFV9n9L/qX
FYYU6NXwijwmp6pq1SzgO0NB0oZ6XS6WXlrHp972aU+hf6JKmHQID6AKEAmsT1Ys
rTdFrrVxr0thqjXYwVjeIUi5Xn5BUY5ABfu+c/40R7h4gBHZFamsR39r1N5f8Y89
bzzWdFT/ljL/
=c5+x
-----END PGP SIGNATURE-----
