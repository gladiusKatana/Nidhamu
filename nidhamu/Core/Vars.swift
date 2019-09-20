// Vars             ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

var globalKeyWindow = UIApplication.shared.keyWindow!

var navController: UINavigationController? = UINavigationController()

var dismissPinch = UIPinchGestureRecognizer()

var timerForShowScrollIndicator: Timer?

var textFieldHeight = CGFloat(0);               var textFieldWidth =  CGFloat(0)
var textFieldY = CGFloat(0)

var xOffSet = CGFloat(0);                       var yOffset = CGFloat(0)
var portraitKeyboardHeight = CGFloat(0);        var landscapeKeyboardHeight = CGFloat(0)
var keyboardHeight = CGFloat(0)


var statusBarHeight = 0.0;                      var lastStatusBarHeight = 0.0
var navBarHeight = 0.0;                         var launchWidth = 0.0

var reloadsWhileResized = 0

var firstReenteredForeground = false;           var firstReloadForKeyboard = false
var justPinched = false;                        var rePresentedVCManually = true
var showConsoleLegend = false;                  var thereWillBeARowException = false
var firstPortraitKeyboardPresented = false;   var firstLandscapeKeyboardPresented = false

var currentOrientation = "orientation (landscape or portrait) for prepare-layout logic"             //* will change this to an enum at some point
var previousOrientation = "previous orientation (landscape or portrait) for prepare-layout logic"   //* " "
var lastActiveOrientation = "orientation (landscape or portrait) before sending app to background"  //* " "
var launchOrientation = "orientation at the moment of launch"                                       //* " "

var loadSymbolLegend = "                                    💾 = view loaded"
var appearSymbolLegend = "                                    🏞 = view appeared"  //console legend

var truncationTrail = "..."

var modelName = "device you're running on"

var phones = ["iPhone4", "iPhone 4s", "iPhone 5", "iPhone 5c", "iPhone 5s", "iPhone 6", "iPhone 6 Plus", "iPhone 6s", "iPhone 6s Plus", "iPhone 7", "iPhone 7 Plus", "iPhone SE", "iPhone 8", "iPhone 8 Plus", "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR"]

var defaultTimetableCellFont = UIFont.systemFont(ofSize: 12, weight: .ultraLight) //UIFont(name: "Helvetica Neue", size: 12)

