

import UIKit

import Alamofire




class APINetwork: NSObject {

    
    
    
    
    static let shared : APINetwork = {
        let instance = APINetwork()
        
        return instance
    }()
    
    
    
    
    
    func requestAPI(completion: @escaping ([Bool]?) -> Void)
    {

        
        Alamofire.request("https://httpbin.org/get" , method:.get , parameters: ["foo": "bar"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        
        
        
    }
    
    

    
    
    
    
}
