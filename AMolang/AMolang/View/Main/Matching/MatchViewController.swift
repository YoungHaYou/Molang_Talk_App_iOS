//
//  MatchViewController.swift
//  AMolang
//
//  Created by 유영하 on 05/10/2019.
//  Copyright © 2019 유영하. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {

    @IBOutlet weak var lbStatus: UILabel!
    
    var isMaching = false

    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    @IBAction func clickEveryone(_ sender: Any) {
        MatchingModel.shared.requestMatchingPost(type: "EVERYONE", completion: {_ in })
    }
    
    
    @IBAction func clickOther(_ sender: Any) {
        MatchingModel.shared.requestMatchingDelete(completion: {_ in})
    }
    
    
    func requestMachingStatus(){
        MatchingModel.shared.requestMatchingGet(completion: {(status) in
            self.isMaching = status
        })
    }
    

}
