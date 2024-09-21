import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

ApplicationWindow{
    visible: true
    width: 1280
    height: 720
    title: "The Movie Database (TMDB)"

    Material.accent: Material.LightBlue

    ColumnLayout{
        anchors.fill: parent

        Rectangle{  // Header
            color: "#032541"
            Layout.fillWidth: true
            height: 64

            Text{
                text: "Navbar..."
                color: "white"
                font.pixelSize: 30
            }
        }

        RowLayout{
            Layout.fillWidth: true
            Layout.fillHeight: true
            
            Rectangle{ // Sidebar
                color: "gray"
                Layout.fillHeight: true
                width: 258

                Text{
                    text: "Sidebar"
                    font.pixelSize: 30
                }
            }
            
            Rectangle{ //Browser
                color: "gray"
                Layout.fillHeight: true
                Layout.fillWidth: true

                Text{
                    text: "Browser"
                    font.pixelSize: 30
                }
            }
        }
    }
}