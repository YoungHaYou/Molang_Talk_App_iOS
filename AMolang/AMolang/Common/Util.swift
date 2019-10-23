//
//  Util.swift
//  AMolang
//
//  Created by 유영하 on 01/10/2019.
//  Copyright © 2019 유영하. All rights reserved.
//

import UIKit





class Util: NSObject {
    
    
    class func diffAppVersion(server_version:String) -> ComparisonResult
    {
        
        let current = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        let appStore = server_version
        
        let versionCompare = current.compare(appStore, options: .numeric)
        if versionCompare == .orderedSame {
            print("same version")
        } else if versionCompare == .orderedAscending {
            // will execute the code here
            print("ask user to update")
        } else if versionCompare == .orderedDescending {
            // execute if current > appStore
            print("don't expect happen...")
        }
        
        return versionCompare
    }
    
    
    
    class func saveId(string:String){
        UserDefaults.standard.set(string, forKey: "start_id")
    }
    
    class func loadId() ->String{
        let data = UserDefaults.standard.string(forKey: "start_id") ?? ""
        return data
    }
    
    class func saveAuth(string:String){
        UserDefaults.standard.set(string, forKey: "start_auth")
    }
    
    class func loadAuth() ->String{
        let data = UserDefaults.standard.string(forKey: "start_auth") ?? ""
        return data
    }
    
    
}
