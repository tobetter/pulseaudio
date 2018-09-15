-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 12.2-2
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
 79efbb8f53ea31bc65cd1262fd93a711df222237 32840 pulseaudio_12.2-2.debian.tar.xz
Checksums-Sha256:
 809668ffc296043779c984f53461c2b3987a45b7a25eb2f0a1d11d9f23ba4055 1665092 pulseaudio_12.2.orig.tar.xz
 ab5519849b1cb858e4abda3ffa96626453425b89fc133e53ad04a5dfbcbfd93f 32840 pulseaudio_12.2-2.debian.tar.xz
Files:
 c42f1f1465e8df9859d023dc184734bf 1665092 pulseaudio_12.2.orig.tar.xz
 abc3f52696b7467a57c774491d5d9275 32840 pulseaudio_12.2-2.debian.tar.xz
Dgit: 51c3bc2f9349f5085917e0fda74f13399c81952d debian archive/debian/12.2-2 https://git.dgit.debian.org/pulseaudio

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAlucQYYUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s/lzg/+MWWaKSRVAbRdWC52PiFne+3weD8f
wrjOMp/bAHjr99PKPM0tn5dE8bhMoyyW87pWQ1Yf0T4Xqc9i6OPlUPBMQEjK8/mA
OjOpETRncvbIGy5zzUM3IGqy4uzC+imKqEn2juUAdybzxNtVYFwSqbUzYU46ktdc
ziBzT4VALNO1ZOhI4OCHIF+9arXeZ0f4qeYn4+gysOMgya7Cru1Jut/CjXovmSBz
lO9pWkPOcLNYNi+Taf25Q8cPSdB7nC6YoL0Wb/68tpffJBduRajhFUSNSAlIlDkU
HPy/RxXSjz/Q+KQv1OHbpaRmXg8aGR4noBkqHo0ReO3+wgOGShjdGVSVsLs5Lg4X
Py+FHVoggY9emoCk7rokdUxLcKZNah1pL8R7a+7e7H6A7zH6WJMnYXR2G5196saB
fraoZHdDpxSTrZQePJIsfnhPczhCNeRAksT0vUJu9P/SC/WLtnRKc+Le1mmewlGD
VGK1jZGCb4pgd0hphbkN5LeR7SHLobR4kHS3g48sCcBQVe5Dw9Xv0bW7TNltxYzn
3cUjyafdWEPUf9+emlcg7CsoOhhcugY2GzTMnAOKuJa6kO8h9+S4GGC0tobviyww
odMI+PBwAMN833nwhuofcjbb4i6tySF8G77eqbmwUJMarvzBUwSlEcC80+w6nz9g
zonJNpDzs26VTmo=
=tVWh
-----END PGP SIGNATURE-----
