import Qt 4.7

Rectangle {
    id: albumViewInt
    anchors.fill: parent

/*    TitleBar {
        id: albumTitleBar
        anchors.top: parent.top
        title: albumModel.albumName
    }
*/

    Rectangle {
        id: albumTitleBar
        anchors.top: parent.top
        width: parent.width
        height: 60

        Row {
            width: parent.width
            height: parent.height
            Rectangle {
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        albumView.state = "unclicked";
                        listViewAlbums.state = "clicked";
                    }
                }

                width: parent.width / 5
                height: parent.height
                clip: true
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "darkGray" }
                    GradientStop { position: 0.8; color: "lightSteelblue" }
                }
                Image {
                    anchors.centerIn: parent
                    source: "pics/button_left_blue.png"
                    scale: 0.55
                }
                Text {
                    anchors.centerIn: parent
                    text: "Albums"
                    font.bold: true
                    font.pixelSize: parent.height * 0.3
                    color: "white"
                }
            }
            Rectangle {
                width: (parent.width / 5) * 3
                height: parent.height
                clip: true
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "darkGray" }
                    GradientStop { position: 0.8; color: "lightSteelblue" }
                }
                Text {
                    text: albumModel.albumName
                    anchors.centerIn: parent
                    color: "white"
                    font.pixelSize: parent.height * 0.4
                    font.bold: true
                    style: Text.Sunken
                    clip: true
                }
            }
            Rectangle {
                width: parent.width / 5
                height: parent.height
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "darkGray" }
                    GradientStop { position: 0.8; color: "lightSteelblue" }
                }
            }
        }
    }

    Rectangle {
        id: line
        anchors.top: albumTitleBar.bottom
        width: parent.width
        height: 1
        color: "black"
    }

    Rectangle {
        anchors.top: line.bottom
        anchors.bottom: parent.bottom
        width: parent.width

        ListView {
                id: albumListView2
                anchors.fill: parent
                model: albumModel
                delegate: oneTrackInList
                focus: true
                clip: true
                snapMode: ListView.SnapToItem
           }
    }

    Component {
        id: oneTrackInList
        Rectangle {
            width: albumListView2.width
            height: 60
            color: "white"
            border.width: 1
            border.color: "darkGray"
            Text {
                x: 8
                id: trackNameArea
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
}
