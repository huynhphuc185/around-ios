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
                    self.performSegueWithIdentifier(kSegueLoginToRegister, sender: nil)
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
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                //                let userName : NSString = result?.value(forKey: "first_name") as! NSString
                //                print("User Name is: \(userName)")
                //                let userEmail : NSString = result?.value(forKey: "email") as! NSString
                //                print("User Email is: \(userEmail)")
            }
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
