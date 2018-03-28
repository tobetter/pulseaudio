-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-equalizer, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 11.1-4
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 4.1.1
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential
Build-Depends: debhelper (>= 10), check, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2) [linux-any], libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 b640a7b77e8923fc6a6be83939dc4a22d6e1d78c 42756 pulseaudio_11.1-4.debian.tar.xz
Checksums-Sha256:
 f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e 1648924 pulseaudio_11.1.orig.tar.xz
 a2fdf3fb5cc73431375dadfb6733474f6ad3acb634325e858fc5c178fb4ff903 42756 pulseaudio_11.1-4.debian.tar.xz
Files:
 390de38231d5cdd6b43ada8939eb74f1 1648924 pulseaudio_11.1.orig.tar.xz
 daf13858b943d8b9efd4a6c1b8d86100 42756 pulseaudio_11.1-4.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEIY7gNiAzyHtsE1+ko7q64kCN1s8FAlooXvMUHGZzYXRlbGVy
QGRlYmlhbi5vcmcACgkQo7q64kCN1s+oYg//eZWYdjC+Xo5/4sSujaCcx2a3N7ir
6WkkqDlfnyQLz0a7L5zUQ3qmnHfWkr+LOBctKgf195sqZs9tpJ9iMWCJZFBlimGL
Yu905tFo94I8bWMgHlvopp/47+Mqw/rOfCEGxShk2ABAJLs2x4uYQi/gkT0EN9Ok
T99K4oIqEPSMXk1VpzY/u6X5tBxRwcFXi7GcT4jvruMztfecbpmhXLUQywSOEgis
pOW5EZnRcs/9JzsTtYBdzEBq7Nlb+mR/nEWzeD6o4hlDuOAEcJI49GDV+U06nrkq
sIb/YWwJJgb4USXlEv6x5CGR3mFH/GM4VgxDGr1bSfrgpUWINbZTOtre3qSdgUEQ
4o/2KvQGodgS+xr7lo6W9iUsvT5dBPlqTq+ilHSjOrNgg7WKktVbqrtoHqwKTgHO
0BrzY9loquj3wtxMVH9/Fd2lgb/TWSqH42AQmBCTq9pFEPzFBeO0su5EfxGOvlOo
z4GyLlcRgQC7+J73HDJjT+Ox2hy4x5FBskpM90LBZotEYy3y8PGBwImKkwLWESli
QeS//U0qS/q2Kz6G/NxNsNR3T7n9tdIiLutJ/pY7GYTpJ2/5bdjqavswNklCDoLw
gP9U3JqCiwZjsk1TQggjZmsIrMZGNi1VEhj7Vda7OzzHKk8R3T9qjo+tIhFxosQm
brITLn2qHpogc64=
=EAc4
-----END PGP SIGNATURE-----
