// Colours          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension UIColor {
    static func rgb(_ r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}

var randomColours = /// used in TestSquare.swift
    [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor, UIColor.white.cgColor]


var iosSettingsGray = UIColor.rgb(240, g: 240, b: 247, a: 1)
var iosKeyboardDefaultColourApprox = UIColor.rgb(206, g: 213, b: 219, a: 1) ///b: 218 // (207, g: 212, b: 225, a: 1)

var defaultColour = skyBackgroundColour;                        var cellDefaultColour = lightSky//UIColor.blue//clear//platinum
var headerColour = UIColor.clear;                               var taskAddingColour = UIColor.darkGray

var greyoutForTimeBlocksPassedThisWeek = grayOne;               var popupMenuLightGray = UIColor.lightGray

var defaultCellTextColour = UIColor.black;                      ///var headerTextDefaultColour = UIColor.black


var dimOrange = UIColor.rgb(180, g: 70, b: 0, a: 0.5)
///var niceOrangeDark = UIColor.rgb(228, g: 100, b: 44, a: 0.75);   ///var orangeForBlocksSinceLastLogin = UIColor.rgb(180, g: 70, b: 0, a: 0.5) ///(220, g: 70, b: 20, a: 0.5)
///var jadeGreenLight = UIColor.rgb(60, g: 120, b: 79, a: 0.3);     ///var jadeGreen = UIColor.rgb(22, g: 134, b: 79, a: 1)

var subtleBlue = UIColor.rgb(100, g: 140, b: 190, a: 1)         ///a: 0.6 ///(150, g: 180, b: 220, a: 0.7) //(120, g: 150, b: 180, a: 1)

var skyBlue = UIColor.rgb(140, g: 170, b: 230, a: 1)            ///(180, g: 210, b: 240, a: 1) ///(150, g: 180, b: 220, a: 1)
var lightSky = UIColor.rgb(100, g: 170, b: 230, a: 0.5)
var darkNavy = UIColor.rgb(0, g: 36, b: 82, a: 1);              var navyBlue = UIColor.rgb(0, g: 50, b: 96, a: 1)
///var extraLightNavy = UIColor.rgb(0, g: 56, b: 116, a: 0.4);               ///var taskTextBlue = UIColor.rgb(50, g: 50, b: 250, a: 1)
///var lightNavy = UIColor.rgb(0, g: 56, b: 116, a: 0.6);                    ///var halfIcyBlue = UIColor.rgb(150, g: 180, b: 220, a: 0.25)
///var bluishGray = UIColor.rgb(20, g: 80, b: 120, a: 1)
///var darkerIce = UIColor.rgb(130, g: 160, b: 200, a: 1)                    ///a: 0.6 ///(150, g: 180, b: 220, a: 0.7); //(120, g: 150, b: 180, a: 1)

var platinum = UIColor.rgb(214, g: 214, b: 214, a: 1);          var lightWhite = UIColor.rgb(255, g: 255, b: 255, a: 0.05)
var grayOne = UIColor.rgb(0, g: 0, b: 0, a: 0.07);              var grayTwo = UIColor.rgb(0, g: 0, b: 0, a: 0.2)
var graySeven = UIColor.rgb(0, g: 0, b: 0, a: 0.7);             ///var grayBarelyThere = UIColor.rgb(0, g: 0, b: 0, a: 0.03)
///var grayFour = UIColor.rgb(0, g: 0, b: 0, a: 0.4);                         ///var grayThree = UIColor.rgb(0, g: 0, b: 0, a: 0.3)
///var clearGlass = UIColor.rgb(255, g: 255, b: 255, a: 0.05)                 ///; var frostedGlass = UIColor.rgb(230, g: 230, b: 230, a: 0.7) //(255,g: 255,b: 255,a: 0.4)

var skyBackgroundImage = UIImage(named: "sky")?.withRenderingMode(.alwaysTemplate) /// sky background (blue with light clouds)
var skyBackgroundColour = UIColor(patternImage: skyBackgroundImage!) ///looks nice, but can slow scrolling performance (if collection view scrolls)

