-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-droid, pulseaudio-module-trust-store, pulseaudio-module-bluetooth, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:9.0-2ubuntu2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.8
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: android-headers-19 (>= 23) [armhf i386 amd64], android-headers-22 (>= 23) [armhf i386 amd64], debhelper (>= 9.20141010), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libandroid-properties-dev [armhf i386 amd64], libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libdbus-cpp-dev [armhf i386 amd64], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libhardware-dev [armhf i386 amd64], libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libtrust-store-dev [armhf i386 amd64], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2), libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any profile=!stage1
 pulseaudio-module-droid deb sound extra arch=armhf,i386,amd64
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-trust-store deb sound extra arch=armhf,i386,amd64
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 d9a9d7cb667ed95ee1de4b6544d5c7444c5a0064 1537568 pulseaudio_9.0.orig.tar.xz
 d18f77acbca02429693a91940be97d712841c1d9 140016 pulseaudio_9.0-2ubuntu2.debian.tar.xz
Checksums-Sha256:
 c3d3d66b827f18fbe903fe3df647013f09fc1e2191c035be1ee2d82a9e404686 1537568 pulseaudio_9.0.orig.tar.xz
 16e8f159baf3caaa92c04e730f287504f01c1f3ebf5f92395c9033af99268dfb 140016 pulseaudio_9.0-2ubuntu2.debian.tar.xz
Files:
 da7162541b3a9bc20576dbd0d7d1489a 1537568 pulseaudio_9.0.orig.tar.xz
 20435078dc10f7dc4873629d708a4f99 140016 pulseaudio_9.0-2ubuntu2.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJX4DZQAAoJEINAGjCxzeWPpQcP/j01xFW70kONuYqxMgIYfhSY
y3h+k+xaJP1DpKl/DBNqdqLLeG+hJ3R5tkObKbP7WHaUpuTiKMWNBzDCuzlfQIez
J7xMyZAzLFz9BorJgautjgXTgbPM6d16fLN8MJLId7lDucJhijekqMRo7rxaB9vK
6r2m4gm2Ig/kSGgs+CLKWsFciF1QIFVFs9nlRoxbg4qs4mVOo9GsfgK0ArhqH2uP
zN7AA4o+8k3UZ5zoCQreBN31/HI4s5NsNL6wVbMKLTRevivK/NJ78hNce5Vk/WOv
MWC7LOdVhsYYeVJTzr2wWTSUfQyU+VLd0VTW78wNX2XbCYsIpHvqIESQI97kXM9d
f0F4pxGK1+pXFHlfUjic3MBYQos3560Gtd3y72DVzLDQxJ5UE31WVNVQzyVwS8wP
NhFZkdOGk5hztuofA8MHKNvl16ZxFruY7b7JusPyVuSwY/om3zSEX+yxhRuYtIBM
mbqolRY27E9dCtvb+zuLyXjYxsJeienUaZM07uyhU180eac4MplsmaT52nowN+Fn
w6S3sTX/UXnuVRPXzhLie1VUuihwheqzxI2aFfe0PWjhQBbpMtBppWSAbzJop56M
yi2KdS0IQtNgH83k5CKVpOMJpxBOAZ0cOosmhgIa1T3Dmp60fCuBJadtDmV7XNp3
miWxX1bqLcP/OlDW2Ysl
=yELA
-----END PGP SIGNATURE-----
