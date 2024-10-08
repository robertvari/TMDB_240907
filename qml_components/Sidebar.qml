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

                SubtitleText{text: "Search"}

                IconTextField{
                    Layout.fillWidth: true
                    placeholderText: "Search..."
                    icon: Resources.get("search_icon.svg")
                    onTextEdited: MovieListProxy.set_search(text)
                }

                SubtitleText{text: "Sorting"}

                ComboBox{
                    Layout.fillWidth: true
                    model: MovieListProxy.sorting_options
                    onActivated: MovieListProxy.current_sorting = currentText
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

                Repeater{
                    model: MovieList.genres

                    TextButton{
                        text: modelData
                        color: "black"
                        font.bold: MovieListProxy.current_genre == text? true:false
                        font.pixelSize: 16
                        onClicked: MovieListProxy.current_genre = text
                    }
                }
            }
        }

        Item{Layout.fillHeight: true}
    }

}