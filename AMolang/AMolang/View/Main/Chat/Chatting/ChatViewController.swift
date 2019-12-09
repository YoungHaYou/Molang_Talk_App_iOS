//
//  ChatViewController.swift
//  AMolang
//
//  Created by 유영하 on 30/09/2019.
//  Copyright © 2019 유영하. All rights reserved.
//

import UIKit




class ChatViewController: UIViewController {

    
    var arrString = [
        "안녕하세요 유영하 입니다.",
        "ㅋㅋㅋㅋ",
        "안녕하세요 유영하 입니다.배가 고프네요",
        "ㅇㅋ요",
        "넵",
        "0000000000ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ",
        "웃웃",
        "채팅 채팅 태채채채채팅애치팅",
        "글도 나옵니다",
        "라아러알",
        "ㅇㅋ",
        "88",
        "ㅇㄹ",
        "ㅇㄹ2"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow:), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide:), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(note:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(note:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    
    }
    
    
    
    @objc func keyboardWillShow(note: NSNotification) {
//        if let keyboardSize = (note.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if keyboardSize.height == 0.0 || keyboardShown == true {
//                return
//            }
//
//            UIView.animate(withDuration: 0.33, animations: { () -> Void in
//                if originY == nil { originY = label.frame.origin.y }
//                label.frame.origin.y = originY - keyboardSize.height
//            }, completion: {
//                keyboardShown = true
//            })
//        }
    }

    @objc func keyboardWillHide(note: NSNotification) {
//        if let keyboardSize = (note.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//          if keyboardShown == false {
//              return
//          }
//
//          UIView.animate(withDuration: 0.33, animations: { () -> Void in
//              guard let originY = originY else { return }
//              label.frame.origin.y = originY
//          }, completion: {
//                keyboardShown = false
//          })
//        }
    }
    

}



//MARK: ----------------- UITableViewDelegate ---------------
extension ChatViewController : UITableViewDelegate
{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrString.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ChatCell
        if indexPath.row % 2 == 0
        {
            cell = (tableView.dequeueReusableCell (withIdentifier: "ChatCell_my") as? ChatCell)!
        }
        else
        {
            cell = (tableView.dequeueReusableCell (withIdentifier: "ChatCell_you") as? ChatCell)!
        }
        
        
        cell.lbTalkText.text = self.arrString[indexPath.row] 
        
        
        return cell
    }
    
    
}


//MARK: ----------------- UITableViewDataSource ---------------
extension ChatViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        let obj:DeliveryItem = self.arrList[indexPath.row] as! DeliveryItem
        //
        //        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //        viewController.deliveryItem = obj
        //        //    UIApplication.shared.keyWindow?.rootViewController = viewController;
        //        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

