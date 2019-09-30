

import UIKit
import Alamofire




class APINetwork: NSObject {

    
    
    
    
    static let shared : APINetwork = {
        let instance = APINetwork()
        
        return instance
    }()
    
    
    
    
    
    func requestAPI(completion: @escaping ([Bool]?) -> Void)
    {
        
        
        
        guard let url = URL(string: "http://localhost:5984/rooms/_all_docs?include_docs=true") else {
            completion(nil)
            return
        }
        
        
        
        
//        Alamofire.request(url,
//                          method: .get,
//                          parameters: ["include_docs": "true"])
//            .validate()
//            .responseJSON { response in
//                guard response.result.isSuccess else {
//                    print("Error while fetching remote rooms: \(String(describing: response.result.error)")
//                        completion(nil)
//                    return
//                }
//
//                guard let value = response.result.value as? [String: Any],
//                    let rows = value["rows"] as? [[String: Any]] else {
//                        print("Malformed data received from fetchAllRooms service")
//                        completion(nil)
//                        return
//                }
//
//                let rooms = rows.flatMap { roomDict in return RemoteRoom(jsonData: roomDict) }
//                completion(rooms)
//        }
    }
    
    

    
    
    
    
}
