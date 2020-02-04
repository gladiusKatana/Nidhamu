// ReturnCell       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let row = indexPath.row; let col = indexPath.section
        let layout = downcastLayout!
        
        if viewControllerType == .timetable {
            
            if (0...1).contains(row) && col == layout.cols - 1 {
                return registerRightCell(collectionView, at: indexPath)
            }
                
            else {
                if col < layout.lockedHeaderSections {return registerCenterCell(collectionView, at: indexPath)}
                else {
                    return registerCell(collectionView, at: indexPath)
                }
            }
            
        } else {return registerCell(collectionView, at: indexPath)}
    }
    
    func registerCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> CustomCell {
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        cell = multiLineCellSetup(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func registerCenterCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> CenterAlignedCell {
        collectionView.register(CenterAlignedCell.self, forCellWithReuseIdentifier: CenterAlignedCell.reuseIdentifier)
        var centerCell = collectionView.dequeueReusableCell(withReuseIdentifier:
            CenterAlignedCell.reuseIdentifier, for: indexPath) as! CenterAlignedCell
        centerCell = centerCellSetup(cell: centerCell, indexPath: indexPath)
        return centerCell
    }
    
    /*func registerLeftCell(:) -- see comment block below (not currently using left aligned cells)*/
    
    func registerRightCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> RightAlignedCell {
        collectionView.register(RightAlignedCell.self, forCellWithReuseIdentifier: RightAlignedCell.reuseIdentifier)
        
        let rightCell = collectionView.dequeueReusableCell(withReuseIdentifier:
            RightAlignedCell.reuseIdentifier, for: indexPath) as! RightAlignedCell
        
        let paths = [(7,0), (7,1)]
        singleLineCellSetup(rightCell, indexPath: indexPath, paths: paths)
        return rightCell
    }
    
    /*func registerAndReturnLeftCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> LeftAlignedCell {
     collectionView.register(LeftAlignedCell.self, forCellWithReuseIdentifier: LeftAlignedCell.reuseIdentifier)
     var leftCell = collectionView.dequeueReusableCell(withReuseIdentifier:
     LeftAlignedCell.reuseIdentifier, for: indexPath) as! LeftAlignedCell
     leftCell = doRestOfLeftCellProcessing(cell: leftCell, indexPath: indexPath)
     return leftCell
     }*/
}

//        for cell in timetableVC.collectionView.visibleCells {
//
//            guard let cell = cell as? BaseCell else {
//                print("could not downcast to base cell in cell reference")
//                return
//            }
//
//            let col = cell.xyCoordinate[0]
//            let row = cell.xyCoordinate[1]
//            resetTitleLabel(cell: cell, row: row, col: col)
//        }

