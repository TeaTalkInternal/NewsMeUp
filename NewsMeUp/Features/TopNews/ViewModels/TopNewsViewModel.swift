//
//  TopNewsViewModel.swift
//  NewsMeUp
//
//  Created by Kevin Vishal Saldanha on 05/08/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import Foundation

class NewsListViewModel {
    
    private var newsNetworkManager : NewsNetworkManager?
    private  var newsArray : [News]? {
        didSet {
            completionHandler?()
        }
    }
    
    var completionHandler : CompletionHandler?
    
    init(completionHandler : @escaping CompletionHandler) {
        self.completionHandler = completionHandler
        self.newsNetworkManager = NewsNetworkManager()
    }
    
    var numberOfNewsArticles : Int {
        guard let newsCount = newsArray?.count else {
            return 0
        }
        return newsCount
    }
    
    func newsArticleAtIndex(index : Int) -> NewsViewModel? {
        return NewsViewModel.init(news: (newsArray?[index])!)
    }
    
    func fetchAllNews() -> Void {
        newsNetworkManager?.fetchTopNews { (result) in
            switch result {
            case .success(let newsList):
                self.newsArray = newsList.news
            case .failure(_):
                self.newsArray = []
            }
        }
    }
}


struct NewsViewModel {
    
    let news : News?
    
    init(news : News) {
        self.news = news
    }
    
    var  newsTitle : String {
        return news?.title ?? ""
    }
    
    var  newsDescription : String {
        return news?.description ?? ""
    }
}





