import VPlayApps 1.0
import QtQuick 2.5
import QtQuick.Controls 2.0 as Quick2
import Qt.labs.settings 1.0 as QtLabs
import QtQuick.Controls.Material 2.0

Page {

    title: "Theme Settings"
    id: mainPageSet2

AppFlickable{
    id: scroll
    anchors.fill: parent
    contentHeight: 1334
    MouseArea{
        anchors.fill: parent
        onClicked: scroll.forceActiveFocus()
   }
   Text {
       id: mainPageSetText
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
       text: "Main Theme"
       antialiasing: true
       textSize: 25
       minimumHeight: 115
       minimumWidth: 450
       anchors.verticalCenterOffset: 150
       anchors.verticalCenter: mainPageSetText.verticalCenter
       anchors.horizontalCenterOffset: 0
       anchors.horizontalCenter: parent.horizontalCenter
       onClicked: Theme.colors.tintColor = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
   }

   AppButton {
       id: appButton2
       width: 450
       height: 115
       text: "Background Color"
       antialiasing: true
       textSize: 25
       minimumHeight: 115
       minimumWidth: 450
       anchors.verticalCenterOffset: 150
       anchors.verticalCenter: appButton.verticalCenter
       anchors.horizontalCenterOffset: 0
       anchors.horizontalCenter: parent.horizontalCenter
       onClicked: Theme.colors.backgroundColor = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
   }
}
}


/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
