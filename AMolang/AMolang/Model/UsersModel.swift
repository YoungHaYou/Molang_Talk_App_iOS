//
//  UsersModel.swift
//  AMolang
//
//  Created by U0ha on 08/11/2019.
//  Copyright © 2019 유영하. All rights reserved.
//

import UIKit





class UsersModel: NSObject {
    
    var userInfo:UserInfo?
    

    static let shared : UsersModel = {
        let instance = UsersModel()
        return instance
    }()
    
    
    
    func requestUserInfo(completion: @escaping (APIResult<UserInfo>) -> Void)
    {
        let id_value = Util.loadId()
        
        let api = APINetwork()
        api.url = "/users/" + id_value
        api.method = .get
        api.parameters = ["id": id_value ,
                          "Authorization": Util.loadAuth()
                        ]
        
      
        api.requestAPI(completion:{(result) in
            switch result {
                case .success(let strData):
                    print(strData)
                    do
                    {
                        let obj = try JSONDecoder().decode(UserInfo.self, from: Data(strData.utf8))
                        return completion(.success(obj))
                    } catch {
                        print(error.localizedDescription)
                    }

                case .failure(let error):
                    return completion(.failure(error))
            }
        })
        
        
    }
    
}

//MARK: ------------------- **UserInfo모델---
struct UserInfo: Codable
{
    
    var id: NSInteger
    var nickName:String
    var gender:String
    var age:NSInteger
    var point:NSInteger
    var profile:String
    var regDate:String
    
    
    enum CodingKeys: String, CodingKey
    {
        case id, nickName ,gender ,age,point,profile,regDate
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = (try? values.decode(NSInteger.self, forKey: .id)) ?? 0
        nickName = (try? values.decode(String.self, forKey: .nickName)) ?? ""
        gender = (try? values.decode(String.self, forKey: .gender)) ?? ""
        age = (try? values.decode(NSInteger.self, forKey: .age)) ?? 0
        point = (try? values.decode(NSInteger.self, forKey: .point)) ?? 0
        profile = (try? values.decode(String.self, forKey: .profile)) ?? ""
        regDate = (try? values.decode(String.self, forKey: .regDate)) ?? ""
    }
}
