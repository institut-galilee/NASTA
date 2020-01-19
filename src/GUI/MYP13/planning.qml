import QtQuick 2.11
import QtQuick.Controls 1.4
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles 1.1
import com.calendar 1.0




    Item {
        id:root
        signal back

        visible: true
        width: 1024
        height:  600
        x:0
        y:0



        SystemPalette {
            id: systemPalette
        }

        SqlEventModel {
            id: eventModel
        }

        Rectangle {
            id: rectangle
            x: 0
            y: 0
            width: 1024
            height: 600
            color: "#46208e"

            MouseArea {
                id: mouseArea1
                width: 1024
                height: 600
            }
        }

        Flow {
            id: row
            anchors.bottomMargin: 77
            anchors.fill: parent
            anchors.margins: 20
            spacing: 10
            layoutDirection: Qt.RightToLeft

            Calendar {
                id: calendar
                width: 500
                height: (parent.height > parent.width ? parent.height * 0.6 - parent.spacing : parent.height)
                dayOfWeekFormat: 1
                visibleYear: 2019
                frameVisible: false
                selectedDate: new Date()
                focus: true


                style: CalendarStyle {
                    gridVisible: true

                    dayDelegate: Item {

                        readonly property color sameMonthDateTextColor: "#542794"
                        readonly property color selectedDateColor:  "#260455"
                        readonly property color selectedDateTextColor: "#ffffff"
                        readonly property color differentMonthDateTextColor: "#542794"
                        readonly property color invalidDatecolor: "#542794"

                        Rectangle {
                            color: styleData.date !== undefined && styleData.selected ? selectedDateColor : "transparent"

                            radius: 12
                            border.width: 0
                            anchors.fill: parent
                            border.color: "#260455"
                            anchors.margins: styleData.selected ? -1 : 0
                        }

                        Image {
                            visible: eventModel.eventsForDate(styleData.date).length > 0
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.margins: -1
                            width: 12
                            height: width
                            source: "qrc:/images/eventindicator.png"
                        }

                        Label {
                            id: dayDelegateText
                            text: styleData.date.getDate()

                            anchors.centerIn: parent
                            color: {
                                var color = invalidDatecolor;
                                if (styleData.valid) {
                                    color = styleData.visibleMonth ? sameMonthDateTextColor : differentMonthDateTextColor;
                                    if (styleData.selected) {
                                        color = selectedDateTextColor;
                                    }
                                }
                                color;
                            }
                        }
                    }
                }
            }

            Component {
                id: eventListHeader

                Row {
                    id: eventDateRow
                    width: parent.width
                    height: eventDayLabel.height
                    spacing: 10

                    Label {
                        id: eventDayLabel
                        text: calendar.selectedDate.getDate()
                        font.pointSize: 35
                    }

                    Column {
                        height: eventDayLabel.height

                        Label {
                            readonly property var options: { weekday: "long" }
                            text: Qt.locale().standaloneDayName(calendar.selectedDate.getDay(), Locale.LongFormat)
                            font.pointSize: 18
                        }
                        Label {
                            text: Qt.locale().standaloneMonthName(calendar.selectedDate.getMonth())
                                  + calendar.selectedDate.toLocaleDateString(Qt.locale(), " yyyy")
                            font.pointSize: 12
                        }
                    }
                }
            }

            Rectangle {
                width: 465
                height: (parent.height > parent.width ? parent.height * 0.4 - parent.spacing : parent.height)
                color: "#e0daf1"
                radius: 20
                border.width: 0
                border.color: Qt.darker(color, 1.2)

                ListView {
                    id: eventsListView
                    spacing: 7
                    clip: true
                    header: eventListHeader
                    anchors.fill: parent
                    anchors.margins: 10
                    model: eventModel.eventsForDate(calendar.selectedDate)

                    delegate: Rectangle {
                        width: eventsListView.width
                        height: eventItemColumn.height
                        border.width: 0
                        radius: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Image {
                            anchors.top: parent.top
                            anchors.topMargin: 4
                            width: 12
                            height: width
                            source: "qrc:/images/eventindicator.png"
                        }

                        Rectangle {
                            width: parent.width
                            height: 1
                            color: "#eee"
                        }

                        Column {
                            id: eventItemColumn
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.right: parent.right
                            height: timeLabel.height + nameLabel.height + 8

                            Label {
                                id: nameLabel
                                width: parent.width
                                wrapMode: Text.Wrap
                                text: modelData.name
                            }
                            Label {
                                id: timeLabel
                                width: parent.width
                                wrapMode: Text.Wrap
                                text: modelData.startDate.toLocaleTimeString(calendar.locale, Locale.ShortFormat) +"-"+modelData.endDate.toLocaleTimeString(calendar.locale, Locale.ShortFormat)
                                color: "#aaa"
                            }

                        }
                    }
                }
            }
        }


        Text {
            id: element
            x: 0
            y: 529
            width: 1030
            height: 71
            color: "#ebeaea"
            text: qsTr("REVENIR EN ARRIERE")
            font.weight: Font.ExtraLight
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 38
        }


        MouseArea {
            id: mouseArea
            x: 0
            y: 529
            width: 1024
            height: 71
            onClicked:{
                root.back()
            }
        }

    }





