import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts


Item{
    id: root

    property string title: "Movie Title"
    property string release_date: "Date"
    property int popularity: 100
    property var poster: Resources.get("poster.webp")
    property int movie_id

    RoundedBox{
        id: source_rect
        visible: false
        anchors.fill: parent

        Image{ // Poster
            id: poster
            source: root.poster
            sourceSize: Qt.size(source_rect.width, source_rect.height)

            // Popularity Progress
            PopularityProgress{
                popularity: root.popularity
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
                    text: root.title
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    Layout.fillWidth: true
                }

                Text{
                    text: root.release_date
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

    MouseArea{
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor
        onClicked: {
            // main_layout.state = "movie-details"
            print(root.movie_id)
        }
    }
}