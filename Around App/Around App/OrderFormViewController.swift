//
//  OrderFormViewController.swift
//  Around App
//
//  Created by phuc.huynh on 8/5/16.
//  Copyright © 2016 phuc.huynh. All rights reserved.
//

import UIKit
import GoogleMaps
class OrderFormViewController: StatusbarViewController {
    @IBOutlet weak var tblViewDelivery: UITableView!
    @IBOutlet weak var tblViewCurrentLocation: UITableView!
    @IBOutlet weak var lblSerevicefee: UILabel!
    @IBOutlet weak var lblItemsCost: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var txtYourOrder: BottomLineTextfield!
    @IBOutlet weak var txtShopLocation: BottomLineTextfield!
    @IBOutlet weak var txtCurrentLocation: BottomLineTextfield!
    var resultsArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        txtYourOrder.inserttriangleImage()
        txtShopLocation.inserttriangleImage()
        txtCurrentLocation.inserttriangleImage()
        
        tblViewCurrentLocation.hidden = true
        tblViewDelivery.hidden = true
        txtCurrentLocation.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        
        txtShopLocation.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
    }


    func textFieldDidChange(textField: UITextField) {
        if textField.tag == 1
        {
            tblViewCurrentLocation.hidden = false
            let placeClient = GMSPlacesClient()
            placeClient.autocompleteQuery(textField.text!, bounds: nil, filter: nil) { (results, error: NSError?) -> Void in
                
                self.resultsArray.removeAll()
                if results == nil {
                    return
                }
                
                for result in results! {
                    if let result = result as? GMSAutocompletePrediction {
                        self.resultsArray.append(result.attributedFullText.string)
                    }
                }
                
                // self.searchResultController.reloadDataWithArray(self.resultsArray)
                self.tblViewCurrentLocation.reloadData()
            }

        }
        else if textField.tag == 2
        {
            tblViewDelivery.hidden = false
            let placeClient = GMSPlacesClient()
            placeClient.autocompleteQuery(textField.text!, bounds: nil, filter: nil) { (results, error: NSError?) -> Void in
                
                self.resultsArray.removeAll()
                if results == nil {
                    return
                }
                
                for result in results! {
                    if let result = result as? GMSAutocompletePrediction {
                        self.resultsArray.append(result.attributedFullText.string)
                    }
                }
                self.tblViewDelivery.reloadData()
            }

        }
        else if textField.tag == 3
        {
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
  
}
extension OrderFormViewController : UITextFieldDelegate
{
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
        
    }
}
extension OrderFormViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tblViewCurrentLocation.dequeueReusableCellWithIdentifier("distanceCell") as! DistanceTableViewCell
        cell.lblTitle.text = self.resultsArray[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView.tag == 1
        {
            tableView.hidden = true
            txtCurrentLocation.text = self.resultsArray[indexPath.row]
        }
        else if tableView.tag == 2
        {
            tableView.hidden = true
            txtShopLocation.text = self.resultsArray[indexPath.row]
        }
        
    }
    
    
    
}
extension OrderFormViewController : UITextViewDelegate
{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true
    }
   }
class DistanceTableViewCell : UITableViewCell
{
    static let identifier = "distanceCell"
    
    @IBOutlet weak var lblTitle: UILabel!
    
    
}
