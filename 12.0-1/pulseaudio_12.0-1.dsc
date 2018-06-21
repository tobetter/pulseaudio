-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 12.0-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.3
Vcs-Browser: https://salsa.debian.org/pulseaudio-team/pulseaudio
Vcs-Git: https://salsa.debian.org/pulseaudio-team/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 10), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev, liborc-0.4-dev, libsamplerate0-dev, libsndfile1-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-equalizer deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound optional arch=linux-any profile=!stage1
 pulseaudio-module-gsettings deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 9b0dcd62ae4c24542e13644e5fac3de5b13d6db7 1657212 pulseaudio_12.0.orig.tar.xz
 118974519c302bdb889df176c4dfe7d9d707d7ce 32272 pulseaudio_12.0-1.debian.tar.xz
Checksums-Sha256:
 6e422dbdc9fd11c0cb6af869e5eda73dc24a8be3c14725440edd51ce6b464444 1657212 pulseaudio_12.0.orig.tar.xz
 62938867cf5880698b95aabbadcaf12c9b4a81b31095f81aab8b391a2c6bf4e2 32272 pulseaudio_12.0-1.debian.tar.xz
Files:
 efe7683310080e80bc42707285df8c36 1657212 pulseaudio_12.0.orig.tar.xz
 dd6d7dde8935688151f9fee930924dd6 32272 pulseaudio_12.0-1.debian.tar.xz
Dgit: 7a5d988ce7e5491af0cb278679ebba5627aad8a9 debian archive/debian/12.0-1 https://git.dgit.debian.org/pulseaudio

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAlsrxBcUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s/tyhAAky7vuPDm8BFvgsyQE/4VwHvqU7Md
r2xFhn4+7Nwi67YRFVwGn7/5daEZjcBi9sBlTWo+9FZKWi6shZS82e6hrT6rIXfD
Qkse5ufPmKbs4kcot6SNgb5avAFXab5hQINv0SXSQp/qg2sQKLdeLzLe3wVNidyF
nRk7qEW6m9hpb6I/tbDh9MbESDqMsZCWEmhe3x1K014plfKK5VxTrIfMwEXIjalv
iOukgLR1RCxc1obCOS9806ObzHFlZVUH0GKR7nOPyV0jBgTqxu4ZKeQGJF/IyYXi
spypzbzd50oJNlbCAtCaQtGjPKF15iKgTle6qPwm7b0kI2GMY+Z/2HrTXZyCkk20
3swmMfD2v23t2GoWv06PclkeChea06Y6kJxuiTFbtpuuv8OYTVT8Z10HHXO1kqzQ
C+8d6f/kvg52YoALp5ADpDL/eGVMa02rAmc75NNn6OSRuiBO0bq+HSYXJwDCTpke
91gJ4PmXGyfmEmhFrKhyUSZsw09KrF+1/u2rpnVnbJ/GEKCKl9IyyF+/itIJVIoZ
k6fZlyt17h8AZtkEIbX/ynw8TsadG+w1H6fi+ICTULplqzklZmTudWhIGLhbJ5uh
ncxpcxi0B8m7txcI277G6+iLL8Hd9ZnpY4WdsLKXbq9PwY0e7Bv4QCr7zB/EFrgj
8K9rEojMBh6k+14=
=/EDZ
-----END PGP SIGNATURE-----
