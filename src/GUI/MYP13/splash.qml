import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11
import com.load 1.0

ApplicationWindow {
    id: root
    property bool updateState
    property date currentDate
    property string dateTimeString
    property variant codeList
    property string desc
    property int temp


    flags: Qt.FramelessWindowHint
    visible: true
    width: 1024
    height:  600
    color: "#ffffff"

    x:0
    y:0

    // Display a little message to the user while loading...
    // ...

    // This is the Loader that will load the main.qml file
    Loading{
        id:ld
    }
    Loader {
        id: mainloader
        visible: status == Loader.Ready
    }

    // This is a fake delay needed to give to QML the necessary time
    // to load and setup the splash item above
    PauseAnimation {
        id: fakeLoadingDelay
        //duration: 12000
        onRunningChanged: {
            if ( !running ) {
                var a = Boolean(false)
                 print(a)
                a=ld.fileExists()
                 print(a)

                if(a==true){
                    mainloader.source = ""
                    mainloader.source = "menu1.qml"
                    fakeLoadingDelay.stop()
                    root.close()
                    var scene = null
                    scene = mainloader.item
                    scene.desc=desc
                    scene.currentDate = currentDate
                    scene.codeList=codeList
                    scene.dateTimeString=dateTimeString
                    scene.temp=temp
                    scene.updateState=updateState
                }
                else{
                    fakeLoadingDelay.stop()
                    root.close()
                }
            }

        }
    }

    Image {
        id: image
        x: 0
        y: 0
        width: 1024
        height: 600
        source: "images/Images3.jpg"
        fillMode: Image.PreserveAspectFit

        Text {
            id: element
            x: 162
            y: 111
            width: 700
            height: 75
            color: "#fbfbfb"
            text: qsTr("VEUILLEZ POSEZ VOTRE CARTE SUR LE LECTEUR")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 28
        }

        Text {
            id: element1
            x: 162
            y: 278
            width: 700
            height: 75
            color: "#fbfbfb"
            text: qsTr("WAITING ...")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 28
        }
    }

    // This start the animation and loading of mail.qml when the component is ready
    Component.onCompleted: fakeLoadingDelay.start()
}
