import QtQuick 2.12
import QtQuick.Window 2.12
import QtQml 2.12
import GoodsModel 0.1
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ApplicationWindow {
    width: 640 //380
    height: 420
    visible: true
    title: qsTr("Computer shop")

    GoodsModel {
        id: goods
    }

    property var goodsModel;

    ColumnLayout{
        id: collayout
        anchors.top: parent.top
        anchors.fill: parent
        spacing: 2

        RowLayout {
            id: rowlayout
            Layout.fillWidth: true
            spacing: 6

            Button {
                id: btgoods
                Layout.fillWidth: true
                height: 20
                text: "Goods"
                onClicked: {
                    if (goods.loadGoods("https://otestserver_1-1-o9142362.deta.app/goods") === true) {
                        goodsModel = goods.getModel();
                    }
                }
            }
        }

        Rectangle {
            id: mainrect
            color: "gray"
            Layout.fillWidth: true
            Layout.fillHeight: true

            Component {
                id: delegate
                Item {
                    width: 120
                    height: 120
                    Column {
                        anchors.centerIn: parent

                        Text {color: "white"; text: (modelData.in_favorite === true ? "* " : "") + modelData.name; font.pointSize: 12}
                        Image {
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: 64
                            height: 64
                            source: "https://otestserver_1-1-o9142362.deta.app" + modelData.image
                            smooth: true
                        }

                        Text {color: "lightblue"; text: "Price: " + modelData.price; font.pointSize: 10}
                        Text {color: "lightblue"; text: "Discount price: " +  (modelData.discount_price === undefined ? modelData.discont_price : modelData.discount_price); font.pointSize: 10}
                        Text {color: "lightblue"; text: "Quantity: " +  modelData.quantity; font.pointSize: 10}
                    }
                }
            }

            GridView {
                cellHeight: 150
                cellWidth: 150
                focus: true
                anchors.fill: parent

                model: goodsModel === undefined ? goodsModel : goodsModel.goods

                delegate: delegate

                /*header: Rectangle {
                    width: parent.width
                    height: 30
                    gradient: Gradient {
                    GradientStop {position: 0; color: "gray"}
                    GradientStop {position: 0.7; color: "black"}
                    }
                    Text{
                        anchors.centerIn: parent;
                        color: "gray";
                        //text: "Computer shop";
                        font.bold: true;
                        font.pointSize: 20
                    }
                }
                footer: Rectangle {
                    width: parent.width
                    height: 30
                    gradient: Gradient {
                        GradientStop {position: 0; color: "gray"}
                        GradientStop {position: 0.7; color: "black"}
                    }
                }
                highlight: Rectangle {
                    width: parent.width
                    color: "darkblue"
                }*/
            }
        }
    }
}
