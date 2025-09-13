import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: qsTr("Mon Livre")

    // Vue principale avec les 3 pages
    StackView {
        id: stack
        anchors.fill: parent
        initialItem: coursPage
    }

    RowLayout{
        spacing: 50
        height: 30
        width: parent.width
        // Bouton pour ouvrir le menu (en haut à gauche)
        ToolButton {
            text: "Menu"
            width: 100
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 35
            onClicked: drawer.open()
        }
        Label{
            text: "Bienvenu dans MyBook"
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    // Barre latérale (Drawer)
    Drawer {
        id: drawer
        width: parent.width * 0.6
        height: parent.height
        edge: Qt.LeftEdge
        /*background: Rectangle {
                    color: "cyan"
                }*/

        Column {
            anchors.fill: parent
            spacing: 15
            padding: 20

            ToolButton {
                text: "X Fermer"
                onClicked: drawer.close()
            }

            Button {
                text: "Cours"
                width: parent.width * 0.6
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    stack.replace(coursPage)
                    drawer.close()
                }
            }
            Button {
                text: "Exercices"
                width: parent.width * 0.6
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    stack.replace(exercicesPage)
                    drawer.close()
                }
            }
            Button {
                text: "Correction"
                width: parent.width * 0.6
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    stack.replace(correctionPage)
                    drawer.close()
                }
            }
            Button {
                text: "Quitter"
                width: parent.width * 0.6
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: Qt.quit()
            }

        }
        Item { Layout.fillHeight: true }

            Label {
                text: "version 1.0.0"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
            }

    }

    // Pages définies comme composants réutilisables
    Component {
        id: coursPage
        Page {
            title: "Cours"
            Label {
                anchors.centerIn: parent
                text: "Bienvenue dans le cours !"
            }

        }
    }

    Component {
        id: exercicesPage
        Page {
            title: "Exercices"
            Column {
                anchors.centerIn: parent
                spacing: 10
                Label { text: "Exercice 1 : 2x + 3 = 7" }
                Button {
                    text: "Voir Correction"
                    onClicked: stack.replace(correctionPage)
                }
            }
        }
    }

    Component {
        id: correctionPage
        Page {
            title: "Correction"
            Column {
                anchors.centerIn: parent
                spacing: 10
                Label { text: "Correction : x = 2" }
                Button {
                    text: "Retour aux exercices"
                    onClicked: stack.replace(exercicesPage)
                }
            }
        }
    }
}
