import QtQuick
import QtQuick.Layouts
import "custom_components"

Item{
    id: root

    Item{
        width: root.width
        height: 700

        Rectangle{ // black background
            color: "black"
            anchors.fill: parent
        }

        Image{ // Backdrop
            source: MovieDetails.backdrop
            width: parent.width
            height: parent.height
            fillMode: Image.PreserveAspectCrop
            opacity: 0.3
        }

        RowLayout{
            anchors.fill: parent
            
            Item{  // poster container
                implicitHeight: 450
                implicitWidth: 450
                Image{
                    anchors.fill: parent
                    source: MovieDetails.poster
                    fillMode: Image.PreserveAspectFit
                }
            }

            ColumnLayout{  // Movie details container
                Layout.fillWidth: true

                TitleText{
                    text: MovieDetails.title
                    color: "white"
                    font.pixelSize: 35
                }

                Text{
                    text: MovieDetails.date_genres_runtime
                    color: "white"
                    font.pixelSize: 16
                }

                PopularityProgress{
                    popularity: MovieDetails.popularity
                    implicitWidth: 80
                    implicitHeight: 80
                }

                SubtitleText{
                    text: MovieDetails.tagline
                    color: "white"
                    font.pixelSize: 20
                }

                Text{
                    text: "Overview"
                    font.bold: true
                    color: "white"
                    font.pixelSize: 16
                }

                Text{
                    Layout.fillWidth: true
                    text: MovieDetails.overview
                    color: "white"
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    font.pixelSize: 16
                }
            }
        }
    }
}