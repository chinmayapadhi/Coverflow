import Qt 4.7

Rectangle {
    anchors.fill: parent

    TitleBar {
        id: moreTitleBar
        anchors.top: parent.top
        title: "More"
    }

    Rectangle {
        id: line
        anchors.top: moreTitleBar.bottom
        width: parent.width
        height: 1
        color: "black"
    }

    Rectangle {
        anchors.top: line.bottom
        anchors.bottom: parent.bottom
        width: parent.width

        ListView {
                id: moreListView2
                anchors.fill: parent
                model: moreListModel
                delegate: oneMoreInList
                focus: true
                clip: true
                snapMode: ListView.SnapToItem
            }
    }

    Component {
        id: oneMoreInList
        Rectangle {
            width: moreListView2.width
            height: 60
            color: "white"
            border.width: 1
            border.color: "darkGray"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (genreListView.state == "" || genreListView.state == "unclicked") {
                        listViewMore.state = "unclicked";
                        genreListView.state = "clicked";
                    }
                }
            }
            Text {
                x: 8
                id: moreArea
                height: parent.height
                width: parent.width
                font.pixelSize: height*0.4
                font.weight: Font.DemiBold
                text: title
                elide: "ElideRight"
                verticalAlignment: "AlignVCenter"
            }
        }
    }
    ListModel {
        id: moreListModel;
        ListElement {
            title: "Genres"
        }
    }
}
