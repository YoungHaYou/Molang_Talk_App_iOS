//
//  RealmManager.swift
//  PrivateDiary
//
//  Created by 유영하 on 13/09/2019.
//  Copyright © 2019 유영하. All rights reserved.
//

import UIKit
import RealmSwift

let realm = RealmManager.shared


//MARK: - ---------------realm_dfctList
final class realm_dfctList: Object {
    
    @objc dynamic var id_dfct_type = ""
    @objc dynamic var id_rgon = ""
    @objc dynamic var nm_dfct_type = ""
    @objc dynamic var oder_mkar = ""
}

//MARK: - ---------------realm_dongList
final class realm_dongList: Object {
    
    @objc dynamic var cd_dong = ""
    @objc dynamic var cd_site = ""
    @objc dynamic var nm_dong = ""
}



//MARK: - ---------------realm_hoList
final class realm_hoList: Object {
    @objc dynamic var cd_dong = ""
    @objc dynamic var nohs = ""
    @objc dynamic var cd_flor = ""
    @objc dynamic var cd_ho = ""
    @objc dynamic var cd_site = ""
    @objc dynamic var cd_tppg = ""
    @objc dynamic var nm_dong = ""
    @objc dynamic var nm_floor = ""
    @objc dynamic var ho = ""
    @objc dynamic var yn_ifc = ""
}

//MARK: - ---------------realm_ifcList
final class realm_ifcList: Object {
    
    @objc dynamic var cd_site = ""
    @objc dynamic var cd_tppg = ""
    @objc dynamic var yn_ifc = ""
}

//MARK: - ---------------realm_locList
final class realm_locList: Object {
    
    @objc dynamic var cd_site = ""
    @objc dynamic var cd_tppg = ""
    @objc dynamic var id_loc = ""
    @objc dynamic var id_uper_loc = ""
    @objc dynamic var nm_loc = ""
    @objc dynamic var oder_mkar = ""
}

//MARK: - ---------------realm_rgonList
final class realm_rgonList: Object {
    
    @objc dynamic var cd_site = ""
    @objc dynamic var id_loc = ""
    @objc dynamic var id_rgon = ""
    @objc dynamic var nm_rgon = ""
    @objc dynamic var oder_mkar = ""
}

//MARK: - ---------------realm_siteList
final class realm_siteList: Object {
    
    @objc dynamic var cd_site = ""
    @objc dynamic var nm_site = ""
}



//MARK: - ---------------RealmManager FUNC
class RealmManager: NSObject {

    static let shared : RealmManager = {
        let instance = RealmManager()
        
        return instance
    }()
    
    
    func saveObj(obj:Object)
    {
        let _realm = try! Realm()
        try! _realm.write() {
            
            let realmObj = obj
            _realm.add(realmObj)
        }
    }
    
    
    func loadDongList() -> Array<realm_dongList>
    {
        let _realm = try! Realm()
        let arrObj = _realm.objects(realm_dongList.self)
        return Array(arrObj)
    }
    
    func loadHoList() -> Array<realm_hoList>
    {
        let _realm = try! Realm()
        let arrObj = _realm.objects(realm_hoList.self)
        return Array(arrObj)
    }
    
    
    func deleteAllItem()
    {
        let _realm = try! Realm()
        try! _realm.write() {
            _realm.deleteAll()
        }
    }
    
    
}
