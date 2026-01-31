import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

ApplicationWindow {
    id: window
    width: 1280
    height: 720
    visible: true
    title: "Qt 6.5 ColorScheme 示例"

    readonly property bool uiDark: themeSwitch.userModified ? themeSwitch.checked : themeManager.isDarkMode

    Material.theme: uiDark ? Material.Dark : Material.Light
    Material.accent: Material.DeepPurple

    Column {
        anchors.centerIn: parent
        spacing: 20

        Label {
            text: "系统检测: " + (themeManager.isDarkMode ? "暗色" : "亮色")
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Switch {
            id: themeSwitch
            text: "手动覆盖主题"
            property bool userModified: false

            checked: themeManager.isDarkMode

            onClicked: {
                userModified = true;
            }
        }

        Button {
            text: "重置并跟随系统"
            onClicked: themeSwitch.userModified = false
        }
    }
}
