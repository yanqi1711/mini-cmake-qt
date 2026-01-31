#ifndef THEMEMANAGER_H
#define THEMEMANAGER_H

#include <QObject>

class ThemeManager : public QObject {
	Q_OBJECT
	Q_PROPERTY(bool isDarkMode READ isDarkMode NOTIFY darkModeChanged)

    public:
	explicit ThemeManager(QObject *parent = nullptr);
	bool isDarkMode() const;

    signals:
	void darkModeChanged();

    private:
	void onColorSchemeChanged();
};

#endif // THEMEMANAGER_H