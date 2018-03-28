-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-droid, pulseaudio-module-droid-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 1:4.0-0ubuntu23
Maintainer: Ubuntu Core Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Martin-Éric Racine <martin-eric.racine@iki.fi>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.8.1
Vcs-Bzr: http://bazaar.launchpad.net/~ubuntu-audio-dev/pulseaudio/ubuntu
Testsuite: autopkgtest
Build-Depends: debhelper (>= 8.1.3), cdbs (>= 0.4.93), dh-autoreconf, dh-translations, intltool, libasound2-dev (>= 1.0.19) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.40) [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk2.0-dev, libhardware-dev [armhf i386 amd64], libice-dev, libjack-dev (>= 0.117.0), libjson0-dev, liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsbc-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libtdb-dev, libudev-dev (>= 143) [linux-any], libsystemd-daemon-dev [linux-any], libsystemd-login-dev [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 pulseaudio-module-droid deb sound extra arch=armhf,i386,amd64
 pulseaudio-module-droid-dbg deb debug extra arch=armhf,i386,amd64
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
 9f0769dcb25318ba3faaa453fd2ed0c509fa9c5c 1392072 pulseaudio_4.0.orig.tar.xz
 b441bda8bd8b651e68e5c9858b42278069fc12c7 96128 pulseaudio_4.0-0ubuntu23.debian.tar.xz
Checksums-Sha256:
 35ceb36bb1822fe54f0b5e4863b4f486769fdfb8ff2111f01fd8778928f9cdae 1392072 pulseaudio_4.0.orig.tar.xz
 e09b64e2624bda980379f5bc9059215ab5cfa1aab805306f13f5ed24c9ab0ea2 96128 pulseaudio_4.0-0ubuntu23.debian.tar.xz
Files:
 591f211db2790a7e4d222f2dc6858db3 1392072 pulseaudio_4.0.orig.tar.xz
 08b63850747f31db8cff822173594c81 96128 pulseaudio_4.0-0ubuntu23.debian.tar.xz
Debian-Vcs-Browser: http://git.debian.org/?p=pkg-pulseaudio/pulseaudio.git
Debian-Vcs-Git: git://git.debian.org/git/pkg-pulseaudio/pulseaudio.git
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJUxk6UAAoJENFO8V2v4RNHHCYP/RHFhvHyCEvvCgxROMAMkmky
g3h9TOGNTd8e8HefwEgx4UjkPEBI06KpNAa8jL21sQqgy/HY0qO4wK1v/TncHuQr
bYa9wxH6++EIBnbVqst+ZyuacCQcWUzszzC9aCmqXWLnnx1PZY6wdL/kqJO0zVOn
6Cqei3xqJqLY4zJq0DDi2UjYiJhRNt6EViToQxy0FuKvIIEbTfNeYhRRkvvEcV7Z
LXuypsSFxnQlDVsn5rCNvPlgvZAbbhbNy/wjagmMS6wZ/a/Vzyw+xd2DdNSAHNJI
ICpsYTka7iDo1uJpr5kshePGM00H2Q+EdaPKJJ3f0+orx79EA21eaavG8BbTUzkO
7/au5Ca01pPo+Quva/mO0Zx/8r0D2g2VB0b2PLtKtuVk/455dveFvlUEp8bjowzO
5zO41CLqU+Hj4VZZ/O8QYDtcgFtbVmqRzqH4M2OgrVmkZsxMrY9SDS1DDhTkd9mk
v0xOhDf2lS5h9Uf5rFbJyoq1PdhQksT3vn3n4LO8+nvVlrIOFh2mf44KHLpkedir
EUU/dawpZDJHUp6HR/keLl4CIwGD2kgLaAwojHmlbKvlOsZcsBsgrA/b3kjbAdz3
dXEZPmNDgwbC7ZIQXs2/XAZJgUcFkGpJxXJWYfuAOXrHXWSGDVYvDJyLEM1MdjRZ
yePVOIHN0eHehh1ubMPA
=7LNa
-----END PGP SIGNATURE-----
