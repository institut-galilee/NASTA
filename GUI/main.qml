import QtQuick 2.11
import QtQuick.Controls 2.4

Item {
    id: root
    anchors.fill: parent

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
        color: "#a8e0e0"
           anchors.fill: root

           gradient: Gradient {
               GradientStop { position: 0.0; color: "#a8e0e0" }
               GradientStop { position: 0.076; color: "#7ec5c5" }
               GradientStop { position: 0.13; color: "#9bd3d3" }
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
               GradientStop {position: 0.978;color: "#7ec5c5" }
               GradientStop { position: 1.0; color: "#abccca" }
           }

           Image {
               id: image1
               x: 111
               y: 386
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
               anchors.bottomMargin: 77
               anchors.leftMargin: 94
               anchors.rightMargin: 94
               anchors.topMargin: 77
               opacity: 0.432
               anchors.fill: parent
               fillMode: Image.PreserveAspectFit
               source: "images/paris13.png"

               Button {
                   id: button
                   opacity: 0
                   anchors.rightMargin: -95
                   anchors.bottomMargin: -78
                   anchors.leftMargin: -93
                   anchors.topMargin: -76
                   anchors.fill: parent
                   visible: true
                   onClicked:{
                    id_loader.source = ""
                    id_loader.source = "menu1.qml"

                                          var scene = null
                                          scene = id_loader.item
                                          scene.parent = root
                                          scene.anchors.fill = root
                                          scene.desc=desc
                                          scene.currentDate = currentDate
                                          scene.codeList=codeList
                                          scene.dateTimeString=dateTimeString
                                          scene.temp=temp
                                          scene.updateState=updateState
                                          //scene.searchFor = name // Location
                                          //scene.init() // Call init function
                                          scene.back.connect(closeScene)

               }

               }

           }

       }

       // Top Area
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
               anchors.centerIn: parent
               text: "MyP13"
               font.underline: false
               font.family: "Cantarell"
               anchors.verticalCenterOffset: -9
               anchors.horizontalCenterOffset: 1
               font.pixelSize: 33
               font.wordSpacing: 0
               font.italic: false
               style: Text.Normal
               font.bold: false
           }

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

           Text {
               id: element
               x: 334
               y: 394
               width: 356
               height: 87
               text: qsTr("Appuyez n'importe ou pour commencer")
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



       }
       // Bottom Area
       Rectangle {
           id: bottomArea
           anchors {
               left: root.left
               right: root.right
               bottom: root.bottom
           }
           height: root.height * 0.1
           color: "transparent"      

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

/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:1024}D{i:19;anchors_height:154;anchors_width:433;anchors_x:104;anchors_y:163}
}
##^##*/
