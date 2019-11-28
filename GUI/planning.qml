import QtQuick 2.11
import QtQuick.Controls 2.4


Item {
    id: root
    anchors.fill: parent



    Rectangle {
        id: rectangle
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
           anchors.fill: root

           gradient: Gradient {
               GradientStop { position: 0.0; color: "#e8536a" }
               GradientStop { position: 0.076; color: "#e8536a" }
               GradientStop {position: 0.109;color: "#e8536a" }
               GradientStop { position: 0.13; color: "#e8536a" }
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
               GradientStop {position: 0.978;color: "#e8536a" }
               GradientStop { position: 1.0; color: "#e8536a" }

           }
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:1024}
}
##^##*/
