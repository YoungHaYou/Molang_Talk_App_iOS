//
//  VersionCheckModel.swift
//  AMolang
//
//  Created by U0ha on 23/10/2019.
//  Copyright © 2019 유영하. All rights reserved.
//

import UIKit

class VersionCheckModel: NSObject {

    
    func requestVersionCheck(completion: @escaping (Bool , Ams?) -> Void)
    {
        
        let api = APINetwork()
        api.url = "/ams/IOS"
        api.method = .get
        api.parameters = [:]
        
        api.requestAPI(completion: { (isSucc , strData) in
            
            if isSucc
            {
                do
                {
                    let obj = try JSONDecoder().decode(Ams.self, from: Data(strData.utf8))
                    completion(true , obj)
                } catch {
                    print(error.localizedDescription)
                }
            }
            completion(false,nil)
            
        })
    }
    
}



//MARK: ------------------- ** VersionCheck 모델---
struct Ams: Codable
{
    var os:String
    var version: String
    var alert: String
    var isAlert: Bool
    var isForceUpdate: Bool
    
    enum CodingKeys: String, CodingKey
    {
        case os, version , alert, isAlert, isForceUpdate
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        os = (try? values.decode(String.self, forKey: .os)) ?? ""
        version = (try? values.decode(String.self, forKey: .version)) ?? ""
        alert = (try? values.decode(String.self, forKey: .alert)) ?? ""
        isAlert = (try? values.decode(Bool.self, forKey: .isAlert)) ?? false
        isForceUpdate = (try? values.decode(Bool.self, forKey: .isForceUpdate)) ?? false
    }
}
