import QtQuick.Window 2.0
import QtQuick.Layouts 1.1
import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.VirtualKeyboard 2.4

  Item {
      id: login11
      visible: true
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

                   width: 1024
                   height: 600
               }

            Window {
                id: loginWindow

            property string password: password.text;


    visible: true
   flags: Qt.Dialog | Qt.FramelessWindowHint
  // modality: Qt.ApplicationModal
    width: 400
    height: 160
    x: Screen.width / 4 - width / 6
    y: Screen.height / 4 - height / 4
    minimumHeight: 160
    minimumWidth: 400
    title: "Login to program"

     /*   TextInput{
            id:input
            inputMethodHints: Qt.ImhDigitsOnly
            focus: Qt.inputMethod.visible;


        }
*/
    GridLayout {
        anchors.rightMargin: 10
        anchors.bottomMargin: 11
        anchors.leftMargin: 10
        anchors.topMargin: 9
        columns: 2
        anchors.fill: parent
        anchors.margins: 10
        rowSpacing: 10
        columnSpacing: 10

        TextField {
            id: login1
            x: 0
            y: 0
            Layout.leftMargin: 90
            Layout.topMargin: 30
            Layout.fillHeight: false
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            transformOrigin: Item.Center
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: false
            inputMethodHints: Qt.ImhDigitsOnly
            focus: Qt.inputMethod.visible;

        }

        Item {
            Layout.columnSpan: 2
            Layout.fillWidth: true
            implicitHeight: button.height

            Button {
                id: button
                anchors.centerIn: parent
                text: "Enter"
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0
                onClicked: {
                    //login11.close()
                    loginWindow.close()
                    login11.back()

                }
            }
        }

    }

    Text {
        id: element
        x: 2
        y: 16
        text: qsTr("Veuillez entrer les 4 derniers chiffres de votre numéro de telephone")
        font.bold: true
        font.pixelSize: 13
    }
}




}
  }


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
