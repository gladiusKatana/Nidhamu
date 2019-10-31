//// SendMsg          ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
//import UIKit
//import MessageUI
//
//extension CollectionVC {


//    func sendArchiveAsCsv() {             /// first (less optimal) way of sending an email / message, using a UIActivityViewController

    
//        let dateString = formattedDateString(lastLoginDate, roundedDown: false, showYear: true,
//                                             prefix: "", suffix: "", dateFormat: .archiveCSVTitle)
//        
//        let fileName = "Tagged tasks (\(dateString)).csv" ///don't insert a space after "as of" : formattedDateString(:) already builds one in
//        guard let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName) else {
//            print("failed to create url")
//            return
//        }
//        var csvText = ""
//        
//        csvText.append("Description, Status, Date\n")
//        
//        var i = 0
//        for _ in archiveTaskDescriptions {
//            csvText.append("\(archiveTaskDescriptions[i]),\(archiveTaskStatusStrings[i]),\(archiveTaskDateStrings[i])\n")
//            i += 1
//        }
//        
//        do {
//            try csvText.write(to: path, atomically: true, encoding: String.Encoding.utf8)
//        } catch {
//            print("Failed to create csv file")
//            print("\(error)")
//        }
//        
//        let vc = UIActivityViewController(activityItems: [path], applicationActivities: [])
//        
//        present(vc, animated: true, completion: nil)
//        
//        vc.excludedActivityTypes = [
//            UIActivity.ActivityType.assignToContact,// is this applicable here anyway?
//            UIActivity.ActivityType.saveToCameraRoll,
//            UIActivity.ActivityType.postToFlickr,
//            UIActivity.ActivityType.postToVimeo,
//            UIActivity.ActivityType.postToTencentWeibo,
//            UIActivity.ActivityType.postToTwitter,
//            UIActivity.ActivityType.postToFacebook,
//            UIActivity.ActivityType.openInIBooks
//        ]
//    }
//}
//
