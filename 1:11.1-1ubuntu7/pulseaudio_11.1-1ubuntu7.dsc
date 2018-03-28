-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:11.1-1ubuntu7
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.0
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 10), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 fe77f5b50c7c16e19832312ec09e6dc339e8606c 94712 pulseaudio_11.1-1ubuntu7.debian.tar.xz
Checksums-Sha256:
 f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e 1648924 pulseaudio_11.1.orig.tar.xz
 87ee836a443257167013e9cfef7a4be59a9fca1dff73480a0eb9942349af9015 94712 pulseaudio_11.1-1ubuntu7.debian.tar.xz
Files:
 390de38231d5cdd6b43ada8939eb74f1 1648924 pulseaudio_11.1.orig.tar.xz
 9176f1cb788bd9440035142b3fcc99ae 94712 pulseaudio_11.1-1ubuntu7.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQJOBAEBCgA4FiEErEg/aN5yj0PyIC/KVo0w8yGyEz0FAlqpwekaHHN0ZXZlLmxh
bmdhc2VrQHVidW50dS5jb20ACgkQVo0w8yGyEz21jg/7BMz4Lw0DxSNlZNE8ksUy
esxaxmEARh0MDtUdWo3wl099mH5nZXNBVUiQNCCj9UnQ6DFpPoSGifOs0PSCT3IH
F7OZ/7DVW1AjwnEOhWxWkPbldppToEmBw59dZGj33kX8efwjKgQly0NDbcBYXgRF
Tx2Ed3X8M8AhFHVvFaDN39t3TbK2nGBKgClFgDywebHkZNfwegSQ+7Y1/unCRyM0
v8uM9WEpzvXtWuLCikFDRCTU5pRDy5tiBA3dzToNJ0DQfXWC/Wzv1hDTZE7AEcfv
xJi7ylHhOThaAu8dWrvc+BTA3w+xlwYOwAJ1Xf2VSNJt7KVUOHwUywX/C8aJE6Dl
R8JKFcsUM5fWIQ18JpU4KEecxIlD0sVhVwYx8L/zcXRTWRHwEIE2+LiulVeAM5B3
6052I6nqzhmu5M0pVargZYogU2Pk2vg6R38vFbzfG6Q8qOgw0X8aVS9xlmgYqQbA
vxwS3Brvqx839lE63IOZ7FzCjwnDGiZWi8z/3hLaAxsc0QGAhz/jrif0C7Z2lgmu
RTkhL9cmX7k+ktSvX6/qkkXZNH9zqsbpAeC7RDxXUjuY4/EOHw4v20pI5ebNGkxc
oayka8jIX/iP6Fg8z5h4w4t4ZQua0X9qcylzxePhw2dW/zGZGwhKm7ge9joZIqDt
lRtwXId9+Z7Os27YyZRqZ0M=
=6XCz
-----END PGP SIGNATURE-----
