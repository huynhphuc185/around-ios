//
//  Function.swift
//  Soroeru
//
//  Created by Phuc Huynh on 3/21/16.
//  Copyright © 2016 soroeru.inc. All rights reserved.
//

import Foundation

func sortCaseInsensitive(values:[Int]) -> [Int]{
    
    let sortedValues = values.sort({ (value1, value2) -> Bool in
        
        if (value1 < value2) {
            return true
        } else {
            return false
        }
    })
    return sortedValues
}
func convertFromStringToFloat(string: String) -> Float
{
    let numberFormatter = NSNumberFormatter()
    let number = numberFormatter.numberFromString(string)
    let numberFloatValue = number!.floatValue
    return numberFloatValue
}
func findKeyForValueArray(value: String, dictionary: [String: [String]]) ->String?
{
    for (key, array) in dictionary
    {
        if (array.contains(value))
        {
            return key
        }
    }
    
    return nil
}

func findKeyForValueString(value: String, dictionary: [String: String]) ->String?
{
    for (key, element) in dictionary
    {
        if element == value{
            return key
        }
    }
    
    return nil
}


func convertStringToDictionary ( text : String) -> [String:AnyObject]? {
    if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String:AnyObject]
            return json
        } catch {
            print("Something went wrong")
        }
    }
    return nil
}



func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {
    
    let contextImage: UIImage = UIImage(CGImage: image.CGImage!)
    
    let contextSize: CGSize = contextImage.size
    
    var posX: CGFloat = 0.0
    var posY: CGFloat = 0.0
    var cgwidth: CGFloat = CGFloat(width)
    var cgheight: CGFloat = CGFloat(height)
    
    // See what size is longer and create the center off of that
    if contextSize.width > contextSize.height {
        posX = ((contextSize.width - contextSize.height) / 2)
        posY = 0
        cgwidth = contextSize.height
        cgheight = contextSize.height
    } else {
        posX = 0
        posY = ((contextSize.height - contextSize.width) / 2)
        cgwidth = contextSize.width
        cgheight = contextSize.width
    }
    
    let rect: CGRect = CGRectMake(posX, posY, cgwidth, cgheight)
    
    // Create bitmap image from context using the rect
    let imageRef: CGImageRef = CGImageCreateWithImageInRect(contextImage.CGImage, rect)!
    
    // Create a new image based on the imageRef and rotate back to the original orientation
    let image: UIImage = UIImage(CGImage: imageRef, scale: image.scale, orientation: image.imageOrientation)    
    return image
}

func convertCurrentDate() -> String {
    let currentDate = NSDate()
    
    //Get day of week
    let cal = NSCalendar.currentCalendar()
    let weeks = ["日曜","月曜","火曜","水曜","木曜","金曜","土曜"]
    
    let comp = cal.components(NSCalendarUnit.Weekday, fromDate: currentDate)
    let weekIdx = comp.weekday
    
    //Get date
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "YYYY/MM/dd"
    let dateString = dateFormatter.stringFromDate(currentDate)
    let dateComponent = dateString.componentsSeparatedByString("/")
    let str1 = dateComponent[0]+"年"
    let str2 = dateComponent[1]+"月"
    let str3 = dateComponent[2]+"日"
    
    return str1 + str2 + str3 + "  " + weeks[weekIdx - 1] + "日"
}

func convertCurrentDateWithOutDay() -> String {
    let currentDate = NSDate()
    //Get date
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "YYYY/MM/dd"
    let dateString = dateFormatter.stringFromDate(currentDate)
    let dateComponent = dateString.componentsSeparatedByString("/")
    let str1 = dateComponent[0]+"年"
    let str2 = dateComponent[1]+"月"
    let str3 = dateComponent[2]+"日"
    
    return str1 + str2 + str3
}

func covertToJapanDate(time : String) -> String
{
    let toArray = time.componentsSeparatedByString("-")
    let str1 = toArray[0]+"年"
    let str2 = toArray[1]+"月"
    let str3 = toArray[2]+"日"
    let str4 = str1+str2+str3
    return str4
}

func deviceID() ->String
{
    let device : UIDevice = UIDevice.currentDevice()
    return (device.identifierForVendor?.UUIDString)!
}



func attributeForTitleTV(titleText : String) -> NSAttributedString{
    let style = NSMutableParagraphStyle()
    style.lineSpacing = 6
    style.lineBreakMode = .ByTruncatingTail
    let attribute = [NSParagraphStyleAttributeName : style]
    
    return NSAttributedString(string: titleText, attributes: attribute)
}


func uniq<S: SequenceType, E: Hashable where E==S.Generator.Element>(source: S) -> [E] {
    var seen: [E:Bool] = [:]
    return source.filter({ (v) -> Bool in
        return seen.updateValue(true, forKey: v) == nil
    })
}

func appUpdateAvailable(storeInfoURL: String) -> Bool
{
    var upgradeAvailable = false
    
    // Get the main bundle of the app so that we can determine the app's version number
    let bundle = NSBundle.mainBundle()
    if let infoDictionary = bundle.infoDictionary {
        // The URL for this app on the iTunes store uses the Apple ID for the  This never changes, so it is a constant
        let urlOnAppStore = NSURL(string: storeInfoURL)
        if let dataInJSON = NSData(contentsOfURL: urlOnAppStore!) {
            // Try to deserialize the JSON that we got
            if let lookupResults = try? NSJSONSerialization.JSONObjectWithData(dataInJSON, options: NSJSONReadingOptions()) {
                // Determine how many results we got. There should be exactly one, but will be zero if the URL was wrong
                if let resultCount = lookupResults["resultCount"] as? Int {
                    if resultCount == 1 {
                        // Get the version number of the version in the App Store
                        if let appStoreVersion = lookupResults["results"]!![0]["version"] as? String {
                            // Get the version number of the current version
                            if let currentVersion = infoDictionary["CFBundleShortVersionString"] as? String {
                                // Check if they are the same. If not, an upgrade is available.
                                if appStoreVersion != currentVersion {
                                    upgradeAvailable = true
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    return upgradeAvailable
}



func isCheckControllerAlreadyOnNavigationStack(views : [UIViewController] , vc : AnyClass) -> Bool
{

    for (var i = 0; i < views.count ; i++)    {
        if (views[i].isKindOfClass(vc))
        {
            return true
            break
        }
        
        
    }

    return false
    
}


func showAlert(title : String, message : String, sender : UIViewController) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
    sender.presentViewController(alert, animated: true, completion: nil)
}


extension Array {
    func splitBy(subSize: Int) -> [[Element]] {
        return 0.stride(to: self.count, by: subSize).map { startIndex in
            let endIndex = startIndex.advancedBy(subSize, limit: self.count)
            return Array(self[startIndex ..< endIndex])
        }
    }
}//func switchRootView(vc: UIViewController)
//{
////
////    let  storyboard = UIStoryboard(name: "Main", bundle: nil)
////    let vcTop = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
////    
////    let leftViewController = storyboard.instantiateViewControllerWithIdentifier("LeftViewController") as! LeftViewController
////    let nvc: UINavigationController = UINavigationController(rootViewController: vcTop)
////    leftViewController.mainViewController = nvc
////    let slideMenuController = ExSlideMenuController(mainViewController: vcTop, leftMenuViewController: leftViewController)
////    appDelegate.mainNav = UINavigationController(rootViewController: slideMenuController)
//    
//    
//    
//    
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let mainViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
//   
//    
//    for (index, element) in (appDelegate.mainNav?.viewControllers.enumerate())!
//    {
//        if index == 0
//        {
//            let leftViewController = storyboard.instantiateViewControllerWithIdentifier("LeftViewController") as! LeftViewController
//            let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
//            leftViewController.mainViewController = nvc
//            (element as! ExSlideMenuController).leftViewController = leftViewController
//            (element as! ExSlideMenuController).mainViewController = mainViewController
//        }
//        else
//        {
//            appDelegate.mainNav?.viewControllers.removeAtIndex(index)
//        }
//    }
//    
//     vc.presentViewController(mainViewController, animated: false, completion: nil)
//    
//
//    
//    
//
//}
