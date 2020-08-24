// TestSquare       ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit

func drawTestSquare() { /// for testing purposes only: to verify calculation/recalculation of navbar height + status bar height, dynamically
    
    testRectanglelayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: statusBarHeight + navBarHeight,
                                                               width: 4, height: 4), cornerRadius: 0).cgPath
    let randNum = randomNumber(inRange: 1...7) - 1
    testRectanglelayer.fillColor = randomColours[randNum]
    globalWindow.layer.addSublayer(testRectanglelayer)
    
    //print("drawing rect clr[\(randNum)] @ (\(statusBarHeight + navBarHeight)\n")
}


public func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
    
    let length = Int64(range.upperBound - range.lowerBound + 1)
    let value = Int64(arc4random()) % length + Int64(range.lowerBound)
    
    return T(value)
}

