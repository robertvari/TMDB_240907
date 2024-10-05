import QtQuick

Rectangle{
    id: root
    width: 50
    height: width
    color: "black"
    radius: width

    property int popularity
    onPopularityChanged: draw_canvas.requestPaint()

    Canvas{
        id: draw_canvas
        anchors.centerIn : parent
        width: parent.width - 3
        height: parent.height - 3

        onPaint: {
            var ctx = getContext("2d")
            var radiant = root.popularity * 0.0628
            var centerX = width / 2
            var centerY = height / 2
            var radius = width / 2

            ctx.reset()
            ctx.beginPath()
            ctx.fillStyle = root.popularity > 60? "lightgreen" : "yellow"

            ctx.arc(centerX, centerY, radius, 0, radiant, false)
            ctx.lineTo(centerX, centerY)
            ctx.fill()
        }

        rotation: -90
    }

    Rectangle{
        color: root.color
        width: root.width - 10
        height: width
        radius: width
        anchors.centerIn: parent
    }

    Text{
        anchors.centerIn : parent
        text: root.popularity
        font.pixelSize: 20
        font.bold: true
        color: "white"
    }
}