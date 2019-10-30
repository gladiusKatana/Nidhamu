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
            cell.backgroundColor = popupMenuLightGray
            cell.titleLabel.text = "Mark '\(globalTaskIdentifier)':"
            cell.titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        }
        else {
            cell.backgroundColor = platinum
            cell.titleLabel.text = TaskStatus.allCases[row].caseName()
            cell.titleLabel.textColor = .black
        }
        
        return cell
    }
}

