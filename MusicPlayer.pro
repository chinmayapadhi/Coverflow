QT =    core \
        gui \
        declarative \
        network \ 
        sql

# MAINQML #
OTHER_FILES = qml/app/*.qml
OTHER_FILES += qml/app/pics/*.png
OTHER_FILES += qml/app/*.js
SOURCES = cpp/main.cpp cpp/qmlapplicationview.cpp
HEADERS = cpp/qmlapplicationview.h
INCLUDEPATH += cpp

# DEPLOYMENTFOLDERS #
DEPLOYMENTFOLDERS = qml/app qml/app/pics

# Avoid auto screen rotation
# ORIENTATIONLOCK #
# DEFINES += ORIENTATIONLOCK

# Needs to be defined for Symbian
# NETWORKACCESS #
# DEFINES += NETWORKACCESS

symbian {
    # TARGETUID3 #
    TARGET.UID3 = 0xE1111235
    TARGET.CAPABILITY += NetworkServices ReadDeviceData WriteDeviceData
    ICON = cpp/symbianicon.svg
    TARGET.EPOCHEAPSIZE = 0x20000 0x2000000
    for(deploymentfolder, DEPLOYMENTFOLDERS) {
        eval(item$${deploymentfolder}.sources = $${deploymentfolder})
        eval(item$${deploymentfolder}.path = qml)
        eval(DEPLOYMENT += item$${deploymentfolder})
    }
#    contains(DEFINES, ORIENTATIONLOCK):LIBS += -lavkon -leikcore -leiksrv -lcone
#   contains(DEFINES, NETWORKACCESS):TARGET.CAPABILITY += NetworkServices
} else:win32 {
    # Ossi will want to kill me when he reads this
    # TODO: Let Ossi do some deployment-via-qmake magic
    !isEqual(PWD,$$OUT_PWD):!contains(CONFIG, build_pass) {
        copyCommand = @echo Copying Qml files...
        for(deploymentfolder, DEPLOYMENTFOLDERS) {
            pathSegments = $$split(deploymentfolder, /)
            sourceAndTarget = $$PWD/$$deploymentfolder $$OUT_PWD/qml/$$last(pathSegments)
            copyCommand += && $(COPY_DIR) $$replace(sourceAndTarget, /, \\)
        }
        copyqmlfiles.commands = $$copyCommand
        first.depends = $(first) copyqmlfiles
        QMAKE_EXTRA_TARGETS += first copyqmlfiles
    }
} else {
    # TODO: make this work
    for(deploymentfolder, DEPLOYMENTFOLDERS) {
        eval(item$${deploymentfolder}.files = $${deploymentfolder})
        eval(item$${deploymentfolder}.path = qml)
        eval(INSTALLS += item$${deploymentfolder})
    }
}
