import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import "qml_components"
import "qml_components/custom_components"

ApplicationWindow{
    visible: true
    width: 1280
    height: 720
    title: "The Movie Database (TMDB)"

    Material.accent: Material.LightBlue

    ColumnLayout{
        id: main_layout
        anchors.fill: parent

        state: "movie-list"
        states: [
            State{
                name: "movie-details"
                PropertyChanges{
                    target: movie_details_view
                    visible: true
                }

                PropertyChanges{
                    target: movie_list_view
                    visible: false
                }
            }
        ]

        // Header
        Navbar{
            Layout.fillWidth: true
        }

        // Download progress
        DownloadProgress{Layout.fillWidth: true}

        MovieDetailsView{
            id: movie_details_view
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: false
        }

        Item{  // movie list view
            id: movie_list_view
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