//
//  Model.swift
//  Memo
//
//  Created by GSM04 on 2021/07/05.
//

import Foundation


class Memo {
    
    var content: String
    var insertDate: Date
        
    init(content: String) {
        self.content = content
        insertDate = Date()
    }
    
    static var dummyDataList = [
        
        Memo(content: "Yuri = 🐹"),
        Memo(content: "Yena = 🐥")
    ]
    
}
