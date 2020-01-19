import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11
import QtQuick.VirtualKeyboard 2.4
ApplicationWindow {
    id: root
    //anchors.fill: parent
    flags: Qt.FramelessWindowHint
    visible: true
    width: 1024
    height:  600
    x:0
    y:0
    color: "#2a0859"
    // Auto update weather state
    property bool updateState: true

    // Properties for Date and Time
    property date currentDate: new Date()
    property string dateTimeString

    // The list of code
    property variant codeList
    property string desc
    property int temp

    // Global Timer to update weather and Date
    Timer {
        interval: 2000
        repeat: true
        running: true
        onTriggered: {
            getCondition()
            if(updateState) updateState = false
            else updateState = true
            currentDate = new Date()
            dateTimeString = currentDate.toLocaleDateString() + "\n                 " + pad(currentDate.getHours())  + ":" + pad(currentDate.getMinutes())
        }
    }
    // Background
    Rectangle {
        id: rectangle
        color: "#00000000"
        x: 0
        y: 0

        Image {
            id: image2
            x: 0
            y: 0
            width: 1024
            height: 635
            source: "images/Images8.jpg"
            fillMode: Image.Stretch
        }


        Image {
            id: image1
            x: 52
            y: 383
            width: 100
            height: 100
            opacity: 0.682
            clip: false
            enabled: true
            smooth: true
            transformOrigin: Item.Center
            source: "images/Insitut-Galilee.png"
            fillMode: Image.PreserveAspectFit
        }
        Image {
            anchors {
                right: parent.right
                bottom: parent.bottom
                top: parent.top
            }
            fillMode: Image.PreserveAspectFit
            //source: "qrc:/images/paris13.png"
        }

        Image {
            id: image
            x: 134
            y: 126
            width: 756
            height: 362
            clip: false
            enabled: true
            smooth: true
            transformOrigin: Item.Center
            opacity: 0.432
            fillMode: Image.PreserveAspectFit
            source: "images/paris13.png"

        }

        Text {
            x: 456
            y: 34
            color: "#e7e1e1"
            anchors.centerIn: parent
            text: "MyP13"
            font.weight: Font.Light
            font.capitalization: Font.AllUppercase
            font.bold: false
            opacity: 1
            anchors.verticalCenterOffset: 55
            anchors.horizontalCenterOffset: 505
            font.underline: false
            font.family: "Cantarell"
            font.pixelSize: 33
            font.italic: false
        }

         Text {
             x: 456
             y: 40
             color: "#000000"
             anchors.centerIn: parent
              text: 'Paris ' + temp + '°'
             verticalAlignment: Text.AlignVCenter
             horizontalAlignment: Text.AlignHCenter
             opacity: 1
             anchors.verticalCenterOffset: 21
             anchors.horizontalCenterOffset: 974
             font.capitalization: Font.AllUppercase
             font.weight: Font.Light
             font.underline: false
             font.family: "Cantarell"
             font.pixelSize: 23
             font.wordSpacing: 0
             font.italic: false
             style: Text.Normal
             font.bold: false
         }
         Text {
             x: 971
             y: 80
             width: 50
             color: "#000000"
             text: desc
             verticalAlignment: Text.AlignBottom
             horizontalAlignment: Text.AlignRight
             opacity: 1
             anchors.verticalCenterOffset: 21
             anchors.horizontalCenterOffset: 974
             font.capitalization: Font.AllUppercase
             font.weight: Font.Light
             font.underline: false
             font.family: "Cantarell"
             font.pixelSize: 23
             font.wordSpacing: 0
             font.italic: false
             style: Text.Normal
             font.bold: true
         }


        Text {
            x:15
            y:15
            color: "#f9f9f9"
            text: dateTimeString
            font.weight: Font.Light
            font.capitalization: Font.AllUppercase
            font.pixelSize: 20
            font.italic: false
        }

        Text {
            id: element
            x: 326
            y: 400
            width: 356
            height: 87
            color: "#fbfbfb"
            text: qsTr("Appuyez n'importe ou pour commencer")
            font.weight: Font.Light
            font.capitalization: Font.AllUppercase
            lineHeight: 1
            elide: Text.ElideNone
            wrapMode: Text.NoWrap
            styleColor: "#f7f7f7"
            opacity: 1
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 30
        }

        Image {
            x: 920
            y: 5
            sourceSize.width: 0
            scale: 1
            transformOrigin: Item.Center
            fillMode: Image.PreserveAspectFit
            source:'http://openweathermap.org/img/wn/'+codeList+'@2x.png'
        }

        Button {
            id: button
            width: 1024
            height: 613
            opacity: 0
            visible: true
            onClicked:{
                id_loader.source = ""
                id_loader.source = "splash.qml"
                var scene = null
                scene = id_loader.item
                scene.desc=desc
                scene.currentDate = currentDate
                scene.codeList=codeList
                scene.dateTimeString=dateTimeString
                scene.temp=temp
                scene.updateState=updateState
              //  scene.back.connect(closeScene)

            }

        }

    }



    function pad(num) {
        var s = num;
        if (s < 9) s = "0" + s;
        return s;

    }
    function getCondition(location, index) {
        var request = new XMLHttpRequest()
        var url = 'http://api.openweathermap.org/data/2.5/weather?q=Paris,fr&appid=644c2f1cbfc29866f412ab337954f92a&lang=fr&units=metric'
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status && request.status === 200) {
                    //parse data
                    // console.log("response", request.responseText)
                    var result = JSON.parse(request.responseText)
                    codeList = result.weather[0].icon
                    desc = result.weather[0].description
                    temp=result.main.temp
                }
            }

        }
        request.open('GET', url, true)
        request.send()
    }

    Loader {
        id: id_loader
    }


    function closeScene() {
        id_loader.source = ""
    }
}


