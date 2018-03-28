-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 10.0-1+deb9u1
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
 5a53d9b128970e7298c03285b1028d895218bb63 41516 pulseaudio_10.0-1+deb9u1.debian.tar.xz
Checksums-Sha256:
 a3186824de9f0d2095ded5d0d0db0405dc73133983c2fbb37291547e37462f57 1608040 pulseaudio_10.0.orig.tar.xz
 7fd5a9de718e264c9de828a03594edcdf3ec59dcf470c7abe46097448b5315a8 41516 pulseaudio_10.0-1+deb9u1.debian.tar.xz
Files:
 4950d2799bf55ab91f6b7f990b7f0971 1608040 pulseaudio_10.0.orig.tar.xz
 0ac7528826175b4f2ae02d725a19cbb8 41516 pulseaudio_10.0-1+deb9u1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAllS9o0UHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s+PaQ//e4+aajdMJjyNVo8n/uFcw84fZUtZ
3HOLszXEJQJZcANgzvoT9E7wU1wHvxERnZe40dbxWzW6751mTBVjKLcSJsbuqSnR
eanF7fitoZy8ZGIIkoqakudntD0H1EEluFcArDgMBuT4sStHPVkbCfEFur7FNCbz
ThDUI49mXqg/M5LtuV5y5IPsE/XOFYCkXrInyVnY7LUCFMLbFcWc7I4nusbtUma4
V67dQBHAwxoIAXF2pe3zHGIy6mLvAFfYFyFWBlvc+fdQ4d5kg9unhxL8RyEqIEYb
f5Svs8z3EdoR1cE+9gdNK3+47GcJrK4fuBga9vbRlkwFavT/0XGxd8hUD/YQRIOK
/RSPbgAcUPk5iLFPts+SwGwxjIESZ4uMt8M8kR6DXGjsTg48hhyW1G6r16TsUv0e
6zv/ipOE/OFsQRXaHcN/aSXJX2WB6nxN6jf5QNK/6pThkLnuvkSf46j/qFRr86bE
IHK+13KGA9eOrF6MBY3TwXsp0Vm++VqavuJ0OXl+1sgJrktVO1m7UPrUj1p6R7/E
e1IazMAloAJXeoY0mF2trsyVP/gdC5DlpQBHWcgg9qAT+zM87O8JPUWIdGs32Gd6
mU+OOQCC3L2nd0I0gjqyLncczcnuIv27hv/F6+PnzUjJYCcz/TdUFv7lrfG7dP5d
cZJoScKeltbJuBI=
=pSV3
-----END PGP SIGNATURE-----
