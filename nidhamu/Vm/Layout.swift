// Layout           ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class CustomFlowLayout : UICollectionViewFlowLayout {
    var cellWidth: CGFloat?;                var cellHeight: CGFloat?;           var autoFitWScale: CGFloat?;        var autoFitHScale: CGFloat?
    var cellWd = CGFloat(0);                var cellHt = CGFloat(0);            var hSpace = CGFloat(0);            var vSpace = CGFloat(0)
    var widthPlusSpace = CGFloat(0);        var heightPlusSpace = CGFloat(0);   var xDefault = CGFloat(0);          var yDefault = CGFloat(0)
    var cols = 0;                           var rows = 0;                       var lockedHeaderRows = 0;           var lockedHeaderSections = 0
    var customFrame: CGRect?;               var cellDimensionsMode = CellDimensionsMode.neitherHardcoded
    var squareCellMode : SquareCellMode;    var squareCells = false
    var embeddedInNavController = false;    var loadsHorizontally = false
    
    init(embeddedInNavController: Bool, customFrame: CGRect?, rows: Int, cols: Int, lockedHeaderRows: Int, lockedHeaderSections: Int,
         cellWidth: CGFloat?, cellHeight: CGFloat?,
         autoFitWScale: CGFloat?, autoFitHScale: CGFloat?,
         hSpace: CGFloat, vSpace: CGFloat, loadsHorizontally: Bool, squareCellMode: SquareCellMode) {
        
        self.embeddedInNavController = embeddedInNavController
        self.customFrame = customFrame
        
        if !loadsHorizontally {self.rows = rows; self.cols = cols}
        else {                 self.rows = cols; self.cols = rows}
        
        self.lockedHeaderRows = lockedHeaderRows;   self.lockedHeaderSections = lockedHeaderSections
        self.cellWidth = cellWidth;                 self.cellHeight = cellHeight
        self.autoFitHScale = (autoFitHScale != nil) ? autoFitHScale : 1
        self.autoFitWScale = (autoFitWScale != nil) ? autoFitWScale : 1
        
        self.hSpace = hSpace;                       self.vSpace = vSpace
        self.loadsHorizontally = loadsHorizontally; self.squareCellMode = squareCellMode
        super.init()
        
        if cellWidth != nil && cellHeight != nil        {cellDimensionsMode = .widthAndHeightHardcoded}
            
        else if cellWidth == nil && cellHeight != nil   {cellDimensionsMode = .heightHardcoded}
            
        else if cellWidth != nil && cellHeight == nil   {cellDimensionsMode = .widthHardcoded}
            
        else    {cellDimensionsMode = .neitherHardcoded}//print(cellDimensionsMode.simpleDescription())//; print(squareCellMode.simpleDescription())
        calculateSizes()
        self.cellWidth = cellWd;   self.cellHeight = cellHt
        //drawTestSquare()                              //print("status  \(statusBarHeight) / \(lastStatusBarHeight)  launch width  \(launchWidth)")
    }
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {return true}
    override func invalidateLayout() {super.invalidateLayout()}
}

