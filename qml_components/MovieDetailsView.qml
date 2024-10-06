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
            source: Resources.get("backdrop.webp")
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
                    source: Resources.get("poster.webp")
                    fillMode: Image.PreserveAspectFit
                }
            }

            ColumnLayout{  // Movie details container
                Layout.fillWidth: true

                TitleText{
                    text: "Deadpool & Wolverine (2024)"
                    color: "white"
                    font.pixelSize: 35
                }

                Text{
                    text: "07/25/2024 Action, Comedy, Science Fiction 2h 8m"
                    color: "white"
                    font.pixelSize: 16
                }

                PopularityProgress{
                    popularity: 85
                    implicitWidth: 80
                    implicitHeight: 80
                }

                SubtitleText{
                    text: "Come together."
                    color: "white"
                    font.pixelSize: 16
                }

                Text{
                    text: "Overview"
                    font.bold: true
                    color: "white"
                    font.pixelSize: 16
                }

                Text{
                    Layout.fillWidth: true
                    text: "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine."
                    color: "white"
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    font.pixelSize: 16
                }
            }
        }

    }
}