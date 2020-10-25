// DateText         ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func testForCellBannerNotification(_ cell: BaseCell, row: Int, col: Int, notificationColour: UIColor?, notificationText: String?) {
    var weight = UIFont.Weight.light
    let str = dateHeaderCellNotification(Date())
    
    if str != "" && (0...1).contains(row) && col > 0 {cell.backgroundColor = dimOrange} /// highlights DST notification same colour as the now-cell
    if (col, row) == (7,0) {
        cell.titleLabel.text = formattedDateString(lastLoginDate, roundDown: false, showYear: true,
                                                   prefix: " Last Login", suffix: " ", dateFormat: .fullDayShortWithMins)
        cell.titleLabel.textColor = graySeven
        if str != "" {weight = .light}
    } else if (col, row) == (7,1) {
        dstNotificationCellPath = (col, row)
        cell.titleLabel.text = str
        cell.titleLabel.textColor = darkNavy; weight = .medium
    } else {
        if notificationColour != nil && notificationText != nil {
            cell.titleLabel.textColor = notificationColour; cell.titleLabel.text = notificationText
        }
    }
    
    if textFieldDisplayed && currentOrientation == "landscape" {
        cell.titleLabel.font = UIFont.systemFont(ofSize: CGFloat(8), weight: weight)
    }
    else {cell.titleLabel.font = UIFont.systemFont(ofSize: CGFloat(12), weight: weight)}
}

/// creates a string notifying if input date is a daylight-savings date, OR if user has not backed up past-task archives in > 30 days
func dateHeaderCellNotification(_ date: Date) -> String {
    let fbk = (truncateMins(date) != truncateMins(fallBackDate)) ? "" :
        "🌖 Daylight Savings (fall-back): the 1am time-block lasts for 2 hours "
    let spf = (truncateMins(date) != truncateMins(springForwardDate)) ? "" :
        "🌔 Daylight Savings (spring-forward): the 2am time-block gets skipped "  //(1:59→ 3:00)"
    var archiveIntervalNotification = ""
    let daysSinceLastArchiveEmail = Int(Date().timeIntervalSince(lastArchiveEmailDate) / 86400)
    
    if daysSinceLastArchiveEmail >= 30
        && archiveTaskDescriptions.count > 0
        && fbk == "" && spf == ""
    {
        archiveIntervalNotification = "⌛️Note: Archives were last updated \(daysSinceLastArchiveEmail) days ago... " //⭐️
    }
    return "\(fbk)\(spf)\(archiveIntervalNotification)"
}

