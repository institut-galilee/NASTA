import QtQuick 2.11
import QtQuick.Controls 2.4


Item {
    id: root
    anchors.fill: parent
    signal back


    Rectangle {
        id: rectangle
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: root
        MouseArea {
            id: mouseArea2
            x: 0
            y: 0
            width: 1024
            height: 600

               Image {
                   id: image
                   x: 0
                   y: 0
                   width: 1024
                   height: 635
                   fillMode: Image.Stretch
                   source: "images/images13.jpg"

                   Text {
                       id: element
                       x: 318
                       y: 39
                       color: "#fdfdfd"
                       text: qsTr("Occupation SALLES TP")
                       font.capitalization: Font.AllUppercase
                       font.weight: Font.ExtraLight
                       font.pixelSize: 35
                   }
               }


        }
    }

    Rectangle {
        id: rectangle6
        x: 38
        y: 546
        width: 65
        height: 47
        color: "#5ee7df"
        radius: 10
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#1e3c72"
            }

            GradientStop {
                position: 0.01
                color: "#1e3c72"
            }

            GradientStop {
                position: 1
                color: "#2a5298"
            }
        }
        border.width: 1
        border.color: "#f2f2f4"
        TextInput {
            id: textInput5
            x: -14
            y: 9
            width: 94
            height: 32
            color: "#fdfdfd"
            text: qsTr("<-")
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.MixedCase
            font.weight: Font.DemiBold
            font.pixelSize: 23
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.back()
            }
        }
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:1024}
}
##^##*/
