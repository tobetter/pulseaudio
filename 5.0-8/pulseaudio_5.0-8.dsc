-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 5.0-8
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.5
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson0-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-login-dev [linux-any], libsystemd-journal-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 e420931a0b9cf37331cd06e30ba415046317ab85 1455428 pulseaudio_5.0.orig.tar.xz
 a6424fa355e3495dcffa5c98992b8060ed3d8dc3 37112 pulseaudio_5.0-8.debian.tar.xz
Checksums-Sha256:
 99c13a8b1249ddbd724f195579df79484e9af6418cecf6a15f003a7f36caf939 1455428 pulseaudio_5.0.orig.tar.xz
 5ec5781e9cd58c977eed4df90f3a2f2f08dc609fc4807327f0b2767c51d303d0 37112 pulseaudio_5.0-8.debian.tar.xz
Files:
 c43749838612f4860465e83ed62ca38e 1455428 pulseaudio_5.0.orig.tar.xz
 c68323b80368f1663ecf8cf60392d803 37112 pulseaudio_5.0-8.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJT7DRBAAoJEKO6uuJAjdbPrCsQAJjaxILut3HmfLySQc8N4afV
3iTxawDdPJJrdTMNBPkk5oU0ZpWacEoRp2jsWJDQSgn+rD3qoyvQ9BzKEuaXAKny
hL+Wdu/MuBlRA5HZDN5+71CZ2SHIU8Ho5kQ7qMlJlgCKi/10Vq/Ydzqrx4J93J9k
1kMsYC9ztuCif2GJFVs0TTEkl3TnjJdK3WNKWeGLtgGwatC9kOinQ6U590GL7naJ
B5iy6/kZMWJMNDWtXxFEJdOt1HWdG5lrfhKkHjeQoi3+bkac8VtMwkCRlRB2HXf+
UZhekT54BwuKGGDo22r2Mvnyx23dnFNf0G0NYI/kBPh6auJDfZrQuTnQN4FKYBsF
SRYqk9rNx1/muhpwqWtftrud72SMtm7ljdoUok0jskhdSzpncc8XblNhdswslqX5
Oigbn+J6zP43jjqmRx1lNN6KXJQ2LVO24JHjr3tbo+ioHVKPdIpaXTcE7C/511sM
ezFA1+WVKfGxwkGrdqt3oHh0HYtrw7G8upWrWdA5+rRvJ1zOA2OoYOMrguEt3XhC
iLVXAHSNVs4YHrZ2aKOaE5Kg+sz9hZACN+BoWVYqFzteLYehidkM4oOmUEUqh0oW
bgLcnZSJSS8tAUPbX7xV1vMZdy5BoG/dNw6ua/5kz+nkSqwENYRIB0jTtq9EOAMk
Np1WEuKeFAIAbMc3qwEj
=4Kd7
-----END PGP SIGNATURE-----
