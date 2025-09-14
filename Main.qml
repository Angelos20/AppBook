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
            background: grey
            ColorAnimation {
                from: "white"
                to: "black"
                duration: 200
            }
        }
    }

    // Pages définies comme composants réutilisables
    Component {
        id: coursPage
        Page {
            title: "Accueil"

            ScrollView {
                anchors.fill: parent

                Column {
                    spacing: 20
                    width: parent.width

                    // Image de couverture
                    Image {
                        source: "/home/joy/MyBook/build/image/hacktheplanetNFA.png"   // place ton image dans le dossier qml.qrc
                        width: parent.width
                        height: 150
                        fillMode: Image.PreserveAspectCrop
                    }

                    // Profil
                    Row {
                        spacing: 10
                        anchors.horizontalCenter: parent.horizontalCenter

                        Image {
                            source: "qrc:/images/avatar.png"
                            width: 60
                            height: 60
                            fillMode: Image.PreserveAspectFit
                           // radius: 30  // arrondi => cercle
                        }

                        Column {
                            Text { text: "Bienvenue, Angelos !" ; font.pixelSize: 18 }
                            Text { text: "Heureux de vous revoir"; color: "grey" }
                        }
                    }

                    Rectangle { height: 1; width: parent.width; color: "lightgrey" }

                    // Simuler un "post" style Facebook
                    Column {
                        spacing: 10
                        width: parent.width * 0.9
                        anchors.horizontalCenter: parent.horizontalCenter

                        Text { text: "📚 Nouveau cours disponible !" ; font.pixelSize: 16 ; wrapMode: Text.WordWrap }

                        Image {
                            source: "qrc:/images/course1.png"
                            width: parent.width
                            height: 200
                            fillMode: Image.PreserveAspectFit
                        }

                        Button {
                            text: "Lire le cours"
                            anchors.horizontalCenter: parent.horizontalCenter
                            onClicked: console.log("Cours ouvert")
                        }
                    }

                    Rectangle { height: 1; width: parent.width; color: "lightgrey" }

                    // Deuxième "post"
                    Column {
                        spacing: 10
                        width: parent.width * 0.9
                        anchors.horizontalCenter: parent.horizontalCenter

                        Text { text: "💡 Exercice du jour !" ; font.pixelSize: 16 }

                        Image {
                            source: "qrc:/images/exercice.png"
                            width: parent.width
                            height: 200
                            fillMode: Image.PreserveAspectFit
                        }

                        Button {
                            text: "Faire l’exercice"
                            anchors.horizontalCenter: parent.horizontalCenter
                            onClicked: stack.replace(exercicesPage)
                        }
                    }
                }
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
