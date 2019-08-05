-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 12.2-5
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
 df63b78f00fd5d121174ac0a8701b9c0e188df7d 35332 pulseaudio_12.2-5.debian.tar.xz
Checksums-Sha256:
 809668ffc296043779c984f53461c2b3987a45b7a25eb2f0a1d11d9f23ba4055 1665092 pulseaudio_12.2.orig.tar.xz
 7ce43a8f72281cd0dec9211a58a44cde01695938e733d4a2863148dd859cd31b 35332 pulseaudio_12.2-5.debian.tar.xz
Files:
 c42f1f1465e8df9859d023dc184734bf 1665092 pulseaudio_12.2.orig.tar.xz
 e704a63755fa1f377d0434de5cd66381 35332 pulseaudio_12.2-5.debian.tar.xz
Dgit: b68d4cb87516f4470ae3b5efa5b83d587e169509 debian archive/debian/12.2-5 https://git.dgit.debian.org/pulseaudio

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAl1HhDQUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s803RAAg26fvhhINjA8qULlYe0I4QOZl4op
GAR+SXlcvU7GgjgCf0ET/1pSxubphGLMPIrYA1HZHCot0mWlxa7StHlri/iS+Oqn
zDAd+WiGzCKzZj5c+UL2aBBm25BrPTHraPToTJbgwl5Lniegy8bWRfQKWNRlw0Hi
GG9Y75xKhgxVRwxwDkRYWP5PS5k8Q2WNHpNS6KItsSd9x6+Nha5ROT5OsMYqtSGb
JFBjOfmrxQod8t+c8DfdSAE1aktlRkSVbb7Ysq4DE/dEUryp6qo+n6x9jrjizYNI
jVLg6R2aaub3eZaAREJli5XAO52JvkdUcwJ+kAxwidJnqcivneFj+6z4MuCRlGBd
Chm3Pwcf7sw6jg/z/nPT3cF3CGFZVWtHCZvEFoQ8w6wnvJtoHW09EVLAQArUwo6B
NAj16TgAhuLuSxnv7vYYI/2g3/PQRMVs9yaC4B3JNRrRvBEUkSMjqZJG5ETaGIC2
t2uDrrLVUUuJ2j2P9Xg0Ms7FNjDSVniWzY1QraffAGLKc3yIHTx348gE4p6zYN1K
HiSmlxUc6BBL6wghj7WMlMVvU8c5pl3KkT1WOvljADSYERPXkxyvcLHFvSKDBQJM
LC8E8LJZb7DNm+UhILLc77++rH6LVVq0Zg2NAOKHMgWEQWmaidiuWbRgp1wdreTP
nXQBaYbDukNh+t0=
=VdWg
-----END PGP SIGNATURE-----
