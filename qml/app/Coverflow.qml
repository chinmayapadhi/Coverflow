import Qt 4.7

/*
    experiments in cover flow

    Things to do
    1.  bring on images instead of text -- easy -- done
    2.  better rotation and sizing functions -- easy -- done
    3.  3D shear of images, so that far-away side is smaller than near side -- done
    4.  ensure z-order of images is sensible so that overlaps are correct -- done

    Then
    5.  lots of fine tuning -- done
    6.  added click handler -- done

    Things remaining to do
    7.  adopt music album art instead of this photo library
    8.  get rotations working properly -- done
*/

Rectangle {
    id: coverflow
    // set these to your preferred window size
    width: parent.longside
    height: parent.shortside
    state: main.landscape ? 'landscape' : ''

    opacity: 0
    states: [
        State {
            name: "landscape"
            PropertyChanges {
                target: coverflow
                opacity: 1
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

    // following should be treated as constants
    color: "black"
    property real overshoot: 1.4
    property int itemsInView: 15

    // displays items on a path, clipped to a region which slightly
    // overshoots coverflow's dimensions
    ListView {
        id: coverList
        anchors.fill: parent
        model: albumListModel
        delegate: picDelegate
        orientation: ListView.Horizontal
        clip: true
        preferredHighlightBegin: coverflow.width*0.5
        preferredHighlightEnd: coverflow.width*0.5
        highlightRangeMode: ListView.StrictlyEnforceRange
        property bool currentItemVisible: true
        cacheBuffer: 6400
    }

    // on top of this path list, put a gradated fader overlay
    Rectangle {
        id: fader
        z: 200
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height/5
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0,0,0,0) }
            GradientStop { position: 1.0; color: "black" }
        }
    }

    // on top of fader, put title
    Text {
        id: faderTitle
        anchors.top: fader.top
        anchors.horizontalCenter: fader.horizontalCenter
        font.pixelSize: fader.height*0.4
        font.bold: true
        color: "lightgrey"
        text: albumListModel.get(coverList.currentIndex).albumName
        z: 200
    }

    // if necessary, put on first-letter indicator
    Rectangle {
        opacity: 0 // todo: make this work
        anchors.bottom: coverflow.bottom
        anchors.bottomMargin: 5
        anchors.right: coverflow.right
        anchors.rightMargin: 5
        width: coverflow.height/10
        height: width
        color: "black"
        border.color: "white"
        z: 200
        Text {
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize: parent.height*0.8
            text: albumListModel.get(coverList.currentIndex).albumName[0]
            color: "white"
        }
    }

    // here's how to display one picture, on the path
    Component {
        id: picDelegate


        Item {
            id: picColumn
            visible: (place >= -1.5 & place <= 1.5) & (ListView.isCurrentItem ? coverList.currentItemVisible : true)

            // normal picture size
            property real picSize: coverflow.height*0.6

            // place runs from -1 to +1 from left to right of screen
//            property real place: (x-coverflow.width/2)/(coverflow.width/2)
            property real place: (parent.x+x-coverflow.width/2)/(coverflow.width/2)

//            property real rotateY: (Math.abs(place) < 0.2) ? -300*place : -(Math.abs(place)/place)*70
            property real rotateY: (Math.abs(place) < 0.3) ? -230*place : -(Math.abs(place)/place)*70
//            property real sizeFactor: (Math.abs(place) < 0.2) ? 1.2/(1+8*place*place*Math.exp(-3*place*place)) : 0.9
            property real sizeFactor: 1/(1+8*place*place*Math.exp(-3*place*place))

            // spreads x in the centre, bunches at the sides
            function tanh(x) { return (Math.exp(x)-Math.exp(-x)) / (Math.exp(x)+Math.exp(-x)) }
            property real deltaX: (tanh(place*2.0) - place) * coverflow.width/2 * 2

// Comment the above 2 lines out, and the following line back in, to improve speed on Symbian^3 devices
//            property real deltaX: (1-Math.abs(place)) * place >=0 ? 1 : -1

            z: 100-place*place*100
            width: coverflow.width*overshoot/coverflow.itemsInView
            height: coverflow.height

            // main image
            Image {
                id: albumImage
                anchors.horizontalCenter: parent.horizontalCenter
                source: albumArt
                smooth: true
                fillMode: Image.PreserveAspectFit
                width: picSize
                height: picSize
                sourceSize.width: picSize
                sourceSize.height: picSize

                transform : [
                    Scale {
                        xScale: sizeFactor; yScale: sizeFactor;
                        origin.x: picSize/2; origin.y: picSize
                    },
                    Translate {
                        x: -picColumn.width /2 + deltaX
                        y: coverflow.height*0.1 -place*place*20
                    },
                    Rotation {
                        angle: rotateY
                        origin.x: picSize/2; origin.y: picSize/2
                        axis.x: 0; axis.y: 1; axis.z: 0
                    }
                ]

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (ListView.isCurrentItem) {
                            albumFlipper.flipAlbum();
                        }
                    }
                }

            }

            // mirror image
            Image {
                source: albumArt
                anchors.horizontalCenter: parent.horizontalCenter
                smooth: true
                fillMode: Image.PreserveAspectFit
                width: picSize
                height: picSize
                sourceSize.width: picSize
                sourceSize.height: picSize
                opacity: 0.65 + 0.2*place*place

                transform : [
                    Rotation {
                        axis.x: 1; axis.y: 0; axis.z: 0
                        angle: 180
                        origin.y: picSize*1.32
                    },
                    Scale {
                        xScale: sizeFactor; yScale: sizeFactor;
                        origin.x: picSize/2; origin.y: picSize
                    },
                    Translate {
                        x: -picColumn.width/2 + deltaX
                        y: -coverflow.height*0.1 -place*place*20
                    },
                    Rotation {
                        angle: rotateY
                        origin.x: picSize/2; origin.y: picSize/2
                        axis.x: 0; axis.y: 1; axis.z: 0
                    }
                ]
            }

        }
    }

    Item {
        id: albumFlipper
        width: parent.width
        height: parent.height * 0.7
        anchors.horizontalCenter: parent.horizontalCenter
        opacity: 0
        visible: false
        property string selectedAlbumName: "Not Defined"
        property string selectedAlbumArtist: "Not Defined"
        property string selectedAlbumArtwork: "Not Defined"
        property bool backVisible: false


        function flipAlbum() {
            state = "flipped"
            flipAlbum.flip();
            coverList.currentItemVisible = false;
            albumFlipperMouseArea.enabled = true;
        }

        states: [
            State {
                name: "flipped"
                PropertyChanges { target: albumFlipper; opacity: 1; visible: true}
            }
        ]

        transitions: [
            Transition {
                from: "flipped"; to: ""; reversible: false
                NumberAnimation {
                    properties: "opacity"; duration: 500
                }
            }
        ]

        MouseArea {
            id: albumFlipperMouseArea
            anchors.fill: parent
            enabled: false
            onClicked: {
                flipAlbum.flip();
                coverList.currentItemVisible = true;
                state = "";
                enabled = false;
            }
        }

        Keys.onPressed: {
            if (event.key == Qt.Key_Left) {
                coverList.decrementCurrentIndex();
                event.accepted = true;
            }
            else if (event.key == Qt.Key_Right) {
                coverList.incrementCurrentIndex();
                event.accepted = true;
            }
            else if (event.key == Qt.Key_Return) {
                albumFlipper.flipAlbum();
                event.accepted = true;
            }
            else {
                event.accepted = false;
            }
        }


        Flipable {
            id: flipAlbum
            width: parent.height * 0.86
            height: width
            y: height *0.168//*0.171
            x: parent.width*0.335

            property int angle:0
            property bool flipped: false

            function flip() {
                if (!flipAlbum.flipped) {
                    albumFlipper.selectedAlbumName = albumListModel.get(coverList.currentIndex).albumName;
                    albumFlipper.selectedAlbumArtist = albumListModel.get(coverList.currentIndex).artistName;
                    albumFlipper.selectedAlbumArtwork = albumListModel.get(coverList.currentIndex).albumArt;
                    albumImage.source = albumFlipper.selectedAlbumArtwork;
                    albumFlipper.backVisible = true;
                    albumModel.loadMusic(albumFlipper.selectedAlbumArtist, albumFlipper.selectedAlbumName);
                }
                coverList.interactive = flipAlbum.flipped;
                faderTitle.visible = flipAlbum.flipped;
                albumImage.visible = !flipAlbum.flipped;
                flipAlbum.flipped = !flipAlbum.flipped;
            }

            transform: Rotation {
                origin.x: width/6;
                axis.x: 0; axis.y: 1; axis.z: 0     // rotate around y-axis
                angle: flipAlbum.angle
            }

            states: [
                State {
                    name: "back"
                    PropertyChanges { target: flipAlbum; angle: 180; z:200 }
                    when: flipAlbum.flipped
                }
            ]

            transitions: Transition {
                NumberAnimation { properties: "angle"; duration: 500 }
            }

            front: Image {
                id: albumImage
                anchors.centerIn: parent
                smooth: true
                fillMode: Image.PreserveAspectFit
                width: parent.width
                height: parent.height
                sourceSize.width: width
                sourceSize.height: height
            }
            back: Item {
                width: parent.width*1.4
                height: width
                anchors.horizontalCenter: parent.horizontalCenter
                y: -20
                z: 250

                AlbumBackTracks {
                    artistNameStr: albumFlipper.selectedAlbumArtist
                    albumNameStr: albumFlipper.selectedAlbumName
                    albumArtStr: albumFlipper.selectedAlbumArtwork
                    imageReady: albumFlipper.backVisible
                }
            }
        }
    }

}
