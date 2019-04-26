-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gsettings, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:12.2-2ubuntu3
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
 a41b4198a66a8d1615e291a5338a77fa353403d1 86788 pulseaudio_12.2-2ubuntu3.debian.tar.xz
Checksums-Sha256:
 809668ffc296043779c984f53461c2b3987a45b7a25eb2f0a1d11d9f23ba4055 1665092 pulseaudio_12.2.orig.tar.xz
 7e0330833df5a85639c173e350424fde7422bea955eb47476938f7633ab5bef6 86788 pulseaudio_12.2-2ubuntu3.debian.tar.xz
Files:
 c42f1f1465e8df9859d023dc184734bf 1665092 pulseaudio_12.2.orig.tar.xz
 a1c08925fd9edbe33932bbd35e78a5e5 86788 pulseaudio_12.2-2ubuntu3.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEi8YAgFqsZg/rTRmDg0AaMLHN5Y8FAly13wgACgkQg0AaMLHN
5Y90fQ/8CXootAuO5ZTaOynhW0MWn617SNGQYyhJt4gkR78KaeMD0ir2MF4LfXx8
fVsV3dE4O28IiDktdI9NPtjbWW07YOHgkB2k0nAqTHRf+LK/iQz1MfeDVc/Kv34h
hyEd0do5HX5+Nr190U8UddQWT8GID2N1qtIYe3SLCXj4EJFmIxC/T/yuChs4BKhC
EpG3U0RRng1VyxeKUM/Wyks3oEkjzirQkUdD9PgNw2a4irHOTZCcZ1NrOsShsWQW
0a0mRu3W0YyINTnZbNzVOm4LN9f0SarLJyyEvZyVDq0NKD9oBfv42KzH5eDHXnBl
9AOQ4rjSV9+waA+y73WcisLresiVb38s1bpOJ92WZ3Wnf1aJjlL4N6WlcVRBSD02
XFIk2DJ1mVJJSR6hbTSk95ttnt9jtAek4z70tGBOsqJLr5T4arrIPfcg0wgR6ljq
0i73J7tolejfkSUpBHNdJFdXdYXVH4X5zuF3+sp+96Fev7QiXpxEXfruGcJJZAeB
DfCjx/3RsliORfx4M7ahiK3Zx5f/9kNOmaS/V71kw2dgQk3Yvw+wwyvOTKKG07n7
jNXNsnUIFhd1Yj2UsOe2BH/2lLFXZzFAS/gVqfDqeC2qjjKuARkdaJcGz9l9Wbv4
AgjoFQKVoDPsxV0mZCl1TikMDk7/q1Ldg4S6lwVK6OImVrzs2tg=
=QMer
-----END PGP SIGNATURE-----
