// Archiving        ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit; import MessageUI

extension PopupMenuVC {
    
    func addToArchives(_ taskBeingTagged: SimpleTask) {
        /*var str = ""
         if taskBeingTagged.taskStatus == .deferred {str = " (deferred)"}
         print("adding task '\(taskBeingTagged.taskDescription)' to archives\(str)")*/
        if !archiveTasks.contains(taskBeingTagged) {
            
            archiveTasks.append(taskBeingTagged)
            archiveTaskDescriptions.append(taskBeingTagged.taskDescription)
            
            archiveTaskStatuses.append(taskBeingTagged.taskStatus.rawValue)
            archiveTaskStatusStrings.append(taskBeingTagged.taskStatus.caseName())
            
            archiveTaskDateComponentArrays.append(getArchiveTaskDateComponents(taskBeingTagged))
            archiveTaskDateStrings.append(formattedDateString(taskBeingTagged.deadline, roundDown: false,
                                                              showYear: true, prefix: "", suffix: "", dateFormat: .archiveFormat))
            ///let casename = taskBeingTagged.taskStatus.caseName()         ; print("archived: \(casename)\n")
            archiveTasks.removeAll()
        }
    }
}

func updateArchiveRelatedData(result: MFMailComposeResult) {
    if result == .sent {
        lastArchiveEmailDate = Date()
        deleteArchivesLocally()
        defaultSaveData(saveDate: false, resetLastLogin: false, showDate: true, pryntTasks: false)
        topVC.reloadCV()
        /*DispatchQueue.main.asyncAfter(deadline: .now() + 0.25 ) {
         topVC.gotoView(vc: timetableVC)
         }*/
    }
}

func deleteArchivesLocally() {
    archiveTaskDescriptions.removeAll()
    archiveTaskStatuses.removeAll();            archiveTaskStatusStrings.removeAll()
    archiveTaskDateComponentArrays.removeAll()
}

func getArchiveTaskDateComponents(_ task: SimpleTask) -> [Int] {
    let (year, monthInt, _, _ , day, _, _, hour, _, _) = getChosenDateComponents(task.deadline, roundedDown: false)
    return [year, monthInt, day, hour]
}

