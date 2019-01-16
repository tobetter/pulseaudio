-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 12.2-3
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.2.1
Vcs-Browser: https://salsa.debian.org/pulseaudio-team/pulseaudio
Vcs-Git: https://salsa.debian.org/pulseaudio-team/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper-compat (= 11), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev, liborc-0.4-dev, libsamplerate0-dev, libsndfile1-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
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
 01a7a468752158e1dedf6bc778d02d6c8d17a9d0 34772 pulseaudio_12.2-3.debian.tar.xz
Checksums-Sha256:
 809668ffc296043779c984f53461c2b3987a45b7a25eb2f0a1d11d9f23ba4055 1665092 pulseaudio_12.2.orig.tar.xz
 40eaf837fd5d187d3e1b8bda6f50ec5a0060d6a7e5ab066ddfe5c9a792bd6ec0 34772 pulseaudio_12.2-3.debian.tar.xz
Files:
 c42f1f1465e8df9859d023dc184734bf 1665092 pulseaudio_12.2.orig.tar.xz
 1f5dd2408bc30d59865594799043ff21 34772 pulseaudio_12.2-3.debian.tar.xz
Dgit: 539830327f02f58f69b1d2fc74b2e7d1fe5e6491 debian archive/debian/12.2-3 https://git.dgit.debian.org/pulseaudio

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAlw+gmoUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s+RUQ/+JsUgyOe57JBQZdOwFjc+Nh7iGo0/
+S91FkG/EJcrtiKI+2wpb/XFG7Vfk0uqrrMMrab7bL32cb5/BjC/tsZK1z1ICDTP
scet1vYG2x81TAms9eOjfyoNkO9q6F/K10srMXNjvBFX2d1fQA8TzuwLb4YnpRR6
eVhO02FeDkzkiEzjl2YJAWyI0ZX7r/IbV3MZa4O9vXIjeJzWcf4JFsFfJ58Isxug
5EhCBOQcKGdK8SRsmYiJI2YhkneVQFQDzEXwcveuZBDG/vyNHjxhuCcLZfCDnLt3
o5FL3ZI9tQOmqNwNGvhfpBQCbOG5+qd8qPtjK6wP9/YZ2F0PyGUqyAb6AbDhT0rr
cjg/UV43GxJQDFIKhHilm8ilbcLELiInousEFXQkkQx2a+0Yt6vYo3aRelAgkP9c
5JmKNRb5SvLO0+w9xJlYG72r0MAMOwycdSNpVnG1cbrILfvYiMKZ38BLZ6fITkfA
ENzxcbQv4vihn2gAQ1u/YZ6hTitxC0iBEsGisl4/zP/rg2a5kTCOG6b8830G+UZL
dWEWubWjoyV5Gz0vpkXLP6Rza+Mo27HkBC62kBm12dfvb6D/DmYcnRrA/salVY96
iJ5vQlTWuQmz8WL9vHyvi2xMZ14eWRmgvYIht+AeHzwQFBJPbtllJ4sLjyei5hVk
YDtl7bO61vcxDVc=
=rmFi
-----END PGP SIGNATURE-----
