-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: pulseaudio
Binary: pulseaudio, pulseaudio-utils, pulseaudio-esound-compat, pulseaudio-module-udev, pulseaudio-module-zeroconf, pulseaudio-module-jack, pulseaudio-module-lirc, pulseaudio-module-gconf, pulseaudio-module-raop, pulseaudio-module-bluetooth, pulseaudio-module-x11, libpulse0, libpulse-mainloop-glib0, libpulse-dev, libpulsedsp
Architecture: any
Version: 8.99.1-1
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
 7832de01e5d0ef75748b8318e7dc25b7e46daa0a 1536952 pulseaudio_8.99.1.orig.tar.xz
 3cb56b890536545a4c3d7d691cbd16ed56a7bf3e 30292 pulseaudio_8.99.1-1.debian.tar.xz
Checksums-Sha256:
 ac5f5c105df1b3c8d434eb580c5636a95b5a432f3bcbd45fa32a2a434d0a1505 1536952 pulseaudio_8.99.1.orig.tar.xz
 0f8b1261af6c7c1853dddf83d385bff3c8ebbcb9bd3d20e81413c1b1122d9335 30292 pulseaudio_8.99.1-1.debian.tar.xz
Files:
 8531a4296603cdb1ef10b6483317b94f 1536952 pulseaudio_8.99.1.orig.tar.xz
 9762c5681a2b3e9f621ddf818315f56c 30292 pulseaudio_8.99.1-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJXN2t4AAoJEKO6uuJAjdbPHDEP/ixQ8IoYGU+DCZVNQwRYoqNU
Fl8/DPVkwyU8NyOXhT+BLGpUz0fgiVkI6pFCJfs0CoeTqMLJLMHWvzgE90z9oY+f
LeGHCs89kw09Z06ROAJtOqX0Hxz5307gTLjudoNS9gEl4G779MhkTO0hIaMbKiIJ
jEhESrhk1ncsYhaZnGUULhRA88R9AxZVtN7sS57PYc0E7VDVY1pdvOiezpvNEIfk
Lpdia7kjBOCvAqk8e0U14cTkPL0vO5c4fXU6pKySQXSYuOvWMYSePpaNt3S4Psjx
ARf4RvnkiOObhJnTdT4z8YON8C23lCxgpyE2NR8+16iMCMyP33Sk1+GQ7gSilgZs
LR1x+uYKkXnIS9pf1dxNYWPan51qNKFbLsz7Ng7Td5lyPDAgOLF/DilgfTm96HOz
cxgUtCgQFJqkbvnewCwOg5g2wjO+AMB1c84JRpU5j+8a2C02V48lbulaeTGJ22Ii
fw2TsFY2FH/zNraoFO3MIdMgYt/vDQLhKkNYO07WDgaP5hVMiRIgmiqNacOl7fDW
++1e9AbSVwtZ9GUpyEetcuJL9DYttdAKr+fhE7Fyu1aJjCMyZU3u1v4ONvP0wUjc
AHVm1YZ9cm9etSrS91UyDEZWsKpMrJbakSFRDBsVoIKHgXjHq3xdXVUrZZ0brW5l
mk07NRxGB8LeUVrkI+LN
=2t3V
-----END PGP SIGNATURE-----
