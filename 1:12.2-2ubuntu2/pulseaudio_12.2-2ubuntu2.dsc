-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:12.2-2ubuntu2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.2.1
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper-compat (= 11), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), liblircclient-dev, libsnapd-glib-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
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
 310a6245036a51df6585a7ebfac75b32e073aa88 1665092 pulseaudio_12.2.orig.tar.xz
 59f032a494c6ee16bd9480284c028432bb1ff242 86756 pulseaudio_12.2-2ubuntu2.debian.tar.xz
Checksums-Sha256:
 809668ffc296043779c984f53461c2b3987a45b7a25eb2f0a1d11d9f23ba4055 1665092 pulseaudio_12.2.orig.tar.xz
 5976034ab0d65c4e444c36abd13c4d9187331c0c1cef67e3ffc85bf2a0186c92 86756 pulseaudio_12.2-2ubuntu2.debian.tar.xz
Files:
 c42f1f1465e8df9859d023dc184734bf 1665092 pulseaudio_12.2.orig.tar.xz
 3bac040235820e120d23bdd82945ad51 86756 pulseaudio_12.2-2ubuntu2.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEi8YAgFqsZg/rTRmDg0AaMLHN5Y8FAly12e8ACgkQg0AaMLHN
5Y/Eqw//dcG39bBMVlDE3s/F+tdqe+VHTd9Oo0/TaOOXZGY7kns5Tj4m9Yg1boAe
lTd4Y3f+EUN99F2F+xQH7znxlvja21LjDw//EW1JluGjhZp1/FT3xs6jgGvmcf7L
zRx+eT1m/l7/akZ6rzi5nktB0ZDCcB3i6ZL7OAaQm+PBwvrX70h61MC79a6Rg52a
y9NQRphkRLWju+2gF3lO1OXKa+niUjclw6Wwpcylw67dTdzekobyviMvthwF+bOt
6pwrkovbakQoKuCx+OZFgwiQ7hslvln3jF2Q6J00QE2LXDstJXetDp6K/TI8a7JY
Ex6DOHYs5f3hlZTTmPYcf7mCBoKloPx+vLVuVDb4b12zH2qa+qZXOdQzsHFbmQH4
Rl6o3t9nQu9AUuk3yQy42DoK5LXVqsYtohzJ9QxnNenhFBK/K2MGqMvyqRq3Fkry
cSD/wpPAQBU8z1D8mMzl2+IFdiGB9xek6Iubv6TFAIZjxxkfag6x0Q7rcyY+uThE
RxE6QYEmAALhHNOZjKcfRJj8BY1ZPnvaf6Sy3z4zjVs2H+F5gm9m+LhYbRjMfr9Y
zyzNtjkpDcnXhTgWvsa6AlDKoJLv6+YdbrevOIrtCSchmgpaiJpD7iD/K9HKbwNp
uWOwFUOCd3R5lFclCHid473JCP5PxFmcBEBZ7xpAw8SpXRNqJB0=
=YIHg
-----END PGP SIGNATURE-----
