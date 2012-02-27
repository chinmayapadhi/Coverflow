#include <QtGui/QApplication>
#include <QDeclarativeEngine>
#include <QDeclarativeContext>
#include <QDesktopWidget>
#include "qmlapplicationview.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QmlApplicationView qmlApp(QLatin1String("qml/app/stunes.qml")); // MAINQML

    QDesktopWidget* obj = app.desktop();
    QString str("desktop");
    qmlApp.engine()->rootContext()->setContextProperty(str, obj);

    QStringList importPaths; // IMPORTPATHSLIST
    qmlApp.setImportPathList(importPaths); // SETIMPORTPATHLIST
    qmlApp.setOrientation(QmlApplicationView::Auto); // ORIENTATION
    qmlApp.setLoadDummyData(false); // LOADDUMMYDATA

//#ifdef Q_OS_SYMBIAN
    qmlApp.showFullScreen();
//#else
//    qmlApp.setGeometry(QRect(100, 100, 360, 640));
//    qmlApp.show();
//#endif
    return app.exec();
}
