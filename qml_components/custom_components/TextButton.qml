import QtQuick

Text{
    text: "Text button"
    font.bold: true
    font.pixelSize: 18
    color: "white"

    MouseArea{
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: print(parent.text)
    }
}