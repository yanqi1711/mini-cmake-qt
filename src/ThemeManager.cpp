#include "ThemeManager.h"
#include <QGuiApplication>
#include <QStyleHints>

ThemeManager::ThemeManager(QObject *parent)
	: QObject(parent)
{
	connect(qGuiApp->styleHints(), &QStyleHints::colorSchemeChanged, this,
		&ThemeManager::onColorSchemeChanged);
}

bool ThemeManager::isDarkMode() const
{
	return qGuiApp->styleHints()->colorScheme() == Qt::ColorScheme::Dark;
}

void ThemeManager::onColorSchemeChanged()
{
	emit darkModeChanged();
}