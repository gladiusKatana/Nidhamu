// Colours          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension UIColor {
    static func rgb(_ r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}

var randomColours =     // used in TestSquare.swift
    [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor, UIColor.white.cgColor]

var windowBackgroundColour = icyBlue

//let num = CGFloat(42)
var headerColour = iosSettingsGray //UIColor.rgb(num, g: num, b: num, a: 1)

var cellDefaultColour = icyBlue
var cellTextDefaultColour = graySeven;                              var headerTextDefaultColour = UIColor.black

var lastWeekColour = darkerIce
var eventAddingColour = lightNavy


//var niceOrange = UIColor.rgb(228, g: 100, b: 44, a: 0.75)
var niceOrangeLight = UIColor.rgb(180, g: 70, b: 0, a: 0.5)         //(220, g: 70, b: 20, a: 0.5)
//var jadeGreen = UIColor.rgb(22, g: 134, b: 79, a: 1)


var icyBlue = UIColor.rgb(180, g: 210, b: 240, a: 1)                //(150, g: 180, b: 220, a: 1)
var darkerIce = UIColor.rgb(130, g: 160, b: 200, a: 0.6)            //(150, g: 180, b: 220, a: 0.7) //(120, g: 150, b: 180, a: 1)
//var halfIcyBlue = UIColor.rgb(150, g: 180, b: 220, a: 0.25)       //; var eventTextBlue = UIColor.rgb(50, g: 50, b: 250, a: 1)
//var darkNavy = UIColor.rgb(0, g: 36, b: 82, a: 1)
var navyBlue = UIColor.rgb(0, g: 50, b: 96, a: 1)
var lightNavy = UIColor.rgb(0, g: 56, b: 116, a: 0.75)


var bluishGray = UIColor.white //UIColor.rgb(60, g: 80, b: 120, a: 1)
var grayTwo = UIColor.rgb(0, g: 0, b: 0, a: 0.2);                   var grayFive = UIColor.rgb(0, g: 0, b: 0, a: 0.5)
var graySeven = UIColor.rgb(0, g: 0, b: 0, a: 0.7)
var iosSettingsGray = UIColor.rgb(240, g: 240, b: 247, a: 1)


var platinum = UIColor.rgb(214, g: 214, b: 214, a: 1)
var platinumLite = UIColor.rgb(214, g: 214, b: 255, a: 0.25)
//var frostedGlass = UIColor.rgb(230, g: 230, b: 230, a: 0.7)       //(255, g: 255, b: 255, a: 0.4)
//var clearGlass = UIColor.rgb(255, g: 255, b: 255, a: 0.05)
//var skyBackgroundImage = UIImage(named: "skyB")?.withRenderingMode(.alwaysOriginal) // sky background (blue with light clouds)
//var skyBackgroundColour = UIColor(patternImage: skyBackgroundImage!) //looks pretty nice, may use later

