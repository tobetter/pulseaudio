-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:11.1-1ubuntu8
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.0
Vcs-Browser: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Vcs-Git: https://git.launchpad.net/~ubuntu-audio-dev/pulseaudio
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 10), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libapparmor-dev [linux-any], libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblirc-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 63ec85e80ec67353f18ccb0818442da9f8a9ee35 99492 pulseaudio_11.1-1ubuntu8.debian.tar.xz
Checksums-Sha256:
 f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e 1648924 pulseaudio_11.1.orig.tar.xz
 ebbc9853077718b648f7ef81d4506c8d5672c417f6c77f798303e3db3e2f9c3a 99492 pulseaudio_11.1-1ubuntu8.debian.tar.xz
Files:
 390de38231d5cdd6b43ada8939eb74f1 1648924 pulseaudio_11.1.orig.tar.xz
 42da722564ca29fa3522646bdb273091 99492 pulseaudio_11.1-1ubuntu8.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE9q/FE/ywo6zf0Lkwk31r/rPJjt0FAlsC3ecACgkQk31r/rPJ
jt0T6xAAqnJ/ZsIcAxz+Gl55L0BRczcHOuaQWlA8LEWvr5oRctGqTAe1nUxDO6w6
0lDWf+5D0ecwmgX1H5M+xaMntHLwjwq/2jD14M5DrsLt5S1JM6W1Rg9CIqatAjOh
cDVNtH9Zzowd+TLtth+yF92KToDgfshR/BBo2Dbbo1v61gHq/kwRKxJ/lkRlhxW5
YPqSxg3RdiOVWkdDIiT0RzsR/u5SkBC2qsAJ1Vkl/zn7cxtIMtEySq2hlsCkWSeJ
YNwHRxB15wnbyzqlgTa4BsRWD/j+KXix45d2Te5UwNpSHQhVl8otQl+1gfPwiaNQ
YpM+m672SQk6R7QCbXauir/wVBPHmqPHSk36Fs5hMFKi0veMxAT902zyn592ruDb
g9/3iQPK4vrfiFEvoNbvPNCDkhvuWTY6pG+9ijI6ewGF5sYKYXFs/5WiFwIG7OGt
J1Mf2EYO4nrdb7pa49Zw5iuUVup4YIvXbZ7+sKYfzs+OC65nstWiuRDwzp5b6AUi
oT0bOiayuRC1COAgGDmaeeI/wIWKNlnQB/S6IypmkjgjX5wFw3310EjMiXPWR03C
EBqFYRsCcJda49zjtCkFtvamLAdkB4yi2YC0YDFipH0C23zXp8XJusslGrq4YK4d
Al6ih+7EXMAsFjeM7OVtycE6ep+mra/LmZmIrn0VHYqUKL60q4o=
=7kf1
-----END PGP SIGNATURE-----
