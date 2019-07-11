//  Vars.swift
//  nidhamu  ∙  1st commit July. 08, 2019  ∙  Created by Garth Snyder, aka gladiusKatana ⚔️
import UIKit

var globalKeyWindow = UIApplication.shared.keyWindow!

var navController: UINavigationController? = UINavigationController()

var xOffSet = CGFloat(0);               var yOffset = CGFloat(0);           var textFieldY = CGFloat(0)

var statusBarHeight = 0.0;              var lastStatusBarHeight = 0.0
var navBarHeight = 0.0;                 var launchWidth = 0.0

var rePresentedVCFromButton = true;     var firstReenteredForeground = false

var loadSymbolLegend = "                                  💾 = view loaded";
var appearSymbolLegend = "                                  🏞 = view appeared"  //console legend
var consoleLegendAppeared = false

var currentOrientation = "orientation (landscape or portrait) for prepare-layout logic"             //* will change this to an enum at some point
var previousOrientation = "previous orientation (landscape or portrait) for prepare-layout logic"   //* " "
var launchOrientation = "orientation at the moment of launch"                                       //* " "

var modelName = "device you're running on"

var phones = ["iPhone4", "iPhone 4s", "iPhone 5", "iPhone 5c", "iPhone 5s", "iPhone 6", "iPhone 6 Plus", "iPhone 6s", "iPhone 6s Plus", "iPhone 7", "iPhone 7 Plus", "iPhone SE", "iPhone 8", "iPhone 8 Plus", "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR"]

// left the above var global only to make it more prominent

