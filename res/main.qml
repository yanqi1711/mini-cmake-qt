import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

ApplicationWindow {
    id: window
    width: 1280
    height: 720
    visible: true
    title: "Qt 6.5 ColorScheme 示例"

    readonly property bool uiDark: themeSwitch.userModified ? themeSwitch.checked : theme.isDarkMode

    Material.theme: uiDark ? Material.Dark : Material.Light
    Material.accent: Material.Blue

    Row {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 20
        spacing: 10

        Button {
            id: themeSwitch
            Material.accent: Material.darkgray
            width: 32
            height: 32
            background: Rectangle {
                color: "transparent"
            }

            property bool userModified: false
            checked: theme.isDarkMode

            onClicked: {
                userModified = true;
                checked = !checked;
            }

            Image {
                id: themeIcon
                anchors.fill: parent
                source: uiDark ? "qrc:/res/IcTwotoneDarkMode.svg" : "qrc:/res/IcTwotoneLightMode.svg"
                fillMode: Image.PreserveAspectFit
            }

            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
        }
    }
}
