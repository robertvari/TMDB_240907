import QtQuick

Text{
    id: root
    text: "Text button"
    font.bold: true
    font.pixelSize: 18
    color: "white"

    signal clicked

    MouseArea{
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: root.clicked()
    }
}