//
//  OrderFormViewController.swift
//  Around App
//
//  Created by phuc.huynh on 8/5/16.
//  Copyright © 2016 phuc.huynh. All rights reserved.
//

import UIKit

class OrderFormViewController: StatusbarViewController {
    @IBOutlet weak var tblViewCurrentLocation: UITableView!
    @IBOutlet weak var lblSerevicefee: UILabel!
    @IBOutlet weak var lblItemsCost: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var txtYourOrder: BottomLineTextfield!
    @IBOutlet weak var txtShopLocation: BottomLineTextfield!
    @IBOutlet weak var txtCurrentLocation: BottomLineTextfield!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtCurrentLocation.delegate = self
        txtShopLocation.delegate = self
        txtYourOrder.delegate = self
        txtYourOrder.inserttriangleImage()
        txtShopLocation.inserttriangleImage()
        txtCurrentLocation.inserttriangleImage()
        tblViewCurrentLocation.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
  
}
extension OrderFormViewController : UITextFieldDelegate
{
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        tblViewCurrentLocation.reloadData()
        tblViewCurrentLocation.hidden = false
        return false
    }
}
extension OrderFormViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tblViewCurrentLocation.dequeueReusableCellWithIdentifier("distanceCell") as! DistanceTableViewCell
        cell.lblTitle.text = "Miss AoDai Building"
        cell.lblDetail.text = "21 Nguyen Trung Ngan"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tblViewCurrentLocation.hidden = true
        txtCurrentLocation.text = "Miss AoDai Building"
        
    }
    
    
   
    
    
    
   
    
}
class DistanceTableViewCell : UITableViewCell
{
    static let identifier = "distanceCell"
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDetail: UILabel!
    
}
