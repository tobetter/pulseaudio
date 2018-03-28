-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 11.1-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.0
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 10), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 e199d741804f6896b843cf07628af13de80a2cd8 41568 pulseaudio_11.1-1.debian.tar.xz
Checksums-Sha256:
 f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e 1648924 pulseaudio_11.1.orig.tar.xz
 139dc3efc11682783f676d22258f89f18c54768cfb8a970d796f0c173e7b2cdf 41568 pulseaudio_11.1-1.debian.tar.xz
Files:
 390de38231d5cdd6b43ada8939eb74f1 1648924 pulseaudio_11.1.orig.tar.xz
 ff93684ea601d0c610738821690fb314 41568 pulseaudio_11.1-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAlnDBD8UHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s8Nug/+NGuDSQVL1oX+pZVp+P/tU7f8fblM
z1Cp39Vthw7HnThzoTGWkuu75/T3ULO0loRrYw7XXycyoEN5ruCTwNBJ4kRDfVcK
HNLNLTvWGwvJp2oIRVHJS64iK5whl+OXnuXTGol74+/pFuCvqY+ag5PAdWdL890B
pWdg8Xad75GUzEvd4OY8m84ULOzdNjkYPmR5yPjyCX202YG9quQl5h/e1z08Morb
kclFFuNAMyBWDAH05VY+8k0X2Bk3Ya96NFvSeVgcVNpZYOdA3FTstXUdSjE+yy84
vCV4IWlyKIafGwNdwb6S6Uf11GRviY9AP7KaApqCeBqsFJ0XOYCyx9u5tY5fubHS
WyE4myeHI1KZp2XKi8q0pdWqUheD2M2mZKpjaS5dSqBs2nASxiTYz3O0/cmzdsY7
5aCosmS+rV0ApeWXhHLTtOw4zYMEfOuwdExxKdJK76q35CyU3I/acgWrcZIMzClS
wrKzRYz9cGCnbAs/cULmbFQj6rvhgx8UZApHCpE5Kz5/HWrlcKQlVo9R9ulekaVB
O5M87Ewq1lzc/mj+6lf7GiH/XAPuTwMyK0Av3pT+3PVsAbOGFjtCKNWKgLyFk0Xf
8TVpYr2WVc6uxKcoKfDTTE+Yj4Zb6M5LHTiqgUDXAKCXUP/DA5E9fdAvmrKa7xxS
wxdl3qzaRLRhdTQ=
=xs41
-----END PGP SIGNATURE-----
