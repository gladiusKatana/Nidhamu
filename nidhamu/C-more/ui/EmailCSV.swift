// EmailCSV         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit
import MessageUI

extension CollectionVC {
    
    func presentEmail() { //print("\n📪EMAIL\n")
        
        if emailComposer.canSendEmail() {
            
            emailComposer.emailComposeVC = emailComposer.configureEmailComposeVC()
            
            /*backgroundVC.view.backgroundColor = .white
            globalWindow.addSubview(backgroundVC.view)*/
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { ///Needs time, for configuration of email composer to complete, or top subject font can be seen resizing
                if currentOrientation == "portrait" {AppUtility.lockOrientation(.portrait)}
                if currentOrientation == "landscape" {AppUtility.lockOrientation(.landscape)} /// will change this current-orientation var to an enum case, not a string
                globalWindow.addSubview(emailComposer.emailComposeVC.view)
            }
        }
        else {
            let alert = UIAlertController(title: "Cannot Send Email", message: "Your device is not able to send email.\nNOTE: If you have not installed the default Mail application for iOS, try simply installing Mail from the App Store, then closing and re-opening this app.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func createArchiveUrl() -> URL {
        
        dateString = formattedDateString(Date(), roundedDown: false, showYear: true,
                                         prefix: "", suffix: "", dateFormat: .archiveCSVTitle)
        fileName = "Tagged events (\(dateString)).csv" ///don't insert a space after "as of" : formattedDateString(:) already builds one in
        
        var returnPath = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("☹️")
        if let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName) {
            
            var csvText = ""
            csvText.append("Description; Status; Date; Timestamp\n")
            
            var i = 0
            for _ in archiveEventDescriptions { /// Comma Separated Values is a misnomer, when exporting to Numbers : must separate columns by semicolon
                let timestamp = dateFromInts(archiveEventDateComponentArrays[i]).timeIntervalSince1970
                csvText.append("\(archiveEventDescriptions[i]);\(archiveEventStatusStrings[i]);\(archiveEventDateStrings[i]);\(timestamp)\n")
                i += 1
            }
            
            do {
                try csvText.write(to: path, atomically: true, encoding: String.Encoding.utf8)
            } catch {
                print("Failed to create csv file")
                print("\(error)")
            }
            
            returnPath = path
        }
            
        else {print("failed to create url")}
        
        return returnPath ?? NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("☹️")!
    }
}

