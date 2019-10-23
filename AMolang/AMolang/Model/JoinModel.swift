//
//  JoinModel.swift
//  AMolang
//
//  Created by U0ha on 19/10/2019.
//  Copyright © 2019 유영하. All rights reserved.
//

import UIKit

class JoinModel: NSObject {
    
    var udid = ""
    var nickName = ""
    var gender = ""
    var age = ""

    static let shared : JoinModel = {
        let instance = JoinModel()
        return instance
    }()
    
    
    
    func requestJoinUser(completion: @escaping (Bool , JoinUser?) -> Void)
    {
        
        let api = APINetwork()
        api.url = "/users"
        api.method = .post
        api.parameters = ["udid": UIDevice.current.identifierForVendor!.uuidString,
                          "nickName":self.nickName,
                            "gender":self.gender ,
                            "age":self.age]
        
        api.requestAPI(completion: { (isSucc , strData) in
            
            if isSucc
            {
                do
                {
                    let obj = try JSONDecoder().decode(JoinUser.self, from: Data(strData.utf8))
                    completion(true , obj)
                } catch {
                    print(error.localizedDescription)
                }
            }
            
            completion(false,nil)
            
        })
    }
    
}

//MARK: ------------------- ** JoinUser모델---
struct JoinUser: Codable
{
    var authorization:String
    var id: String
    
    enum CodingKeys: String, CodingKey
    {
        case authorization, id
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        authorization = (try? values.decode(String.self, forKey: .authorization)) ?? ""
        id = (try? values.decode(String.self, forKey: .id)) ?? ""
    }
}
