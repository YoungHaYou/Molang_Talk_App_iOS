//
//  Step1ViewController.swift
//  AMolang
//
//  Created by 유영하 on 05/10/2019.
//  Copyright © 2019 유영하. All rights reserved.
//

import UIKit

class Step1ViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.tfInput.becomeFirstResponder()
    }
    
    @IBAction func nextAction(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Join", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "Step2ViewController") as! Step2ViewController
        
        //
        JoinModel.shared.nickName = self.tfInput.text ?? ""
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
