

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import LunchCalculator

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#8cae80"


    ListModel {
        id: payersModel
        ListElement {text: "Tini"}
        ListElement {text: "Mimi"}
        ListElement {text: "Dila"}
        ListElement {text: "Wani"}
        ListElement {text: "Ismah"}
        ListElement {text: "Syahnaz"}
        ListElement {text: "Salma"}
        ListElement {text: "Gin"}

    }

    Item {
        id: placeDateItem
        y: 20
        width: 451
        height: 130
        anchors.left: parent.left
        anchors.leftMargin: 20

        Label {
            id: placeLabel
            color: "#322525"
            text: qsTr("PLACE")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 20
        }

        Label {
            id: dateLabel
            y: 86
            color: "#322525"
            text: qsTr("DATE")
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
        }

        TextArea {
            id: textArea
            x: 134
            y: 78
            width: 235
            height: 32
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 20
            anchors.bottomMargin: 20
            placeholderText: qsTr("When did this transaction take place?")
        }

        TextArea {
            id: textArea1
            x: 134
            width: 235
            height: 32
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 20
            anchors.topMargin: 20
            placeholderText: qsTr("Where did you eat?")
        }
    }

    Item {
        id: payerItem
        y: 148
        width: 330
        height: 124
        anchors.left: parent.left
        anchors.leftMargin: 20

        Label {
            id: payToLabel
            x: 8
            y: 23
            color: "#352828"
            text: qsTr("PAY TO")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 20
        }

        Label {
            id: paymentModeLabel
            color: "#352828"
            text: qsTr("PAYMENT MODE")
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
        }

        ComboBox {
            id: payerComboBox
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 20
            anchors.topMargin: 20
            model: payersModel
            currentIndex: 0
            displayText: payerComboBox.currentText
        }

        ComboBox {
            id: paymentModeComboBox
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 20
            anchors.bottomMargin: 20
            model: ["Bank", "E-wallet", "Cash"]
        }
    }

    Item {
        id: salesServiceTaxItem
        y: 278
        width: 339
        height: 111
        anchors.left: parent.left
        anchors.leftMargin: 20

        TextField {
            id: sstTxtField
            x: 192
            y: 59
            width: 111
            height: 32
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 36
            anchors.bottomMargin: 20
            placeholderText: qsTr("Text Field")
        }

        TextField {
            id: serviceChargeTxtField
            x: 192
            width: 111
            height: 32
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 36
            anchors.topMargin: 20
            placeholderText: qsTr("Text Field")
        }

        Label {
            id: sstLabel
            color: "#3d3030"
            text: qsTr("SST  (%)")
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
        }

        Label {
            id: serviceChargeLabel
            color: "#3d3030"
            text: qsTr("SERVICE CHARGE (%)")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 20
        }
    }

    Item {
        id: headersItem
        y: 395
        width: 489
        height: 37
        anchors.left: parent.left
        anchors.leftMargin: 20

        Label {
            id: itemsLabel
            color: "#000000"
            text: qsTr("Items")
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 20
        }

        Label {
            id: priceLabel
            x: 206
            color: "#000000"
            text: qsTr("Price")
            anchors.verticalCenter: parent.verticalCenter
        }

        Label {
            id: taxableLabel
            x: 357
            color: "#000000"
            text: qsTr("Taxable")
            anchors.verticalCenter: parent.verticalCenter
            anchors.top: parent.top
            anchors.topMargin: 7
        }
    }

    ScrollView {
        id: scrollView
        y: 424
        width: 1191
        height: 609
        anchors.left: parent.left
        anchors.leftMargin: 20

        Column {
            id: column
            width: 200
            height: 400

            Repeater {
                id: repeater
                model: 20

                Item {
                    id: checkableFillableRow
                    width: 1194
                    height: 52

                    TextField {
                        id: itemsTxtField
                        x: 8
                        y: 8
                        width: 163
                        height: 32
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        placeholderText: qsTr("Text Field")
                    }

                    TextField {
                        id: priceTxtField
                        x: 211
                        y: 8
                        width: 125
                        height: 32
                        placeholderText: qsTr("Text Field")
                    }

                    ComboBox {
                        id: taxableComboBox
                        x: 368
                        y: 8
                        model: ["y", "n"]
                    }

                    CheckBox {
                        id: p1CheckBox
                        x: 597
                        y: 8
                        text: qsTr("")
                        anchors.leftMargin: 0
                        anchors.rightMargin: -41
                        anchors.topMargin: 0
                        anchors.bottomMargin: -33
                        checked: false
                        display: AbstractButton.IconOnly
                    }

                    CheckBox {
                        id: p2CheckBox
                        x: 727
                        y: 8
                        text: qsTr("")
                        display: AbstractButton.IconOnly
                        checked: false
                    }

                    CheckBox {
                        id: p3CheckBox
                        x: 859
                        y: 8
                        text: qsTr("")
                        display: AbstractButton.IconOnly
                        checked: false
                    }

                    CheckBox {
                        id: p4CheckBox
                        x: 986
                        y: 8
                        text: qsTr("")
                        display: AbstractButton.IconOnly
                        checked: false
                    }

                    CheckBox {
                        id: p5CheckBox
                        x: 1116
                        y: 8
                        text: qsTr("")
                        anchors.rightMargin: 39
                        anchors.topMargin: 1
                        display: AbstractButton.IconOnly
                        checked: false
                    }
                }
            }
        }
    }

    Row {
        id: participantsRow
        x: 549
        y: 395
        width: 654
        height: 37
        spacing: 10

        Repeater {
            id: participantsRepeater
            model: 5

            ComboBox {
                id: participantsComboBox
                model: payersModel
            }
        }
    }

    Item {
        id: overalTotalItem
        x: 571
        y: 30
        width: 392
        height: 114

        Label {
            id: subTotalLabel
            x: 15
            y: 17
            color: "#322525"
            text: qsTr("SUBTOTAL (RM)")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 20
        }

        Label {
            id: servChargeTotalLabel
            x: 15
            y: 45
            color: "#322525"
            text: qsTr("SERV. CHARGE TOTAL (RM)")
            anchors.left: parent.left
            anchors.leftMargin: 20
        }

        Label {
            id: sstTotalLabel
            x: 15
            color: "#322525"
            text: qsTr("SST TOTAL (RM)")
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
        }

        Text {
            id: priceTotal
            y: 14
            width: 110
            height: 23
            text: qsTr("Text")
            anchors.right: parent.right
            anchors.rightMargin: 20
            font.pixelSize: 17
        }

        Text {
            id: servChargeTotal
            y: 45
            width: 110
            height: 23
            text: qsTr("Text")
            anchors.right: parent.right
            anchors.rightMargin: 20
            font.pixelSize: 17
        }

        Text {
            id: sstTotal
            width: 110
            height: 23
            text: qsTr("Text")
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 20
            anchors.bottomMargin: 20
            font.pixelSize: 17
        }
    }



















    states: [
        State {
            name: "clicked"
        }
    ]
}
