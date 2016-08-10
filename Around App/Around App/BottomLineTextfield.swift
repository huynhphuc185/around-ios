//
//  BottomLineTextfield.swift
//  Around App
//
//  Created by phuc.huynh on 8/4/16.
//  Copyright © 2016 phuc.huynh. All rights reserved.
//

import UIKit

class BottomLineTextfield: UITextField {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        useUnderline()
        paddingLeft()
    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
        useUnderline()
        paddingLeft()
    }
    
    func paddingLeft()
    {
        let paddingView = UIView(frame: CGRectMake(0, 0, 5, self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = UITextFieldViewMode.Always
        
        
        
    }
    func useUnderline() {
        
        if let strPlaceholder = self.placeholder
        {
            self.attributedPlaceholder = NSAttributedString(string:strPlaceholder,
                                                            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        }
        self.textColor = UIColor.whiteColor()
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, self.frame.size.height)
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        self.borderStyle = .None
    }
    func inserttriangleImage()
    {
        self.rightViewMode = .Always
        
        let imageArrow = UIImageView(frame: CGRectMake(0, 0, 15, 15))
        imageArrow.image = UIImage(named: "downarrow")
        
        
        self.rightView = imageArrow
    }
}
