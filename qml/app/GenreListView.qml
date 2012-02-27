import Qt 4.7

Rectangle {
    id: genreViewInt
    anchors.fill: parent

/*    TitleBar {
        id: genreTitleBar
        anchors.top: parent.top
        title: "Genre"
    }
*/
    Rectangle {
        id: genreTitleBar
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
                        genreListView.state = "unclicked";
                        listViewMore.state = "clicked";
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
                    text: "More"
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
                    text: "Genres"
                    anchors.centerIn: parent
                    color: "white"
                    font.pixelSize: parent.height * 0.5
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
// end of title bar!

    Rectangle {
        id: line
        anchors.top: genreTitleBar.bottom
        width: parent.width
        height: 1
        color: "black"
    }

    Rectangle {
        anchors.top: line.bottom
        anchors.bottom: parent.bottom
        width: parent.width

        ListView {
                id: genreListView1
                anchors.fill: parent
                model: genreListModel
                delegate: oneGenreInList
                focus: true
                clip: true
                snapMode: ListView.SnapToItem
            }
    }

    Component {
        id: oneGenreInList
        Rectangle {
            width: genreListView1.width
            height: 60
            color: "white"
            border.width: 1
            border.color: "darkGray"
            Text {
                x: 8
                id: genreArea
                height: parent.height
                width: parent.width
                font.pixelSize: height*0.4
                font.weight: Font.DemiBold
                text: genre
                elide: "ElideRight"
                verticalAlignment: "AlignVCenter"
            }
        }
    }
}
