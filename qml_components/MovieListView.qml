import QtQuick

Item{
    GridView{
        id: grid_view
        anchors.fill: parent
        model: 10
        cellWidth: 184
        cellHeight: 386
        clip: true

        delegate: Rectangle{
            color: "gray"
            radius: 10
            width: grid_view.cellWidth - 5
            height: grid_view.cellHeight -5
        }
    }
}