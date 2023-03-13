import QtQuick
import QtMultimedia
import QtQuick.Dialogs
//import QtQuick.Layouts

Window {

    property alias videoAlias: video

    width: 640
    height: 480
    visible: true
    title: qsTr("Video Player")

    MenuBar{
        z: 99
        Rectangle {
            width: 80
            color: "white"
            height: parent.height
            border.color: "black"

            Text {
                anchors.fill: parent
                text: "Select Video"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                MouseArea {
                    anchors.fill: parent
                    onClicked: fileDialog.open()
                }
            }

            FileDialog {
                id: fileDialog
                onAccepted: {
                    video.play()
                    //console.log("playing state is", MediaPlayer.PausedState)
                }
            }
        }
    }

    //Video Player Space
    Rectangle {
//       width: 640
//       height: 480
       color: video.hasVideo ? "black" : "white"
       anchors.fill: parent
       Video {
            id: video
            anchors.fill: parent
            fillMode: VideoOutput.PreserveAspectFit
            source: fileDialog.selectedFile
        }
    }

    //playbackControls
    Rectangle {
         height: 80
         anchors.bottom: parent.bottom
         anchors.left: parent.left
         anchors.right: parent.right
         color: "grey"


         MySlider { //progressbar + slider from scratch
            id: slider
            maximum: video.duration
            minimum: 0
            value: video.position
         }

         PlaybackMenu {
             anchors.centerIn: parent
         }

    }
}
