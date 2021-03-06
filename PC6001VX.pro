#-------------------------------------------------
#
# Project created by QtCreator 2012-01-01T00:17:09
#
#-------------------------------------------------

QT += core gui widgets network

TARGET = PC6001VX
TEMPLATE = app

TRANSLATIONS = src/Qt/translation/PC6001VX_en.ts
TR_EXCLUDE += /usr/include/*

CONFIG += link_prl link_pkgconfig c++11

#Define for Qt dependent code
DEFINES += QTP6VX

#Use FMGEN for PSG(For non commercial only)
#DEFINES += USEFMGEN

#Disable joystick support. If uncommented below, PC6001VX does not depend on SDL2.
#DEFINES += NOJOYSTICK

#Disable video capture support. If uncommented below, PC6001VX does not depend on ffmpeg.
#DEFINES += NOAVI

#Disable debug features. For low performance machine.
#DEFINES += NOMONITOR

#Other feature control flags.
#DEFINES += NOSINGLEAPP
#DEFINES += NOOPENGL
#DEFINES += NOSOUND
#DEFINES += AUTOSUSPEND
#DEFINES += REPLAYDEBUG_FRAME
#DEFINES += REPLAYDEBUG_INST

debug:DEFINES += DEBUG
CONFIG(release, debug|release):DEFINES += QT_NO_DEBUG_OUTPUT
INCLUDEPATH += src/Qt src/Qt/qtsingleapplication

#Configuration for UNIX variants
unix:!macx {
#Configuration for Android
android {
DEFINES += NOSINGLEAPP NOJOYSTICK NOMONITOR NOAVI ALWAYSFULLSCREEN AUTOSUSPEND
DEFINES -= QT_NO_DEBUG_OUTPUT
#Set "ROM Path in target device" to "CUSTOM_ROM_PATH environment variable on build host"
debug:DEFINES += CUSTOMROMPATH=\\\"$$(CUSTOM_ROM_PATH)\\\"
QT += androidextras
}

pandora {
#Configuration for OpenPandora
QT += x11extras

DEPLOY_PATH = /media/sddev/pc6001vx
target.path = $${DEPLOY_PATH}
sharedlibs.path = $${DEPLOY_PATH}
sharedlibs.files += $${PANDORA_SDK}/usr/lib/libX11.so.6 \
                    $${PANDORA_SDK}/usr/lib/libX11.so.6.3.0 \
                    $${PANDORA_SDK}/usr/lib/libX11-xcb.so.1 \
                    $${PANDORA_SDK}/usr/lib/libX11-xcb.so.1.0.0 \
                    $${PANDORA_SDK}/usr/lib/libxcb.so.1 \
                    $${PANDORA_SDK}/usr/lib/libxcb.so.1.1.0

QMAKE_LFLAGS += $${QMAKE_LFLAGS_RPATH}$${DEPLOY_PATH}
INSTALLS += target sharedlibs
DEFINES += NOOPENGL NOJOYSTICK NOMONITOR NOAVI
#QTPLUGIN += qxcb qeglfs
}
!android:!pandora {
#Configuration for X11(XCB)
DEFINES += USE_X11
QT += x11extras
PKGCONFIG += x11
}
}

#Configuration for Windows
win32 {
DEFINES += WIN32
#On Windows, links libraries statically as long as possible.
QMAKE_LFLAGS += -static -lpthread
RC_ICONS += src/win32/PC6001VX.ico
}

!contains(DEFINES, NOJOYSTICK) {
PKGCONFIG += sdl2
}

!contains(DEFINES, NOOPENGL) {
QT += opengl
}

!contains(DEFINES, NOSOUND) {
QT += multimedia
SOURCES += \
    src/Qt/wavfile.cpp \
    src/Qt/utils.cpp
}

!contains(DEFINES, NOAVI) {
DEFINES += __STDC_CONSTANT_MACROS __STDC_FORMAT_MACROS
PKGCONFIG += libavformat libavcodec libswscale libswresample libavutil
}

SOURCES += \
    src/Qt/aboutdialog.cpp \
    src/Qt/colorbutton.cpp \
    src/Qt/configdialog.cpp \
    src/Qt/emulationadaptor.cpp \
    src/Qt/osdQt.cpp \
    src/Qt/pc6001v.cpp \
    src/Qt/qtel6.cpp \
    src/Qt/qtsingleapplication/qtlocalpeer.cpp \
    src/Qt/qtsingleapplication/qtlockedfile.cpp \
    src/Qt/qtsingleapplication/qtlockedfile_unix.cpp \
    src/Qt/qtsingleapplication/qtlockedfile_win.cpp \
    src/Qt/qtsingleapplication/qtsingleapplication.cpp \
    src/Qt/qtsingleapplication/qtsinglecoreapplication.cpp \
    src/Qt/renderview.cpp \
    src/Qt/semaphore.cpp \
    src/Qt/thread.cpp \
    src/breakpoint.cpp \
    src/common.cpp \
    src/config.cpp \
    src/console.cpp \
    src/cpum.cpp \
    src/cpus.cpp \
    src/d88.cpp \
    src/debug.cpp \
    src/device.cpp \
    src/device/ay8910.cpp \
    src/device/fmgen/fmgen.cpp \
    src/device/fmgen/fmtimer.cpp \
    src/device/fmgen/opm.cpp \
    src/device/fmgen/opna.cpp \
    src/device/mc6847.cpp \
    src/device/pd7752.cpp \
    src/device/pd8255.cpp \
    src/device/ym2203.cpp \
    src/device/z80-dbg.cpp \
    src/device/z80.cpp \
    src/disk.cpp \
    src/error.cpp \
    src/graph.cpp \
    src/ini.cpp \
    src/intr.cpp \
    src/io.cpp \
    src/joystick.cpp \
    src/keyboard.cpp \
    src/memory.cpp \
    src/movie.cpp \
    src/p6el.cpp \
    src/p6t2.cpp \
    src/p6vm.cpp \
    src/pio.cpp \
    src/replay.cpp \
    src/schedule.cpp \
    src/sound.cpp \
    src/status.cpp \
    src/tape.cpp \
    src/vdg.cpp \
    src/voice.cpp \
    src/vsurface.cpp \ 
    src/Qt/keypanelbutton.cpp \
    src/Qt/keypanel.cpp \
    src/Qt/p6vxapp.cpp \
    src/psgfm.cpp \
    src/device/fmgen/psg.cpp \
    src/Qt/mainwidget.cpp \
    src/Qt/virtualkeytabwidget.cpp \
    src/Qt/virtualkeyitem.cpp \
    src/Qt/simplevirtualkeyboardscene.cpp \
    src/Qt/virtualkeyboardscene.cpp \
    src/Qt/keystatewatcher.cpp \
    src/Qt/normalvirtualkeyboardscene.cpp \
    src/Qt/virtualkeyboardview.cpp \
    src/Qt/virtualstickitem.cpp

HEADERS  += \
    openpandora/pandora_develop_environment/linux-pandora-g++/qplatformdefs.h \
    src/Qt/aboutdialog.h \
    src/Qt/colorbutton.h \
    src/Qt/configdialog.h \
    src/Qt/emulationadaptor.h \
    src/Qt/qtel6.h \
    src/Qt/qtsingleapplication/QtLockedFile \
    src/Qt/qtsingleapplication/QtSingleApplication \
    src/Qt/qtsingleapplication/qtlocalpeer.h \
    src/Qt/qtsingleapplication/qtlockedfile.h \
    src/Qt/qtsingleapplication/qtsingleapplication.h \
    src/Qt/qtsingleapplication/qtsinglecoreapplication.h \
    src/Qt/qtutil.h \
    src/Qt/renderview.h \
    src/Qt/utils.h \
    src/Qt/wavfile.h \
    src/breakpoint.h \
    src/common.h \
    src/config.h \
    src/console.h \
    src/cpum.h \
    src/cpus.h \
    src/d88.h \
    src/debug.h \
    src/device.h \
    src/device/ay8910.h \
    src/device/fmgen/diag.h \
    src/device/fmgen/fmgen.h \
    src/device/fmgen/fmgeninl.h \
    src/device/fmgen/fmtimer.h \
    src/device/fmgen/headers.h \
    src/device/fmgen/misc.h \
    src/device/fmgen/opm.h \
    src/device/fmgen/opna.h \
    src/device/fmgen/types.h \
    src/device/mc6847.h \
    src/device/pd7752.h \
    src/device/pd8255.h \
    src/device/psgbase.h \
    src/device/ym2203.h \
    src/device/z80-cdCB.h \
    src/device/z80-cdED.h \
    src/device/z80-cdXC.h \
    src/device/z80-cdXX.h \
    src/device/z80-code.h \
    src/device/z80-tbl.h \
    src/device/z80.h \
    src/disk.h \
    src/error.h \
    src/event.h \
    src/graph.h \
    src/id_menu.h \
    src/ini.h \
    src/intr.h \
    src/io.h \
    src/joystick.h \
    src/keyboard.h \
    src/keydef.h \
    src/log.h \
    src/memory.h \
    src/movie.h \
    src/osd.h \
    src/p6el.h \
    src/p6t2.h \
    src/p6vm.h \
    src/pc6001v.h \
    src/pio.h \
    src/replay.h \
    src/schedule.h \
    src/semaphore.h \
    src/sound.h \
    src/status.h \
    src/tape.h \
    src/thread.h \
    src/typedef.h \
    src/vdg.h \
    src/voice.h \
    src/vsurface.h \ 
    src/Qt/keypanelbutton.h \
    src/Qt/keypanel.h \
    src/Qt/p6vxapp.h \
    src/psgfm.h \
    src/device/fmgen/psg.h \
    src/Qt/audiooutputwrapper.h \
    src/Qt/mainwidget.h \
    src/Qt/virtualkeytabwidget.h \
    src/Qt/virtualkeyitem.h \
    src/Qt/simplevirtualkeyboardscene.h \
    src/Qt/virtualkeyboardscene.h \
    src/Qt/keystatewatcher.h \
    src/Qt/normalvirtualkeyboardscene.h \
    src/Qt/virtualkeyboardview.h \
    src/Qt/virtualstickitem.h

FORMS    += \
    src/Qt/configdialog.ui \
    src/Qt/aboutdialog.ui \
    src/Qt/virtualkeytabwidget.ui

OTHER_FILES += \
    android/AndroidManifest.xml \
    openpandora/PC-6001.png \
    openpandora/PC6001VX.sh \
    openpandora/PXML.xml \
    openpandora/create_pnd.sh \
    openpandora/pandora_develop_environment/environment_build.log \
    openpandora/pandora_develop_environment/linux-pandora-g++/qmake.conf \
    openpandora/pandora_develop_environment/pandora_develop_environment.sh \
    openpandora/pandora_develop_environment/qtmultimedia.patch \
    openpandora/pandora_develop_environment/qtmultimedia53.patch \
    openpandora/pandora_develop_environment/sdk_installer_openpandora_toolchain.sh \
    src/Qt/res/PC-6001.ico \
    src/Qt/res/PC-6001mk2.ico \
    src/Qt/res/PC-6001mk2SR.ico \
    src/Qt/res/PC-6601.ico \
    src/Qt/res/PC-6601SR.ico \
    src/Qt/res/background.png \
    src/Qt/res/font/fonth12.png \
    src/Qt/res/font/fontz12.png \
    src/Qt/res/fontz12.png \
    src/Qt/translation/PC6001VX_en.qm \
    src/Qt/translation/PC6001VX_en.ts \
    src/device/fmgen/readme.txt \
    src/win32/PC6001VX.ico \
    win32/angle.patch \
    win32/angle52.patch \
    win32/buildenv.sh \
    win32/optimize.patch \
    win32/safemode.bat \
    win32/toolchain.sh \ 
    android/res/drawable-ldpi/icon.png \
    win32/release.sh \
    doc/about.png \
    doc/firstboot.png \
    doc/keypanel.png \
    doc/menu.png \
    doc/monitormode.png \
    doc/overview.png \
    doc/romcrc.png \
    doc/setting_basic.png \
    doc/setting_color1.png \
    doc/setting_color2.png \
    doc/setting_file.png \
    doc/setting_folder.png \
    doc/setting_input.png \
    doc/setting_other.png \
    doc/setting_screen.png \
    doc/setting_sound.png \
    doc/tilt.png \
    doc/markdown.css \
    data/PC-6001_16.png \
    data/PC-6001_32.png \
    data/PC-6001_48.png \
    data/PC-6001_64.png \
    data/PC-6001_256.png \
    data/PC-6001.svg \
    data/PC-6001_128.png \
    openpandora/pandora_develop_environment/eglfs.patch \
    openpandora/pandora_develop_environment/eglplatform.patch

RESOURCES += \
    src/Qt/pc6001vx.qrc

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

DISTFILES += \
    README.html \
    LICENSE \
    README.adoc \
    win32/buildenv.sh \
    win32/buildrelease.sh \
    win32/release.sh \
    win32/safemode.bat


