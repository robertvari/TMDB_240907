import QtQuick
import QtQuick.Layouts
import "custom_components"

Item{ // Sidebar
    width: 258

    RoundedBox{
        width: parent.width
        height: 300

        TitleText{text: "Search and Filter"}
    }
}