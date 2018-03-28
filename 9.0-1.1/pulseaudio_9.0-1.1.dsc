-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-udev, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-module-x11, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 9.0-1.1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.8
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 9.20141010), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2), libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any profile=!stage1
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-udev deb sound optional arch=linux-any
 pulseaudio-module-x11 deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 d9a9d7cb667ed95ee1de4b6544d5c7444c5a0064 1537568 pulseaudio_9.0.orig.tar.xz
 c2d44df6a2615506e0e57acabe772e9277ef560a 30904 pulseaudio_9.0-1.1.debian.tar.xz
Checksums-Sha256:
 c3d3d66b827f18fbe903fe3df647013f09fc1e2191c035be1ee2d82a9e404686 1537568 pulseaudio_9.0.orig.tar.xz
 18c393c47793b867ee0c1fdfbd3ae9356d7c2db189cb7b27a495d4d4c4821094 30904 pulseaudio_9.0-1.1.debian.tar.xz
Files:
 da7162541b3a9bc20576dbd0d7d1489a 1537568 pulseaudio_9.0.orig.tar.xz
 0d618fbaf05534c363ce9bfd071b737d 30904 pulseaudio_9.0-1.1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJXetprAAoJEHQmOzf1tfkTdeUP/RJqbEsm/LQUZU6pZ1OeH3hZ
4+pbn/L4ycVy8TrvM9alXX/Ovctn/7Q2DK/U7dLtQhyCXkz/82zfUF7/vcmYtepJ
3Dpn4KwEJXJm/qsBTOoLIpTX5OHUvgaTW159kzcZ4xgiCGOpsVwaDzegeNHQasxX
v3ZtpQgwtCxR62KnTp9fDxellssZRIv08ukJ5nnoc+tRezUmzXVXxChpE2A5Qnoc
e0CMJ6xS6BYseeoN77sA3iy4gf6cQVcuK3O2zx5hZ2IkSc8RfKmWcX9eAVaqYUQB
f4LGHtijV3f8rXxdWpU6zYyHiLdsiIHwT6ph9YA9AU1BaFQhW8jHIKqRVcgtKKyw
5aMBqWpXbjetCbOHnROwPYAfT++wh42L5ruXbuxw5vh2LjgWuVKBw8rf+z52Gs2Z
cZpoEv9kABBxsBn6QHFfpEJsM035UXlQjKbiNoEodBqhnoFdZi/VDaZddNiclny7
ZeUuQFwYjUJ7HB53l2SvMxGQcEElSgEwzKKHkVqwXPWv/GTujw/J5kJGQTV6quUA
MYW9KY+mNi5mpo/3e6RifftSGiLck1yZnb6czzIXyPcVLe190SE/50JqBltXe3+Z
bvGtSrX3HRBBPxA0mRJK9v1/sYPeP/60IaFU5rwv6KrDt/XBU1LCqGsXVSNbDIeN
0y0EYCYDvvUp30ePejXk
=FytP
-----END PGP SIGNATURE-----
