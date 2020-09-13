//
//  Utility.swift
//  NewsMeUp
//
//  Created by Kevin Vishal Saldanha on 06/08/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import Foundation

typealias CompletionHandler = (()->Void)

struct Utility {
    
    static func getDateString() -> String {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: Date())
    }
}

