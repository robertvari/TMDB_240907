import QtQuick
import Qt5Compat.GraphicalEffects

Item{

    RoundedBox{
        id: source_rect
        visible: false
        anchors.fill: parent

        Image{ // Poster
            source: "../../resources/poster.webp"
            sourceSize: Qt.size(source_rect.width, source_rect.height)

            Rectangle{
                id: popularity_progress
                width: 60
                height: width
                color: "lightBlue"
                radius: width
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -height/2
                anchors.left: parent.left
                anchors.leftMargin: 10
            }
        }

        Item{ //Movie title container

        }
    }


    DropShadow{
        anchors.fill: parent
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8
        color: "#e3e3e3"
        source: source_rect
    }
}