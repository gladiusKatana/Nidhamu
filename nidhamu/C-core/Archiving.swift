// Archiving        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension PopupMenuVC {
    
    func addToArchives(_ eventBeingTagged: SimpleEvent) {
        if !archiveEvents.contains(eventBeingTagged) {
            archiveEvents.append(eventBeingTagged)
            
            archiveEventDescriptions.append(eventBeingTagged.eventDescription)
            archiveEventStatuses.append(eventBeingTagged.eventStatus.rawValue)
            archiveEventDateComponentArrays.append(getEventDateComponents(eventBeingTagged))
            
            archiveEventDateStrings.append(formattedDateString(eventBeingTagged.eventDate, roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .archiveFormat))
            let casename = eventBeingTagged.eventStatus.caseName()
            archiveEventStatusStrings.append(eventBeingTagged.eventStatus.caseName())   ; print("tagged as: \(casename)\n")
            
            archiveEvents.removeAll()
        }
    }
    
}

