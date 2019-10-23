

import UIKit
import Alamofire


let API = APINetwork()


class APINetwork: NSObject {

    
//    static let shared : APINetwork = {
//        let instance = APINetwork()
//
//        return instance
//    }()
//
    
    var url = ""
    var method : HTTPMethod = .get
    var parameters:[String : Any] = [:]
    var encoding:ParameterEncoding = URLEncoding.default
    
    func requestAPI(completion: @escaping (Bool , String) -> Void)
    {

        print("url::::::")
        print(self.url)
        print("param::::::")
        print(self.parameters)
        
        if self.url == ""
        {
            
            completion(false , "")
            return
        }
        

        Alamofire.request(SERVER_API_DOMAIN + self.url , method:self.method , parameters: self.parameters , encoding: self.encoding , headers: [:])
            .responseJSON { response in
                print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization



                if response.response?.statusCode == 200
                {
                    if let json = response.result.value {
                        print("JSON: \(json)")

                        let jsonString = String(decoding: response.data!, as: UTF8.self)

                        completion(true , jsonString)
                    }
                    else
                    {
                        completion(false , "")
                    }
                }
                else
                {
                    completion(false , "")
                }

        }
    }
    
}
