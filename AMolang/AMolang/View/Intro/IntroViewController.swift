//
//  IntroViewController.swift
//  AMolang
//
//  Created by 유영하 on 25/09/2019.
//  Copyright © 2019 유영하. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func clickTest(_ sender: Any) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Join", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "joinNavi") as! UINavigationController
        UIApplication.shared.keyWindow?.rootViewController = vc;
        
    }
    
    
    
    @IBAction func clickMain(_ sender: Any) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "TabController") as! TabController
        UIApplication.shared.keyWindow?.rootViewController = vc;
        
    }
    
    

}
