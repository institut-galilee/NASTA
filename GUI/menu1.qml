import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.2

Item {
    id: root
    anchors.fill: parent
    signal back

    property bool updateState: true

    property date currentDate
    property string dateTimeString

    property variant codeList
    property string desc
    property int temp
    property variant win


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

    Rectangle {
        id: rectangle
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
           anchors.fill: root

           gradient: Gradient {
               GradientStop { position: 0.0; color: "#81e956" }
               GradientStop { position: 0.076; color: "#81e956" }
               GradientStop {position: 0.109;color: "#81e956" }
               GradientStop { position: 0.13; color: "#81e956" }
               GradientStop {position: 0.196; color: "#f2f3f3"}
               GradientStop { position: 0.3; color: "#f7f7f7" }
               GradientStop { position: 0.4; color: "#f7f7f7" }
               GradientStop { position: 0.5; color: "#ffffff" }
               GradientStop { position: 0.6; color: "#f5f5f5" }
               GradientStop { position: 0.7; color: "#fbfbfb" }
               GradientStop { position: 0.782;color: "#f7f7f7" }
               GradientStop { position: 0.8; color: "#f7f7f7" }
               GradientStop {position: 0.832;color: "#f7f7f7"}
               GradientStop { position: 0.9; color: "#ebeeeb" }
               GradientStop {position: 0.978;color: "#81e956" }
               GradientStop { position: 1.0; color: "#81e956" }

           }

           Text {
               id: element
               x: 421
               y: 21
               width: 218
               height: 38
               text: qsTr("Menu Principal")
               font.weight: Font.DemiBold
               horizontalAlignment: Text.AlignHCenter
               verticalAlignment: Text.AlignVCenter
               font.pixelSize: 30

           }

           Rectangle {
               id: rectangle1
               x: 98
               y: 176
               width: 206
               height: 118
               color: "#d5eec0"
               radius: 40
               border.width: 1
               border.color: "#081004"

               TextInput {
                   id: textInput
                   x: 56
                   y: 43
                   width: 94
                   height: 32
                   text: qsTr("Planning")
                   font.capitalization: Font.MixedCase
                   font.weight: Font.DemiBold
                   horizontalAlignment: Text.AlignHCenter
                   font.pixelSize: 23
               }

           }

           Rectangle {
               id: rectangle2
               x: 427
               y: 176
               width: 206
               height: 118
               color: "#d5eec0"
               radius: 40
               opacity: 1
               border.color: "#081004"
               border.width: 1

               TextInput {
                   id: textInput2
                   x: 0
                   y: 45
                   width: 206
                   height: 29
                   text: qsTr("Planning Annuel")
                   font.weight: Font.DemiBold
                   horizontalAlignment: Text.AlignHCenter
                   font.pixelSize: 21
               }
           }

           Rectangle {
               id: rectangle3
               x: 98
               y: 351
               width: 206
               height: 118
               color: "#d5eec0"
               radius: 40
               border.color: "#081004"
               border.width: 1

               TextInput {
                   id: textInput1
                   x: -7
                   y: 44
                   width: 220
                   height: 30
                   text: qsTr("Occupation Salles TP")
                   font.weight: Font.DemiBold
                   horizontalAlignment: Text.AlignHCenter
                   font.pixelSize: 19
               }
           }

           Rectangle {
               id: rectangle4
               x: 427
               y: 351
               width: 206
               height: 118
               color: "#d5eec0"
               radius: 40
               border.color: "#081004"
               border.width: 1

               TextInput {
                   id: textInput3
                   x: 0
                   y: 45
                   width: 206
                   height: 29
                   text: qsTr("Plan de l'Université")
                   horizontalAlignment: Text.AlignHCenter
                   font.weight: Font.DemiBold
                   font.pixelSize: 21
               }
           }

           Rectangle {
               id: rectangle5
               x: 750
               y: 265
               width: 206
               height: 118
               color: "#d5eec0"
               radius: 40
               border.color: "#081004"
               border.width: 1

               TextInput {
                   id: textInput4
                   x: 56
                   y: 43
                   width: 94
                   height: 32
                   text: qsTr("Plus")
                   horizontalAlignment: Text.AlignHCenter
                   font.capitalization: Font.MixedCase
                   font.weight: Font.DemiBold
                   font.pixelSize: 23
               }

           }

           Image {
               id: image
               x: 628
               y: 389
               width: 351
               height: 176
               opacity: 0.391
               source: "images/paris13.png"
               fillMode: Image.PreserveAspectFit
           }

           Rectangle {
               id: rectangle6
               x: 38
               y: 546
               width: 65
               height: 47
               color: "#e6eaea"
               radius: 20
               border.color: "#69d246"
               TextInput {
                   id: textInput5
                   x: -14
                   y: 9
                   width: 94
                   height: 32
                   text: qsTr("<-")
                   horizontalAlignment: Text.AlignHCenter
                   font.capitalization: Font.MixedCase
                   font.weight: Font.DemiBold
                   font.pixelSize: 23
               }
               border.width: 1
               MouseArea {
                   anchors.fill: parent
                   onClicked: {
                       root.back()
                   }
               }
           }

           MouseArea {
               id: mouseArea
               x: 750
               y: 265
               width: 206
               height: 118
               onClicked:{
                pageLoader.source = ""
                   pageLoader.source = "login.qml"
                   var scene = null
                   scene = pageLoader.item
               }
           }

           MouseArea {
               id: mouseArea1
               x: 98
               y: 176
               width: 206
               height: 118
               onClicked:{
                   pageLoader.source = "planning.qml"
                   var scene = null
                   scene = pageLoader.item
                   scene.parent = root
                   scene.anchors.fill = root
                   scene.back.connect(closeScene)
               }
           }


    }
    Rectangle {
        id: topArea
        anchors {
            top: root.top
            left: root.left
            right: root.right
        }
        height: root.height * 0.15
        color: "transparent"

        Text {
            anchors.fill: parent
            text: 'Paris ' + temp + '°'
            horizontalAlignment: Text.AlignRight

            anchors.rightMargin: 10
            anchors.bottomMargin: 5
            anchors.leftMargin: 5
            anchors.topMargin: 5
            font.pixelSize: 20
            font.italic: false
        }

        Text {
            anchors.fill: parent
            text: desc
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 20
            anchors.rightMargin: 8
            anchors.bottomMargin: -72
            anchors.leftMargin: -8
            anchors.topMargin: 74
            font.italic: false
        }


        Text {
            anchors.fill: parent
            text: dateTimeString
            anchors.topMargin: 9
            anchors.leftMargin: 15
            anchors.bottomMargin: -83
            anchors.rightMargin: 15
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
            font.italic: false
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
            id: pageLoader
    }
   function closeScene() {
            pageLoader.source = ""
            }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:1024}
}
##^##*/
