import VPlayApps 1.0
import QtQuick 2.6


Page {
    id: settingsPage

    title: "Settings"
    AppFlickable{
        id: scroll
        anchors.fill: parent
        contentHeight: 1334
       MouseArea{
           anchors.fill: parent
           onClicked: scroll.forceActiveFocus()
       }
    Text {
        id: settingsText
        width: 417
        height: 67
        text: qsTr("")
        font.pointSize: 45
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.left: parent.left
        anchors.leftMargin: 25
        font.family: "Arial"
    }

    AppButton {
        id: mainScreenSettings
        width: 450
        height: 115
        text: "Theme Settings"
        antialiasing: true
        textSize: 25
        minimumHeight: 115
        minimumWidth: 450
        anchors.verticalCenterOffset: 150
        anchors.verticalCenter: settingsText.verticalCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: push (Qt.resolvedUrl("MainPageSet.qml"))
        Icon{
           id: homeIcon
           icon: IconType.paintbrush
           color: "#FFFFFF"
           size: 50
           anchors.top: mainScreenSettings.top
           anchors.verticalCenter: mainScreenSettings.verticalCenter
           anchors.left: mainScreenSettings.left
           anchors.leftMargin: 30
        }

 }
    AppButton {
        id: paymentSettings
        width: 450
        height: 115
        text: "Payment"
        antialiasing: true
        textSize: 25
        minimumWidth: 450
        minimumHeight: 115
        anchors.verticalCenterOffset: 150
        anchors.verticalCenter: mainScreenSettings.verticalCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: push (Qt.resolvedUrl("PaymentPage.qml"))
        Icon{
           id: paymentIcon
           icon: IconType.creditcard
           color: "#FFFFFF"
           size: 50
           anchors.top: paymentSettings.top
           anchors.verticalCenter: paymentSettings.verticalCenter
           anchors.left: paymentSettings.left
           anchors.leftMargin: 30
        }
    }

    AppButton {
        property int flag: 0
        id: nightMode
        width: 450
        height: 115
        text: "Night Mode"
        antialiasing: true
        textSize: 25
        minimumHeight: 115
        minimumWidth: 450
        anchors.verticalCenterOffset: 150
        anchors.verticalCenter: paymentSettings.verticalCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        Icon{
           id: nightIcon
           icon: IconType.moono
           color: "#FFFFFF"
           size: 50
           anchors.top: parent.top
           anchors.verticalCenter: parent.verticalCenter
           anchors.left: parent.left
           anchors.leftMargin: 30
        }

        onClicked: { if(flag == 0) {
                    Theme.colors.backgroundColor = "#212121"
                    Theme.colors.tintColor = "#000000"
                    Theme.colors.dividerColor = "#000000"
                    Theme.colors.textColor = "#FFFFFF"
                    Theme.appButton.backgroundColorPressed = "#424242"
                    Theme.navigationAppDrawer.backgroundColor = "#000000"
                    Theme.navigationAppDrawer.itemActiveBackgroundColor = "#616161"
                    Theme.navigationAppDrawer.itemBackgroundColor = "#000000"
                    Theme.colors.statusBarStyleBlack
                    nightMode.textColor = "#ffff00"
                    nightIcon.color = "#ffff00"
                    nightMode.textColorPressed = "#ffff00"
                    logout.backgroundColor = "#000000"
                    logout.backgroundColorPressed = "#424242"
                    logoutIcon.color = "#b71c1c"
                    logout.textColor = "#b71c1c"
                    logout.textColorPressed = "#b71c1c"
                    flag = 1
                    mainScreenSettings.enabled = false
                    mainScreenSettings.disabledColor = "#000000"
                    homeIcon.color = "#A9A9A9"
                    }
                    else{
                    Theme.colors.backgroundColor = "#FFFFFF"
                    nightMode.textColor = "#FFFFFF"
                    nightMode.textColorPressed = "#FFFFFF"
                    nightIcon.color = "#FFFFFF"
                    Theme.colors.dividerColor = "#E0E0E0"
                    Theme.colors.tintColor = "#3F51B5"
                    Theme.colors.textColor = "#000000"
                    Theme.appButton.backgroundColorPressed = "#5C6BC0"

                    Theme.navigationAppDrawer.backgroundColor = "#FFFFFF"
                    Theme.navigationAppDrawer.itemActiveBackgroundColor = "#FFFFFF"
                    Theme.navigationAppDrawer.itemBackgroundColor = "#FFFFFF"
                    Theme.colors.statusBarStyleWhite

                    logout.backgroundColor = "#b71c1c"
                    logout.backgroundColorPressed = "#d50000"
                    logoutIcon.color = "#FFFFFF"
                    logout.textColor = "#FFFFFF"
                    logout.textColorPressed = "#FFFFFF"
                    flag = 0
                    mainScreenSettings.enabled = true
                    homeIcon.color = "#FFFFFF"
                   }}

    }

    AppButton {
        id: aboutusFaq
        width: 450
        height: 115
        text: "About Us/ FAQ"
        antialiasing: true
        textSize: 25
        minimumWidth: 450
        minimumHeight: 115
        anchors.verticalCenterOffset: 150
        anchors.verticalCenter: nightMode.verticalCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: push (Qt.resolvedUrl("AboutFAQ.qml"))
    }

    AppButton {
        id: logout
        width: 450
        height: 115
        text: "Log Out"
        antialiasing: true
        backgroundColorPressed: "#d50000"
        textSize: 25
        minimumWidth: 450
        minimumHeight: 115
        anchors.verticalCenterOffset: 350
        anchors.verticalCenter: aboutusFaq.verticalCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        backgroundColor: "#b71c1c"
        Icon{
           id: logoutIcon
           icon: IconType.signout
           color: "#FFFFFF"
           size: 50
           anchors.top: logout.top
           anchors.verticalCenter: logout.verticalCenter
           anchors.left: logout.left
           anchors.leftMargin: 30
        }
    }

}}


/*##^## Designer {
    D{i:0;autoSize:true;height:1334;width:750}
}
 ##^##*/
