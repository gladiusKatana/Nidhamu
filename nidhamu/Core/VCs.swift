// VCs              ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

var cellGap = CGFloat(0) // if nonzero, do not make this smaller than: 0.5 (iphone7), or lines drawn inconsistently
var backgroundVC = UIViewController()
var topVC = CollectionVC(.initial, backgroundColour: UIColor.clear, loopWeeks: nil, demarcateWeeksByColour: nil, colourIndex: nil, collectionViewLayout: timetableLayout)

var timetableHeaders = 5
var timeBlockSize = 1                           /// length, in hours, of each time-block (cell)             /// * * may make this an enum, with values = 1, 3, 6, 12, 24 etc
var timetableRows = 24 / timeBlockSize + timetableHeaders
var cellHeightFactor = CGFloat(1);  var headerHeightFactor = CGFloat(1)

var timetableLayout = ///---------------------------------------------
    CustomFlowLayout(
        embeddedInNavController: true,          ///  if true, it's fullscreen (with a nav bar button to navigate to its collection view controller's view); else it's a window with a custom frame
        customFrame: nil,                       ///  if nil, defaults to a pre-set frame, the app's window frame (as described in above comment)
        rows: timetableRows, cols: 8,
        lockedHeaderRows: timetableHeaders, lockedHeaderSections: 1,
        cellWidth: nil, cellHeight: nil,        ///  if either parameter is nil, screen width and/or height is autofitted (else, auto-fit scalars below are ignored, ie set to 1.0)
        autoFitWScale: 1, autoFitHScale: 1,     ///  if either of these parameters are nil, they default to 1.0
        hSpace: cellGap, vSpace: cellGap,       ///  gaps between the cells
        loadsHorizontally: false,               ///❗️if loadsHorizontally is true, 'rows' look like columns
        squareCellMode: .noAutoSquare)

var timetableVC = CollectionVC(.timetable, backgroundColour: defaultColour, loopWeeks: true, demarcateWeeksByColour: true, colourIndex: 0, collectionViewLayout: timetableLayout)





var taskTaggingLayout = ///--------------------------------------------
    CustomFlowLayout(
        embeddedInNavController: false,
        customFrame: nil,
        rows: 5, cols: 1, lockedHeaderRows: 1, lockedHeaderSections: 0,
        cellWidth: 80, cellHeight: 20,
        autoFitWScale: nil, autoFitHScale: nil,
        hSpace: cellGap, vSpace: cellGap,
        loadsHorizontally: false,
        squareCellMode: .noAutoSquare)

var taskTaggingViewController = PopupMenuVC(collectionViewLayout: taskTaggingLayout);     var taskRecurringSwitchView = PopupSwitchView()

let zeroFrame = CGRect(x: 0, y: 0, width: 0, height: 0) /// Initial value for testing

///let popupFrame = CGRect(x: timetableLayout.cellWidth! * 2, y: 0, width: timetableLayout.cellWidth!, height: timetableLayout.cellHeight! * 5)

//* taskList VC: remove loopWeeks & demarcateWeeksByColour, via subclassing / making them optional parameters

