//
//  ChatListViewController.swift
//  AMolang
//
//  Created by 유영하 on 05/10/2019.
//  Copyright © 2019 유영하. All rights reserved.
//

import UIKit

class ChatListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
}



//MARK: ----------------- UITableViewDelegate ---------------
extension ChatListViewController : UITableViewDelegate
{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ChatListCell
        cell = (tableView.dequeueReusableCell (withIdentifier: "ChatListCell") as? ChatListCell)!
        
        
        
        
        
        return cell
    }
    
    
}


//MARK: ----------------- UITableViewDataSource ---------------
extension ChatListViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Chat", bundle: nil)
                let vc = mainStoryboard.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
    }
}
