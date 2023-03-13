import QtQuick
import QtQuick.Layouts
import QtMultimedia
Item {
    RowLayout {
        Layout.alignment: Qt.AlignCenter
        id: controlButtons
        Layout.fillWidth: true
        anchors.fill: parent
        //play button
        Rectangle {
            id: playButton

            Layout.alignment: Qt.AlignCenter

            Rectangle {

                anchors.centerIn: parent
                width: 40
                height: 40
                radius: 50
                color: "white"
                border.color: "black"

                Text {
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "\u25B6"
                    font.pixelSize: 20
                }

    //            visible: video.hasVideo ? true : false

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        video.play()
                       // console.log("playing state is", MediaPlayer.PausedState)
                        //playbackControls()
                    }

    //                function playbackControls() {
    //                    //if video was in playing state
    //                    if(video.playbackState === MediaPlayer.PlayingState)
    //                        video.pause()
    //                    else if(video.playbackState === MediaPlayer.PausedState)
    //                        //if video was in pause state
    //                        video.play()
    //                }
                }



    //            states: [
    //                    State {
    //                        name: "playing"
    //                        when: mediaPlayerState == MediaPlayer.PlayingState
    //                        PropertyChanges { target: pauseButton; visible: true}
    //                        PropertyChanges { target: playButton; visible: false}
    //                        PropertyChanges { target: stopButton; visible: true}
    //                    },
    //                    State {
    //                        name: "stopped"
    //                        when: mediaPlayerState == MediaPlayer.StoppedState
    //                        PropertyChanges { target: pauseButton; visible: false}
    //                        PropertyChanges { target: playButton; visible: true}
    //                        PropertyChanges { target: stopButton; visible: false}
    //                    },
    //                    State {
    //                        name: "paused"
    //                        when: mediaPlayerState == MediaPlayer.PausedState
    //                        PropertyChanges { target: pauseButton; visible: false}
    //                        PropertyChanges { target: playButton; visible: true}
    //                        PropertyChanges { target: stopButton; visible: true}
    //                    }
    //                ]

            }
        }

        //pause button

        Rectangle {
        id: pauseButton

//        anchors.bottom: parent.bottom
//        anchors.left: parent.left
//        anchors.right: parent.right
        Layout.alignment: Qt.AlignCenter
        Rectangle {

            anchors.centerIn: parent
            width: 40
            height: 40
            radius: 50
            color: "white"



            Text {
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text:"\u2016"
                font.pixelSize: 20
            }

//            visible: video.hasVideo ? true : false

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    video.pause()
                   // console.log("playing state is", MediaPlayer.PausedState)
                    //playbackControls()
                }

//                function playbackControls() {
//                    //if video was in playing state
//                    if(video.playbackState === MediaPlayer.PlayingState)
//                        video.pause()
//                    else if(video.playbackState === MediaPlayer.PausedState)
//                        //if video was in pause state
//                        video.play()
//                }
            }



//            states: [
//                    State {
//                        name: "playing"
//                        when: mediaPlayerState == MediaPlayer.PlayingState
//                        PropertyChanges { target: pauseButton; visible: true}
//                        PropertyChanges { target: playButton; visible: false}
//                        PropertyChanges { target: stopButton; visible: true}
//                    },
//                    State {
//                        name: "stopped"
//                        when: mediaPlayerState == MediaPlayer.StoppedState
//                        PropertyChanges { target: pauseButton; visible: false}
//                        PropertyChanges { target: playButton; visible: true}
//                        PropertyChanges { target: stopButton; visible: false}
//                    },
//                    State {
//                        name: "paused"
//                        when: mediaPlayerState == MediaPlayer.PausedState
//                        PropertyChanges { target: pauseButton; visible: false}
//                        PropertyChanges { target: playButton; visible: true}
//                        PropertyChanges { target: stopButton; visible: true}
//                    }
//                ]

        }
    }


 }

    states: [
        State {
            name: "playing"
            when: videoAlias.playbackState == MediaPlayer.PlayingState
            PropertyChanges { target: pauseButton; visible: true}
            PropertyChanges { target: playButton; visible: false}
            //PropertyChanges { target: stopButton; visible: true}
        },
        State {
            name: "stopped"
            when: videoAlias.playbackState == MediaPlayer.StoppedState
            PropertyChanges { target: pauseButton; visible: false}
            PropertyChanges { target: playButton; visible: true}
            PropertyChanges { target: slider; value: 0}
        },
        State {
            name: "paused"
            when:  videoAlias.playbackState == MediaPlayer.PausedState
            PropertyChanges { target: pauseButton; visible: false}
            PropertyChanges { target: playButton; visible: true}
            //PropertyChanges { target: stopButton; visible: true}
        }
    ]
}
