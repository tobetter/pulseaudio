-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-udev, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-module-x11, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 9.0-1
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.8
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-pulseaudio/pulseaudio.git
Vcs-Git: https://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Testsuite: autopkgtest
Build-Depends: debhelper (>= 9.20141010), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, dpkg-dev (>= 1.17.14), intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any] <!stage1>, libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libsoxr-dev (>= 0.1.1), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev (>= 0.2), libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse0 deb libs optional arch=any
 libpulsedsp deb sound optional arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any profile=!stage1
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-udev deb sound optional arch=linux-any
 pulseaudio-module-x11 deb sound optional arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-utils deb sound optional arch=any
Checksums-Sha1:
 d9a9d7cb667ed95ee1de4b6544d5c7444c5a0064 1537568 pulseaudio_9.0.orig.tar.xz
 0b26230001320c0046740ee7fee7c85b505186ac 30324 pulseaudio_9.0-1.debian.tar.xz
Checksums-Sha256:
 c3d3d66b827f18fbe903fe3df647013f09fc1e2191c035be1ee2d82a9e404686 1537568 pulseaudio_9.0.orig.tar.xz
 257c3b3df9940d247705a96349f6ca0fe9ad4f1620e61984cee37a924801231c 30324 pulseaudio_9.0-1.debian.tar.xz
Files:
 da7162541b3a9bc20576dbd0d7d1489a 1537568 pulseaudio_9.0.orig.tar.xz
 a92d52e66cbccb6494c6ab38f0a14a98 30324 pulseaudio_9.0-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJXeTasAAoJEKO6uuJAjdbPbToQALvBCd98jC+/JNVEdWgIMLWZ
OuMVPmhA0TYHNg8s2JFxbWsg6HbUMiD+e7RmeboT21s4CPpDeOxt04PU1nI3C2PV
ML0g7Z9JV4kS8UKYvIHg9sl9Jep3Zu+ugXVwyAsjcyuc9h4dHFjPz/m5vxsgtcoY
fld/1tHLuRgsjK5KhcaC6tG936AsyZJLuPufgy6NuEr09tOv677/H13iO/7jriAH
SJKR5x886dBh8caKYov/pAdRy17cmN5z1mh+U8dEF9eZuxNCHpIrTERbQ87MewAs
t0pk0Z+epiTl3cXy0mvHUpSDGeUMSXUvgd0MOO8zBrnZ+LdMqvW9avEhGRcVNZRJ
jFZ3H+AJQORt0IOlRoLCkH6s7FWVkg6hDhz6oma3gCJp9DwX3a0pAe4ID/odVQjI
FBNf8FmSMo46oOERuR6bx/SFc47foWPNverqBIVFCwR2XYm/k5nhyXbvr99xxdLf
2OmSJGH8l/+5biNJ8aCjrEOA/RAw3KqQS1b+bxY8TXFnyF/9sSPP/K9KQO3pDMmh
WJT6SF+CozjnVY01AO60+wbCFkphv0XDVBw2sqQKQAY9PqI1yIsctK3Q3qXYk7YM
Dc4yUyh8pReowy3fuWROLBp8ViDKbP06ryEZxpV/Eozrpw2pztrAilI5VuoS3MVK
dnozgAX72vMwMUkU7mDS
=kIFn
-----END PGP SIGNATURE-----
