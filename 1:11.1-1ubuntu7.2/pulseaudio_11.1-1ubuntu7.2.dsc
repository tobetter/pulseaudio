-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 1:11.1-1ubuntu7.2
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
 6ff5c81316abdead17f658c81ce2f43e79750eb1 102124 pulseaudio_11.1-1ubuntu7.2.debian.tar.xz
Checksums-Sha256:
 f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e 1648924 pulseaudio_11.1.orig.tar.xz
 2307cf7ab31bfeea43a4e040a1be14f41a7e9821b9edea7aaa374bf728340bcb 102124 pulseaudio_11.1-1ubuntu7.2.debian.tar.xz
Files:
 390de38231d5cdd6b43ada8939eb74f1 1648924 pulseaudio_11.1.orig.tar.xz
 189c55d038544e49a5f3915524938dbd 102124 pulseaudio_11.1-1ubuntu7.2.debian.tar.xz
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQJGBAEBCgAwFiEEbi1BlW4M6OBFsyeqTc+O63QuJ8sFAlxiYIcSHGNoaWx1a0B1
YnVudHUuY29tAAoJEE3Pjut0LifLNWEQANahZ6yKR2v4G8NOFTwHbOmzKTYwu+rz
jJ3O+dY+O9q3upITs+sV+HsoW7ZKV4Bx2tY8QrhPiqqMOyihOQQJbdwaV9oJ9fAJ
/niW2fPOJcGfEtSh31RixF9RCLcnUi7Zd3yVAc/C1bqk5r0p3SMrdYywt0jpj9V4
zoGBOsKNMYlxrzLr+wKeUWcitaiIGHpY/pCcGsWyWN2mUrLcf6A5Xwj5rm9E/i7K
9DWOhPNH8XL4/FY9/LCd0B4d+txYLqqlUe5LhZCRfgvrDu2iWewxvj1sr+sMqj6D
CfWMUPK2+p0TujtkmH+XE4k0AxIOZT7yldHAJz3hCiGb0r56UiUvXM8WHrYLSsSq
DK/cZGB4IY8hha9fyv10h0iesCUJ3QlrhzhRjjhk6D+JUbd5qJfA/Xrpduz54ghm
alXTvQvtLNr96kXK0O88o1Xuu3L1qIlmoJ+MkoSc8uZ+4nkYrDXfV9V9/KyDrZ5V
BTj4U8iSXl8K3jvSqVDmyieznNoHgzQWm+vhQAq+Ahuy/yvp64i10Nq9ojk+d2dF
Dv20Mt+9c9Y3GIGaC3YHx/0WNIemE/xeaB1ihlRVcXluz7WihNtliyKj+O1Q8oRv
BW0ODcL2PR2StffsH3/KZG48aqhdItalZCCb58Gn01+Ix7qyQHwVBtua3/OUJy0s
LdgRttEw7DWH
=MDfI
-----END PGP SIGNATURE-----
