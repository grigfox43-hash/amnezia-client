import QtQuick
import QtQuick.Controls

import Style 1.0

TabButton {
    id: root

    property string hoveredColor: AmneziaStyle.color.primaryGreen
    property string defaultColor: AmneziaStyle.color.paleGray
    property string selectedColor: AmneziaStyle.color.primaryGreen

    property string image

    property bool isSelected: false

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
    
    property string borderFocusedColor: AmneziaStyle.color.paleGray
    property int borderFocusedWidth: 1

    property var clickedFunc

    hoverEnabled: true

    icon.source: image
    icon.color: isSelected ? selectedColor : defaultColor
    icon.width: 48
    icon.height: 48

    background: Rectangle {
        id: background
        anchors.fill: parent
        color: AmneziaStyle.color.transparent
        radius: 10

        border.width: 0

    }

    MouseArea {
        anchors.fill: background
        cursorShape: Qt.PointingHandCursor
        enabled: false
    }
    
    Keys.onEnterPressed: {
        if (root.clickedFunc && typeof root.clickedFunc === "function") {
            root.clickedFunc()
        }
    }

    Keys.onReturnPressed: {
        if (root.clickedFunc && typeof root.clickedFunc === "function") {
            root.clickedFunc()
        }
    }

    onClicked: {
        if (root.clickedFunc && typeof root.clickedFunc === "function") {
            root.clickedFunc()
        }
    }
}
