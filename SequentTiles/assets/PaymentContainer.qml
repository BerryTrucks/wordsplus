import bb.cascades 1.0
import com.sample.payment 1.0

Page {
    Container {
        layout: DockLayout {
        }
        background: Color.create("#272727")
        ImageView {
            horizontalAlignment: HorizontalAlignment.Center
            imageSource: "images/background_payment.png"
        }
        Container {
            topPadding: 30
            preferredWidth: 720
            horizontalAlignment: HorizontalAlignment.Center
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: "Get More Coins! " + sequentTiles.coinCount
                textStyle {
                    textAlign: TextAlign.Center
                    base: SystemDefaults.TextStyles.BigText
                    color: Color.create("#fafafa")
                }
            }

        }
        Container {
            bottomPadding: 50
            preferredWidth: 720
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Bottom
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: "Guess the Sequent"
                textStyle {
                    textAlign: TextAlign.Center
                    base: SystemDefaults.TextStyles.BigText
                    color: Color.create("#fafafa")
                }
            }

        }
        Container {
            layout: AbsoluteLayout {
            }
            preferredHeight: 980
            preferredWidth: 720
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            //background: Color.Gray
            Container {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 42
                    positionY: 162
                }
                Container {
                    layout: DockLayout {
                    }
                    preferredHeight: 300
                    preferredWidth: 300
                    background: Color.create("#0098f0")
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Top
                        text: "600 COINS\n$0.99"
                        multiline: true
                        textStyle {
                            textAlign: TextAlign.Center
                            base: SystemDefaults.TextStyles.BodyText
                            color: Color.create("#FFD700")
                        }

                    }
                    Button {
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "Buy"
                        preferredHeight: 100
                        preferredWidth: 200
                        onClicked: {
                            paymentControl.id = "28015175"
                            paymentControl.sku = "600_coins"
                            paymentControl.name = "600 Coins"
                            paymentControl.metadata = "600"
                            paymentControl.getPrice(paymentControl.id, paymentControl.sku)
                            paymentControl.purchase(paymentControl.id, paymentControl.sku, paymentControl.name, paymentControl.metadata)
                        }
                    }
                }
            }
            Container {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 379
                    positionY: 162
                }
                Container {
                    layout: DockLayout {
                    }
                    preferredHeight: 300
                    preferredWidth: 300
                    background: Color.create("#0098f0")
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Top
                        text: "1500 COINS\n$1.99"
                        multiline: true
                        textStyle {
                            textAlign: TextAlign.Center
                            base: SystemDefaults.TextStyles.BodyText
                            color: Color.create("#FFD700")
                        }

                    }
                    Button {
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "Buy"
                        preferredHeight: 100
                        preferredWidth: 200
                        onClicked: {
                            paymentControl.id = "28015176"
                            paymentControl.sku = "1500_coins"
                            paymentControl.name = "1500 Coins"
                            paymentControl.metadata = "1500"
                            paymentControl.getPrice(paymentControl.id, paymentControl.sku)
                            paymentControl.purchase(paymentControl.id, paymentControl.sku, paymentControl.name, paymentControl.metadata)
                        }
                    }
                }
            }
            Container {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 379
                    positionY: 502
                }
                Container {
                    layout: DockLayout {
                    }
                    preferredHeight: 300
                    preferredWidth: 300
                    background: Color.create("#0098f0")
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Top
                        text: "4000 COINS\n$2.99"
                        multiline: true
                        textStyle {
                            textAlign: TextAlign.Center
                            base: SystemDefaults.TextStyles.BodyText
                            color: Color.create("#FFD700")
                        }

                    }
                    Button {
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "Buy"
                        preferredHeight: 100
                        preferredWidth: 200
                        onClicked: {
                            paymentControl.id = "28015177"
                            paymentControl.sku = "4000_coins"
                            paymentControl.name = "4000 Coins"
                            paymentControl.metadata = "4000"
                            paymentControl.getPrice(paymentControl.id, paymentControl.sku)
                            paymentControl.purchase(paymentControl.id, paymentControl.sku, paymentControl.name, paymentControl.metadata)
                        }
                    }
                }
            }
            Container {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 42
                    positionY: 502
                }
                Container {
                    preferredHeight: 300
                    preferredWidth: 300
                    background: Color.create("#0098f0")
                    ImageView {
                        imageSource: "images/buttons/selected.png"
                    }
                }
            }
        }
        attachedObjects: [
            //! [3]
            // The custom payment element for holding item data
            // and used for method invocation and receiving events as a
            // result of those invocations
            PaymentServiceControl {
                id: paymentControl
                property string id
                property string sku
                property string name
                property string metadata
                onPriceResponseSuccess: {
                }
                onPurchaseResponseSuccess: {
                    var coinsBought = Number(metadata);
                    sequentTiles.coinCount = sequentTiles.coinCount + coinsBought;
                }
                onExistingPurchasesResponseSuccess: {
                }
                onCheckStatusResponseSuccess: {
                }
                onInfoResponseError: {
                }
            }
        //! [3]
        ]
    }
    actions: [
        ActionItem {
            title: "Close"
            imageSource: "images/close.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                paymentSheet.close();
            }
        }
    ]
}
