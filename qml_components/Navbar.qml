import QtQuick
import QtQuick.Layouts
import "custom_components"

Rectangle{  // Header
    color: "#032541"
    height: 64

    RowLayout{
        TextButton{text: "Movies"}
        TextButton{text: "TV Shows"}
        TextButton{text: "People"}
        TextButton{text: "More"}
        TextButton{text: "Login"}
        TextButton{text: "Join TMDB"}
    }
}