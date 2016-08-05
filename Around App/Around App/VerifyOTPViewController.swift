//
//  VerifyOTPViewController.swift
//  Around App
//
//  Created by phuc.huynh on 8/3/16.
//  Copyright © 2016 phuc.huynh. All rights reserved.
//

import UIKit

class VerifyOTPViewController: WithOutStatusBarViewController {

    @IBOutlet weak var txtOTP: UITextField!
    var profileUser : ProfileUser?
    var numberPhone : String!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        
      @IBAction func btnSubmit(sender: AnyObject) {
        
        DataConnect.verifyOTP(numberPhone,otpCode: txtOTP.text!,onsuccess: { data in
            let result = data as! String
            if result == "success"
            {
                if self.profileUser != nil{
                    let token = defaults.valueForKey("token") as! String
                    DataConnect.updateProfile(self.numberPhone, token: token, profileUser: self.profileUser!, onsuccess: { (result) in
                        
                        }, onFailure: {
                            
                    })
                }
                
               
                self.performSegueWithIdentifier(kSegueVerifyToHome, sender: nil)
            }
            })
        {
            showAlert("", message: "Error OTP", sender: self)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
