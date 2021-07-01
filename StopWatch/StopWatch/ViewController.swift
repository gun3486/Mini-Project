//
//  ViewController.swift
//  StopWatch
//
//  Created by GSM04 on 2021/07/01.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var time: UILabel!
    @IBOutlet var txtTime: UILabel!
    
    var count: Int = 0
    var mTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnStart(_ sender: UIButton) {
        if mTimer != nil{
            mTimer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        } else {
            mTimer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func btnStop(_ sender: UIButton) {
        if mTimer != nil {
            mTimer.invalidate()
        }
        count = 0
        txtTime.text = String(count)
    }
    
    @objc func timerCallback() {
        count += 1
        txtTime.text = String(count)
    }
}


