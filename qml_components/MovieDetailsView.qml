import QtQuick
import QtQuick.Layouts
import "custom_components"

Rectangle{
    id: root

    ColumnLayout{
        width: root.width

        TitleText{
            text: "Deadpool & Wolverine (2024)"
        }

        Text{
            text: "07/25/2024 Action, Comedy, Science Fiction 2h 8m"
        }

        SubtitleText{
            text: "Come together."
        }

        Text{
            text: "Overview"
            font.bold: true
        }

        Text{
            text: "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine."
        }

        Image{
            source: Resources.get("poster.webp")
        }
    }
}