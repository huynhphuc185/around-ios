

import UIKit
import Alamofire

class DataConnect {
    
    static let loginURL = "http://api.mapp.vn/register/login"
    static let verifyOTPURL = "http://api.mapp.vn/register/verify"
    static let updateProfileURL = "http://api.mapp.vn/register/userupdate"
    
    typealias onSuccess = (result : AnyObject)->()
    typealias onFailed = () -> ()
    
    class func registerByPhoneNumber (numberPhone : String ,onsuccess : onSuccess , onFailure: onFailed )
    {
        let parameters = [
            "action": "login",
            "phone": numberPhone,
            "deviceid": deviceID(),
            "devicetoken": deviceID()
            ]
        
        Alamofire.request(.POST,loginURL , parameters:parameters ).responseJSON { response in
            
            switch response.result {
            case .Success:
                if let JSON = response.result.value
                {
                    onsuccess(result: JSON.valueForKey("code")!)
                }
            case .Failure(let error):
                print(error)
                onFailure()
            }
            
            
            
            
            
        }
    }
    
    
    class func updateProfile (numberPhone : String ,token : String, profileUser: ProfileUser ,onsuccess : onSuccess , onFailure: onFailed )
    {
        let parameters = [
            "action": "updateinfo",
            "phone": numberPhone,
            "deviceid": deviceID(),
            "devicetoken": deviceID(),
            "token": token,
            "username" : profileUser.user_name,
            "avatarurl" : profileUser.avatarImageURL,
            "email" : profileUser.email,
            "fbid" : profileUser.fb_id
        ]
        
        Alamofire.request(.POST,updateProfileURL , parameters:parameters ).responseJSON { response in
            
            switch response.result {
            case .Success:
                if let JSON = response.result.value
                {
                    if JSON.valueForKey("code") as! Int == 1
                    {
                        onsuccess(result: "success")
                    }
                    else{
                         onFailure()
                    }
                }
            case .Failure(let error):
                
                onFailure()
                print(error)
            }
            
            
            
            
            
        }
    }
    
    
    
    class func verifyOTP (numberPhone : String ,otpCode : String ,onsuccess : onSuccess , onFailure: onFailed )
    {
        let parameters = [
            "action": "verify",
            "phone": numberPhone,
            "otp" : otpCode,
            "deviceid": deviceID(),
            "devicetoken": deviceID()
        ]
        
        Alamofire.request(.POST,verifyOTPURL , parameters:parameters ).responseJSON { response in
            
            switch response.result {
            case .Success:
                if let JSON = response.result.value
                {
                    if JSON.valueForKey("code") as! Int == 1
                    {
                        defaults.setObject(JSON.valueForKey("data")?.valueForKey("token") as! String , forKey: "token")
                        onsuccess(result: "success")
                    }
                    else{
                        onFailure()
                    }
                }
            case .Failure(let error):
                
                onFailure()
                print(error)
            }
            
            
            
            
            
        }
    }
    

}
