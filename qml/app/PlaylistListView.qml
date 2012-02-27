import Qt 4.7

Rectangle {
    anchors.fill: parent

    TitleBar {
        id: playlistTitleBar
        anchors.top: parent.top
        title: "Playlists"
    }

    Rectangle {
        id: line
        anchors.top: playlistTitleBar.bottom
        width: parent.width
        height: 1
        color: "black"
    }

    Rectangle {
        anchors.top: line.bottom
        anchors.bottom: parent.bottom
        width: parent.width

        ListView {
                id: playlistListView1
                anchors.fill: parent
                model: playlistListModel
                delegate: onePlaylistInList
                focus: true
                clip: true
                snapMode: ListView.SnapToItem
            }
    }

    Component {
        id: onePlaylistInList
        Rectangle {
            width: playlistListView1.width
            height: 60
            color: "white"
            border.width: 1
            border.color: "darkGray"
            Text {
                x: 8
                height: parent.height
                width: parent.width
                font.pixelSize: height*0.4
                font.weight: Font.DemiBold
                text: name
                elide: "ElideRight"
                verticalAlignment: "AlignVCenter"
            }
        }
    }

    ListModel {
        id: playlistListModel

        ListElement {
            name: "Genius"
        }
        ListElement {
            name: "On-The-Go"
        }
        ListElement {
            name: "5 Star Rating"
        }
    }
}
