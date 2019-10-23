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

        
        self.checkLogin()
    }
    
    //MARK: - 로그인 여부 체크
    func checkLogin()
    {
        
        if Util.loadId() != ""
        {
            self.goToMain()
        }
        else
        {
            self.goToStart()
        }
    }
    
    //MARK: - 시작하기 화면 이동
    func goToStart()
    {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Join", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "joinNavi") as! UINavigationController
        UIApplication.shared.keyWindow?.rootViewController = vc;
    }
    
    //MARK: - 메인 화면 이동
    func goToMain()
    {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "TabController") as! TabController
        UIApplication.shared.keyWindow?.rootViewController = vc;
    }
    
    
    @IBAction func clickTest(_ sender: Any) {
        self.goToStart()
        
    }
    
    
    
    @IBAction func clickMain(_ sender: Any) {
        self.goToMain()
    }
    
    

}
