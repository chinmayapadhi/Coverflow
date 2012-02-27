import Qt 4.7

Rectangle {
    id: viewRectangle
    opacity: 0
    z:0
    states: [
        State {
            name: "clicked"
            PropertyChanges {
                target: viewRectangle
                z: 1
                opacity: 1
            }
        },
        State {
            name: "unclicked"
            PropertyChanges {
                target: viewRectangle
                opacity: 0
                z: 0
            }
        }
    ]

    transitions: [
        Transition {
            from: ""; to: "clicked"; reversible: false
            NumberAnimation {
                properties: "opacity"; duration: 200
            }
        },
        Transition {
            from: "unclicked"; to: "clicked"; reversible: false
            NumberAnimation {
                properties: "opacity,z"; duration: 200
            }
        },
        Transition {
            from: "clicked"; to: "unclicked"; reversible: false
            NumberAnimation {
                properties: "opacity"; duration: 1000
            }
         }
    ]
}
