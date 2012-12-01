import bb.cascades 1.0

Container {
    property int bbm_personalmessage: 6
    property int bbm_statusmessage: 7
    property int bbm_invitetodownload: 8
    Container { // bottom panel
        //background: Color.Gray
        verticalAlignment: VerticalAlignment.Bottom
        //        Container {
        //            preferredWidth: 768
        //            preferredHeight: 3
        //            //background: Color.create("#FF8C00")
        //            background: Color.create("#CC3F10")
        //            //background: Color.create("#00629C")
        //            //background: Color.create("#262626")
        //            //background: Color.Black
        //        }
        Container { // whole panel
            //background: Color.Black
            Container { // image panel
                //background: Color.Yellow
                layout: DockLayout {
                }
                Container {
                    ImageView {
                        imageSource: "asset:///images/btm_nav.png"
                    }
                }
                Container {
                    topPadding: 20
                    //background: Color.Gray
                    horizontalAlignment: HorizontalAlignment.Left
                    preferredHeight: 150
                    preferredWidth: 150
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
                }
                Container { //play container
                    property bool isSwipe: true
                    layout: DockLayout {
                    }
                    //background: Color.Gray
                    topPadding: 23.5
                    rightPadding: 2
                    verticalAlignment: VerticalAlignment.Top
                    horizontalAlignment: HorizontalAlignment.Center
                    Container {
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        ImageView {
                            id: pLetter
                            rightMargin: 0
                            leftMargin: 0
                            preferredHeight: 75
                            preferredWidth: 75
                            //imageSource: "asset:///images/letters/highlight/p_navbar.png"
                            onTouch: {
                                if (event.isDown()) {
                                    pLetter.imageSource = "asset:///images/letters/highlight/p_navbar.png"
                                    wordsPlus.playSound("letterSelected");
                                } else if (event.isUp()) {
                                    pLetter.imageSource = ""
                                }
                            }
                        }
                        ImageView {
                            id: lLetter
                            rightMargin: 0
                            leftMargin: 0
                            preferredHeight: 75
                            preferredWidth: 75
                            //imageSource: "asset:///images/letters/highlight/l_navbar.png"
                            onTouchEnter: {
                                if (pLetter.imageSource == "asset:///images/letters/highlight/p_navbar.png") {
                                    lLetter.imageSource = "asset:///images/letters/highlight/l_navbar.png"
                                    wordsPlus.playSound("letterSelected");
                                }
                            }
                            onTouch: {
                                if (event.isUp()) {
                                    pLetter.imageSource = ""
                                    lLetter.imageSource = ""
                                }
                            }
                        }
                        ImageView {
                            id: aLetter
                            rightMargin: 0
                            leftMargin: 0
                            preferredHeight: 75
                            preferredWidth: 75
                            //imageSource: "asset:///images/letters/highlight/a_navbar.png"
                            onTouchEnter: {
                                if (lLetter.imageSource == "asset:///images/letters/highlight/l_navbar.png") {
                                    aLetter.imageSource = "asset:///images/letters/highlight/a_navbar.png"
                                    wordsPlus.playSound("letterSelected");
                                }
                            }
                            onTouch: {
                                if (event.isUp()) {
                                    pLetter.imageSource = ""
                                    lLetter.imageSource = ""
                                    aLetter.imageSource = ""
                                }
                            }
                        }
                        ImageView {
                            id: yLetter
                            rightMargin: 0
                            leftMargin: 0
                            preferredHeight: 75
                            preferredWidth: 75
                            //imageSource: "asset:///images/letters/y.png"
                            onTouchEnter: {
                                if (aLetter.imageSource == "asset:///images/letters/highlight/a_navbar.png") {
                                    yLetter.imageSource = "asset:///images/letters/highlight/y_navbar.png"
                                    wordsPlus.playSound("letterSelected");
                                }
                            }
                            onTouchExit: {
                                pLetter.imageSource = ""
                                lLetter.imageSource = ""
                                aLetter.imageSource = ""
                                yLetter.imageSource = ""
                                wordsPlus.intializePlayArea();
                            }
                            onTouch: {
                                if (event.isUp()) {
                                    if (yLetter.imageSource == "asset:///images/letters/highlight/y_navbar.png") {
                                        pLetter.imageSource = ""
                                        lLetter.imageSource = ""
                                        aLetter.imageSource = ""
                                        yLetter.imageSource = ""
                                        wordsPlus.intializePlayArea();
                                    }
                                }
                            }
                        }
                    }
                } // end of letter container
                Container {
                    property bool isHome: false
                    //background: Color.Gray
                    preferredHeight: 150
                    preferredWidth: 150
                    horizontalAlignment: HorizontalAlignment.Right
                    onTouch: {
                        if (event.isDown()) {
                            isHome = true;
                        }
                        if (event.isUp() && isHome) {
                            isHome = false;
                            wordsPlus.stopTimer();
                            wordsPlus.InitializeHomePage();
                        }
                    }
                }
            } // image panel
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
