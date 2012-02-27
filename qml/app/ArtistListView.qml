import Qt 4.7

Rectangle {
    anchors.fill: parent

    TitleBar {
        id: artistTitleBar
        anchors.top: parent.top
        title: "Artists"
    }

    Rectangle {
        id: line
        anchors.top: artistTitleBar.bottom
        width: parent.width
        height: 1
        color: "black"
    }

    Rectangle {
        anchors.top: line.bottom
        anchors.bottom: parent.bottom
        width: parent.width

        ListView {
                id: artistListView
                anchors.fill: parent
                model: artistListModel
                delegate: oneArtistInList
                focus: true
                clip: true
                snapMode: ListView.SnapToItem

                // The sectionExpression is simply the size of the pet.
                // We use this to determine which section we are in above.
                section.property: "artistName"
                section.criteria: ViewSection.FirstCharacter
                section.delegate: Rectangle {
                    color: "lightsteelblue"
                    width: artistListView.width
                    height: 20
                    Text {
                        x: 2; height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        text: section
                        font.bold: true
                    }
                }
            }
        ListNaviBar {}
    }

    Component {
        id: oneArtistInList
        Rectangle {
            width: artistListView.width
            height: 60
            color: "white"
            border.width: 1
            border.color: "darkGray"
            Text {
                x: 8
                id: songNameArea
                height: parent.height
                width: parent.width
                font.pixelSize: height*0.4
                font.weight: Font.DemiBold
                text: artistName
                elide: "ElideRight"
                verticalAlignment: "AlignVCenter"
            }
        }
    }
}
