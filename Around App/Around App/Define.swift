//
//  Define.swift
//  Around
//
//  Created by phuc.huynh on 8/2/16.
//  Copyright © 2016 phuc.huynh. All rights reserved.
//

import Foundation
let defaults = NSUserDefaults.standardUserDefaults()
let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
let storyboard = UIStoryboard(name: "Main", bundle: nil)
enum UIUserInterfaceIdiom : Int
{
    case Unspecified
    case Phone
    case Pad
}

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.mainScreen().bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.mainScreen().bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
}

var deviceTokenStr = ""
let menuItems = ["title", "news", "comments", "map", "calendar", "wishlist", "bookmark", "tag"];
let kSegueMenuTo1 = "seguemenuto1"
let kSegueMenuTo2 = "seguemenuto2"
let kSegueMenuTo3 = "seguemenuto3"
let kSegueMenuTo4 = "seguemenuto4"
let kSegueMenuTo5 = "seguemenuto5"


let kSegueLoginToHome = "logintohome"
let kSegueLoginToRegister = "logintoregister"
let kSegueRegisterToVerify = "registertoverify"
let kSegueVerifyToHome = "verifytohome"