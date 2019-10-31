//
//  IntroViewController.swift
//  AMolang
//
//  Created by 유영하 on 25/09/2019.
//  Copyright © 2019 유영하. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    
    let versionCheckModel = VersionCheckModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.checkVersion()
    }
    
    
    
    
    func makeAPICall()
    {
        
    }
    
    //MARK: - 버전 및 업데이트 체크
    func checkVersion()
    {
        
        self.versionCheckModel.requestVersionCheck(completion:{(isSucc , obj) in

            if isSucc
            {

                let flag = Util.diffAppVersion(server_version: obj!.version)
                
                //앱 버전이 서버 버전보다 낮음.
                if flag == .orderedAscending{
                    //업데이트!
                }
                else
                {
                    //다음 스탭 이동
                    self.checkLogin()
                }
            }
            
            
        })

    }
    
    //MARK: - 로그인 여부 체크
    func checkLogin()
    {

        
        if Util.loadId() != "" && Util.loadAuth() != ""
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
        DispatchQueue.main.async {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Join", bundle: nil)
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "joinNavi") as! UINavigationController
            UIApplication.shared.keyWindow?.rootViewController = vc;
        }
    }
    
    //MARK: - 메인 화면 이동
    func goToMain()
    {
        DispatchQueue.main.async {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "TabController") as! TabController
            UIApplication.shared.keyWindow?.rootViewController = vc;
        }
    }
    
    
    @IBAction func clickTest(_ sender: Any) {
        self.goToStart()
        
    }
    
    
    
    @IBAction func clickMain(_ sender: Any) {
        self.goToMain()
    }
    
    

}
