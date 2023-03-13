import QtQuick

Item {
    id: root

// public
    property double maximum: 10
    property double value:    0
    property double minimum:  0

// private
    width: parent.width;  height: 10 // default size

    Rectangle {
        width: root.width
        color: 'white'
        height: 10
        anchors.verticalCenter: parent.verticalCenter
    }

    Rectangle { // pill
        id: pill
        color: "black"
        x: (value - minimum) / (maximum - minimum) * (root.width - pill.width) // pixels from value
        width: parent.height;  height: width
        border.width: 0.05 * root.height
        radius: 0.5 * height
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        drag {
            target:   pill
            axis:     Drag.XAxis
            maximumX: root.width - pill.width
            minimumX: 0
        }

        onPositionChanged:  if(drag.active) setPixels(pill.x + 0.5 * pill.width) // drag pill
    }

    function setPixels(pixels) {
        var value = (maximum - minimum) / (root.width - pill.width) * (pixels - pill.width / 2) + minimum // value from pixels
        videoAlias.seek(Math.min(Math.max(minimum, value), maximum))
    }
}
