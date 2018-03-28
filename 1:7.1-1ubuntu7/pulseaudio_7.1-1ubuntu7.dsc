-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-droid, pulseaudio-module-droid-dbg, pulseaudio-module-trust-store, pulseaudio-module-trust-store-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 1:7.1-1ubuntu7
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Testsuite: autopkgtest
Build-Depends: android-headers-19 (>= 23) [armhf i386 amd64], android-headers-22 (>= 23) [armhf i386 amd64], debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, intltool, libapparmor-dev [linux-any], libandroid-properties-dev [armhf i386 amd64], libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.40) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libdbus-cpp-dev [armhf i386 amd64], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libhardware-dev [armhf i386 amd64], libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libtrust-store-dev [armhf i386 amd64], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 pulseaudio-module-trust-store deb sound extra arch=armhf,i386,amd64
 pulseaudio-module-trust-store-dbg deb debug extra arch=armhf,i386,amd64
 pulseaudio-module-x11 deb sound optional arch=any
 pulseaudio-module-x11-dbg deb debug extra arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-module-zeroconf-dbg deb debug extra arch=any
 pulseaudio-utils deb sound optional arch=any
 pulseaudio-utils-dbg deb debug extra arch=any
Checksums-Sha1:
 dc35a8aa66c513ac989319e13a18e317d8e432b3 1506504 pulseaudio_7.1.orig.tar.xz
 8aff93186a82e8947c7e77441ece603e219d00f2 140872 pulseaudio_7.1-1ubuntu7.debian.tar.xz
Checksums-Sha256:
 e667514a28328f92aceea754a224a0150dddfe7e9a71b4c6d31489220153b9d9 1506504 pulseaudio_7.1.orig.tar.xz
 a0d5f110bf686433775a099236bc7a0c0a779ecb8563b54aac3a0d2d44cb1cca 140872 pulseaudio_7.1-1ubuntu7.debian.tar.xz
Files:
 9d0a9817b632cac8e3f3834d7eb1c99d 1506504 pulseaudio_7.1.orig.tar.xz
 cc759e0db6720272c0da699e5cf600c0 140872 pulseaudio_7.1-1ubuntu7.debian.tar.xz
Debian-Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Debian-Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJWtJUPAAoJEL1+qmB3j6b1+U4QAMQtTeO/W70kSyhpe33OXh10
gpIU0PNMIeM20G37UI8vYfJBWmEuXHa+16aEeNtrsSU9RzV3mNZsiZfr1M2CSwqn
iGSqLapMVBETy+c+IA3oQ43BnhT6VaQyDZ0hnRyeZ1/DKonAFsNNLgiP/WObEc8l
QT9v5S8S/FlZHjynBXaWzKbURhIab2yBYrnkZHJGxqNMMMB1KI2cq71KoTEdMf7w
Lm4LYfMVI3lP51zNcOZMm4MKRn7PGLJwTh/wbt2sFErw484x94+stprT9LG7JpHA
Gj9zvb3S+KG7WwlZiUss5OMLueohpC6FZb1m+ONrHGPKcHzhJgkR1bticzXTg2/c
kjVy8tNWCcS3O106uqInKGWi8KYQx0Y0e/yBUyh+0g49WKDrFd4rHy96daPxIcQO
SbOJYIi/41oZT+Xwrjj+x4OQ1rvUxY6bShgeCU7yvzWSaY3orhwTLdE8M0B9mXbg
2hayusD1wXZ4uW7UUkAAl6yu83S10UWjzQVmaDGKH6K8BwKCq00kue1X4Nqv0ETB
3CedP6CCVact+jnCSQ1t39mBbbPG2G9UNFWddAZvifYMGK4VYaTiaCvGxm+lgCNu
PCWhxpfl4mzEjg0TQXBbyKogPSM4AuC49gNoG47+QtgCPfTembeLdQx8jouA8Ry5
HrKOBOtBI8dIcM2u65d8
=unpB
-----END PGP SIGNATURE-----
