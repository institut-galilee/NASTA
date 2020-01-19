import QtQuick 2.11
import QtQuick.Controls 2.4
import com.json 1.0


Item {
    id: root
    anchors.fill: parent
    signal back


    Json{
    id : jsp
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
                   source: "images/Images7.jpg"

                   Text {
                       id: element
                       x: 265
                       y: 8
                       color: "#fdfdfd"
                       text: qsTr("information pédagogique")
                       font.capitalization: Font.AllUppercase
                       font.weight: Font.ExtraLight
                       font.pixelSize: 35
                   }

                   SwipeView {
                       id: view
                       anchors.leftMargin: 0
                       anchors.topMargin: 57

                       currentIndex: 0
                       anchors.fill: parent

                       Item {
                           id: firstPage
                           Text{
                               id: titre1
                               x: 320
                               y: 30
                               width: 384
                               height: 40
                                text: jsp.info_titre(0)
                               font.pointSize: 14
                               font.bold: true
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }

                           Text {
                               id: info1
                               x: 62
                               y: 52
                               width: 900
                               height: 482
                               color: "#44f7ea"
                               text: jsp.info_texte(0).replace(/\n|\r/g, "").replace(/>>|\r/g, "");
                               font.pointSize: 11
                               wrapMode: Label.WordWrap
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }
                       }
                       Item {
                           id: secondPage
                           Text{
                               id: titre2
                               x: 320
                               y: 30
                               width: 384
                               height: 40
                                text: jsp.info_titre(1)
                               font.pointSize: 14
                               font.bold: true
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }

                           Text {
                               id: info2
                               x: 62
                               y: 52
                               width: 900
                               height: 482
                               color: "#44f7ea"
                               text: jsp.info_texte(1).replace(/\n|\r/g, "").replace(/>>|\r/g, "");
                               font.pointSize: 11
                               wrapMode: Label.WordWrap
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }
                       }
                       Item {
                           id: thirdPage
                           Text{
                               id: titre3
                               x: 320
                               y: 30
                               width: 384
                               height: 40
                                text: jsp.info_titre(2)
                               font.pointSize: 14
                               font.bold: true
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }

                           Text {
                               id: info3
                               x: 62
                               y: 52
                               width: 900
                               height: 482
                               color: "#44f7ea"
                               text: jsp.info_texte(2).replace(/\n|\r/g, "").replace(/>>|\r/g, "");
                               font.pointSize: 11
                               wrapMode: Label.WordWrap
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }
                       }
                       Item {
                           id: fourthPage
                           Text{
                               id: titre4
                               x: 320
                               y: 30
                               width: 384
                               height: 40
                                text: jsp.info_titre(3)
                               font.pointSize: 14
                               font.bold: true
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }

                           Text {
                               id: info4
                               x: 62
                               y: 52
                               width: 900
                               height: 482
                               color: "#44f7ea"
                               text: jsp.info_texte(3).replace(/\n|\r/g, "").replace(/>>|\r/g, "");
                               font.pointSize: 11
                               wrapMode: Label.WordWrap
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }
                       }
                       Item {
                           id: fifthPage
                           Text{
                               id: titre5
                               x: 320
                               y: 30
                               width: 384
                               height: 40
                                text: jsp.info_titre(4)
                               font.pointSize: 14
                               font.bold: true
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }

                           Text {
                               id: info5
                               x: 62
                               y: 52
                               width: 900
                               height: 482
                               color: "#44f7ea"
                               text: jsp.info_texte(4).replace(/\n|\r/g, "").replace(/>>|\r/g, "");
                               font.pointSize: 11
                               wrapMode: Label.WordWrap
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }
                       }
                       Item {
                           id: sixthPage
                           Text{
                               id: titre6
                               x: 320
                               y: 30
                               width: 384
                               height: 40
                                text: jsp.info_titre(5)
                               font.pointSize: 14
                               font.bold: true
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }

                           Text {
                               id: info6
                               x: 62
                               y: 52
                               width: 900
                               height: 482
                               color: "#44f7ea"
                               text: jsp.info_texte(5).replace(/\n|\r/g, "").replace(/>>|\r/g, "");
                               font.pointSize: 11
                               wrapMode: Label.WordWrap
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }
                       }
                       Item {
                           id: sevenPage
                           Text{
                               id: titre7
                               x: 320
                               y: 30
                               width: 384
                               height: 40
                                text: jsp.info_titre(6)
                               font.pointSize: 14
                               font.bold: true
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }

                           Text {
                               id: info7
                               x: 62
                               y: 52
                               width: 900
                               height: 482
                               color: "#44f7ea"
                               text: jsp.info_texte(6).replace(/\n|\r/g, "").replace(/>>|\r/g, "");
                               font.pointSize: 11
                               wrapMode: Label.WordWrap
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }
                       }
                       Item {
                           id: heigtPage
                           Text{
                               id: titre8
                               x: 320
                               y: 30
                               width: 384
                               height: 40
                                text: jsp.info_titre(7)
                               font.pointSize: 14
                               font.bold: true
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }

                           Text {
                               id: info8
                               x: 62
                               y: 52
                               width: 900
                               height: 482
                               color: "#44f7ea"
                               text: jsp.info_texte(7).replace(/\n|\r/g, "").replace(/>>|\r/g, "");
                               font.pointSize: 11
                               wrapMode: Label.WordWrap
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }
                       }
                       Item {
                           id: ninePage
                           Text{
                               id: titre9
                               x: 320
                               y: 30
                               width: 384
                               height: 40
                                text: jsp.info_titre(8)
                               font.pointSize: 14
                               font.bold: true
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }

                           Text {
                               id: info9
                               x: 62
                               y: 52
                               width: 900
                               height: 482
                               color: "#44f7ea"
                               text: jsp.info_texte(8).replace(/\n|\r/g, "").replace(/>>|\r/g, "");
                               font.pointSize: 11
                               wrapMode: Label.WordWrap
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }
                       }
                       Item {
                           id: tenPage
                           Text{
                               id: titre10
                               x: 320
                               y: 30
                               width: 384
                               height: 40
                                text: jsp.info_titre(9)
                               font.pointSize: 14
                               font.bold: true
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }

                           Text {
                               id: info10
                               x: 62
                               y: 52
                               width: 900
                               height: 482
                               color: "#44f7ea"
                               text: jsp.info_texte(9).replace(/\n|\r/g, "").replace(/>>|\r/g, "");
                               font.pointSize: 11
                               wrapMode: Label.WordWrap
                               font.capitalization: Font.MixedCase
                               verticalAlignment: Text.AlignVCenter
                               horizontalAlignment: Text.AlignHCenter

                           }
                       }
                   }

                   PageIndicator {
                       id: indicator
                       y: 580
                       anchors.horizontalCenterOffset: -7
                       anchors.bottomMargin: 0

                       count: view.count
                       currentIndex: view.currentIndex

                       anchors.bottom: view.bottom
                       anchors.horizontalCenter: parent.horizontalCenter
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

        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.back()
            }
        }
    }

    /*function getinfo() {
        var http = new XMLHttpRequest();
        var url = 'https://ent.univ-paris13.fr/ajax?__application=nouvelles&__class=Nouvelles&__function=renderViewAll'
        http.open("GET", url, true);
        http.setRequestHeader( 'username', 'password ' + Qt.btoa( '11707756' + ':' + '' ) )
        http.onreadystatechange = function () {
          if(http.readyState === XMLHttpRequest.DONE && http.status === 200) {
              console.log(http.status)
              callback(http)
          }
        };
        http.send();
    }*/

}




/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:1024}
}
##^##*/
