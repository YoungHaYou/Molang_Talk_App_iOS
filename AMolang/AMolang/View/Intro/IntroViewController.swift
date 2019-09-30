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
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Chat", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "chat_navi") as! UINavigationController
        UIApplication.shared.keyWindow?.rootViewController = vc;
        
    }
    
    

}
