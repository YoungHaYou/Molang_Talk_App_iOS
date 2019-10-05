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

        self.tfInput.becomeFirstResponder()
    }
    
    @IBAction func nextAction(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Join", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "Step2ViewController") as! Step2ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
