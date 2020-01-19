import QtQuick 2.11
import QtQuick.Controls 2.4
import com.quotas 1.0

Item {
    id: root
    anchors.fill: parent
    signal back
    property string numero: "11707756"



    Quotas{
        id:q_imp
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
                height: 600
                fillMode: Image.Stretch
                source: "images/Images10.jpg"

                Text {
                    id: element
                    x: 319
                    y: 32
                    color: "#091394"
                    text: qsTr("QUOTAS ET STOCKAGE")
                    font.capitalization: Font.AllUppercase
                    font.weight: Font.Light
                    font.pixelSize: 35
                }

                Rectangle {
                    id: rectangle1
                    x: 131
                    y: 324
                    width: 751
                    height: 169
                    color: "#fad0c4"
                    radius: 30
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#dad4ec"
                        }

                        GradientStop {
                            position: 0.01
                            color: "#dad4ec"
                        }

                        GradientStop {
                            position: 1
                            color: "#f3e7e9"
                        }
                    }

                    Text {
                        id: element1
                        x: 42
                        y: 87
                        text: q_imp.stockage(numero.toString())
                        font.weight: Font.Light
                        font.capitalization: Font.AllUppercase
                        font.pixelSize: 30
                    }

                    Text {
                        id: element5
                        x: 32
                        y: 30
                        color: "#940505"
                        text: "NUMERO ETUDIANT                     STOCKAGE MAX     STOCKAGE UTILISÉ"
                        font.weight: Font.Light
                        font.capitalization: Font.AllUppercase
                        font.pixelSize: 22
                    }
                }

                Rectangle {
                    id: rectangle2
                    x: 127
                    y: 150
                    width: 759
                    height: 101
                    color: "#fad0c4"
                    radius: 30
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#dad4ec"
                        }

                        GradientStop {
                            position: 0.01
                            color: "#dad4ec"
                        }

                        GradientStop {
                            position: 1
                            color: "#f3e7e9"
                        }
                    }

                    Text {
                        id: element2
                        x: 296
                        y: 32
                        text: q_imp.quotas_etu() + "/300"
                        font.capitalization: Font.AllUppercase
                        font.weight: Font.Light
                        font.pixelSize: 30
                    }

                    Text {
                        id: element4
                        x: 8
                        y: 32
                        color: "#940505"
                        text: "Pages restante :"
                        font.weight: Font.Light
                        font.capitalization: Font.AllUppercase
                        font.pixelSize: 30
                    }
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
                color: "#cc208e"
            }

            GradientStop {
                position: 1
                color: "#6713d2"
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


/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:1024}
}
##^##*/
