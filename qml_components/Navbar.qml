import QtQuick
import QtQuick.Layouts
import "custom_components"

Rectangle{  // Header
    color: "#032541"
    height: 64

    RowLayout{
        spacing: 30
        anchors.fill: parent
        anchors.leftMargin: 30
        anchors.rightMargin: 30

        Image{
            source: "../resources/logo.svg"
            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: main_layout.state = "movie-list"
            }
        }

        TextButton{text: "Movies"}
        TextButton{text: "TV Shows"}
        TextButton{text: "People"}
        TextButton{text: "More"}

        Item{Layout.fillWidth: true}

        TextButton{text: "Login"}
        TextButton{text: "Join TMDB"}
    }
}