//
//  LoginViewController.swift
//  Around
//
//  Created by phuc.huynh on 8/1/16.
//  Copyright © 2016 phuc.huynh. All rights reserved.
//

import UIKit
import FBSDKLoginKit
class LoginViewController: WithOutStatusBarViewController {
    
    @IBOutlet weak var constrainTopLogo: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if DeviceType.IS_IPHONE_4_OR_LESS
        {
            constrainTopLogo.constant = 65
        }
        else if DeviceType.IS_IPHONE_5
        {
            constrainTopLogo.constant = 75
        }
        
        self.view.needsUpdateConstraints()
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
   
    override func viewDidAppear(animated: Bool) {
        
        
    }
    
    
    @IBAction func btnFBLoginPressed(sender: AnyObject) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logInWithReadPermissions(["public_profile", "email", "user_friends"]) { (result, error) in
            if (error == nil){
                if result!.isCancelled
                {
                    print("User Logged Out")
                }
                else if(result!.grantedPermissions.contains("email"))
                {
                    self.returnUserData()
                    
                    
                }
                
            }
        }
    }
    
    func returnUserData()
    {
        let graphRequest: FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "email, first_name, last_name, gender, picture"])
        
        
        
        
        graphRequest.startWithCompletionHandler { (connection, result, error) in
            if ((error) != nil)
            {
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                    let first_Name  = result.valueForKey("first_name") as! String
                    let last_name  = result.valueForKey("last_name") as! String
                    let email  = result.valueForKey("email") as! String
                    let fbID  = result.valueForKey("id") as! String
                let avatarURL  = result.valueForKey("picture")?.valueForKey("data")?.valueForKey("url") as! String
                
                let profileUser = ProfileUser(fb_id: fbID, user_name: last_name + first_Name , avatarImageURL: avatarURL,email: email)
                self.performSegueWithIdentifier(kSegueLoginToRegister, sender: profileUser)
            }
            
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == kSegueLoginToRegister {
                if let profile = sender as? ProfileUser {
                    let vc = segue.destinationViewController as! RegisterPhoneNumberViewController
                    vc.profileUser  = profile
                }
                
            }
            
            
        }

        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
