//
//  RegisterPhoneNumberViewController.swift
//  Around
//
//  Created by phuc.huynh on 8/2/16.
//  Copyright © 2016 phuc.huynh. All rights reserved.
//
import Alamofire
import UIKit

class RegisterPhoneNumberViewController: UIViewController {

    @IBOutlet weak var txtNumberPhone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     @IBAction func btnSubmit(sender: AnyObject) {

        DataConnect.registerByPhoneNumber(txtNumberPhone.text!,onsuccess: { data in
           let result = data as! Int
            if result == 1
            {
               self.performSegueWithIdentifier("registertoverify", sender: nil)
            }
            
            })
        {
        }
        
        
      
      
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "registertoverify" {
                let vc = segue.destinationViewController as! VerifyOTPViewController
                vc.numberPhone = txtNumberPhone.text
            }
        }
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
