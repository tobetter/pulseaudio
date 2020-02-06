-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 13.0-5
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: https://www.pulseaudio.org
Standards-Version: 4.5.0
Vcs-Browser: https://salsa.debian.org/pulseaudio-team/pulseaudio
Vcs-Git: https://salsa.debian.org/pulseaudio-team/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper-compat (= 12), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev, liborc-0.4-dev, libsamplerate0-dev, libsndfile1-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
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
 dd07a49f09821913c5ed1b131ea7f85f27085d0b 1901768 pulseaudio_13.0.orig.tar.xz
 79a404e43537b4c99993e992b13be26b22fb37b6 35336 pulseaudio_13.0-5.debian.tar.xz
Checksums-Sha256:
 961b23ca1acfd28f2bc87414c27bb40e12436efcf2158d29721b1e89f3f28057 1901768 pulseaudio_13.0.orig.tar.xz
 685f5b19076ee27ecf1018671712931827b5112452229437d02e58803a313174 35336 pulseaudio_13.0-5.debian.tar.xz
Files:
 e41d606f90254ed45c90520faf83d95c 1901768 pulseaudio_13.0.orig.tar.xz
 522fd27080f48f9a0aa9d69ec3baccbd 35336 pulseaudio_13.0-5.debian.tar.xz
Dgit: b6b76548e3613f22ac8d89b964cb8ad9601714ce debian archive/debian/13.0-5 https://git.dgit.debian.org/pulseaudio

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAl47dPcUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s/zbhAAmJRxlZ/A+pQZrclQpxTNPlgROWzo
qwEQ1T11x2YWZCN+2NLJNgpkggXTHbKYzDUmqlR5QleVTpSZ8bmtxFHFJQQPeMWP
f4s+FTUdUMIA85lI4hg0GFgpAM4mVymyq/xdnxFmLpZSciqBoiKIv5nnyzL/FYuA
GMVN8Jpna7ky2Eza0+JG+F10vfK7vV57CpYtPdzfHEy2+XoRANBcH9KR27G38jRp
+jnFsbD+Qm8I2+ThfigpBjkWyxMgHRwoKl/QFwJ8XZ0G4MZKzWJkeWNSWcOe3Xbj
9Wti4umS6ft9w6VMWclfJCzCb5tGcUhxRE/RP7MsogCkhUfeSnxHBp4RvKJytAt8
CiF9EhqKbWGbr2hiH1u1dHmA0lxwaeVt6N6xju4gwHA4aiVTgA6UC7ZhzUdrz4e6
Gy2+/PAjv/MYVzs9T71Uo2Nbi+nrSY+qo+Nr+Rzq5NXdk9HAuBAPfpIpU5oGxlLP
RnzNlAd9JCbOG7HgegusoK+O1SsHt16VU1Tvevu2+1B4WKCLWVBewBBWP342FlRK
gA5AQ2ip9Xl4w7jQvszdrTWE/qo1zaQZxIv1LUdHShxVu6B+V1Yx6foR3YHk5EEQ
uS9HbINTZTdk17avWJvF3kXeUCHZp0MHFCtiwMjam/U2zxCfvwPFCCtk6fhGDWId
xpG033dj4NzQsSI=
=gXus
-----END PGP SIGNATURE-----
