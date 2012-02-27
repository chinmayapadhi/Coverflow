import Qt 4.7

Rectangle {
    id: childViewRectangle
    opacity: 1
    z:1
    x: parent.width

    states: [
        State {
            name: "clicked"
            PropertyChanges {
                target: childViewRectangle
                z: 1
                x: 0
            }
        },
        State {
            name: "unclicked"
            PropertyChanges {
                target: childViewRectangle
                opacity: 1
                z: 1
                x: childViewRectangle.width
            }
        }
    ]

    transitions: [
        Transition {
            from: ""; to: "clicked"; reversible: false
            NumberAnimation {
                properties: "x,z"; duration: 200
            }
        },
        Transition {
            from: "unclicked"; to: "clicked"; reversible: false
            NumberAnimation {
                properties: "x,z"; duration: 200
            }
        },
        Transition {
            from: "clicked"; to: "unclicked"; reversible: false
            NumberAnimation {
                properties: "x,z"; duration: 200
            }
         }
    ]
}
