//
//  NewsNetworkManager.swift
//  NewsMeUp
//
//  Created by Kevin Vishal Saldanha on 05/08/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import Foundation


protocol NewsNetworkManagerProtocol {
    func fetchTopNews(_ completion : @escaping (Result<NewsList, NetworkError>) -> Void) -> Void
}

class NewsNetworkManager {
        
    func fetchTopNews(_ completion : @escaping (Result<NewsList, NetworkError>) -> Void) -> Void {
        let urlStr =  APICLient.getTopNewsApi()
        return HttpClient.sharedInstance.getResponse(fromURL: urlStr, completion)
    }
}
