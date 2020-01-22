// Vars             ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit
/// Note— triple-commented global vars (///) denote vars not currently used, but that could be/ may be/ sometimes are used (ie in testing, etc)

var globalWindow = UIWindow(frame: UIScreen.main.bounds)
///var sceneDelegate = SceneDelegate()  // not (currently) supporting multiple windows on iPad, or multiple-scene-view in modal vc presentations

var navController: UINavigationController? = UINavigationController()
var dismissPinch = UIPinchGestureRecognizer()

var emailComposer = EmailComposer();            ///var timerForShowingScrollIndicator: Timer?
var defaultTimetableCellFont = UIFont.systemFont(ofSize: 12, weight: .ultraLight) /// UIFont(name: "Helvetica Neue", size: 12)



var statusBarHeight = 0.0;                      var lastStatusBarHeight = 0.0
var navBarHeight = 0.0;                         var launchWidth = 0.0

var textFieldWidth = CGFloat(0);                var textFieldY = CGFloat(0)
var textFieldHeight = CGFloat(30)  /// will rewrite this at some point, to be reset to a size calculated from its text height, plus a bit (with an initial value of 0). See stringSize(:), in Strings.swift

var xOffSet = CGFloat(0);                       var yOffset = CGFloat(0)
var keyboardHeight = CGFloat(0)  /// will rewrite the two lines below this one, & write an enum containing manually-determined** values for each device; this will be done by running the app...
var portraitKeyboardHeight = CGFloat(246) /// ...on each simulator, with old versions of resetKeyboardHeight() & showKBoard(:); so, will be initializing these 2 values to 0, as below
var landscapeKeyboardHeight = CGFloat(192)/// **why manually determined?  Because these values (keyboard heights for different iOS devices) do not seem to be recorded anywhere online
///var portraitKeyboardHeight = CGFloat(0)
///var landscapeKeyboardHeight = CGFloat(0)


var keyboardLocked = false;                     ///var firstPortraitKeyboardPresented = false;                          var firstLandscapeKeyboardPresented = false
var textFieldDisplayed = false;                 var justPinched = false;                    var rowLongPressed = -1
var taggingViewDisplayed = false;               var selectedTaskWillRecur = false
var firstTimeLoaded = false                     // one-way bool: only flipped to  true once in entire app lifecycle
///var firstBecameActive = false
///var rotatedFromResignActive = false
var reloadedFromHourTickingOver = true;         var cachedBlocksAndTheirPaths = false
var tempRescalingBool = false;                  var thereWillBeARowException = false;       var showConsoleLegend = true



var currentOrientation = "orientation (landscape or portrait) for prepare-layout logic"             //* will change this to an enum at some point
var previousOrientation = "previous orientation (landscape or portrait) for prepare-layout logic"   //* " "
var lastActiveOrientation = "orientation (landscape or portrait) before sending app to background"  //* " "
var launchOrientation = "orientation at the moment of launch"                                       //* " "
var loadSymbolLegend = "                                        💾 = view loaded"
///var appearSymbolLegend = "                                        🏞 = view appeared"  /// console legend
var truncationTrail = "…";                      ///var averageLetterWidth = CGFloat(0)
var dateString = "global csv date string";      var fileName = "global csv file name"
var modelName = "device you're running on"
var phones = ["iPhone4", "iPhone 4s", "iPhone 5", "iPhone 5c", "iPhone 5s", "iPhone 6", "iPhone 6 Plus", "iPhone 6s", "iPhone 6s Plus", "iPhone 7", "iPhone 7 Plus", "iPhone SE", "iPhone 8", "iPhone 8 Plus", "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR"]

