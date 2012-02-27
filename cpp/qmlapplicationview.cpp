#include "qmlapplicationview.h"

#include <QtCore/QDir>
#include <QtCore/QFileInfo>
#include <QtDeclarative/QDeclarativeComponent>
#include <QtDeclarative/QDeclarativeEngine>
#include <QtDeclarative/QDeclarativeContext>

#if 0 // defined(Q_OS_SYMBIAN) && defined(ORIENTATIONLOCK)
#include <eikenv.h>
#include <eikappui.h>
#include <aknenv.h>
#include <aknappui.h>
#endif // Q_OS_SYMBIAN && ORIENTATIONLOCK

class QmlApplicationViewPrivate
{
    QString mainQmlFile;
    friend class QmlApplicationView;
};

QmlApplicationView::QmlApplicationView(const QString &mainQmlFile, QWidget *parent)
    : QDeclarativeView(parent)
    , m_d(new QmlApplicationViewPrivate)
{
    m_d->mainQmlFile = mainQmlFile;
    setSource(QUrl(m_d->mainQmlFile));
    connect(engine(), SIGNAL(quit()), SLOT(close()));
    setResizeMode(QDeclarativeView::SizeRootObjectToView);
}

QmlApplicationView::~QmlApplicationView()
{
    delete m_d;
}

void QmlApplicationView::setImportPathList(const QStringList &importPaths)
{
    engine()->setImportPathList(importPaths);
}

void QmlApplicationView::setOrientation(Orientation orientation)
{
    if (orientation != Auto) {
#if 0 // defined(Q_OS_SYMBIAN)
#if defined(ORIENTATIONLOCK)
        const CAknAppUiBase::TAppUiOrientation uiOrientation =
                (orientation == LockPortrait) ? CAknAppUi::EAppUiOrientationPortrait
                    : CAknAppUi::EAppUiOrientationLandscape;
        CAknAppUi* appUi = dynamic_cast<CAknAppUi*> (CEikonEnv::Static()->AppUi());
        TRAPD(error,
            if (appUi)
                appUi->SetOrientationL(uiOrientation);
        );
#else // ORIENTATIONLOCK
        qWarning("'ORIENTATIONLOCK' needs to be defined on Symbian when locking the orientation.");
#endif // ORIENTATIONLOCK
#endif // Q_OS_SYMBIAN
    }
}

void QmlApplicationView::setLoadDummyData(bool loadDummyData)
{
    if (loadDummyData) {
        const QFileInfo mainQmlFileInfo(m_d->mainQmlFile);
        const QDir dir(mainQmlFileInfo.absolutePath() + QLatin1String("/dummydata"),
                 QLatin1String("*.qml"));
        foreach (const QFileInfo &qmlFile, dir.entryInfoList()) {
            QFile f(qmlFile.absoluteFilePath());
            if (f.open(QIODevice::ReadOnly)) {
                QDeclarativeComponent comp(engine());
                comp.setData(f.readAll(), QUrl());
                QObject *dummyData = comp.create();
                if (dummyData) {
                    rootContext()->setContextProperty(qmlFile.baseName(), dummyData);
                    dummyData->setParent(this);
                }
            }
        }
    }
}
