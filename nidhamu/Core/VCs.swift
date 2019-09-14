// VCs              ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

var cellGap = CGFloat(0)                            //* if nonzero, do not make this smaller than: 0.5 (iphone7), or lines drawn inconsistently

var timetableLayout = CustomFlowLayout(
    embeddedInNavController: true, //* if true, it's fullscreen (with nav bar button); else it's a custom window
    customFrame: nil,                               //* if nil, defaults to a pre-set frame (e.g. global key window frame)
    rows: 28, cols: 8, lockedHeaderRows: 4, lockedHeaderSections: 1,
    cellWidth: nil, cellHeight: nil,                //* if either dimension entered nil, screen width &/or height is autofitted
    autoFitWScale: nil, autoFitHScale: nil,         //* if either of these parameters are nil, they default to 1.0
    hSpace: cellGap, vSpace: cellGap,               //* auto-fit scaling factors above are ignored if width/height are not nil
    loadsHorizontally: false,                       //❗️if loadsHorizontally is true, 'rows' look like columns
    squareCellMode: .noAutoSquare)

var todoListLayout = CustomFlowLayout(embeddedInNavController: true,
                                      customFrame: globalKeyWindow.frame,
                                      rows: 1, cols: 3, lockedHeaderRows: 0, lockedHeaderSections: 0,
                                      cellWidth: nil, cellHeight: nil,
                                      autoFitWScale: 1, autoFitHScale: 0.667,
                                      hSpace: cellGap, vSpace: cellGap,
                                      loadsHorizontally: false,
                                      squareCellMode: .noAutoSquare)

var classifierLayout = CustomFlowLayout(embeddedInNavController: false,
                                        customFrame: nil,
                                        rows: 7, cols: 1, lockedHeaderRows: 1, lockedHeaderSections: 0,
                                        cellWidth: 80, cellHeight: 20,
                                        autoFitWScale: nil, autoFitHScale: nil,
                                        hSpace: cellGap, vSpace: cellGap,
                                        loadsHorizontally: false,
                                        squareCellMode: .noAutoSquare)

let nilCatcherFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
//* Initial value for testing
//let popupFrame = CGRect(x: timetableLayout.cellWidth! * 2, y: 0, width: timetableLayout.cellWidth!, height: timetableLayout.cellHeight! * 5)

var timetableVC = CollectionVC(.hours, loopWeeks: true, demarcateWeeksByColour: true, colourIndex: 0, collectionViewLayout: timetableLayout)
var todoListVC = CollectionVC(.todoList, loopWeeks: false, demarcateWeeksByColour: false, colourIndex: 1, collectionViewLayout: todoListLayout)

var classifierVC = PopupMenuVC(collectionViewLayout: classifierLayout)
var eventRecurringSwitchView = PopupSwitchView()

var topVC = CollectionVC(.initial, loopWeeks: false, demarcateWeeksByColour: false, colourIndex: nil, collectionViewLayout: timetableLayout)

//* For todoListVC: will probably remove loopWeeks & demarcateWeeksByColour, via subclassing / making them optional parameters


