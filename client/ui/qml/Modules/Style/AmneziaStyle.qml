pragma Singleton

import QtQuick

QtObject {
    property QtObject color: QtObject {
        readonly property color transparent: 'transparent'
        readonly property color paleGray: '#D7D8DB'
        readonly property color lightGray: '#C1C2C5'
        readonly property color mutedGray: '#878B91'
        readonly property color charcoalGray: '#333333'
        readonly property color slateGray: '#333333'
        readonly property color onyxBlack: '#333333'
        readonly property color midnightBlack: '#333333'
        readonly property color goldenApricot: goldenApricotString
        readonly property color benefitsPanelBackground: '#333333'
        readonly property color softViolet: '#A87BE2'
        readonly property color burntOrange: '#A85809'
        readonly property color mutedBrown: '#84603D'
        readonly property color richBrown: '#633303'
        readonly property color deepBrown: '#402102'
        readonly property color vibrantRed: '#eb3e3e'
        readonly property color darkCharcoal: '#333333'
        readonly property color pearlGray: '#EAEAEC'

        readonly property color sheerWhite: Qt.rgba(1, 1, 1, 0.12)
        readonly property color translucentWhite: Qt.rgba(1, 1, 1, 0.08)
        readonly property color barelyTranslucentWhite: Qt.rgba(1, 1, 1, 0.05)
        readonly property color translucentMidnightBlack: Qt.rgba(14/255, 14/255, 17/255, 0.8)
        readonly property color softGoldenApricot: Qt.rgba(251/255, 178/255, 106/255, 0.3)
        readonly property color mistyGray: Qt.rgba(215/255, 216/255, 219/255, 0.8)
        readonly property color cloudyGray: Qt.rgba(215/255, 216/255, 219/255, 0.65)
        readonly property color translucentRichBrown: Qt.rgba(99/255, 51/255, 3/255, 0.26)
        readonly property color translucentSlateGray: Qt.rgba(85/255, 86/255, 92/255, 0.13)
        readonly property color translucentOnyxBlack: Qt.rgba(28/255, 29/255, 33/255, 0.13)

        readonly property string goldenApricotString: '#01ba53'
    }
}
