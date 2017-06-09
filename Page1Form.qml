import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Item {
    id: item1
    property alias textField1: textField1
    property alias button1: button1

    Rectangle {
        id: recFrost
        anchors.fill: fastBlur
        color: "white"
        radius: 10
    }
    FastBlur {
        id: fastBlur
        anchors.fill: recControls
        source: ShaderEffectSource {
            sourceItem: imgBackground
            sourceRect: Qt.rect(recControls.x, recControls.y, recControls.width, recControls.height)
        }
        radius: 64
        opacity: 0.55
    }
    Rectangle {
        id: recControls
        x: 171
        y: 51
        width: 364
        height: 89
        color: "#00000000"
        radius: 20
        anchors.horizontalCenterOffset: 0
        anchors.bottomMargin: 340
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        RowLayout {
            x: 45
            y: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20
            anchors.top: parent.top

            TextField {
                id: textField1
                placeholderText: qsTr("Text Field")
            }

            Button {
                id: button1
                text: qsTr("Press Me")
            }
        }
    }

    Image {
        id: imgBackground
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        z: -2
        source: "nature_1.jpg"
    }
}
