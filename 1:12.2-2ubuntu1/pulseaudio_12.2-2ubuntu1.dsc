-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:12.2-2ubuntu1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.2.1
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper-compat (= 11), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), liblircclient-dev, libsnapd-glib-dev, libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev, libxtst-dev
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
 f3beb2a93ca1fafa0f43c428cb4fa41db5a1b470 86148 pulseaudio_12.2-2ubuntu1.debian.tar.xz
Checksums-Sha256:
 809668ffc296043779c984f53461c2b3987a45b7a25eb2f0a1d11d9f23ba4055 1665092 pulseaudio_12.2.orig.tar.xz
 a60b241997ccc324bd5b523d905c3f97622871f90e2f46435d3f40284d64a5e2 86148 pulseaudio_12.2-2ubuntu1.debian.tar.xz
Files:
 c42f1f1465e8df9859d023dc184734bf 1665092 pulseaudio_12.2.orig.tar.xz
 9e8d69c6b7ac2d7fa2fb36d32d9f46a4 86148 pulseaudio_12.2-2ubuntu1.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQJGBAEBCgAwFiEEbi1BlW4M6OBFsyeqTc+O63QuJ8sFAlxibSUSHGNoaWx1a0B1
YnVudHUuY29tAAoJEE3Pjut0LifLjXYQAMDc/OUoh91kjY2jhz3ZO+lMkoHPMKhK
rA7h2kLnJ7kJkp3kV6yA6a5GICy2g+ieLS5jmmbEKV72KRyKf0C2u+EfVmw9mNUr
Yd/vhbcDrPhVzidYRFODSduUXcDlfyJ65W0DMx0dQK3a9/waS3NcIBATmrr96k/Z
hiJ0KuFbXMF3Pve09P/dPmsS7D0GBJo6vZSGzhH1YmcxGtLXg0W5IKk5dJvl52d3
ovHkO8KDslLTNIkGn2ir7Zxyiqtg1Lvgy0BcUes8urWy43iu18NwAlxe/wQy2J55
6g5NaTrEE+Xl/yqZU/4iJqWYLU7Qnk05YhgLlvKJV5vQ/62GkhFYMG7I9bhYLFTc
rqSlvxiP1JPOi1cRQ/we2EwLhlgNk/ovBlzHCymTvFJjv5tuuBfmnbqiD3otl4dO
mxywDWQGOTlqOo/0djBEv/0axY2tS5qHWbjV7s6ONGsDMTNdWsj+/JTarXSu/PQc
b7SqDiyTrQqWEM7LCuqsFI/rdCusTsWendAnX2uuzerf1g4Qo1DMDWSBoGn0Qi1A
JUnxj9ONiRe7811i/M/5UJixorfKCPQq2UXJXrL3fCIofCzjXm5p6EGvO1FBS4SK
+DaDxMHrBVsf09wa+7M5vuup/cnoWw2sS1oQGKXJlQobo6hJfJqJq97HqEsRF8j9
BJiME125Imiq
=kPH9
-----END PGP SIGNATURE-----
