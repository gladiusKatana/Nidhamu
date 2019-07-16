// PCellPath        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension PopupMenuVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        let customLayout = downcastLayout!
        let row = indexPath.item
        
        if row < customLayout.lockedHeaderRows { //|| column < customLayout.lockedHeaderSections { // popup menu design here has no need for > col.s
            cell.backgroundColor = headerColour
            cell.titleLabel.text = "Mark '\(globalEventIdentifier)':"     //"✔︎ Mark Event:" // ← ⇦ ◄ ⬅️ still looking for a large enough ascii arrow
            cell.titleLabel.textColor = headerTextDefaultColour
        } else {
            cell.backgroundColor = .lightGray
            cell.titleLabel.text = EventStatus.allCases[row - 1].caseName()
            cell.titleLabel.textColor = headerColour
        }
        //print(indexPath)
        return cell
    }
    
}

