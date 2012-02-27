import Qt 4.7

// tab bar
Rectangle {
    anchors.bottom: parent.bottom
    height: 77
    width: parent.width
    border.color: "black"
    gradient: Gradient {
        GradientStop { position: 0.0; color: "darkGray" }
        GradientStop { position: 0.3; color: "black" }
        }
    GridView {
        id: bottomButtonGroup
        x: 0; y: 0
        width: parent.width; height: parent.height
        cellHeight: parent.height; cellWidth: parent.width / 5
        focus: true
        Item {
            id: playListTabButton
            anchors.left: parent.left
            width: 72
            height: parent.height

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (listViewPlaylists.state == "" || listViewPlaylists.state == "unclicked") {
                        listViewPlaylists.state = "clicked";
                        listViewArtists.state = "unclicked";
                        listViewAlbums.state = "unclicked";
                        listViewTracks.state = "unclicked";
                        listViewMore.state = "unclicked";
                        albumView.state = "unclicked";
                        genreListView.state = "unclicked";
                        activePlaylistsButton.visible = true;
                        activeAlbumsButton.visible = false;
                        activeArtistsButton.visible = false;
                        activeTracksButton.visible = false;
                        activeMoreButton.visible = false;
                    }
                }
            }
            Item {
                id: playlistImage
                anchors.horizontalCenter: parent.horizontalCenter
                width: 60; height: 60; smooth: true
                Image {
                    source : "pics/playlists_grey.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 60; height: 60; smooth: true
                }
                Image {
                    id: activePlaylistsButton
                    source : "pics/playlists_blue.png"
                    visible: false
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 60; height: 60; smooth: true
                }
            }
            Text {
                anchors.top: playlistImage.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: "grey"
                text: "Playlists"
                font.bold: true
            }
        }

        Item {
            id: artistTabButton
            anchors.left: playListTabButton.right
            width: 72
            height: parent.height

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (listViewArtists.state == "" || listViewArtists.state == "unclicked") {
                        listViewArtists.state = "clicked";
                        listViewPlaylists.state = "unclicked";
                        listViewAlbums.state = "unclicked";
                        listViewTracks.state = "unclicked";
                        listViewMore.state = "unclicked";
                        albumView.state = "unclicked";
                        genreListView.state = "unclicked";
                        activeArtistsButton.visible = true;
                        activeAlbumsButton.visible = false;
                        activePlaylistsButton.visible = false;
                        activeTracksButton.visible = false;
                        activeMoreButton.visible = false;
                    }
                }
            }
            Item {
                width: 72
                Item {
                    id: artistImage
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 60; height: 60; smooth: true
                    Image {
                        source : "pics/artists_grey.png"
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 60; height: 60; smooth: true
                    }
                    Image {
                        id: activeArtistsButton
                        source : "pics/artists_blue.png"
                        visible: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 60; height: 60; smooth: true
                    }
                }
                Text {
                    anchors.top: artistImage.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "grey"
                    text: "Artists"
                    font.bold: true
                }
            }
        }
        Item {
            id: trackTabButton
            anchors.left: artistTabButton.right
            width: 72
            height: parent.height

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (listViewTracks.state == "" || listViewTracks.state == "unclicked") {
                        listViewTracks.state = "clicked";
                        listViewArtists.state = "unclicked";
                        listViewPlaylists.state = "unclicked";
                        listViewAlbums.state = "unclicked";
                        listViewMore.state = "unclicked";
                        albumView.state = "unclicked";
                        genreListView.state = "unclicked";
                        activeTracksButton.visible = true;
                        activeAlbumsButton.visible = false;
                        activePlaylistsButton.visible = false;
                        activeArtistsButton.visible = false;
                        activeMoreButton.visible = false;
                    }
                }
            }
            Item {
                width: 72
                Item {
                    id: tracksImage
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 60; height: 60; smooth: true
                    Image {
                        source : "pics/songs_grey.png"
                        anchors.horizontalCenter: parent.horizontalCenter;
                        width: 60; height: 60; smooth: true
                    }
                    Image {
                        id: activeTracksButton
                        source : "pics/songs_blue.png"
                        visible: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 60; height: 60; smooth: true
                    }
                }
                Text {
                    anchors.top: tracksImage.bottom
                    color: "grey"
                    text: "Songs"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                }
            }
        }
        Item {
            id: albumTabButton
            anchors.left: trackTabButton.right
            width: 72
            height: parent.height

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (listViewAlbums.state == "" || listViewAlbums.state == "unclicked") {
                        listViewAlbums.state = "clicked";
                        listViewArtists.state = "unclicked";
                        listViewPlaylists.state = "unclicked";
                        listViewTracks.state = "unclicked";
                        listViewMore.state = "unclicked";
                        albumView.state = "unclicked";
                        genreListView.state = "unclicked";
                        activeAlbumsButton.visible = true;
                        activePlaylistsButton.visible = false;
                        activeArtistsButton.visible = false;
                        activeTracksButton.visible = false;
                        activeMoreButton.visible = false;
                    }
                }
            }
            Item {
                width: 72
                Item {
                    id: albumsImage
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 60; height: 60; smooth: true
                    Image {
                        source : "pics/albums_grey.png"
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 60; height: 60; smooth: true
                    }
                    Image {
                        id: activeAlbumsButton
                        source : "pics/albums_blue.png"
                        visible: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 60; height: 60; smooth: true
                    }
                }
                Text {
                    anchors.top: albumsImage.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "grey"
                    text: "Albums"
                    font.bold: true
                }
            }
        }
        Item {
            id: moreTabButton
            anchors.left: albumTabButton.right
            anchors.right: parent.right
            width: 72
            height: parent.height

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (listViewMore.state == "" || listViewMore.state == "unclicked") {
                        listViewMore.state = "clicked";
                        listViewAlbums.state = "unclicked";
                        listViewArtists.state = "unclicked";
                        listViewPlaylists.state = "unclicked";
                        listViewTracks.state = "unclicked";
                        albumView.state = "unclicked";
                        genreListView.state = "unclicked";
                        activeMoreButton.visible = true;
                        activeAlbumsButton.visible = false;
                        activePlaylistsButton.visible = false;
                        activeArtistsButton.visible = false;
                        activeTracksButton.visible = false;
                    }
                }
            }
            Item {
                width: 72
                Item {
                    id: moreImage
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 60; height: 60; smooth: true
                    Image {
                        source : "pics/more_grey.png"
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 60; height: 60; smooth: true
                    }
                    Image {
                        id: activeMoreButton
                        source : "pics/more_blue.png"
                        visible: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 60; height: 60; smooth: true
                    }
                }
                Text {
                    anchors.top: moreImage.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "grey"
                    text: "More"
                    font.bold: true
                }
            }
        }
    }
    Component.onCompleted: {
        activeAlbumsButton.visible = true;
        listViewAlbums.state = "clicked";
    }
}
