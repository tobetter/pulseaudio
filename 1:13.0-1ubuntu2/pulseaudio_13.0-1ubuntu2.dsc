-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:13.0-1ubuntu2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.2.1
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper-compat (= 12), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), liblircclient-dev, libsnapd-glib-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
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
 869c8325948f6c3af109d0d2e06049c110854a09 81432 pulseaudio_13.0-1ubuntu2.debian.tar.xz
Checksums-Sha256:
 961b23ca1acfd28f2bc87414c27bb40e12436efcf2158d29721b1e89f3f28057 1901768 pulseaudio_13.0.orig.tar.xz
 f08760e9b445a4bf64b22bbe3fb005ca41886ab1a4886c22edd9e5a8c214511d 81432 pulseaudio_13.0-1ubuntu2.debian.tar.xz
Files:
 e41d606f90254ed45c90520faf83d95c 1901768 pulseaudio_13.0.orig.tar.xz
 2da72bf8b5fd9151f8585ded00ba5802 81432 pulseaudio_13.0-1ubuntu2.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQJOBAEBCgA4FiEErEg/aN5yj0PyIC/KVo0w8yGyEz0FAl3sjnEaHHN0ZXZlLmxh
bmdhc2VrQHVidW50dS5jb20ACgkQVo0w8yGyEz0lmQ/+NOh3PAPOD3RgyePwPyIh
jgSnqfigmfl1DQ2c0M3dCX20zDLc69Ex/vt9ta67Nuw6qg0fqX0IGNUM2Ev3lsky
8913aIS+iw+jDag/2tH60t/M2PQYYP/EOmVciuEQEBH6iwttJWLhwNCspVcaFmWn
m8KMtfCKD+YQyQRkIO7uPPgFPSgKt1ZNFp2+YQIjWFvlKiPAolOeJrM6tRIgsI9U
nM0LTd4K7WqkpALKGxWp+dI3rNoir+v2EJrGiFXXWj7ztQN8s1jMJaxdd5F5sTVW
rm0R+EokxhQy0G/5LMk6BkWe5ON6RGC+MWKH7F99m2uKCWDik0pY4OGn+KQVYchj
ze27jqjkcMBuJYQItjp+cKsvb6RximLxDg+43vy8d6Kf503/dM5NQpRSL3mp7tMi
zOk9mubUoY2aCKFCtETGikABJuCPjrbD+A7AuCMJ42pZ4ttNIHANsrBQ7/6YVKqm
vuXBxIdvk7epQs9HNsmdJNbxZkMATKP3Ut/IR96dFhH8bitUTCUrjk/CuPKamcIG
QP4ZSi+H8rtkm3MRXCAe4jSpXNDjUlkT3prR+KyL5zvHzYZIom/vDV7/BjiCwC5B
dpZOTvCaffwDf1IrcA8Hs+fii4w9fSF3ntRp3jdJMTWNfzLrXhhnPch3AcS6TMIs
6h6/Jszj3mMnloxe/bDIJtM=
=oGMd
-----END PGP SIGNATURE-----
