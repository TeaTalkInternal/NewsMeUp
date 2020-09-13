//
//  APIClient.swift
//  NewsMeUp
//
//  Created by Kevin Vishal Saldanha on 07/08/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import Foundation


struct APICLient {
    
   static func getTopNewsApi() -> String {
    return "https://newsapi.org/v2/top-headlines?q=top&from=\(Utility.getDateString())&sortBy=publishedAt&apiKey=a28b5e512c104bf68fba3eb289522447&pageSize=10"
    }
}


