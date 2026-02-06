import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import NetworkingModule

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "TCP Chat Client"
    color: "#E5DDD5"

    // --- Helper Function for Time ---
    function getCurrentTime() {
        return new Date().toLocaleTimeString(Qt.locale(), "hh:mm ap")
    }

    TcpClient {
        id: backend
        onMessageReceived: (msg) => {
            chatModel.append({
                "content": msg,
                "isMine": false,
                "timestamp": getCurrentTime() // Add time here
            })
            chatList.positionViewAtEnd()
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        // --- Header ---
        RowLayout {
            Layout.fillWidth: true
            Button {
                text: "Connect"
                enabled: backend.status !== "Connected!"
                onClicked: backend.connectToServer("127.0.0.1", 1234)
            }
            Label {
                text: backend.status
                color: backend.status === "Connected!" ? "green" : "red"
                font.bold: true
                Layout.alignment: Qt.AlignVCenter
            }
            Item { Layout.fillWidth: true }
        }

        // --- Chat List ---
        ListView {
            id: chatList
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 15 // Increased spacing so bubbles don't touch
            model: chatModel

            delegate: Item {
                width: ListView.view.width
                // Height must now accommodate text + timestamp + padding
                height: messageBubble.height

                Rectangle {
                    id: messageBubble
                    // Width logic: Text width OR Timestamp width (whichever is bigger), capped at 70%
                    width: Math.min(Math.max(messageText.implicitWidth, timeText.implicitWidth) + 30, parent.width * 0.7)
                    height: messageText.implicitHeight + timeText.implicitHeight + 20
                    radius: 10

                    anchors.right: isMine ? parent.right : undefined
                    anchors.left: isMine ? undefined : parent.left
                    color: isMine ? "#DCF8C6" : "#FFFFFF"

                    // Message Text
                    Text {
                        id: messageText
                        anchors.top: parent.top
                        anchors.topMargin: 8
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 10

                        text: content
                        wrapMode: Text.Wrap
                        color: "black"
                    }

                    // Timestamp Text
                    Text {
                        id: timeText
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.margins: 6

                        text: timestamp // Comes from the model
                        font.pixelSize: 10
                        color: "gray"
                    }
                }
            }
        }

        // --- Input Area ---
        RowLayout {
            Layout.fillWidth: true

            TextField {
                id: messageInput
                Layout.fillWidth: true
                placeholderText: "Type a message..."
                onAccepted: sendButton.clicked()
            }

            Button {
                id: sendButton
                text: "Send"
                enabled: backend.status === "Connected!" && messageInput.text.length > 0

                onClicked: {
                    backend.sendMessage(messageInput.text)

                    chatModel.append({
                        "content": messageInput.text,
                        "isMine": true,
                        "timestamp": getCurrentTime() // Add time here
                    })

                    messageInput.clear()
                    chatList.positionViewAtEnd()
                }
            }
        }
    }

    ListModel {
        id: chatModel
        // Initial "System" message now has a time too!
        ListElement {
            content: "System: Ready to connect..."
            isMine: false
            timestamp: "Now"
        }
    }
}
