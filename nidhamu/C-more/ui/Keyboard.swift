// Keyboard         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


func resetKeyboardHeight() {
    
    if textFieldDisplayed {
        
        if currentOrientation == "portrait" {
            keyboardHeight = portraitKeyboardHeight     // may cache these device-and-orientation-specific heights...
        }                                               //...inside UserDefaults, saving them for next launch
        else {
            keyboardHeight = landscapeKeyboardHeight
        }
        
    }
}


//func resetKeyboardHeight() {
//
//    if textFieldDisplayed {
//
//        if
//            firstPortraitKeyboardPresented &&
//                currentOrientation == "portrait" {
//            keyboardHeight = portraitKeyboardHeight     // may cache these device-and-orientation-specific heights...
//        }                                               //...inside UserDefaults, saving them for next launch
//
//        if
//            firstLandscapeKeyboardPresented &&
//                currentOrientation == "landscape" {
//            keyboardHeight = landscapeKeyboardHeight
//        }
//
//    }
//}

