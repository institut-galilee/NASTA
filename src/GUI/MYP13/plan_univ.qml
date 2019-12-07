

import QtQuick 2.11
import QtQuick.Controls 2.4


Item {
    id: root
    anchors.fill: parent
    signal back


    Rectangle {
        id: rectangle
        visible:true
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


        }
    }

    Image {
        id: image
        x: 0
        y: 0
        width: 1024
        height: 600
        fillMode: Image.Stretch
        source: "images/blank.svg"
    }

    SwipeView{
        id:slider
        x:112
        y:0
        height: 550
        width: 800

        property var model :ListModel{}
        clip:true
        Repeater {
            model:slider.model
            Image{
                width: slider.width
                height: slider.height
                source:image
                fillMode: Image.Stretch
            }
        }
    }
    PageIndicator {
        x: 500
        y: 560

        currentIndex: slider.currentIndex
        count: slider.count
    }
    Component.onCompleted: {
        slider.model.append({image:"images/plan2.jpg"})
        slider.model.append({image:"images/plan1.jpg"})
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
            anchors.fill: parent
            onClicked: {
                root.back()
            }
        }
    }


}


/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:1024}D{i:11;anchors_x:300;anchors_y:520}
}
##^##*/
