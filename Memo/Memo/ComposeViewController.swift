//
//  ComposeViewController.swift
//  Memo
//
//  Created by GSM04 on 2021/07/06.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet var close: UIBarButtonItem!
    @IBOutlet var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
    @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard let memo = memoTextView.text,
            memo.count > 0  else {
            
            alert(message: "메모를 입력하세요 ")
            
            return
        }
        
        let newMemo = Memo(content: memo)
        Memo.dummyDataList.append(newMemo)
        
        NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil )
        
        dismiss(animated: true, completion: nil)
    }
    
}

extension ComposeViewController{
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
}
