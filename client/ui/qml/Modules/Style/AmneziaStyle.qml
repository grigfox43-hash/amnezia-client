pragma Singleton

import QtQuick

QtObject {
    property QtObject color: QtObject {
        readonly property color transparent: 'transparent'
        readonly property color paleGray: '#D7D8DB'
        readonly property color lightGray: '#C1C2C5'
        readonly property color mutedGray: '#878B91'
        readonly property color charcoalGray: '#111111'
        readonly property color slateGray: '#111111'
        readonly property color onyxBlack: '#111111'
        readonly property color midnightBlack: '#111111'
        readonly property color goldenApricot: goldenApricotString
        readonly property color benefitsPanelBackground: '#111111'
        readonly property color burntOrange: '#01ba53'
        readonly property color mutedBrown: '#01ba53'
        readonly property color richBrown: '#01ba53'
        readonly property color deepBrown: '#01ba53'
        readonly property color vibrantRed: '#eb3e3e'
        readonly property color vibrantGreen: '#3FBF6B'
        readonly property color deepMagenta: '#950051'
        readonly property color darkCharcoal: '#111111'
        readonly property color pearlGray: '#EAEAEC'

        readonly property color sheerWhite: Qt.rgba(1, 1, 1, 0.12)
        readonly property color translucentWhite: Qt.rgba(1, 1, 1, 0.08)
        readonly property color barelyTranslucentWhite: Qt.rgba(1, 1, 1, 0.05)
        readonly property color translucentMidnightBlack: Qt.rgba(14/255, 14/255, 17/255, 0.8)
        readonly property color softGoldenApricot: Qt.rgba(1/255, 186/255, 83/255, 0.3)
        readonly property color mistyGray: Qt.rgba(215/255, 216/255, 219/255, 0.8)
        readonly property color cloudyGray: Qt.rgba(215/255, 216/255, 219/255, 0.65)
        readonly property color translucentRichBrown: Qt.rgba(1/255, 186/255, 83/255, 0.26)
        readonly property color translucentSlateGray: Qt.rgba(85/255, 86/255, 92/255, 0.13)
        readonly property color translucentOnyxBlack: Qt.rgba(28/255, 29/255, 33/255, 0.13)

        readonly property string goldenApricotString: '#01ba53'

        readonly property color backgroundBase: '#101012'
        readonly property color surfaceBase: '#18181B'
        readonly property color surfaceHovered: '#232327'
        readonly property color surfacePressed: '#2C2D30'
        readonly property color surfaceInverse: '#E4E4E7'
        readonly property color surfaceInverseHovered: '#D4D4D8'
        readonly property color surfaceInversePressed: '#A1A1AA'
        readonly property color textPrimary: '#FAFAFA'
        readonly property color textTertiary: '#A1A1AA'
        readonly property color textInverted: '#09090B'
        readonly property color textStaticWhite: '#FFFFFF'
        readonly property color borderSoft: '#3F3F46'
        readonly property color accentSuccess: '#4ADE80'
        readonly property color accentWarning: '#EAB308'
    }
}
