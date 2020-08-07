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
        let urlStr =  "https://newsapi.org/v2/top-headlines?q=top&from=2020-07-07&sortBy=publishedAt&apiKey=a28b5e512c104bf68fba3eb289522447&pageSize=10"
        return HttpClient.sharedInstance.getResponse(fromURL: urlStr, completion)
    }
    
}
