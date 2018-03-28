-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-dbg, pulseaudio-utils, pulseaudio-utils-dbg, pulseaudio-esound-compat, pulseaudio-esound-compat-dbg, pulseaudio-module-zeroconf, pulseaudio-module-zeroconf-dbg, pulseaudio-module-jack, pulseaudio-module-jack-dbg, pulseaudio-module-lirc, pulseaudio-module-lirc-dbg, pulseaudio-module-gconf, pulseaudio-module-gconf-dbg, pulseaudio-module-raop, pulseaudio-module-raop-dbg, pulseaudio-module-bluetooth, pulseaudio-module-bluetooth-dbg, pulseaudio-module-x11, pulseaudio-module-x11-dbg, libpulse0, libpulse0-dbg, libpulse-mainloop-glib0, libpulse-mainloop-glib0-dbg, libpulse-dev, libpulsedsp, libpulsedsp-dbg
Architecture: any
Version: 6.99.1-2
Maintainer: Pulseaudio maintenance team <pkg-pulseaudio-devel@lists.alioth.debian.org>
Uploaders: Sjoerd Simons <sjoerd@debian.org>, Balint Reczey <balint@balintreczey.hu>, Felipe Sateler <fsateler@debian.org>
Homepage: http://www.pulseaudio.org
Standards-Version: 3.9.6
Vcs-Browser: http://anonscm.debian.org/gitweb/?p=pkg-pulseaudio/pulseaudio.git
Vcs-Git: git://anonscm.debian.org/git/pkg-pulseaudio/pulseaudio.git
Build-Depends: debhelper (>= 9), cdbs (>= 0.4.93), check, dh-autoreconf, dh-exec, intltool, libasound2-dev (>= 1.0.24) [linux-any], libasyncns-dev, libatomic-ops-dev, libavahi-client-dev, libbluetooth-dev (>= 4.99) [linux-any], libsbc-dev [linux-any], libcap-dev [linux-any], libfftw3-dev, libgconf2-dev, libglib2.0-dev, libgtk-3-dev, libice-dev, libjack-dev, libjson-c-dev (>= 0.11), liblircclient-dev, libltdl-dev (>= 2.2.6a-2), liborc-0.4-dev (>= 1:0.4.11), libsamplerate0-dev, libsndfile1-dev (>= 1.0.20), libspeexdsp-dev (>= 1.2~rc1), libssl-dev, libsystemd-dev [linux-any], libtdb-dev [!hurd-any], libudev-dev (>= 143) [linux-any], libwebrtc-audio-processing-dev, libwrap0-dev, libx11-xcb-dev, libxcb1-dev (>= 1.6), libxtst-dev
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
 4c463999562e557801fb47e8ae363c3bb5460ee4 1519340 pulseaudio_6.99.1.orig.tar.xz
 715172e14b064255cce05bda3fea29b08333a741 30796 pulseaudio_6.99.1-2.debian.tar.xz
Checksums-Sha256:
 e0fe622b52cb3d9c82e1845191572845250e68e32faa349aecedc05aff012bac 1519340 pulseaudio_6.99.1.orig.tar.xz
 413626d198a0ace474ad3435d8ac55d951f1977f0e21d358e81fa2aa3cf6a8ab 30796 pulseaudio_6.99.1-2.debian.tar.xz
Files:
 c808839d148ad248358415a7d66aa318 1519340 pulseaudio_6.99.1.orig.tar.xz
 a3f2c293351dc8598470a6abba084768 30796 pulseaudio_6.99.1-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJV8hYOAAoJEKO6uuJAjdbPG+gP/3L0GOa7M3ANX0xoUjoAfms0
oryKcceGwKAVi28xW1In3cuVBlZlEbtHar/JVL0zxKjBQ8Rrw0TsPoFvFoP1GbpX
IIIrk/5KkYCdtn1mU+afJecC4Xj4Qy+2k78jSPgy2OvBBmb+SbSuypxxbFZI27Qp
g1tbfdEsh9loCvsUGgm5mf1M7zGt4VQb59XfWQ+PihS0aTPt73Xjz2p8H1NA+rr0
lvQ2gMJ9dz9KDZDFhBiX04+/X5pEJ8xFC1rLGdaeVCJTLa2y+o4Io28/Mx9+FhDr
Zw7K20i+Sf0PqNlKXimlUE57EPOFHpCbtPmMe63CRoqWK6P/qWgE8ujdoeUzjLVY
gRRJyKThR2BVrTAlbB4dL4iglMRC0w9ZfUAuc1ECwYQOnYaa4cmEvdY7+rNmz2Lr
tBCGa2u2bSZLDYa9Cir/fXNSBGsWxcalAK8yXoGwm7OOYpDg/cy6DsDd7+VBvh//
pHXDD/3XiCSu2gih1znLpx/wYdpvLRh1aKb6z/69rgOBLqvdmhDyLbUUf4Onwosv
1p/wt6lMIOEUUgi/ljUXH7spC4uvFtlZ67OQYRX0Kj/nlm6hyh8NOngpfmfJc9/5
np1Y4g8DfYZRnDWjlP63Dn5qC7HVJlb4Gp0u5QXFfAsszDQeGU8Ou0vFfJbT3t64
Fw43zMXgQ7y7Z4rJ4tmE
=qiGL
-----END PGP SIGNATURE-----
