import QtQuick
import "custom_components"

Item{
    GridView{
        id: grid_view
        anchors.fill: parent
        model: 10
        cellWidth: 184
        cellHeight: 386
        clip: true

        delegate: MovieCard{
            width: grid_view.cellWidth - 10
            height: grid_view.cellHeight - 10
        }
    }
}