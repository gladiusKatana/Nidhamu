// Tap              ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {                            ///print("tapped tt cell")
        
        let layout = downcastLayout!;  let row = indexPath.item;  let column = indexPath.section
        if row >= layout.lockedHeaderRows && column >= layout.lockedHeaderSections {
            
            let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
            ///print("\nselected date (unformatted gmt)  \(cell.cellDate)")     ///print(formattedDateString(cell.cellDate, roundedDown: false, prefix: "                 (formatted)    ", suffix: "", short: false))
            
            selectedCellDate = cell.cellDate                                                                                        //➕
            selectedTimeBlockDateDescription = formattedDateString(selectedCellDate, roundedDown: true, showYear: false, prefix: " Add an Event", suffix: "", dateFormat: .fullDayShortForm) // ! probably needs smaller font on iPhone SEs in portrait
            
            switch vcType {
            case .hours:
                
                selectedTimeBlockPath = [column, row]                                               ///; print("selected time block path \(selectedTimeBlockPath)")
                timeBlock = TimeBlock(values:(column, row))
                
                if eventsAtIndexPath[timeBlock] == nil || textFieldDisplayed {
                    
                    if previousTimeBlockPathSelected == defaultPathOutOfView {
                        previousTimeBlockPathSelected = selectedTimeBlockPath
                        
                        ///setNavBarTitle(customString: " Add an Event (Tap Done to quit)")                                                           // may not use.  Gives User too much extra stuff to look at?
                        animateTimeBlockTappedToAddEvent(cell: cell)                                /// may not use. Looks nice; slows User down a little bit?
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            self.prepareAndPresentTextField(dateString: selectedTimeBlockDateDescription)
                        }
                    }
                    else {
                        cell.backgroundColor = eventAddingColour
                        prepareAndPresentTextField(dateString: selectedTimeBlockDateDescription)
                    }
                    ///see (*) re. animation-logic, below
                } else {
                    if let events = eventsAtIndexPath[timeBlock] {todoListVC.downcastLayout!.rows = events.count}
                    gotoView(vc: todoListVC)
                }
                
            case .todoList:     prepareAndPresentTextField(dateString: selectedTimeBlockDateDescription)
            case .archive:      sendArchiveAsCsv()
            default: print("unrecognized collection view type's cell selected")}
        }///else {print("selected navbar-embeddd vc's header")}
    }
    
    func sendArchiveAsCsv() {
        
        let dateString = formattedDateString(lastLoginDate, roundedDown: false, showYear: true,
                                             prefix: "", suffix: "", dateFormat: .archiveCSVTitle)
        
        let fileName = "Tagged events (\(dateString)).csv" ///don't insert a space after "as of" : formattedDateString(:) already builds one in
        guard let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName) else {
            print("failed to create url")
            return
        }
        var csvText = ""
        
        
        csvText.append("Description, Status, Date\n")
        
        var i = 0
        for _ in archiveEventDescriptions {
            csvText.append("\(archiveEventDescriptions[i]),\(archiveEventStatusStrings[i]),\(archiveEventDateStrings[i])\n")
            i += 1
        }
        
        do {
            try csvText.write(to: path, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Failed to create csv file")
            print("\(error)")
        }
        
        let vc = UIActivityViewController(activityItems: [path], applicationActivities: [])
        present(vc, animated: true, completion: nil)
        
        vc.excludedActivityTypes = [
            //UIActivity.ActivityType.assignToContact,// is this applicable here anyway?
            //UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToTencentWeibo,
            UIActivity.ActivityType.postToTwitter,
            UIActivity.ActivityType.postToFacebook,
            //UIActivity.ActivityType.openInIBooks
        ]
    }
}

//(*)

/*if row >= 18 {
 if !textFieldDisplayed {presentTextField(after: 1, dateString: selectedTimeBlockDateDescription)}
 else {presentTextField(after: 0, dateString: selectedTimeBlockDateDescription)}
 } else {presentTextField(after: 0, dateString: selectedTimeBlockDateDescription)}*/
