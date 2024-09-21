import QtQuick
import QtQuick.Layouts
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

            IconTextField{
                Layout.fillWidth: true
                placeholderText: "Phone"
                icon: "../../resources/phone_icon.svg"
            }

            IconTextField{
                Layout.fillWidth: true
                placeholderText: "Address"
                icon: "../../resources/address_icon.svg"
            }

            IconTextField{
                Layout.fillWidth: true
                placeholderText: "Name"
                icon: "../../resources/name_icon.svg"
            }
        }

    }
}