-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-droid, pulseaudio-module-droid-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 1:6.0-0ubuntu3
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Testsuite: autopkgtest
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.40) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libhardware-dev [armhf i386 amd64], libgtk-3-dev, libice-dev, libjack-dev, libjson0-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
Package-List:
 libpulse-dev deb libdevel optional arch=any
 libpulse-mainloop-glib0 deb sound optional arch=any
 libpulse-mainloop-glib0-dbg deb debug extra arch=any
 libpulse0 deb libs optional arch=any
 libpulse0-dbg deb debug extra arch=any
 libpulsedsp deb sound optional arch=any
 libpulsedsp-dbg deb debug extra arch=any
 pulseaudio deb sound optional arch=any
 pulseaudio-dbg deb debug extra arch=any
 pulseaudio-esound-compat deb sound optional arch=any
 pulseaudio-esound-compat-dbg deb debug extra arch=any
 pulseaudio-module-bluetooth deb sound extra arch=linux-any
 pulseaudio-module-bluetooth-dbg deb debug extra arch=linux-any
 pulseaudio-module-droid deb sound extra arch=armhf,i386,amd64
 pulseaudio-module-droid-dbg deb debug extra arch=armhf,i386,amd64
 pulseaudio-module-gconf deb sound optional arch=any
 pulseaudio-module-gconf-dbg deb debug extra arch=any
 pulseaudio-module-jack deb sound optional arch=any
 pulseaudio-module-jack-dbg deb debug extra arch=any
 pulseaudio-module-lirc deb sound optional arch=any
 pulseaudio-module-lirc-dbg deb debug extra arch=any
 pulseaudio-module-raop deb sound optional arch=any
 pulseaudio-module-raop-dbg deb debug extra arch=any
 pulseaudio-module-x11 deb sound optional arch=any
 pulseaudio-module-x11-dbg deb debug extra arch=any
 pulseaudio-module-zeroconf deb sound optional arch=any
 pulseaudio-module-zeroconf-dbg deb debug extra arch=any
 pulseaudio-utils deb sound optional arch=any
 pulseaudio-utils-dbg deb debug extra arch=any
Checksums-Sha1:
 3607d523fb270d9b68463de30f5d9e17957f1088 1469248 pulseaudio_6.0.orig.tar.xz
 4a195f7417cd8058f47d1fc44b7db530e7709a7c 97520 pulseaudio_6.0-0ubuntu3.debian.tar.xz
Checksums-Sha256:
 b50640e0b80b1607600accfad2e45aabb79d379bf6354c9671efa2065477f6f6 1469248 pulseaudio_6.0.orig.tar.xz
 629d0d4743fd5fcccd6a7256363af894712cba134ed323dfb00dd80aa6808ed2 97520 pulseaudio_6.0-0ubuntu3.debian.tar.xz
Files:
 b691e83b7434c678dffacfa3a027750e 1469248 pulseaudio_6.0.orig.tar.xz
 59172652776ec501b46e0a870c69619a 97520 pulseaudio_6.0-0ubuntu3.debian.tar.xz
Debian-Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Debian-Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Original-Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU5RXMAAoJEHNgbJmxYiOjXn8P/3MquEoBOAwLdQQ8yV/jtE7U
wVKQFfAHQG7V7D/mRj+Izo1w2BkxyIyZSORbnOJLZfXyGCQoY44jzcH4jdmrZufi
GK65pvn1pudEoRxNGBvP5RTUC/+/675VArg2SKgWr68VIfyY33a8B8FLlKpTRQGI
v3xoOwyvpRG3wqIGGsUQ2d3R1R+updHqXzDhq795s7R8Z0OyUXRd1K48bAKaxjmP
LnLYvWQ60y0809ka+pbryp1LIdytE6Z+xEx6WngG2p6F+q2fwOKY48C/8KcrlTOO
x7gVn/v8dfoWCAcVnM71Gx1ZWbWftK3K8sIwwfsKZUdu7TkT2+O5PeJ97UmrpSob
/yMPsX2ltLxhRrfOQr6n29z5zxF4tXyqRif3naYyq8YJ1OFp47KmJ5400y3G7QGJ
uUzzEFgFlPFi6CmJn/ES74E58xrvlTIZEET/93y/aasWd56DA8m8BDQt8XuX1J7Q
fUCjvZYt3uZzHvGp4vKbxHUflNheZxaFbFQMZtTvsRkQnJUh7eVhUJz5vMes0ncO
ZNhDysMgudzNG98dnFF9aLIXpPhSExtj/S1Qd6f1r53pu4bKElZRxc2cY1V+6fnN
A5h7uZ4+jjMbY3pbdXQ1vHekek9jwGBawQP/zH/CPnXV/AQNn4wFlFOW2AxuVLEC
A0RSKJiuA4A5vnbZYJNT
=+edF
-----END PGP SIGNATURE-----
