// PCellPath        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension PopupMenuVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.popupReuseIdentifier, for: indexPath) as! CustomCell
        let customLayout = downcastLayout!
        let row = indexPath.item
        
        if row < customLayout.lockedHeaderRows
            //|| column < customLayout.lockedHeaderSections {           // our popup menu has no need for header columns
        {
            cell.backgroundColor = headerColour
            cell.titleLabel.text = "Mark '\(globalEventIdentifier)':"   //"✔︎ Mark Event:" //← ⇦ ◄ ⬅️ // didn't find a large enough ascii arrow
            cell.titleLabel.textColor = headerTextDefaultColour
        }
        else {
            cell.backgroundColor = platinum
            cell.titleLabel.text = EventStatus.allCases[row - 1].caseName()
            cell.titleLabel.textColor = .black
        }
        
        return cell
    }
}

