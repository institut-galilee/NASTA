import QtQuick.Window 2.0
import QtQuick.Layouts 1.1
import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.VirtualKeyboard 2.4

import QtWebEngine 1.9


    ApplicationWindow{
        id:root
        signal back
         flags: Qt.FramelessWindowHint
        visible: true
        width: 1024
        height:  600
        x:0
        y:0
        minimumWidth: 400
        minimumHeight: 300
        color: "#2a0859"

        WebEngineView{
            x:0
            y:0
            width:1024
            height: 500
            url: "https://mon-espace.izly.fr/Home/Logon"
        }

        Text {
            id: element
            x: 0
            y: 506
            width: 1024
            height: 94
            color: "#ffffff"
            text: qsTr("REVENIR EN ARRIERE")
            font.weight: Font.Light
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 38

            MouseArea {
                id: mouseArea
                x: 0
                y: 8
                width: 1024
                height: 86
                onClicked: {
                    root.back()
                    root.close()
                }
            }
        }

    }






