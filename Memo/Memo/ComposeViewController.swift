//
//  ComposeViewController.swift
//  Memo
//
//  Created by GSM04 on 2021/07/06.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet var close: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
