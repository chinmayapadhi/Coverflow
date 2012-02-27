import Qt 4.7

Rectangle {
    id: titleBar
    width: parent.width
    height: 60
    property string title: "Empty"
    property string leftimage: ""
    property string rightimage: ""


    Row {
        width: parent.width
        height: parent.height
        Rectangle {
            width: parent.width / 6
            height: parent.height
            gradient: Gradient {
                GradientStop { position: 0.0; color: "darkGray" }
                GradientStop { position: 0.8; color: "lightSteelblue" }
            }
        }
        Rectangle {
            width: (parent.width / 3) * 2
            height: parent.height
            clip: true
            gradient: Gradient {
                GradientStop { position: 0.0; color: "darkGray" }
                GradientStop { position: 0.8; color: "lightSteelblue" }
            }
            Text {
                text: title
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: parent.height * 0.5
                font.bold: true
                style: Text.Sunken
                clip: true
            }
        }
        Rectangle {
            width: parent.width / 6
            height: parent.height
            gradient: Gradient {
                GradientStop { position: 0.0; color: "darkGray" }
                GradientStop { position: 0.8; color: "lightSteelblue" }
            }
        }
    }
}
