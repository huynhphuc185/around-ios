//
//  MainHomeViewController.swift
//  Around App
//
//  Created by phuc.huynh on 8/5/16.
//  Copyright © 2016 phuc.huynh. All rights reserved.
//

import UIKit

class MainHomeViewController: WithOutStatusBarViewController {

    
    @IBOutlet weak var viewPayment: UIView!
    @IBOutlet weak var viewHelp: UIView!
    @IBOutlet weak var viewOrder: UIView!
    @IBOutlet weak var viewStart: UIView!
    @IBOutlet weak var viewProfile: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewProfile.backgroundColor = UIColor(hex: "#363636")
//         viewOrder.backgroundColor = UIColor(hex: "#363636")
//         viewHelp.backgroundColor = UIColor(hex: "#363636")
//        viewPayment.backgroundColor = UIColor(hex: "#ebebeb")
//        viewStart.backgroundColor = UIColor(hex: "#ebebeb")
        
        
        // Do any additional setup after loading the view.
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
