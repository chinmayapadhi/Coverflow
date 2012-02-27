import Qt 4.7

Rectangle {
    id: albumBackTracks
    color: "black"
    anchors.fill: parent
    border.color: "white"
    border.width: 2
    property string artistNameStr: "notDefined"
    property string albumNameStr: "notDefined"
    property string albumArtStr: "notDefined"
    property bool imageReady: false
    z: 1

    Item {
        id: albumTitleBar
        anchors.top: parent.top
        anchors.left: parent.left
        height: 40
        width: parent.width

        Rectangle {
            id: albumTitles
            anchors.top: parent.top
            anchors.left: parent.left
            width: parent.width - parent.height - 2
            height: parent.height
            border.color: "white"
            border.width: 2
            clip: true
            gradient: Gradient {
                GradientStop { position: 0.0; color: "lightSteelblue" }
                GradientStop { position: 0.8; color: "steelblue" }
            }
            Text {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 10
                text: artistNameStr
                color: "white"
                font.bold: true
                font.pixelSize: 12
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.bottom: parent.bottom
                text: albumNameStr
                color: "white"
                font.bold: true
                font.pixelSize: 20
            }
        }
        Rectangle {
            anchors.top: albumTitles.top
            anchors.left: albumTitles.right
            width: parent.height
            height: width
            border.color: "white"
            border.width: 2

            Image {
                id: albumBackArtwork
                anchors.centerIn: parent
                source: imageReady ? albumArtStr : ""
                width: parent.height-2
                height: width
                sourceSize.width: width
                sourceSize.height: height
            }
        }

    }

    Rectangle {
        anchors.top: albumTitleBar.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        border.width: 2
        border.color: "white"
        color: "black"

        Image {
            width: parent.width-4
            height: parent.height-4
            sourceSize.width: width
            sourceSize.height: height
            source: imageReady ? albumArtStr : ""
            opacity: 0.4
            anchors.centerIn: parent
            transform: [
                Rotation {
                    origin.x: width/2;
                    axis.x: 0; axis.y: 1; axis.z: 0     // rotate around y-axis
                    angle: 180
                }
            ]
        }

        ListView {
                id: albumBackListView1
                width: parent.width-4
                height: parent.height-4
                anchors.centerIn: parent
                model: albumModel
                delegate: oneTrackInList1
                focus: true
                clip: true
                snapMode: ListView.SnapToItem
                interactive: true
           }
    }

    Component {
        id: oneTrackInList1
        Rectangle {
            width: albumBackListView1.width
            height: 40
            color: Qt.rgba(0,0,0,0)
            border.width: 1
            border.color: "darkGray"

            Rectangle {
                id: trackNumber
                anchors.left: parent.left
                anchors.top: parent.top
                width: parent.width / 10
                height: parent.height
                color: Qt.rgba(0,0,0,0)
                border.width: 1
                border.color: "darkGray"

                Text {
                    x: 8
                    anchors.centerIn: parent
                    anchors.leftMargin: 5
                    height: parent.height - 4
                    width: parent.width - 4
                    color: "white"
                    font.pixelSize: height*0.4
                    font.weight: Font.DemiBold
                    text: sequence
                    elide: "ElideRight"
                    verticalAlignment: "AlignVCenter"
                }
            }

            Rectangle {
                id: trackName
                anchors.left: trackNumber.right
                anchors.top: parent.top
                width: parent.width / 10 * 7
                height: parent.height
                color: Qt.rgba(0,0,0,0)
                border.width: 1
                border.color: "darkGray"
                clip: true
                Text {
                    x: 8
                    height: parent.height
                    width: parent.width
                    color: "white"
                    font.pixelSize: height*0.4
                    font.weight: Font.DemiBold
                    text: name
                    elide: "ElideRight"
                    verticalAlignment: "AlignVCenter"
                }
            }

            Rectangle {
                anchors.left: trackName.right
                anchors.top: parent.top
                width: parent.width / 10 * 3
                height: parent.height
                color: Qt.rgba(0,0,0,0)
                border.width: 1
                border.color: "darkGray"
                clip: true

                Text {
                    x: 8
                    height: parent.height
                    width: parent.width
                    color: "white"
                    font.pixelSize: height*0.4
                    font.weight: Font.DemiBold
                    text: duration
                    elide: "ElideRight"
                    verticalAlignment: "AlignVCenter"
                }
            }
        }
    }
}
