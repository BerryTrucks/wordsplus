// Default empty project template
import bb.cascades 1.0

// creates one page with a label
Page {
//    attachedObjects: [
//        Sheet {
//            id: aboutSheet
//            AboutSheet {
//            }
//        },
//        Sheet {
//            id: helpSheet
//            HelpSheet {
//            }
//        },
//        Sheet {
//            id: settingsSheet
//            SettingsSheet {
//            }
//        }
//    ]
    onCreationCompleted: {
        Application.menuEnabled = false;
        Application.fullscreen.connect(onFullscreen);
        Application.asleep.connect(onAsleep);
    }
    function onThumbnailed() {
    }
    function onFullscreen() {
    }
    function onAsleep() {
    }

}
