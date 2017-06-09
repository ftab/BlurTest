import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 1
        background: Image {
            id: imgBackground
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: "nature_1.jpg"
        }



        Item {
            id: item1


            Rectangle {
                id: recFrost
                anchors.fill: fastBlur
                radius: 10
            }
            FastBlur {
                id: fastBlur
                anchors.fill: recControls
                source: ShaderEffectSource {
                    sourceItem: imgBackground

                    sourceRect: Qt.rect(
                                    (swipeView.width * fastBlur.parent.SwipeView.index) - swipeView.contentItem.contentX + fastBlur.x,
                                    fastBlur.y,
                                    fastBlur.width,
                                    fastBlur.height)
                }
                radius: 32
                visible: false
            }
            OpacityMask {
                anchors.fill: fastBlur
                source: fastBlur
                maskSource: recFrost
                opacity: 0.55
            }

            Rectangle {
                id: recControls
                width: 364
                height: 89
                color: "#00000000"
                anchors.bottomMargin: 8
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom

                Label {
                    text: qsTr("First page")
                    anchors.centerIn: parent
                }
            }
        }

        Item {
            id: item2

            Rectangle {
                id: recFrost2
                anchors.fill: fastBlur2
                radius: 10
            }
            FastBlur {
                id: fastBlur2
                anchors.fill: recControls2
                source: ShaderEffectSource {
                    sourceItem: imgBackground

                    sourceRect: Qt.rect(
                                    (swipeView.width * fastBlur2.parent.SwipeView.index) - swipeView.contentItem.contentX + fastBlur2.x,
                                    fastBlur2.y,
                                    fastBlur2.width,
                                    fastBlur2.height)
                }
                radius: 32
                visible: false
            }
            OpacityMask {
                anchors.fill: fastBlur2
                source: fastBlur2
                maskSource: recFrost2
                opacity: 0.55
            }
            Rectangle {
                id: recControls2
                width: 364
                height: 89
                color: "#00000000"
                anchors.centerIn: parent

                Label {
                    text: qsTr("Second page")
                    anchors.centerIn: parent
                }
            }
        }

        Item {
            id: item3

            Rectangle {
                id: recFrost3
                anchors.fill: fastBlur3
                radius: 10
            }
            FastBlur {
                id: fastBlur3
                anchors.fill: recControls3
                source: ShaderEffectSource {
                    sourceItem: imgBackground

                    sourceRect: Qt.rect(
                                    (swipeView.width * fastBlur3.parent.SwipeView.index) - swipeView.contentItem.contentX + fastBlur3.x,
                                    fastBlur3.y,
                                    fastBlur3.width,
                                    fastBlur3.height)
                }
                radius: 32
                visible: false
            }
            OpacityMask {
                anchors.fill: fastBlur3
                source: fastBlur3
                maskSource: recFrost3
                opacity: 0.55
            }
            Rectangle {
                id: recControls3
                width: 364
                height: 89
                color: "#00000000"
                anchors.topMargin: 8
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top

                Label {
                    text: qsTr("Third page")
                    anchors.centerIn: parent
                }
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: 1
        TabButton {
            text: qsTr("First")
        }
        TabButton {
            text: qsTr("Second")
        }
        TabButton {
            text: qsTr("Third")
        }
    }
}
