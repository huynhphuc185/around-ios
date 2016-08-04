//
//  ProfileUser.swift
//  Around App
//
//  Created by phuc.huynh on 8/4/16.
//  Copyright © 2016 phuc.huynh. All rights reserved.
//

import UIKit

class ProfileUser: NSObject {
    var fb_id : String
    var user_name : String
    var avatarImageURL : String
    var email : String
    init(fb_id : String,user_name : String,avatarImageURL : String, email : String){
        self.fb_id = fb_id
        self.user_name = user_name
        self.avatarImageURL = avatarImageURL
        self.email = email
    }

}

