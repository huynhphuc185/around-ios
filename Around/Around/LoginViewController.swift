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


    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        if (FBSDKAccessToken.current() != nil)
        {
            
            self.performSegue(withIdentifier: "logintohome", sender: nil)
            
        }
    }
    
    
    
    
    
    @IBAction func btnFBLoginPressed(sender: AnyObject) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager .logIn(withReadPermissions: ["public_profile", "email", "user_friends"], handler: { (result, error) -> Void in
            if (error == nil){
                if result!.isCancelled
                {
                    print("User Logged Out")
                }
                else if(result!.grantedPermissions.contains("email"))
                {
                     self.performSegue(withIdentifier: "logintohome", sender: nil)
                }
               
            }
        })
    }

    
    
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    
    func returnUserData()
    {
        let graphRequest: FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "email, first_name, last_name, gender, picture"])
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let userName : NSString = result?.value(forKey: "first_name") as! NSString
                print("User Name is: \(userName)")
                let userEmail : NSString = result?.value(forKey: "email") as! NSString
                print("User Email is: \(userEmail)")
            }
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
