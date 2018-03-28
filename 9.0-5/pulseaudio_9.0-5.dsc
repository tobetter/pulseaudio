-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 9.0-5
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.8
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 9.20141010), check, dh-autoreconf, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 ea8c9a6317e2f8010b5b3076591775adeb8840c7 32180 pulseaudio_9.0-5.debian.tar.xz
Checksums-Sha256:
 c3d3d66b827f18fbe903fe3df647013f09fc1e2191c035be1ee2d82a9e404686 1537568 pulseaudio_9.0.orig.tar.xz
 270a0159d85a6009b01ac9bbbc6372771fa4410df2c72cc9e08f4563841568b7 32180 pulseaudio_9.0-5.debian.tar.xz
Files:
 da7162541b3a9bc20576dbd0d7d1489a 1537568 pulseaudio_9.0.orig.tar.xz
 19abdd7e51c25527069cf8d58f501b78 32180 pulseaudio_9.0-5.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQIxBAEBCAAbBQJYHRY8FBxmc2F0ZWxlckBkZWJpYW4ub3JnAAoJEKO6uuJAjdbP
SMQP/A2nUZQ0JA56qyq4hWSrJ4D5WxjGlalNhYELSmIDgQnk3vxBILC9rrkwRrm3
8kKvRFun3HxNDlKkbFI3yp+1HA1q4HCSGqJp9VPXQT7sLgExSalsKIC3eOv8MBUo
AZTnEnRzQ/yOGxG4+fZuhGYLl1BZ1tZmp5MUb5HmC/V288OgeDVWViagmiYuqVZb
kcQOd4Oyup8G49zdA/951Tt68L0g8MA25Jx6vfau5Znr5XkwqK8aoV4vK7yobCsZ
tnKCD31S0YB0LQiM7ACoHsb43Xq2ut4r6CRx21XfMA67twZoeR6wcFKPem1O7ga9
UcNMg9PKE+k5MggTNqymWktIwVd9jpmXRzxiQLKypVfsXnbLNFGqKXISSxnCkj0f
indoCm+qrBI5D66cxkdjf3/8oJWt8J2w3rf+pANB86tNi/E4F6vYRwTqulnZnbAK
+2r87oAiF+vF3+vQ7bjOMCHfATk0kxmv+xXf+Yzz6aFys5PEz7eWRl4CsXWrTEfm
2KeGnQ6jaV/nZBAoC8bxxXkGPEsmc5Zcz4FTpOy6Mgp4GMWG/vEQtCGxDugANTMy
kPjD5neinP7R8mw5VgQUlVvLV/j6GiCcFDf58xmJq2YFLppgS47TvEp6PSkQajwO
uBDdatUenj8s7hWT4wmiaSoVM4WhefShmkls6+bZtzmy8bj0
=b/Rb
-----END PGP SIGNATURE-----
