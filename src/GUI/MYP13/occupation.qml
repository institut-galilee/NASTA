import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import com.occu 1.0


Item {
    id: root
    anchors.fill: parent
    signal back

    Sqloccumodel{
        id:occu
    }


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
                   height: 672
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

                   ComboBox {
                       id: comboBox
                       x: 132
                       y: 222
                       width: 276
                       height: 176
                       font.preferShaping: true
                       font.kerning: true
                       leftPadding: 30
                       topPadding: 0
                       font.weight: Font.Light
                       wheelEnabled: true
                       spacing: 2
                       hoverEnabled: true
                       focusPolicy: Qt.ClickFocus
                       enabled: true
                       flat: false
                       currentIndex: -1
                       textRole: qsTr("")
                       Layout.fillWidth: true
                       font.pointSize: 30
                       model: ListModel{
                             ListElement{
                                text : "F200"
                             }
                             ListElement{
                                text : "F201"
                             }
                             ListElement{
                                text : "F202"
                             }
                             ListElement{
                                text : "F203"
                             }
                             ListElement{
                                text : "F204"
                             }
                             ListElement{
                                text : "F205"
                             }
                             ListElement{
                                text : "F206"
                             }
                             ListElement{
                                text : "F207"
                             }
                             ListElement{
                                text : "G207"
                             }
                             ListElement{
                                text : "G208"
                             }
                             ListElement{
                                text : "G209"
                             }
                             ListElement{
                                text : "G210"
                             }
                             ListElement{
                                text : "G211"
                             }
                             ListElement{
                                 text : "G212"
                             }
                             ListElement{
                                 text : "G215"
                             }
                       }
                   }

                   Rectangle {
                       id: rectangle1
                       x: 592
                       y: 222
                       width: 274
                       height: 176
                       color: "#c1cae9"
                       radius: 25

                       Text {
                           id: element1
                           x: 8
                           y: 8
                           width: 258
                           height: 160
                           color: "#000000"
                           text: occu.occupation(comboBox.currentText.toString())
                           font.weight: Font.Light
                           font.capitalization: Font.AllUppercase
                           horizontalAlignment: Text.AlignHCenter
                           verticalAlignment: Text.AlignVCenter
                           font.pixelSize: 40
                       }
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
    D{i:0;autoSize:true;height:600;width:1024}D{i:5;anchors_height:176;anchors_width:276;anchors_x:175;anchors_y:225}
}
##^##*/
