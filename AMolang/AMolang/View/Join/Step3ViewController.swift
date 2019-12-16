//
//  Step3ViewController.swift
//  AMolang
//
//  Created by 유영하 on 05/10/2019.
//  Copyright © 2019 유영하. All rights reserved.
//

import UIKit

class Step3ViewController: UIViewController {

    @IBOutlet weak var btMan: UIButton!
    @IBOutlet weak var btWoman: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func manClick(_ sender: Any) {
        self.btMan.isSelected = true
        self.btWoman.isSelected = false
    }

    @IBAction func womanClick(_ sender: Any) {
        self.btMan.isSelected = false
        self.btWoman.isSelected = true
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        
        JoinModel.shared.gender = self.btMan.isSelected ? "M":"F"
        JoinModel.shared.requestJoinUser { (result) in
            switch result {
            case .success(let model):
                
                Util.saveId(string: String(model.id))
                Util.saveAuth(string: model.authorization)
                self.goToMain()
                
            case .failure(let error):
                print(error)

            }
        }
        
        
        
    }
    
    
    func goToMain()
    {
        DispatchQueue.main.async {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "TabController") as! TabController
            UIApplication.shared.keyWindow?.rootViewController = vc;
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
