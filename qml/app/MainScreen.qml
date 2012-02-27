import Qt 4.7

Rectangle {
    id: mainScreenInt
    anchors.fill: parent
    state: main.landscape ? 'landscape' : ''

    opacity: 1
    states: [
        State {
            name: "landscape"
            PropertyChanges {
                target: mainScreenInt
                opacity: 0
            }
        }
    ]

    transitions: [
        Transition {
            from: ""; to: "landscape"; reversible: false
            NumberAnimation {
                properties: "opacity"; duration: 200
            }
        },
        Transition {
            from: "landscape"; to: ""; reversible: false
            NumberAnimation {
                properties: "opacity"; duration: 200
            }
        }
    ]

    // status bar
    Rectangle {
        id: sysStatusBar
        anchors.top: parent.top
        width: parent.width
        height: 20
        gradient: Gradient {
            GradientStop { position: 0.5; color: "lightGray" }
            GradientStop { position: 1.0; color: "darkGray" }
        }
        Text { anchors.centerIn: parent; text: "11:48"; font.bold: true }
        Image {
            scale: 0.8
            anchors.right: parent.right
            source: "pics/battery.png"
        }
    }
    Rectangle {
        id: line
        anchors.top: sysStatusBar.bottom
        width: parent.width
        height: 1
        color: "black"
    }

    // list views
    ViewRectangle {
        id: listViewAlbums
        anchors.top: line.bottom
        anchors.bottom: viewTabsBar.top
        width: parent.width
        border.color: "black"
        AlbumListView {}
    }

    ViewRectangle {
        id: listViewArtists
        anchors.top: line.bottom
        anchors.bottom: viewTabsBar.top
        width: parent.width
        border.color: "black"
        ArtistListView {}
    }

    ViewRectangle {
        id: listViewPlaylists
        anchors.top: line.bottom
        anchors.bottom: viewTabsBar.top
        width: parent.width
        border.color: "black"
        PlaylistListView {}
    }

    ViewRectangle {
        id: listViewTracks
        anchors.top: line.bottom
        anchors.bottom: viewTabsBar.top
        width: parent.width
        border.color: "black"
        TrackListView {}
    }

    ViewRectangle {
        id: listViewGenres
        anchors.top: line.bottom
        anchors.bottom: viewTabsBar.top
        width: parent.width
        border.color: "black"
        GenreListView {}
    }

    ViewRectangle {
        id: listViewMore
        anchors.top: line.bottom
        anchors.bottom: viewTabsBar.top
        width: parent.width
        border.color: "black"
        MoreListView {}
    }

    ChildViewRectangle {
        id: albumView
        anchors.top: line.bottom
        anchors.bottom: viewTabsBar.top
        width: parent.width
        border.color: "black"
        AlbumView {}
    }

    ChildViewRectangle {
        id: genreListView
        anchors.top: line.bottom
        anchors.bottom: viewTabsBar.top
        width: parent.width
        border.color: "black"
        GenreListView {}
    }

    ViewTabs {
        id: viewTabsBar
    }

}

