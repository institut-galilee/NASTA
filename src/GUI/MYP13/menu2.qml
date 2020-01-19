import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.2

Item {
    id: root
    visible: true
    width: 1024
    height:  600


    signal back
    property bool updateState: true

    property date currentDate
    property string dateTimeString

    property variant codeList
    property string desc
    property int temp
    property string name
    property string mail
    property string formation


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

    MouseArea {
        id: mouseArea
        x: 0
        y: 0
        width: 1024
        height: 600
    }

    Rectangle {
        id: rectangle
        color: "#00000000"
        x: 0
        y: 0


        Image {
            id: image1
            x: 0
            y: 0
            width: 1024
            height: 600
            source: "images/Images7.jpg"
            fillMode: Image.Stretch


        }


        Text {
            id: element
            x: 421
            y: 21
            width: 218
            height: 38
            color: "#ffffff"
            text: qsTr("Menu Principal")
            font.capitalization: Font.AllUppercase
            font.weight: Font.Light
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 30

        }
        Text {
            x: 456
            y: 3
            color: "#f9f9f9"
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
            color: "#f9f9f9"
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

        Rectangle {
            id: rectangle1
            x: 183
            y: 176
            width: 206
            height: 118
            color: "#5ee7df"
            radius: 30
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
                id: textInput
                x: -13
                y: 23
                width: 233
                height: 32
                color: "#f9f9f9"
                text: qsTr("INFOS ")
                font.capitalization: Font.AllUppercase
                font.weight: Font.Light
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 23
            }

            TextInput {
                id: textInput4
                x: -13
                y: 61
                width: 233
                height: 32
                color: "#f9f9f9"
                text: qsTr("PEADGOGIQUE")
                font.capitalization: Font.AllUppercase
                font.weight: Font.Light
                font.pixelSize: 23
                horizontalAlignment: Text.AlignHCenter
            }

        }

        Rectangle {
            id: rectangle2
            x: 639
            y: 171
            width: 206
            height: 118
            color: "#5ee7df"
            radius: 30
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
                id: textInput2
                x: 0
                y: 45
                width: 206
                height: 29
                color: "#fdfdfd"
                text: qsTr("IZLY")
                font.capitalization: Font.AllUppercase
                font.weight: Font.Light
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 21
            }
        }

        Rectangle {
            id: rectangle3
            x: 427
            y: 351
            width: 206
            height: 118
            color: "#5ee7df"
            radius: 30
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
                id: textInput1
                x: -7
                y: 23
                width: 220
                height: 30
                color: "#f9f9f9"
                text: qsTr("QUOTAS")
                renderType: Text.NativeRendering
                inputMask: qsTr("")
                font.capitalization: Font.AllUppercase
                font.weight: Font.Light
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 19
            }

            TextInput {
                id: textInput6
                x: -7
                y: 59
                width: 220
                height: 30
                color: "#f9f9f9"
                text: qsTr("ET STOCKAGE")
                horizontalAlignment: Text.AlignHCenter
                renderType: Text.NativeRendering
                font.pixelSize: 19
                font.capitalization: Font.AllUppercase
                font.weight: Font.Light
                inputMask: qsTr("")
            }
        }

        Image {
            id: image
            x: 665
            y: 452
            width: 351
            height: 176
            opacity: 0.599
            source: "images/paris13.png"
            fillMode: Image.Stretch
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
        }



        MouseArea {
            id: mouseArea6
            x: 38
            y: 546
            width: 65
            height: 47
            onClicked: {
                root.back()
            }
        }

        MouseArea {
            id: mouseArea1
            x: 183
            y: 176
            width: 206
            height: 118
            onClicked:{
                pageLoader.source = ""
                pageLoader.source = "infos.qml"
                var scene = null
                scene = pageLoader.item
                scene.back.connect(closeScene)
            }
        }



        MouseArea {
            id: mouseArea3
            x: 427
            y: 351
            width: 206
            height: 118
            onClicked:{
                pageLoader.source = ""
                pageLoader.source = "quotas.qml"
                var scene = null
                scene = pageLoader.item
                scene.back.connect(closeScene)
            }
        }


        MouseArea {
            id: mouseArea5
            x: 639
            y: 171
            width: 206
            height: 118
            onClicked:{
                pageLoader.source = ""
                pageLoader.source = "izly.qml"
                var scene = null
                scene = pageLoader.item
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
            color: "#f9f9f9"
            anchors.fill: parent
            text: dateTimeString
            font.weight: Font.Light
            font.capitalization: Font.AllUppercase
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
        Text {
            id: element1
            x: 90
            y: 88
            width: 443
            height: 33
            color: "#ffffff"
            text: qsTr("BONJOUR   M.    ") + name + "    -    " +formation
            font.capitalization: Font.AllUppercase
            font.pixelSize: 25
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


