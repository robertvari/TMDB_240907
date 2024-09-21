import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import "qml_components"

ApplicationWindow{
    visible: true
    width: 1280
    height: 720
    title: "The Movie Database (TMDB)"

    Material.accent: Material.LightBlue

    ColumnLayout{
        anchors.fill: parent

        // Header
        Navbar{
            Layout.fillWidth: true
        }


        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true

            RowLayout{
                anchors.fill: parent
                anchors.leftMargin: 200
                anchors.rightMargin: 200
                
                // Sidebar
                Sidebar{
                    Layout.fillHeight: true                
                }
                
                // Movie List View
                MovieListView{
                    Layout.fillWidth: true
                    Layout.fillHeight: true      
                }
            }
        }
    }
}