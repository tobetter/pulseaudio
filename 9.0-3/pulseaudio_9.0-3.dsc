-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 9.0-3
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.8
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 9.20141010), check, dh-autoreconf, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2), libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 d9a9d7cb667ed95ee1de4b6544d5c7444c5a0064 1537568 pulseaudio_9.0.orig.tar.xz
 1dd8c1005b233160199016b286013216bf99f128 31084 pulseaudio_9.0-3.debian.tar.xz
Checksums-Sha256:
 c3d3d66b827f18fbe903fe3df647013f09fc1e2191c035be1ee2d82a9e404686 1537568 pulseaudio_9.0.orig.tar.xz
 fa2f3b8ed9819ea8c957de3eed06763d9459d47b8d717e2ebdac78057470fd3f 31084 pulseaudio_9.0-3.debian.tar.xz
Files:
 da7162541b3a9bc20576dbd0d7d1489a 1537568 pulseaudio_9.0.orig.tar.xz
 e0152d0eb7a35257b9a54d6cb100481f 31084 pulseaudio_9.0-3.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQIxBAEBCAAbBQJXw3XQFBxmc2F0ZWxlckBkZWJpYW4ub3JnAAoJEKO6uuJAjdbP
c+8P/jnhWkeCLvrvkcpfYOj/0Mf7LtUreEhmP0p+HEMdK32Trc/3Guu/QfICcIek
ytZZLu5Et4MoYJO9vv282eYucGFSj7jpjol5pxioWE9uNQVps29x30N1JLF3qmdu
kYwjNNUTiTcz5VkZYcgGeMn46l60QwIYmC8iYQpEshG1dFbIGIZatbJ/drZ5FvA2
ReCwHwwTORvJ7/y0dosWNyQZAKU3kY6X7oSCSd2mkIabOk/Z8o+uh1RYFopbSPRG
bvLTFHjYZUokl7qDqMsg7xq1CsV6C0bTVtvicetqXfj2tiiM1jqrkfUoQEZM2sxU
7IJQF7s7rjnxGRlIkHIwACIcbKeZxI7YniuC0DIEPmrKy1qGKxTluHGRrambsU6o
oS6TPZaIAbJav/4m/NMSVu3cy8GJ+jhl4bqYTiR5jfuLqX35hhbhOnrzuTzIaaHT
iKuN8C5+UUOOj5fc4tYdyJQdu5yMpX+QiTSkr/t2nz6DmJnQuxXxZo5CwxjUWtnR
Whgw/vccJPGLgvcBgKQULdiToH5++65uf5iMdiMXZ0SWHtt9qLHVUusoTyaOu0zW
5NXE5/x59TOIPim6lflx2eZUUgVc+D5Q19rwYELIGMrcOGTvZgLzL1hf46rpIF6h
zWpem4/YZK3a+Vg2/zTYn/y8SdRA18VKWOZWlxgxqJ3fvP2i
=rcIy
-----END PGP SIGNATURE-----
