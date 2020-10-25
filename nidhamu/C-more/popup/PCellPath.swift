// PCellPath        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension PopupMenuVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CenterAlignedCell.popupReuseIdentifier,
                                                      for: indexPath) as! CenterAlignedCell
        let customLayout = downcastLayout!
        let row = indexPath.item                            //; let column = indexPath.section
        cell.layer.cornerRadius = 0
        
        if row < customLayout.lockedHeaderRows
        //|| column < customLayout.lockedHeaderSections {    // our popup menu has no need for header columns
        {
            let col = indexPathsToProcess.first![0]; let rw = indexPathsToProcess.first![1]
            guard let tasks = tasksAtIndexPath[TimeBlock(values:(col, rw))] else {print("error casting task array from popup wizard"); return cell}
            
            cell.titleLabel.text = "Tag Task (\(tasks.count) left)"
            
            if tasks.count == 0 && indexPathsToProcess.count > 0 {                      //print("autosaving")
                taskIndex = 0
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                    tasksAtIndexPath.remove(at: tasksAtIndexPath.index(forKey: TimeBlock(values:(col, rw)))!)
                    indexPathsToProcess.removeFirst(); taskArraysToProcess.removeFirst(); taskDescriptionsToProcess.removeFirst()
                    
                    if !taskArraysToProcess.isEmpty {
                        tasksInBlockToBeProcessed = taskArraysToProcess.first!.count
                    }
                    self.dismissPopupMenuAndSave(newTimeBlock: true, autoSave: true)
                }
            }
            
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

