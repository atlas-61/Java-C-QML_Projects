import VPlayApps 1.0
import QtQuick 2.0

Page {

    title: "About Us/ FAQ"
    AppFlickable{
        id: scroll
        anchors.fill: parent
        contentHeight: 1334
       MouseArea{
           anchors.fill: parent
           onClicked: scroll.forceActiveFocus()
       }
    AppText {
        id: appText
        width: 371
        height: 158
        text: qsTr("We are the best team! Members are:
- Claudio Lopez
- Mümtaz Sancak
- Pedro Almedia

ITUe 2018 ")
        fontSize: 20
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        anchors.verticalCenterOffset: 150
        anchors.verticalCenter: aboutFAQ.verticalCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }
    AppText {
        id: appText2
        width: 371
        height: 158
        text: qsTr("1. Is it safe?
- Yes. It is officall VUT app. It is basicly works on school database.
2. Does application use my card information?
- Yes but it uses if you add your card information already school database.
3. Can someone change my password?
- No there is no option for that.")
        fontSize: 20
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        anchors.verticalCenterOffset: 350
        anchors.verticalCenter: appText.verticalCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }
    AppText {
        id: aboutFAQ
        width: 417
        height: 67

        text: qsTr("")
        font.pointSize: 40
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.left: parent.left
        anchors.leftMargin: 25
        font.family: "Arial"
    }

    AppButton {
        id: appButton
        width: 450
        height: 115
        text: "Donate!"
        antialiasing: true
        textSize: 25
        minimumWidth: 450
        minimumHeight: 115
        anchors.verticalCenterOffset: 800
        anchors.verticalCenter: appText.verticalCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter

    }

}}

/*##^## Designer {
    D{i:0;autoSize:true;height:1334;width:750}
}
 ##^##*/
