// VCs_II           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

var deferralLayout = ///---------------------------------------------
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

var deferralVC = CollectionVC(.deferralDates, backgroundColour: defaultColour, loopWeeks: true, demarcateWeeksByColour: true, colourIndex: nil, collectionViewLayout: deferralLayout)


var taskListLayout = ///------------------------------------------------
    CustomFlowLayout(
        embeddedInNavController: true,
        customFrame: globalWindow.frame,
        rows: 1, cols: 3, lockedHeaderRows: 0, lockedHeaderSections: 0,
        cellWidth: nil, cellHeight: nil,
        autoFitWScale: 1, autoFitHScale: 1,
        hSpace: cellGap, vSpace: cellGap,
        loadsHorizontally: false,
        squareCellMode: .noAutoSquare)

var taskListVC = CollectionVC(.taskList, backgroundColour: defaultColour, loopWeeks: nil, demarcateWeeksByColour: nil, colourIndex: nil, collectionViewLayout: taskListLayout)


var archiveLayout = ///--------------------------------------------------
    CustomFlowLayout(
        embeddedInNavController: true,
        customFrame: globalWindow.frame,
        rows: 1, cols: 4, lockedHeaderRows: 0, lockedHeaderSections: 0,
        cellWidth: nil, cellHeight: 20,
        autoFitWScale: 1, autoFitHScale: 1,
        hSpace: cellGap, vSpace: cellGap,
        loadsHorizontally: false,
        squareCellMode: .noAutoSquare)

var archiveVC = CollectionVC(.archive, backgroundColour: defaultColour, loopWeeks: nil, demarcateWeeksByColour: nil, colourIndex: 1, collectionViewLayout: archiveLayout)
