//
//  NewsNetworkMangerTests.swift
//  NewsMeUpTests
//
//  Created by Kevin Vishal Saldanha on 07/08/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import XCTest
@testable import NewsMeUp

enum TestNewsNetworkMangerType {
    case successResponse
    case errorResponse
}

class TestNewsNetworkManger : NewsNetworkManagerProtocol {
    
    var testNewsNetworkMangerType : TestNewsNetworkMangerType = TestNewsNetworkMangerType.errorResponse
    
    func fetchTopNews(_ completion : @escaping (Result<NewsList, NetworkError>) -> Void) -> Void {
        
        var urlStr : URL?
        
        if testNewsNetworkMangerType == .successResponse {
            urlStr = Bundle.main.url(forResource: "TopNews", withExtension: "json")!
        }
        else {
            urlStr = Bundle.main.url(forResource: "EmptyResponse", withExtension: "json")!
        }
        
        let urlSession = URLSession.init(configuration: URLSessionConfiguration.default)
        let task = urlSession.dataTask(with: urlStr!) { (data, response, error) in
            
            guard let data =  data, error == nil else {
                completion(.failure(.badResponse))
                return
            }
            do {
                let newsArray = try JSONDecoder().decode(NewsList.self, from: data)
                completion(.success(newsArray))
                return
            }
            catch {
                completion(.failure(.badFormat))
                return
            }
        }
        task.resume()
    }
    
}
