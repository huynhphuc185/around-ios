//
//  DefaultNavigation.swift
//  Around App
//
//  Created by phuc.huynh on 8/4/16.
//  Copyright © 2016 phuc.huynh. All rights reserved.
//

import UIKit

class DefaultNavigation: UINavigationBar {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setBackgroundImage(UIImage(named: "navigation.jpg"), forBarMetrics : .Default)
    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.setBackgroundImage(UIImage(named: "navigation.jpg"), forBarMetrics : .Default)
    }

}
