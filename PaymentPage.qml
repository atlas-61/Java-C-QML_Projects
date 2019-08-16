import VPlayApps 1.0
import QtQuick 2.0

Page {

    title: "Payment Setting"
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
        width: 417
        height: 67
        text: qsTr("")
        fontSize: 40
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.left: parent.left
        anchors.leftMargin: 25
        font.family: "Arial"
    }

    AppText {
        id: appText1
        width: 450
        height: 200
        text: qsTr("If you already added your card information to school database, your card information stored in school database. If you don't go to VUT web page -> Intraportal and add your card information.")
        fontSize: 20
        lineHeight: 1.1
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignLeft
        wrapMode: Text.WordWrap
        anchors.verticalCenterOffset: 150
        anchors.verticalCenter: appText.verticalCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter


        AppCheckBox {
            id: appChBx
            width: 400
            height: 50
            text: "Allow this app can use my card informations."
            antialiasing: true
            anchors.verticalCenterOffset: 400
            anchors.verticalCenter: appText1.verticalCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            checked: true
        }
    }

    AppButton {
        id: appButton
        width: 450
        height: 115
        text: "Save"
        antialiasing: true
        textSize: 25
        minimumWidth: 450
        minimumHeight: 115
        anchors.verticalCenterOffset: 800
        anchors.verticalCenter: appText1.verticalCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        backgroundColorPressed: "#00e676"
        backgroundColor: "#00c853"
    }

}}

/*##^## Designer {
    D{i:0;autoSize:true;height:1334;width:750}
}
 ##^##*/
