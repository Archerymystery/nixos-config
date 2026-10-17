import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Effects

Item {
    id: root
    width: 1920
    height: 1080

    readonly property string fontFamily: config.fontFamily
    readonly property color cAccent: config.accent
    readonly property color cText: config.textColor
    readonly property color cMuted: config.mutedColor
    readonly property color cField: config.fieldColor
    readonly property color cBorder: config.fieldBorderColor
    readonly property color cPanel: config.panelColor
    readonly property color cError: config.errorColor
    readonly property color cBtnText: config.buttonTextColor
    readonly property real panelRatio: parseFloat(config.panelRatio)
    readonly property real panelOpacity: parseFloat(config.panelOpacity)
    readonly property real blurAmount: parseFloat(config.blurAmount)
    readonly property int blurMax: parseInt(config.blurMax)
    readonly property int formW: parseInt(config.formWidth)
    readonly property int rad: parseInt(config.cornerRadius)
    property var now: new Date()

    function doLogin() {
        sddm.login(userBox.currentValue, passField.text, sessionBox.currentIndex)
    }

    component PillField: TextField {
        width: root.formW
        height: 46
        color: root.cText
        placeholderTextColor: root.cMuted
        font.family: root.fontFamily
        font.pixelSize: 15
        horizontalAlignment: TextInput.AlignHCenter
        selectByMouse: true
        background: Rectangle {
            radius: Math.min(root.rad, height / 2)
            color: root.cField
            opacity: 0.85
            border.width: 2
            border.color: parent.activeFocus ? root.cAccent : root.cBorder
        }
    }

    component PowerBtn: Rectangle {
        id: pb
        property alias label: lbl.text
        signal clicked()
        width: 100
        height: 34
        radius: Math.min(root.rad, height / 2)
        color: ma.containsMouse ? root.cAccent : "transparent"
        border.width: 1
        border.color: ma.containsMouse ? root.cAccent : root.cBorder
        Text {
            id: lbl
            anchors.centerIn: parent
            color: ma.containsMouse ? root.cBtnText : root.cMuted
            font.family: root.fontFamily
            font.pixelSize: 13
        }
        MouseArea {
            id: ma
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: pb.clicked()
        }
    }

    component UserBox: ComboBox {
        id: ub
        width: root.formW
        height: 46
        model: userModel
        textRole: "name"
        valueRole: "name"
        currentIndex: userModel.lastIndex
        font.family: root.fontFamily
        font.pixelSize: 15

        indicator: Text {
            visible: ub.count > 1
            text: "▾"
            color: root.cMuted
            font.pixelSize: 14
            x: ub.width - width - 20
            y: (ub.height - height) / 2
        }
        background: Rectangle {
            radius: Math.min(root.rad, height / 2)
            color: root.cField
            opacity: 0.85
            border.width: 2
            border.color: (ub.popup.visible || ub.hovered) ? root.cAccent : root.cBorder
        }
        contentItem: Text {
            text: ub.displayText
            color: root.cText
            font: ub.font
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        delegate: ItemDelegate {
            width: ub.width
            highlighted: ub.highlightedIndex === index
            contentItem: Text {
                text: model.name
                color: parent.highlighted ? root.cBtnText : root.cText
                font: ub.font
                horizontalAlignment: Text.AlignHCenter
            }
            background: Rectangle {
                color: parent.highlighted ? root.cAccent : root.cPanel
            }
        }
        popup: Popup {
            y: ub.height + 4
            width: ub.width
            padding: 1
            contentItem: ListView {
                clip: true
                implicitHeight: Math.min(contentHeight, 200)
                model: ub.popup.visible ? ub.delegateModel : null
                currentIndex: ub.highlightedIndex
            }
            background: Rectangle {
                color: root.cPanel
                border.color: root.cBorder
                radius: root.rad
            }
        }
    }

    Image {
        id: wallpaper
        anchors.fill: parent
        source: Qt.resolvedUrl(config.background)
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
    }

    Item {
        id: leftPanel
        width: root.width * root.panelRatio
        height: root.height
        clip: true

        Image {
            id: blurSource
            width: root.width
            height: root.height
            source: wallpaper.source
            fillMode: Image.PreserveAspectCrop
            visible: false
        }
        MultiEffect {
            width: root.width
            height: root.height
            source: blurSource
            blurEnabled: true
            blur: root.blurAmount
            blurMax: root.blurMax
        }
        Rectangle {
            anchors.fill: parent
            color: root.cPanel
            opacity: root.panelOpacity
        }

        Column {
            id: form
            anchors.centerIn: parent
            spacing: 14
            width: root.formW

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: config.welcomeText
                color: root.cText
                font.family: root.fontFamily
                font.pixelSize: 38
            }
            Text {
                id: clock
                anchors.horizontalCenter: parent.horizontalCenter
                text: Qt.formatTime(root.now, config.timeFormat)
                color: root.cAccent
                font.family: root.fontFamily
                font.pixelSize: 72
                font.bold: true
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: Qt.formatDate(root.now, config.dateFormat)
                color: root.cMuted
                font.family: root.fontFamily
                font.pixelSize: 15
            }

            Item { width: 1; height: 28 }

            UserBox {
                id: userBox
                onActivated: passField.forceActiveFocus()
            }
            PillField {
                id: passField
                placeholderText: "Password"
                echoMode: showPass.checked ? TextInput.Normal : TextInput.Password
                onAccepted: root.doLogin()
            }

            Row {
                spacing: 8
                Rectangle {
                    id: showPass
                    property bool checked: false
                    width: 18
                    height: 18
                    radius: Math.min(root.rad, 4)
                    color: checked ? root.cAccent : "transparent"
                    border.width: 1
                    border.color: checked ? root.cAccent : root.cBorder

                    Text {
                        anchors.centerIn: parent
                        visible: showPass.checked
                        text: "✓"
                        color: root.cBtnText
                        font.family: root.fontFamily
                        font.pixelSize: 13
                        font.bold: true
                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: showPass.checked = !showPass.checked
                    }
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Show password"
                    color: root.cMuted
                    font.family: root.fontFamily
                    font.pixelSize: 12
                }
            }

            Text {
                id: errorMsg
                anchors.horizontalCenter: parent.horizontalCenter
                color: root.cError
                font.family: root.fontFamily
                font.pixelSize: 13
                height: 18
            }

            Button {
                width: root.formW
                height: 46
                onClicked: root.doLogin()
                contentItem: Text {
                    text: "Login"
                    color: root.cBtnText
                    font.family: root.fontFamily
                    font.pixelSize: 16
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                    radius: Math.min(root.rad, height / 2)
                    color: parent.down ? Qt.darker(root.cAccent, 1.2)
                         : parent.hovered ? Qt.lighter(root.cAccent, 1.1)
                         : root.cAccent
                }
            }

            ComboBox {
                id: sessionBox
                width: root.formW
                height: 34
                model: sessionModel
                textRole: "name"
                currentIndex: sessionModel.lastIndex
                font.family: root.fontFamily
                font.pixelSize: 12
                indicator: Item {}
                background: Rectangle {
                    radius: Math.min(root.rad, height / 2)
                    color: "transparent"
                    border.width: 1
                    border.color: root.cBorder
                }
                contentItem: Text {
                    text: "Session: " + sessionBox.displayText
                    color: root.cMuted
                    font: sessionBox.font
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
                delegate: ItemDelegate {
                    width: sessionBox.width
                    highlighted: sessionBox.highlightedIndex === index
                    contentItem: Text {
                        text: model.name
                        color: parent.highlighted ? root.cBtnText : root.cText
                        font: sessionBox.font
                        horizontalAlignment: Text.AlignHCenter
                    }
                    background: Rectangle {
                        color: parent.highlighted ? root.cAccent : root.cPanel
                    }
                }
                popup: Popup {
                    y: -height - 4
                    width: sessionBox.width
                    padding: 1
                    contentItem: ListView {
                        clip: true
                        implicitHeight: contentHeight
                        model: sessionBox.popup.visible ? sessionBox.delegateModel : null
                        currentIndex: sessionBox.highlightedIndex
                    }
                    background: Rectangle {
                        color: root.cPanel
                        border.color: root.cBorder
                        radius: root.rad
                    }
                }
            }

            Item { width: 1; height: 16 }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                PowerBtn { label: "Sleep"; visible: sddm.canSuspend; onClicked: sddm.suspend() }
                PowerBtn { label: "Reboot"; visible: sddm.canReboot; onClicked: sddm.reboot() }
                PowerBtn { label: "Shutdown"; visible: sddm.canPowerOff; onClicked: sddm.powerOff() }
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.now = new Date()
    }

    Connections {
        target: sddm
        function onLoginFailed() {
            passField.text = ""
            errorMsg.text = "Wrong password"
            passField.forceActiveFocus()
        }
    }

    Component.onCompleted: passField.forceActiveFocus()
}
