#include "ThemeManager.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>

int main(int argc, char *argv[])
{
	QQuickStyle::setStyle("Material");

	QGuiApplication app(argc, argv);

	ThemeManager themeManager;
	QQmlApplicationEngine engine;

	engine.rootContext()->setContextProperty("themeManager", &themeManager);

	const QUrl url(QStringLiteral("qrc:/res/main.qml"));

	QObject::connect(
		&engine, &QQmlApplicationEngine::objectCreationFailed, &app,
		[]() { QCoreApplication::exit(-1); }, Qt::QueuedConnection);

	engine.load(url);

	if (engine.rootObjects().isEmpty()) {
		return -1;
	}

	return app.exec();
}
