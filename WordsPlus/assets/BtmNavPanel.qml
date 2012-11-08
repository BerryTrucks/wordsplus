import bb.cascades 1.0

Container {
    property int bbm_personalmessage: 6
    property int bbm_statusmessage: 7
    property int bbm_invitetodownload: 8
    Container { // bottom panel
        background: Color.Gray
        verticalAlignment: VerticalAlignment.Bottom
        Container {
            preferredWidth: 768
            preferredHeight: 3
            //background: Color.create("#FF8C00")
            //background: Color.create("#CC3F10")
            //background: Color.create("#00629C")
            background: Color.create("#262626")
            //background: Color.Black
        }
        Container { // whole panel
            preferredWidth: 768
            preferredHeight: 200
            background: Color.Black
            Container { // image panel
                //background: Color.Yellow
                preferredWidth: 768
                preferredHeight: 150
                layout: DockLayout {
                }
                Container { // BBM Share
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Left
                    Container {
                        ImageView {
                            preferredHeight: 100
                            preferredWidth: 100
                            imageSource: "asset:///images/test.png"
                        }
                        Label {
                            text: "hold me"
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Center
                            textStyle {
                                base: btmNavPanelSubTitleNormalWhite.style
                            }
                        }
                    }
                    contextActions: [
                        ActionSet {
                            title: "Share The Love."
                            subtitle: "HOW DO YOU BBM?"
                            ActionItem {
                                title: "Invite My Friends"
                                imageSource: "asset:///images/invite.png"
                                onTriggered: {
                                    wordsPlus.ControlsForBBM(bbm_invitetodownload);
                                }
                            }
                            ActionItem {
                                title: "I Love WordsPlus!"
                                imageSource: "asset:///images/heart_small.png"
                                onTriggered: {
                                    wordsPlus.ControlsForBBM(bbm_personalmessage);
                                }
                            }
                            ActionItem {
                                title: "I'm Busy Playing"
                                imageSource: "asset:///images/busy.png"
                                onTriggered: {
                                    wordsPlus.ControlsForBBM(bbm_statusmessage);
                                }
                            }
                        } // end of ActionSet
                    ] // end of contextActions list
                } // share
                Container {
                    layout: DockLayout {
                    }
                    property real dx: 0
                    property real currentX: 0
                    property real deltaThreshold: 100
                    topPadding: 20
                    verticalAlignment: VerticalAlignment.Top
                    horizontalAlignment: HorizontalAlignment.Center
                    Container {
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        leftPadding: 20
                        verticalAlignment: VerticalAlignment.Center
                        ImageView {
                            id: pLetter
                            preferredHeight: 75
                            preferredWidth: 75
                            imageSource: "asset:///images/letters/p.png"
                            onTouch: {
                                if (event.isDown) {
                                    pLetter.imageSource = "asset:///images/letters/highlight/p.png"
                                } else if (event.isUp) {
                                    pLetter.imageSource = "asset:///images/letters/p.png"
                                }
                            }
                        }
                        ImageView {
                            id: lLetter
                            preferredHeight: 75
                            preferredWidth: 75
                            imageSource: "asset:///images/letters/l.png"
                            onTouchEnter: {
                                lLetter.imageSource = "asset:///images/letters/highlight/l.png"
                            }
                        }
                        ImageView {
                            id: aLetter
                            preferredHeight: 75
                            preferredWidth: 75
                            imageSource: "asset:///images/letters/a.png"
                            onTouchEnter: {
                                aLetter.imageSource = "asset:///images/letters/highlight/a.png"
                            }
                        }
                        ImageView {
                            id: yLetter
                            preferredHeight: 75
                            preferredWidth: 75
                            imageSource: "asset:///images/letters/y.png"
                            onTouchEnter: {
                                yLetter.imageSource = "asset:///images/letters/highlight/y.png"
                                if (event.isUp()) {
                                    wordsPlus.intializePlayArea();
                                    pLetter.imageSource = "asset:///images/letters/p.png"
                                    lLetter.imageSource = "asset:///images/letters/l.png"
                                    aLetter.imageSource = "asset:///images/letters/a.png"
                                    yLetter.imageSource = "asset:///images/letters/y.png"
                                }
                            }
                            onTouch: {
                            }
                            onTouchExit: {
                                wordsPlus.intializePlayArea();
                                pLetter.imageSource = "asset:///images/letters/p.png"
                                lLetter.imageSource = "asset:///images/letters/l.png"
                                aLetter.imageSource = "asset:///images/letters/a.png"
                                yLetter.imageSource = "asset:///images/letters/y.png"
                            }
                        }
                    }
                    //                    Container {
                    //                        layout: StackLayout {
                    //                            orientation: LayoutOrientation.LeftToRight
                    //                        }
                    //                        leftPadding: 20
                    //                        verticalAlignment: VerticalAlignment.Center
                    //                        touchPropagationMode: TouchPropagationMode.None //change this later
                    //                        ImageView {
                    //                            id: pLetter
                    //                            opacity: 0
                    //                            preferredHeight: 75
                    //                            preferredWidth: 75
                    //                            imageSource: "asset:///images/letters/highlight/p.png"
                    //                            animations: BtmNavAnimation {
                    //                                id: pLetterAnimation
                    //                                onStarted: {
                    //                                    lLetterAnimation.delay = 500
                    //                                    lLetterAnimation.play();
                    //                                }
                    //                            }
                    //                        }
                    //                        ImageView {
                    //                            id: lLetter
                    //                            opacity: 0
                    //                            preferredHeight: 75
                    //                            preferredWidth: 75
                    //                            imageSource: "asset:///images/letters/highlight/l.png"
                    //                            animations: BtmNavAnimation {
                    //                                id: lLetterAnimation
                    //                                onStarted: {
                    //                                    aLetterAnimation.delay = 500
                    //                                    aLetterAnimation.play();
                    //                                }
                    //                            }
                    //                        }
                    //                        ImageView {
                    //                            id: aLetter
                    //                            opacity: 0
                    //                            preferredHeight: 75
                    //                            preferredWidth: 75
                    //                            imageSource: "asset:///images/letters/highlight/a.png"
                    //                            animations: BtmNavAnimation {
                    //                                id: aLetterAnimation
                    //                                onStarted: {
                    //                                    yLetterAnimation.delay = 500
                    //                                    yLetterAnimation.play();
                    //                                }
                    //                            }
                    //                        }
                    //                        ImageView {
                    //                            id: yLetter
                    //                            opacity: 0
                    //                            preferredHeight: 75
                    //                            preferredWidth: 75
                    //                            imageSource: "asset:///images/letters/highlight/y.png"
                    //                            animations: BtmNavAnimation {
                    //                                id: yLetterAnimation
                    //                                onEnded: {
                    //                                    wordsPlus.intializePlayArea();
                    //                                    pLetter.opacity = 0;
                    //                                    lLetter.opacity = 0;
                    //                                    aLetter.opacity = 0;
                    //                                    yLetter.opacity = 0;
                    //                                }
                    //                            }
                    //                        }
                    //                    } // end of highlighted letters
                    //                    onTouchExit: {
                    //                        currentX = 0
                    //                    }
                    //                    onTouch: {
                    //                        if (event.isDown()) {
                    //                            dx = event.windowX;
                    //                        } else if (event.isMove()) {
                    //                            currentX = event.windowX - dx;
                    //                            if (currentX > deltaThreshold) {
                    //                                pLetterAnimation.play();
                    //                            }
                    //                        } else if (event.isUp()) {
                    //                            currentX = 0;
                    //                        }
                    //                    }
                } // end of letter container
                Label {
                    text: "swipe me"
                    verticalAlignment: VerticalAlignment.Bottom
                    horizontalAlignment: HorizontalAlignment.Center
                    touchPropagationMode: TouchPropagationMode.None //change this later
                    textStyle {
                        base: btmNavPanelSubTitleNormalWhite.style
                    }
                }
                Container {
                    //background: Color.Gray
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Right
                    Container {
                        horizontalAlignment: HorizontalAlignment.Center
                        touchPropagationMode: TouchPropagationMode.PassThrough
                        ImageView {
                            preferredHeight: 100
                            preferredWidth: 100
                            imageSource: "asset:///images/test.png"
                            //                            onTouch: {
                            //                                if (event.isUp()) {
                            //                                    wordsPlus.InitializeHomePage();
                            //                                }
                            //                            }
                        }
                        Label {
                            text: "tap me"
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Center
                            textStyle {
                                base: btmNavPanelSubTitleNormalWhite.style
                            }
                        }
                    }
                }
            } // image panel
            Container { //divider
                preferredWidth: 768
                preferredHeight: 50
                background: Color.create("#00629C")
                verticalAlignment: VerticalAlignment.Bottom
                horizontalAlignment: HorizontalAlignment.Center
            }
        } // whole panel
    } // bottom panel
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: btmNavPanelTextNormalWhite
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: btmNavPanelSubTitleNormalBlue
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: btmNavPanelSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        }
    ]
}
