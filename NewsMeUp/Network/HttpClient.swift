//
//  HttpClient.swift
//  NewsMeUp
//
//  Created by Kevin Vishal Saldanha on 07/08/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import Foundation


enum NetworkError : Error {
    case badResponse
    case badFormat
}


class HttpClient {
    
    static let sharedInstance = HttpClient()
    
    private init() {
        
    }
    
    func getResponse(fromURL urlStr : String, _ completion : @escaping (Result<NewsList, NetworkError>) -> Void) -> Void {
        let url = URL(string: urlStr)!
        let urlSession = URLSession.init(configuration: URLSessionConfiguration.default)
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.badResponse))
                return
            }
            
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
