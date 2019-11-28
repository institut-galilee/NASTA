import QtQuick.Window 2.0
import QtQuick.Layouts 1.1
import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.VirtualKeyboard 2.4



Window {
    id: loginWindow
    signal back

    property string username: login.text;
    property string password: password.text;
    property bool issave: savePassword.checked;
    visible: true
    flags: Qt.Dialog
    modality: Qt.WindowModal
    width: 400
    height: 160
    x: Screen.width / 4 - width / 6
    y: Screen.height / 4 - height / 4
    property alias login: login
    minimumHeight: 160
    minimumWidth: 400
    title: "Login to program"

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
            id: login
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
                    loginWindow.back()
                    loginWindow.close();
                }
            }
        }

    }

    Text {
        id: element
        x: 2
        y: 16
        text: qsTr("Veuillez rentrez les 4 derniers chiffres de votre numero de telephone")
        font.bold: true
        font.pixelSize: 13
    }


}

