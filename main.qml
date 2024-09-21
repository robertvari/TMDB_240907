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


        RowLayout{
            Layout.fillWidth: true
            Layout.fillHeight: true
            
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