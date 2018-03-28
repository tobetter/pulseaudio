-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:11.1-1ubuntu5
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.0
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 10), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libdbus-cpp-dev [armhf i386 amd64], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 53bde72b6bfe715c19b1519db8845f7a58346b67 1648924 pulseaudio_11.1.orig.tar.xz
 63d21939920acf37efae09615826622849ca44fe 94228 pulseaudio_11.1-1ubuntu5.debian.tar.xz
Checksums-Sha256:
 f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e 1648924 pulseaudio_11.1.orig.tar.xz
 3e86542f890774f55f055d2a6780ff6bc3de124aeb6428ddd620cad04411bfc0 94228 pulseaudio_11.1-1ubuntu5.debian.tar.xz
Files:
 390de38231d5cdd6b43ada8939eb74f1 1648924 pulseaudio_11.1.orig.tar.xz
 7204a9e2e2d6f82cfe34125dc8a55348 94228 pulseaudio_11.1-1ubuntu5.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQI3BAEBCgAhBQJac60LGhxzdGV2ZS5sYW5nYXNla0B1YnVudHUuY29tAAoJEFaN
MPMhshM9S9gP/jeZhiRz1ZSE/bdj6AyzsqNHUk7l0YifuaYZzDjTvz+GF7oieQUw
IR6b9r6wNEvmAMpZ4kNs0hOi3KZQFAmFL7JPsThf76ELY7eg67ZerXsK6H8r5d13
v18UR9T7kOniu1JjDE05ha/ETPQj6kgTvnvx5+qPxAZSqxeKHYaQVo8okh9JKCeT
ArJQKhHMHeIYlRjBzVlnM05CruYTWWh7TWnRVuhQ079g6xwDroSiV5+YImikLgW0
eiF2r3YqlIJahrJ7BCvci8IynSnM/m+R+kVEd0dhqpZr0qOIiaCysG5ecD8u8XXb
kiNKhx0HShz5GhngFQ2fFgXT29zgsApCKwlwyAqBI+PAQ3bsc4LwMqDK+69K96IX
aaFHZ+vvHwwpaVrnx00OlPRpxiKqc91dU0654yOuJvjqAkLjQl4LaTm4sZwKDMRZ
o8CmqxXdXQ+PZZwtfp44/mGgworjDvIuGd52dIR2VHXg1JOAhCj5CI/T+yrqANYT
UDoYcP8VRgTDNJ+LFLnOJy15ud24X4xKFswL8gM3MBPVf3cBThWRxWu51PYIYPa6
kGXc7L9BBdVjACA7SCsn9q7plZr6NK3Xs5OxJS8DLz0dWgWVYR2e0iWqCQNIEqRD
of17uDdyLD9+B9MC59EOwy6CmZcYvFZplLThjFMunP+x3kX7i64cGCbq
=vY29
-----END PGP SIGNATURE-----
