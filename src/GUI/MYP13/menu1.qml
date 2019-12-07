import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.2

ApplicationWindow {
    id: root
    flags: Qt.FramelessWindowHint
    visible: true
    width: 1024
    height:  600
    x:0
    y:0
    color: "#2a0859"
    signal back

    property bool updateState: true

    property date currentDate
    property string dateTimeString

    property variant codeList
    property string desc
    property int temp


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
        color: "#00000000"
        x:0
        y:0

        Image {
            id: image1
            x: 0
            y: 0
            width: 1024
            height: 600
            source: "images/Images3.jpg"
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
            id: rectangle8
            x: 762
            y: 176
            width: 206
            height: 118
            color: "#5ee7df"
            radius: 30
            border.color: "#f2f2f4"
            border.width: 1
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#ac32e4"
                }

                GradientStop {
                    position: 0.48
                    color: "#7918f2"
                }

                GradientStop {
                    position: 1
                    color: "#4801ff"
                }
            }
            TextInput {
                id: textInput8
                x: -7
                y: 23
                width: 220
                height: 30
                color: "#f9f9f9"
                text: qsTr("SIGNALER")
                renderType: Text.NativeRendering
                font.capitalization: Font.AllUppercase
                font.pixelSize: 19
                inputMask: qsTr("")
                font.weight: Font.Light
                horizontalAlignment: Text.AlignHCenter
            }

            TextInput {
                id: textInput9
                x: -7
                y: 59
                width: 220
                height: 30
                color: "#f9f9f9"
                text: qsTr("LA CARTE")
                renderType: Text.NativeRendering
                font.capitalization: Font.AllUppercase
                font.pixelSize: 19
                inputMask: qsTr("")
                font.weight: Font.Light
                horizontalAlignment: Text.AlignHCenter
            }

            MouseArea {
                id: mouseArea8
                x: 0
                y: 0
                width: 206
                height: 118
                onClicked:{
                    pageLoader.source = ""
                    pageLoader.source = "signaler.qml"
                    var scene = null
                    scene = pageLoader.item
                    scene.back.connect(closeScene)
                }
            }
        }

        Rectangle {
            id: rectangle7
            x: 316
            y: 512
            width: 290
            height: 88
            color: "#00000000"
            visible: true

            MouseArea {
                id: mouseArea7
                x: 0
                y: 0
                width: 290
                height: 88
                visible: true
                onClicked:{
                    pageLoader.source = ""
                    pageLoader.source = "menu2.qml"

                    var scene = null
                    scene = pageLoader.item
                    scene.desc=desc
                    scene.currentDate = currentDate
                    scene.codeList=codeList
                    scene.dateTimeString=dateTimeString
                    scene.temp=temp
                    scene.updateState=updateState
                    scene.back.connect(closeScene)

                }

            }
        }
        Rectangle {
            id: rectangle1
            x: 98
            y: 176
            width: 206
            height: 118
            color: "#5ee7df"
            radius: 30
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#ac32e4"
                }

                GradientStop {
                    position: 0.48
                    color: "#7918f2"
                }

                GradientStop {
                    position: 1
                    color: "#4801ff"
                }
            }
            border.width: 1
            border.color: "#f2f2f4"

            TextInput {
                id: textInput
                x: 43
                y: 43
                width: 120
                height: 32
                color: "#f9f9f9"
                text: qsTr("Planning")
                font.capitalization: Font.AllUppercase
                font.weight: Font.Light
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
            color: "#5ee7df"
            radius: 30
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#ac32e4"
                }

                GradientStop {
                    position: 0.48
                    color: "#7918f2"
                }

                GradientStop {
                    position: 1
                    color: "#4801ff"
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
                text: qsTr("Planning Annuel")
                font.capitalization: Font.AllUppercase
                font.weight: Font.Light
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
            color: "#5ee7df"
            radius: 30
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#ac32e4"
                }

                GradientStop {
                    position: 0.48
                    color: "#7918f2"
                }

                GradientStop {
                    position: 1
                    color: "#4801ff"
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
                text: qsTr("Occupation")
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
                text: qsTr("Salles TP")
                horizontalAlignment: Text.AlignHCenter
                renderType: Text.NativeRendering
                font.pixelSize: 19
                font.capitalization: Font.AllUppercase
                font.weight: Font.Light
                inputMask: qsTr("")
            }
        }

        Rectangle {
            id: rectangle4
            x: 427
            y: 351
            width: 206
            height: 118
            color: "#5ee7df"
            radius: 30
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#ac32e4"
                }

                GradientStop {
                    position: 0.48
                    color: "#7918f2"
                }

                GradientStop {
                    position: 1
                    color: "#4801ff"
                }
            }
            border.width: 1
            border.color: "#f2f2f4"

            TextInput {
                id: textInput3
                x: -14
                y: 62
                width: 235
                height: 29
                color: "#fbfbfb"
                text: qsTr("l'Université")
                passwordCharacter: ""
                font.kerning: true
                font.wordSpacing: 0
                font.capitalization: Font.AllUppercase
                horizontalAlignment: Text.AlignHCenter
                font.weight: Font.Light
                font.pixelSize: 21
            }

            TextInput {
                id: textInput7
                x: -14
                y: 22
                width: 235
                height: 29
                color: "#fbfbfb"
                text: qsTr("Plan de ")
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 21
                font.capitalization: Font.AllUppercase
                font.kerning: true
                passwordCharacter: ""
                font.wordSpacing: 0
                font.weight: Font.Light
            }
        }

        Rectangle {
            id: rectangle5
            x: 762
            y: 351
            width: 206
            height: 118
            color: "#5ee7df"
            radius: 30
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#ac32e4"
                }

                GradientStop {
                    position: 0.48
                    color: "#7918f2"
                }

                GradientStop {
                    position: 1
                    color: "#4801ff"
                }
            }
            border.width: 1
            border.color: "#f2f2f4"

            TextInput {
                id: textInput4
                x: 56
                y: 43
                width: 94
                height: 32
                color: "#ffffff"
                text: qsTr("Plus")
                selectionColor: "#fbfbfb"
                horizontalAlignment: Text.AlignHCenter
                font.capitalization: Font.AllUppercase
                font.weight: Font.Light
                font.pixelSize: 23
            }

        }

        Image {
            id: image
            x: 617
            y: 445
            width: 351
            height: 176
            opacity: 0.599
            source: "images/paris13.png"
            fillMode: Image.Stretch

            MouseArea {
                id: mouseArea6
                x: 295
                y: 109
                width: 100
                height: 100
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
                    color: "#5f72bd"
                }

                GradientStop {
                    position: 1
                    color: "#9b23ea"
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
                    root.close()
                }
            }
        }

        MouseArea {
            id: mouseArea
            x: 762
            y: 351
            width: 206
            height: 118
            onClicked:{
                pageLoader.source = ""
                pageLoader.source = "login.qml"
                var scene = null
                scene = pageLoader.item
                scene.back.connect(closeScene)
            }
        }

        MouseArea {
            id: mouseArea1
            x: 98
            y: 176
            width: 206
            height: 118
            onClicked:{
                pageLoader.source = ""
                pageLoader.source = "planning.qml"
                var scene = null
                scene = pageLoader.item
                scene.back.connect(closeScene)
            }
        }


        MouseArea {
            id: mouseArea3
            x: 98
            y: 351
            width: 206
            height: 118
            onClicked:{
                pageLoader.source = ""
                pageLoader.source = "occupation.qml"
                var scene = null
                scene = pageLoader.item
                scene.back.connect(closeScene)
            }
        }


        MouseArea {
            id: mouseArea4
            x: 427
            y: 351
            width: 206
            height: 118
            onClicked:{
                pageLoader.source = ""
                pageLoader.source = "plan_univ.qml"
                var scene = null
                scene = pageLoader.item
                scene.back.connect(closeScene)
            }
        }

        MouseArea {
            id: mouseArea5
            x: 427
            y: 176
            width: 206
            height: 118
            onClicked:{
                pageLoader.source = ""
                pageLoader.source = "planning_ann.qml"
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
            color: "#fbfbfb"
            anchors.fill: parent
            text: desc
            font.weight: Font.Light
            font.capitalization: Font.AllUppercase
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 20
            anchors.rightMargin: 8
            anchors.bottomMargin: -72
            anchors.leftMargin: -8
            anchors.topMargin: 74
            font.italic: false
        }



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


