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
                   height: 600
                   fillMode: Image.Stretch
                   source: "images/Images9.jpg"

                   Text {
                       id: element
                       x: 357
                       y: 8
                       color: "#fdfdfd"
                       text: qsTr("Planning Annuel")
                       font.capitalization: Font.AllUppercase
                       font.weight: Font.ExtraLight
                       font.pixelSize: 35
                   }

                   Image {
                       id: image1
                       x: 46
                       y: 57
                       width: 932
                       height: 499
                       source: "images/L3CAL.jpg"
                       fillMode: Image.Stretch
                   }
               }


        }
    }

    Rectangle {
        id: rectangle6
        x: 37
        y: 557
        width: 65
        height: 43
        color: "#5ee7df"
        radius: 10
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#cc208e"
            }

            GradientStop {
                position: 1
                color: "#6713d2"
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
            anchors.rightMargin: 0
            anchors.bottomMargin: -1
            anchors.leftMargin: 1
            anchors.topMargin: 2
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
