//
//  News.swift
//  NewsMeUp
//
//  Created by Kevin Vishal Saldanha on 05/08/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import Foundation

struct News : Codable {
    
    var author : String?
    var title : String?
    var description : String?
    var url : String?
    var urlToImage : String?
    var publishedAt : String?
    var content : String?
}

struct NewsList : Codable {
    
    var news : [News]
    
    private enum CodingKeys: String, CodingKey {
        case news = "articles"
    }
}
