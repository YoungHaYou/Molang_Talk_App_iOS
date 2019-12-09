

import UIKit
import Alamofire


let API = APINetwork()


enum APIResult<T> {
    case success(T)
    case failure(ErrorModel)
    
}


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
    var header:[String:String] = [
                                    "Content-Type":"application/x-www-form-urlencoded",
                                    "accept":"application/json",
//                                    "Authorization":Util.loadAuth()
                                    "Authorization":Util.loadAuth()
                                    ]
    
    func requestAPI(completion: @escaping (Bool , String) -> Void)
    {

        print("url::::::")
        print(SERVER_API_DOMAIN)
        print(self.url)
        print("param::::::")
        print(self.parameters)
        print("header::::::")
        print(self.header)

        if self.url == ""
        {
            completion(false , "")
            return
        }

        Alamofire.request(SERVER_API_DOMAIN + self.url , method:self.method , parameters: self.parameters , encoding: self.encoding , headers: self.header)
            .responseJSON { response in
                print("start")
                print(response.request?.allHTTPHeaderFields)  // original URL request
//                print(response.response.debugDescription) // URL response
//                print(response.data?.base64EncodedString())     // server data
//                print(response.result)   // result of response serialization

                if self.method == .post
                {print("POST")}
                else if self.method == .get
                {print("GET")}
                else if self.method == .put
                {print("PUT")}
                else if self.method == .delete
                {print("DELETE")}

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
                    let jsonString = String(decoding: response.data!, as: UTF8.self)
                    print("Error Code :\(response.response?.statusCode)")
                    print("Error Code :\(jsonString)")
                    completion(false , jsonString)
                }

        }
    }
    
    
    
    

        func requestAPI(completion: @escaping (APIResult<String>) -> Void)
        {

            print("url::::::")
            print(SERVER_API_DOMAIN)
            print(self.url)
            print("param::::::")
            print(self.parameters)
            print("header::::::")
            print(self.header)

            if self.url == ""
            {
                let e = ErrorModel()
                return completion(.failure(e))

            }

            Alamofire.request(SERVER_API_DOMAIN + self.url , method:self.method , parameters: self.parameters , encoding: self.encoding , headers: self.header)
                .responseJSON { response in
                    print("start")
                    print(response.request?.allHTTPHeaderFields)  // original URL request
    //                print(response.response.debugDescription) // URL response
    //                print(response.data?.base64EncodedString())     // server data
    //                print(response.result)   // result of response serialization

                    if self.method == .post
                    {print("POST")}
                    else if self.method == .get
                    {print("GET")}
                    else if self.method == .put
                    {print("PUT")}
                    else if self.method == .delete
                    {print("DELETE")}

                    if response.response?.statusCode == 200
                    {
                        if let json = response.result.value {
                            print("JSON: \(json)")

                            let jsonString = String(decoding: response.data!, as: UTF8.self)
                            completion(.success(jsonString))
                        }
                        else
                        {
                            let e = ErrorModel()
                            return completion(.failure(e))
                        }
                    }
                    else
                    {
//                        let jsonString = String(decoding: response.data!, as: UTF8.self)
                        print("Error Code :\(response.response?.statusCode)")
//                        print("Error Code :\(jsonString)")
                        do{
                            let e = try JSONDecoder().decode(ErrorModel.self, from: response.data!)
                            return completion(.failure(e))
                        }catch{
                            let e = ErrorModel()
                            return completion(.failure(e))
                        }
                        
                    }

            }
        }
    
}
