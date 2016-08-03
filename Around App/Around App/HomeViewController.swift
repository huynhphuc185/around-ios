//
//  HomeViewController.swift
//  Around
//
//  Created by phuc.huynh on 8/2/16.
//  Copyright © 2016 phuc.huynh. All rights reserved.
//

import UIKit
class HomeViewController: WithOutStatusBarViewController {
    @IBOutlet weak var sidebarButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "News";
        self.sidebarButton.target = self.revealViewController()
        self.sidebarButton.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    override func prefersStatusBarHidden() -> Bool {
        return false
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
