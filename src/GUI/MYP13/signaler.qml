import QtQuick.Window 2.0
import QtQuick.Layouts 1.1
import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.VirtualKeyboard 2.4
import com.mail 1.0
import QtQuick.Dialogs 1.1


Item {
    id: root
    property string  email
    property string  msg
    property  bool sent
    width: 1024
     height: 600
x:0
y:0
    signal back






     InputPanel {
         id: inputPanel
         z: 89
         y: 320
         anchors.left: parent.left
         anchors.right: parent.right
         visible: Qt.inputMethod.visible

     }



    Mail{
        id:mail
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
                   height: 638
                   fillMode: Image.Stretch
                   source: "images/Images12.jpg"

                   Text {
                       id: element
                       x: 353
                       y: 45
                       color: "#0b0136"
                       text: qsTr("SIGNALER LA CARTE")
                       font.capitalization: Font.AllUppercase
                       font.weight: Font.ExtraLight
                       font.pixelSize: 35
                   }

                   Button {
                       id: button
                       x: 406
                       y: 365
                       width: 212
                       height: 92
                       text: qsTr("Envoyer")
                       font.pointSize: 15
                       font.capitalization: Font.AllUppercase
                       onClicked: {
                           if(!sent){
                               msg=textf.text
                               mail.sendmail(email.toString(),msg.toString())
                               sent=true
                           }
                           else{
                           messageDialog.open()
                           }

                       }
                   }

                   TextField {
                       id: textf
                       x: 332
                       y: 206
                       width: 361
                       height: 125
                       transformOrigin: Item.Center
                       horizontalAlignment: Text.AlignHCenter
                       focus: Qt.inputMethod.visible;

                   }

                   MessageDialog {
                       id: messageDialog
                       title: "Attention"
                       text: "Un mail a déja été envoyé a la personne"
                       onAccepted: {
                           messageDialog.close()
                           menu1.sent=sent
                           root.back()

                       }
                   }

                   Text {
                       id: element1
                       x: 396
                       y: 143
                       width: 233
                       height: 40
                       text: qsTr("Ajouter un commentaire (facultatif)")
                       font.bold: true
                       font.weight: Font.Light
                       font.capitalization: Font.AllUppercase
                       horizontalAlignment: Text.AlignHCenter
                       verticalAlignment: Text.AlignVCenter
                       font.pixelSize: 17
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
                color: "#f43b47"
            }

            GradientStop {
                position: 1
                color: "#453a94"
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



