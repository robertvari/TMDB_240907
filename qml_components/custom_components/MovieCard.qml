import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts


Item{

    RoundedBox{
        id: source_rect
        visible: false
        anchors.fill: parent

        Image{ // Poster
            id: poster
            source: "../../resources/poster.webp"
            sourceSize: Qt.size(source_rect.width, source_rect.height)

            Rectangle{
                id: popularity_progress
                width: 60
                height: width
                color: "lightBlue"
                radius: width
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -20
                anchors.left: parent.left
                anchors.leftMargin: 10
            }
        }

        Item{ //Movie title container
            anchors.left: source_rect.left
            anchors.right: source_rect.right
            anchors.bottom: source_rect.bottom
            anchors.top: poster.bottom

            anchors.margins: 5
            anchors.topMargin: 20

            ColumnLayout{
                anchors.fill: parent

                SubtitleText{
                    text: "Saving Bikini Bottom: The Sandy Cheeks Movie"
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    Layout.fillWidth: true
                }

                Text{
                    text: "Jul 25, 2024"
                }
            }
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