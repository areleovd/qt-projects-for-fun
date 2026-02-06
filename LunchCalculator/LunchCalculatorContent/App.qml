import QtQuick
import LunchCalculator

Window {
    width: mainScreen.width
    height: mainScreen.height

    visible: true
    title: "LunchCalculator"

    Screen01 {
        id: mainScreen

        anchors.centerIn: parent
    }

}

