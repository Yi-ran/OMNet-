# qtenv.pri is automatically generated from qtenv.pri.in by the
# configure script, so any manual modifications will be lost.

# This file serves no real purpose for the build itself, just
# tells Qt Creator the relevant defines, so it can highlight
# and index the code accordingly during development.

<<<<<<< HEAD
WITH_OSG = yes
=======
WITH_OSG = no
>>>>>>> c5a259b2be548d1ad67dc20a1954f2831997c53a
equals(WITH_OSG, yes) {
  DEFINES += WITH_OSG
}

WITH_OSGEARTH = yes
equals(WITH_OSGEARTH, yes) {
  DEFINES += WITH_OSGEARTH
}
