// VCs_II           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

var deferralLayout =
    CustomFlowLayout(
        embeddedInNavController: true,
        customFrame: nil,
        rows: timetableRows, cols: 8,
        lockedHeaderRows: timetableHeaders, lockedHeaderSections: 1,
        cellWidth: nil, cellHeight: nil,
        autoFitWScale: 1, autoFitHScale: 1,
        hSpace: cellGap, vSpace: cellGap,
        loadsHorizontally: false,
        squareCellMode: .noAutoSquare)

var deferralVC = CollectionVC(.deferralDates, backgroundColour: defaultColour, loopWeeks: true, demarcateWeeksByColour: true, colourIndex: nil, collectionViewLayout: deferralLayout)


var taskListLayout =
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


var archiveLayout =
    CustomFlowLayout(
        embeddedInNavController: true,
        customFrame: globalWindow.frame,
        rows: 1, cols: 3, lockedHeaderRows: 0, lockedHeaderSections: 0,
        cellWidth: nil, cellHeight: 20,
        autoFitWScale: 1, autoFitHScale: 1,
        hSpace: cellGap, vSpace: cellGap,
        loadsHorizontally: false,
        squareCellMode: .noAutoSquare)

var archiveVC = CollectionVC(.archive, backgroundColour: defaultColour, loopWeeks: nil, demarcateWeeksByColour: nil, colourIndex: 1, collectionViewLayout: archiveLayout)

