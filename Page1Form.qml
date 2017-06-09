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

            /* this sourceRect moves based on the current position of the
               content in the SwipeView so that the blur appears to float over
               the back -- if it doesn't account for the SwipeView then the
               blur is a static sample of the background that was underneath it
               before the view moved

               i.e. right now this set of coordinates ONLY works because this is
               on the first page of the SwipeView

               A SwipeView stacks its children horizontally as you might expect,
               and slides them to the left or right.
               swipeView.contentItem.contentX is how far to the right
               the user has moved from the starting point

               If this were on the third page and the user had swiped
               halfway to it from the second page, contentX would be 960.
               And if I move pages again, I have to go back through each and
               adjust the coordinates of the sourceRect.

               How do I make it more automatic?
               */
            sourceRect: Qt.rect(
                            fastBlur.x - swipeView.contentItem.contentX,
                            fastBlur.y,
                            fastBlur.width,
                            fastBlur.height)
        }
        radius: 64

        visible: false // this needs to be invisible for the mask to work
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
}
