// Archiving        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

extension PopupMenuVC {
    
    func addToArchives(_ taskBeingTagged: SimpleTask) {     print("adding task '\(taskBeingTagged.taskDescription)' to archives")
        
        if !archiveTasks.contains(taskBeingTagged) {
            archiveTasks.append(taskBeingTagged)
            
            archiveTaskDescriptions.append(taskBeingTagged.taskDescription)
            archiveTaskStatuses.append(taskBeingTagged.taskStatus.rawValue)
            archiveTaskStatusStrings.append(taskBeingTagged.taskStatus.caseName())
            archiveTaskDateComponentArrays.append(getArchiveTaskDateComponents(taskBeingTagged))
            
            archiveTaskDateStrings.append(formattedDateString(taskBeingTagged.deadline, roundedDown: false, showYear: true, prefix: "", suffix: "", dateFormat: .archiveFormat))
            
            ///let casename = taskBeingTagged.taskStatus.caseName()         ; print("archived: \(casename)\n")
            
            archiveTasks.removeAll()
        }
    }
}

