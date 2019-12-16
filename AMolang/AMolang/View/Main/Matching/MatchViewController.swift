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
    var pollTimer: Timer?

    
    
    //MARK: - --------------VIEW LIFE CYCLE -------------
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.requestMachingStatus()
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        self.stopTimer()
    }
    
    
    //MARK: - --------------IB ACtion -------------
    @IBAction func clickEveryone(_ sender: Any) {
        MatchingModel.shared.requestMatchingPost(type: "EVERYONE", completion: {(isSucc) in
            if isSucc{
                self.requestMachingStatus()
            }
        })
    }
    
    
    @IBAction func clickOther(_ sender: Any) {
        MatchingModel.shared.requestMatchingPost(type: "DIFFERENT_GENDER", completion: {(isSucc) in
            if isSucc{
                self.requestMachingStatus()
            }
        })
    }
    
    
    @IBAction func clickCancel(_ sender: Any) {
        MatchingModel.shared.requestMatchingDelete(completion: {(isSucc) in
            if isSucc{
                self.stopTimer()
            }
        })
    }
    
    
    
    //MARK: - --------------FUNC  -------------
    func requestMachingStatus()
    {
        MatchingModel.shared.requestMatchingGet { (isOn , result) in
            switch result {
            case .success(let model):
                self.isMaching = isOn
                
                if isOn{
                    self.startTimer()
                    self.lbStatus.text = "신청 중!"
                }
                else
                {
                    self.stopTimer()
                    self.lbStatus.text = "신청 중 아님"
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func startTimer(){
        self.pollTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(callbackTimer), userInfo: nil, repeats: false)
    }
    
    func stopTimer(){
        self.pollTimer?.invalidate()
        self.pollTimer = nil
    }
    
    @objc func callbackTimer(){
        print("timer action")
        self.requestMachingStatus()
    }
    
}
