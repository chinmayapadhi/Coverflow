import Qt 4.7

Rectangle {
    anchors.fill: parent
    TitleBar {

        id: tracksTitleBar
        anchors.top: parent.top
        title: "Songs"
    }

    Rectangle {
        id: line
        anchors.top: tracksTitleBar.bottom
        width: parent.width
        height: 1
        color: "black"
    }

    Rectangle {
        anchors.top: line.bottom
        anchors.bottom: parent.bottom
        width: parent.width

        ListView {
                id: trackListView
                anchors.fill: parent
                model: trackListModel
                delegate: oneTrackInList
                focus: true
                clip: true
                snapMode: ListView.SnapToItem

                // The sectionExpression is simply the size of the pet.
                // We use this to determine which section we are in above.
                section.property: "name"
                section.criteria: ViewSection.FirstCharacter
                section.delegate: Rectangle {
                    color: "lightsteelblue"
                    width: trackListView.width
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
        id: oneTrackInList
        Rectangle {
            width: trackListView.width
            height: 60
            color: "white"
            border.width: 1
            border.color: "darkGray"

            Column {
                width: parent.width
                height: parent.height
                Text {
                    x: 8
                    id: songNameArea
                    height: parent.height*0.6
                    width: parent.width
                    font.pixelSize: height*0.5
                    font.weight: Font.DemiBold
                    text: name
                    elide: "ElideRight"
                    verticalAlignment: "AlignVCenter"
                }
                Text {
                    x: 8
                    height: parent.height*0.4
                    width: parent.width
                    font.pixelSize: height*0.6
                    text: albumName + " - " + artistName
                    elide: "ElideRight"
                    color: "darkGray"
                    verticalAlignment: "AlignTop"
                }
            }
        }
    }
}
