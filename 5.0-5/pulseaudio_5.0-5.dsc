-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 5.0-5
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.5
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), dh-autoreconf, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson0-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-login-dev [linux-any], libsystemd-journal-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 3700627b269e3cbf68cd6bd9bba35818ce1674cd 33612 pulseaudio_5.0-5.debian.tar.xz
Checksums-Sha256:
 99c13a8b1249ddbd724f195579df79484e9af6418cecf6a15f003a7f36caf939 1455428 pulseaudio_5.0.orig.tar.xz
 4bebc186683cd920337555b872543f3a44224edc552d80145d686a6d0edfc8a1 33612 pulseaudio_5.0-5.debian.tar.xz
Files:
 c43749838612f4860465e83ed62ca38e 1455428 pulseaudio_5.0.orig.tar.xz
 f86179e2a668cbc11852b6dfbab84f64 33612 pulseaudio_5.0-5.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJT3rIsAAoJEKO6uuJAjdbPoxQQAIofc7q8Sw3L46pmwPhd5M44
0FI6zza7+cxtra+PZSVAKA4iikRjPYr8zdKzVjhzz2jdPvhRCmYQf/Tvp40+yy2v
zQfa8w0Jr1RGi/5h4rIk8ad5aCPWRWWzPyq2i5ouwejbkvpWwf5OpjvXuC75oHcQ
F5/Kn6qYLmkIg+fDmOcS5+GxseStxt6b851Y7ZeqPgC6iAldJ78LeulvMSNd92CA
SuRxJ/bIBbhm3CN6d2EWIHhRj7KnLczOdQuF908jaP1O7745sh3/W8Q2lu/tZBeb
SgSYWPVdeZbWQweZtIUgGNTfF5cKPUcVz4wZ+XVGn20puRKPD9QGDOjAe4zXePDo
+aiVljH04MU0owFKv2QBp0FBhldUD024+4jMm1pJ3grLNfEQAE+zgg4jeBJUt/gp
7N6TxaWqcGxjIMHerJE7o0jeyANF4o0tPv8Kdm5hHtZXsngEcqyHP4VmO9m4Qw+3
BHeAWw0Sghziv+E8RwXeQUk4ErEzwlpjpkdHvyA9TIzqOTDGYCR3MzT6J9PM+OA+
Gr+3HSclW78lRj3yovf4A5giBDEPTCKUbkTRu52soSHAL1+42+Uzrc3ak6gQtfzb
aox36UU7EXS5gMNV5C190FiFhtfVcQIOvoHCdvc9B2bKYR5OLaglP7rAtLf3sNW/
LQPBD1LLv6nFfRNdD0PE
=B9cf
-----END PGP SIGNATURE-----
