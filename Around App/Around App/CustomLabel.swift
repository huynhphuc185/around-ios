//
//  CustomLabel.swift
//  Around App
//
//  Created by phuc.huynh on 8/5/16.
//  Copyright © 2016 phuc.huynh. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        useUnderline()
    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
        useUnderline()
    }
    
    func useUnderline() {
        
      
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, self.frame.size.height)
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    
}
