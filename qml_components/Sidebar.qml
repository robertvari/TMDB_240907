import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import "custom_components"

Item{ // Sidebar
    width: 258

    ColumnLayout{
        anchors.fill:parent

        RoundedBox{  // Search and Sorting
            Layout.fillWidth: true
            height: childrenRect.height + 20

            ColumnLayout{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 10

                TitleText{text: "Search and Sorting"}

                IconTextField{
                    Layout.fillWidth: true
                    placeholderText: "Search..."
                    icon: "../../resources/search_icon.svg"
                }

                ComboBox{
                    Layout.fillWidth: true
                    model: ["Popularity Descending", "Popularity Ascending", "Rating Descending", "Rating Ascending", "Release Date Descending", "Release Date Ascending", "Title (A-Z)", "Title (Z-A)"]
                }
            }


        }

        RoundedBox{  // Genre filter
            Layout.fillWidth: true
            height: childrenRect.height + 20

            ColumnLayout{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 10
            
                TitleText{text: "Genres"}

                TextButton{text: "Action"; color: "black"; font.bold: false}
                TextButton{text: "Adventure"; color: "black"; font.bold: false}
                TextButton{text: "Animation"; color: "black"; font.bold: false}
                TextButton{text: "Comedy"; color: "black"; font.bold: false}
                TextButton{text: "Drama"; color: "black"; font.bold: false}
                TextButton{text: "Fantasy"; color: "black"; font.bold: false}
            }
        }

        Item{Layout.fillHeight: true}
    }

}