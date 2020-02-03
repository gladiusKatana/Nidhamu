// LeftCell         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

class LeftAlignedCell: BaseCell {
    
    static let reuseIdentifier = "CustomLeftAlignedCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTitleLabelConstraints(titleLabel, attribute: .left)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

extension CollectionVC {
    
    /*func registerAndReturnLeftCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> LeftAlignedCell {
     collectionView.register(LeftAlignedCell.self, forCellWithReuseIdentifier: LeftAlignedCell.reuseIdentifier)
     
     var leftCell = collectionView.dequeueReusableCell(withReuseIdentifier:
     LeftAlignedCell.reuseIdentifier, for: indexPath) as! LeftAlignedCell
     
     leftCell = doRestOfLeftCellProcessing(cell: leftCell, indexPath: indexPath)
     return leftCell
     }*/
    
    func doRestOfLeftCellProcessing(cell: LeftAlignedCell, indexPath: IndexPath) -> LeftAlignedCell  {
        
        let paths = [(0,0), (0,1)] /// this is where the content at cells (7,0) & (7,1) used to be (now right-aligned text, so as to be right under the nav-bar buttons)
        
        singleLineCellSetup(cell, indexPath: indexPath, paths: paths)
        
        return cell
    }
}

