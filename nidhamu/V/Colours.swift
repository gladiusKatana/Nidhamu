// Colours          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

var iosSettingsGray = UIColor.rgb(240, g: 240, b: 247, a: 1)
//var iosKeyboardDefaultColourApprox = UIColor.rgb(206, g: 213, b: 219, a: 1) ///b: 218 // (207, g: 212, b: 225, a: 1)

var defaultColour = skyBackgroundColour;                        var cellDefaultColour = lightWhite
var headerColour = UIColor.clear;                               var taskAddingColour = platinum

var defaultCellTextColour = UIColor.black;                      ///var headerTextDefaultColour = UIColor.black

var dimOrange = UIColor.rgb(180, g: 70, b: 0, a: 0.5);          var darkNavy = UIColor.rgb(0, g: 36, b: 82, a: 1);

var lightWhite = UIColor.rgb(255, g: 255, b: 255, a: 0.3);      var platinum = UIColor.rgb(214, g: 214, b: 214, a: 1);

var grayOne = UIColor.rgb(0, g: 0, b: 0, a: 0.1);               var grayTwo = UIColor.rgb(0, g: 0, b: 0, a: 0.2)
var grayOneConverted = UIColor.rgb(138, g: 176, b: 210, a: 1) /// Got alpha=1 equivalent of grayOne*, via screenshot + this app:  tinyurl.com/y2e4smph
var grayThree = UIColor.rgb(0, g: 0, b: 0, a: 0.3);             var grayFour = UIColor.rgb(0, g: 0, b: 0, a: 0.4)
var graySeven = UIColor.rgb(0, g: 0, b: 0, a: 0.7)
var greyoutForTimeBlocksPassedThisWeek = grayOne;               var popupMenuLightGray = UIColor.lightGray

var backgroundImage = UIImage(named: "(big)sky2")?.withRenderingMode(.alwaysTemplate) /// sky background (blue with light clouds)
var skyBackgroundColour = UIColor(patternImage: backgroundImage!) ///looks nice, but can slow scrolling performance (if collection view scrolls)

var randomColours = /// used in TestSquare.swift
    [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor, UIColor.white.cgColor]

extension UIColor {
    static func rgb(_ r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}

///var darkRed = UIColor.rgb(150, g: 0, b: 0, a: 1)
///var niceOrangeDark = UIColor.rgb(228, g: 100, b: 44, a: 0.75); ///var orangeForBlocksSinceLastLogin = UIColor.rgb(180, g: 70, b: 0, a: 0.5) ///(220,g: 70, b: 20, a: 0.5)
///var jadeGreenLight = UIColor.rgb(60, g: 120, b: 79, a: 0.3);     ///var jadeGreen = UIColor.rgb(22, g: 134, b: 79, a: 1)

///var skyBlue = UIColor.rgb(0, g: 80, b: 180, a: 0.7)                       ///(180, g: 210, b: 240, a: 1) ///(150, g: 180, b: 220, a: 1)
///var lightSky = UIColor.rgb(100, g: 170, b: 230, a: 0.5)                   ///var bluishGray = UIColor.rgb(20, g: 80, b: 120, a: 1)
///var subtleBlue = UIColor.rgb(100, g: 140, b: 190, a: 1)                   ///a: 0.6 ///(150, g: 180, b: 220, a: 0.7) //(120, g: 150, b: 180, a: 1)
///var navyBlue = UIColor.rgb(0, g: 50, b: 96, a: 1)
///var extraLightNavy = UIColor.rgb(0, g: 56, b: 116, a: 0.4)                ///var taskTextBlue = UIColor.rgb(50, g: 50, b: 250, a: 1)
///var lightNavy = UIColor.rgb(0, g: 56, b: 116, a: 0.6);                    ///var halfIcyBlue = UIColor.rgb(150, g: 180, b: 220, a: 0.25)
///var darkerIce = UIColor.rgb(130, g: 160, b: 200, a: 1)                    ///a: 0.6 ///(150, g: 180, b: 220, a: 0.7); //(120, g: 150, b: 180, a: 1)

///var midPlatinum = UIColor.rgb(214, g: 214, b: 214, a: 0.5)                ///var grayBarelyThere = UIColor.rgb(0, g: 0, b: 0, a: 0.03)
///var midWhite = UIColor.rgb(255, g: 255, b: 255, a: 0.5)/*****************/
///var clearGlass = UIColor.rgb(255, g: 255, b: 255, a: 0.05)                ///; var frostedGlass = UIColor.rgb(230, g: 230, b: 230, a: 0.7) //(255,g: 255,b: 255,a: 0.4)


/* *Some more explanation re. the alpha-conversion comment above:
 my colour  grayOne  is transparent, so cells using it show some of the background photo (blue sky) used throughout this app.  But, 'transparent mixture' color effects (with alpha < 1) can't be easily matched in the navigation bar's background color (since the background behind the nav bar is default black).   But— there's an easy solution.  To get a solid (alpha=1) version of any 'transparent mixture' color, you only need to screenshot the app on your device, crop the color-area you want, then upload that image to the web app linked above. That app gives you the rgb variables, you can use these with alpha = 1)
 
 ...here's the full app link (again):
 
 https://www.ginifab.com/feeds/pms/pms_color_in_image.php   // full link
 
 https://www.ginifab.com/feeds/                                // main site with some other useful design tools)
 
 (Nice way to shill their free tools right ;)
 */


/*background image sources:
 
 background image id string:                link:
 
 (big)sky1                                  https://depositphotos.com/228431962/stock-video-beautiful-almost-clear-blue-sky.html  **
 (big)sky2                                  https://depositphotos.com/228431962/stock-video-beautiful-almost-clear-blue-sky.html
 
 ** note - 1st image is a timelapse video; the image frame used, can be found in the attached .keynote (for now). See 2nd slide
 
 */

