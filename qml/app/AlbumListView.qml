import Qt 4.7

Rectangle {
    anchors.fill: parent

    TitleBar {
        id: albumsTitleBar
        anchors.top: parent.top
        title: "Albums"
    }

    Rectangle {
        id: line
        anchors.top: albumsTitleBar.bottom
        width: parent.width
        height: 1
        color: "black"
    }

    Rectangle {
        anchors.top: line.bottom
        anchors.bottom: parent.bottom
        width: parent.width

        ListView {
                id: albumListView
                anchors.fill: parent
                model: albumListModel
                delegate: oneAlbumInList
                focus: true
                clip: true
                snapMode: ListView.SnapToItem
                cacheBuffer: 6400

                // The sectionExpression is simply the size of the pet.
                // We use this to determine which section we are in above.
                section.property: "albumName"
                section.criteria: ViewSection.FirstCharacter
                section.delegate: Rectangle {
                    color: "lightsteelblue"
                    width: albumListView.width
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
        id: oneAlbumInList
        Rectangle {
            width: albumListView.width
            height: 60
            color: "white"
            border.width: 1
            border.color: "darkGray"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (albumView.state == "" || albumView.state == "unclicked") {
                        listViewAlbums.state = "unclicked";
                        albumModel.loadMusic(artistName, albumName);
                        albumView.state = "clicked";
                    }
                }
            }
            Row {
                spacing: 10
                width: parent.width
                height: parent.height

                Image {
                    y: 1
                    id: artworkId
                    source: albumArt
                    width: parent.height
                    height: parent.height-1
                    smooth: true
                    sourceSize.width: parent.height
                    sourceSize.height: parent.height-1
                }

                Column {
                    width: parent.width - artworkId.width-4
                    height: parent.height
                    Text {
                        id: albumArea
                        height: parent.height*0.6
                        width: parent.width
                        font.pixelSize: height*0.5
                        font.weight: Font.DemiBold
                        text: albumName
                        elide: "ElideRight"
                        verticalAlignment: "AlignVCenter"
                    }
                    Text {
                        height: parent.height*0.4
                        width: parent.width
                        font.pixelSize: height*0.6
                        text: artistName
                        elide: "ElideRight"
                        color: "darkGray"
                        verticalAlignment: "AlignTop"
                    }
                }
            }
        }
    }
}
