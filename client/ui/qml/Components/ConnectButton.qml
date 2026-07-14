import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

import ConnectionState 1.0
import PageEnum 1.0
import Style 1.0

Button {
    id: root

    property string defaultButtonColor: "#eb3e3e"
    property string progressButtonColor: AmneziaStyle.color.paleGray
    property string connectedButtonColor: "#01ba53"
    property bool buttonActiveFocus: activeFocus && (Qt.platform.os !== "android" || SettingsController.isOnTv())

    property bool isFocusable: true
    
    Keys.onTabPressed: {
        FocusController.nextKeyTabItem()
    }

    Keys.onBacktabPressed: {
        FocusController.previousKeyTabItem()
    }

    Keys.onUpPressed: {
        FocusController.nextKeyUpItem()
    }
    
    Keys.onDownPressed: {
        FocusController.nextKeyDownItem()
    }
    
    Keys.onLeftPressed: {
        FocusController.nextKeyLeftItem()
    }

    Keys.onRightPressed: {
        FocusController.nextKeyRightItem()
    }
        
    implicitWidth: 285
    implicitHeight: 285

    Connections {
        target: ConnectionController

        function onPreparingConfig() {
            PageController.showNotificationMessage(qsTr("Unable to disconnect during configuration preparation"))
        }
    }

    background: Item {
        implicitWidth: parent.width
        implicitHeight: parent.height
        transformOrigin: Item.Center

        // Pulsing ring behind the button
        Item {
            id: pulseRing
            width: 280
            height: 280
            anchors.centerIn: parent
            opacity: 0.5

            Rectangle {
                id: maskRect
                anchors.fill: parent
                radius: width / 2
                visible: false
            }

            RadialGradient {
                id: gradientRect
                anchors.fill: parent
                horizontalRadius: parent.width / 2
                verticalRadius: parent.height / 2
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "transparent" }
                    GradientStop { position: 1.0; color: ConnectionController.isConnected ? root.connectedButtonColor : root.defaultButtonColor }
                }
                visible: false
            }

            OpacityMask {
                anchors.fill: parent
                source: gradientRect
                maskSource: maskRect
            }
            
            SequentialAnimation on scale {
                loops: Animation.Infinite
                running: !ConnectionController.isConnectionInProgress
                paused: Qt.platform.os === "android" ? (Qt.application.state !== Qt.ApplicationActive) : false
                NumberAnimation { from: 1.0; to: 1.5; duration: 2500; easing.type: Easing.OutSine }
            }
            SequentialAnimation on opacity {
                loops: Animation.Infinite
                running: !ConnectionController.isConnectionInProgress
                paused: Qt.platform.os === "android" ? (Qt.application.state !== Qt.ApplicationActive) : false
                NumberAnimation { from: 0.6; to: 0.0; duration: 2500; easing.type: Easing.OutSine }
            }
            visible: !ConnectionController.isConnectionInProgress
        }

        Shape {
            id: backgroundCircle
            width: parent.implicitWidth
            height: parent.implicitHeight
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            layer.enabled: true
            layer.samples: 4
            layer.smooth: true

            ShapePath {
                fillColor: {
                    if (ConnectionController.isConnectionInProgress) {
                        return AmneziaStyle.color.goldenApricotString // dark #1c1c1c
                    } else if (ConnectionController.isConnected) {
                        return root.connectedButtonColor
                    } else {
                        return root.defaultButtonColor
                    }
                }
                strokeColor: "transparent"
                strokeWidth: 0
                capStyle: ShapePath.RoundCap

                PathAngleArc {
                    centerX: backgroundCircle.width / 2
                    centerY: backgroundCircle.height / 2
                    radiusX: 140
                    radiusY: 140
                    startAngle: 0
                    sweepAngle: 360
                }
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                enabled: false
            }
        }

        Shape {
            id: shape
            width: parent.implicitWidth
            height: parent.implicitHeight
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            layer.enabled: true
            layer.samples: 4

            visible: ConnectionController.isConnectionInProgress

            ShapePath {
                fillColor: AmneziaStyle.color.transparent
                strokeColor: AmneziaStyle.color.paleGray
                strokeWidth: 3
                capStyle: ShapePath.RoundCap

                PathAngleArc {
                    centerX: shape.width / 2
                    centerY: shape.height / 2
                    radiusX: 140
                    radiusY: 140
                    startAngle: 245
                    sweepAngle: -180
                }
            }

            RotationAnimator {
                target: shape
                running: ConnectionController.isConnectionInProgress
                paused: Qt.platform.os === "android" ? (Qt.application.state !== Qt.ApplicationActive) : false
                from: 0
                to: 360
                loops: Animation.Infinite
                duration: 1000
            }
        }
    }

    contentItem: Item {
        width: parent.width
        height: parent.height
        
        Image {
            id: powerIcon
            source: "qrc:/images/controls/power.svg"
            sourceSize: Qt.size(80, 80)
            anchors.centerIn: parent
            visible: false
        }
        
        ColorOverlay {
            anchors.fill: powerIcon
            source: powerIcon
            color: "#111111"
        }
    }

    onClicked: {
        ConnectionController.connectButtonClicked()
    }

    Keys.onEnterPressed: this.clicked()
    Keys.onReturnPressed: this.clicked()
}
