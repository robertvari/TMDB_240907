import QtQuick
import QtQuick.Controls.Basic

TextField{
    property string icon
    leftPadding: 25
    font.pixelSize: 16
    color: "black"

    background: Rectangle{
        radius: 10
        border.color: "#e3e3e3"
    }

    Image{
        source: parent.icon
        sourceSize: Qt.size(20, 20)
        opacity: 0.3
        y: 6
        x: 3
    }
}