// PCellPath        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension PopupMenuVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CenterAlignedCell.popupReuseIdentifier,
                                                      for: indexPath) as! CenterAlignedCell
        let customLayout = downcastLayout!
        
        let row = indexPath.item                            //; let column = indexPath.section
        
        if row < customLayout.lockedHeaderRows
            //|| column < customLayout.lockedHeaderSections {    // our popup menu has no need for header columns
        {
            
            let col = indexPathsToProcess.first![0]; let rw = indexPathsToProcess.first![1]
            guard let tasks = tasksAtIndexPath[TimeBlock(values:(col, rw))] else {print("error casting task array from popup wizard"); return cell}
            
//            let taskId = globalTaskIdentifier
//            cell.titleLabel.text = taskId == defaultTaskIdentifier ? "Mark \(defaultTaskIdentifier):" : "Mark '\(taskId)':"
            cell.titleLabel.text = "Tag Task \(tasks.count - tasksInBlockToBeProcessed + 1) of \(tasks.count)"
            cell.titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .thin)
            
            cell.backgroundColor = popupMenuLightGray
            
        } else {
            cell.backgroundColor = cellDefaultColour
            cell.titleLabel.text = TaskStatus.allCases[row].caseName()
            cell.titleLabel.textColor = .black
        }
        
        return cell
    }
}

