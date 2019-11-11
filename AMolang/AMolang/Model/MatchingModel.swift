//
//  MatchingModel.swift
//  AMolang
//
//  Created by U0ha on 10/11/2019.
//  Copyright © 2019 유영하. All rights reserved.
//

import UIKit


//MARK: ------------------- ** IsMatching 모델---
struct IsMatching: Codable
{
    var isMatching:Bool
}


class MatchingModel: NSObject {

    static let shared : MatchingModel = {
        let instance = MatchingModel()
        return instance
    }()
    

//MARK: ------------------- ** 매칭 신청 ---
    
    func requestMatchingPost(type:String ,completion: @escaping (Bool) -> Void)
    {
        let id_value = Util.loadId()
        
        if id_value == ""
        {
            completion(false)
            return
        }
        
        let api = APINetwork()
        api.url = "/matching"
        api.method = .post
        api.parameters = ["userId": id_value ,
                          "Authorization": Util.loadAuth(),
                          "type":type
                        ]
        
        api.requestAPI(completion: { (isSucc , strData) in
            
            if isSucc
            {
                completion(true)
            }
            else
            {
                completion(false)
            }
            
        })
    }
    
    //MARK: ------------------- ** 매칭 조회(폴링용) ---
    
    func requestMatchingGet(type:String ,completion: @escaping (Bool) -> Void)
    {
        let id_value = Util.loadId()
        
        if id_value == ""
        {
            completion(false)
            return
        }
        
        let api = APINetwork()
        api.url = "/matching"
        api.method = .get
        api.parameters = ["userId": id_value ,
                          "Authorization": Util.loadAuth()
                        ]
        
        api.requestAPI(completion: { (isSucc , strData) in
            
            if isSucc
            {
                do
                {
                    let obj = try JSONDecoder().decode(IsMatching.self, from: Data(strData.utf8))
                    
                    if obj.isMatching
                    {
                        completion(true)
                    }
                    else
                    {
                        completion(false)
                    }
                    
                    
                } catch {
                    print(error.localizedDescription)
                }
                
            }
            else
            {
                completion(false)
            }
            
        })
    }
    
    
    //MARK: ------------------- ** 매칭 취소 ---
    func requestMatchingDelete(type:String ,completion: @escaping (Bool) -> Void)
    {
        let id_value = Util.loadId()
        
        if id_value == ""
        {
            completion(false)
            return
        }
        
        let api = APINetwork()
        api.url = "/matching"
        api.method = .post
        api.parameters = ["userId": id_value ,
                          "Authorization": Util.loadAuth()
                        ]
        
        api.requestAPI(completion: { (isSucc , strData) in
            
            if isSucc
            {
                completion(true)
            }
            else
            {
                completion(false)
            }
            
        })
    }
    
}
