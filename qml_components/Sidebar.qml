import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import "custom_components"

Item{ // Sidebar
    width: 258

    RoundedBox{
        width: parent.width
        height: 300

        ColumnLayout{
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: 10

            TitleText{text: "Search and Filter"}

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
}