//
//  TopNewsViewModelTest.swift
//  NewsMeUpTests
//
//  Created by Kevin Vishal Saldanha on 13/09/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import XCTest
@testable import NewsMeUp

class TopNewsViewModelTest: XCTestCase {
    
    var testNewsNetworkManger : TestNewsNetworkManger?
    var newsListViewModel : NewsListViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testNewsNetworkManger = TestNewsNetworkManger()
        newsListViewModel = NewsListViewModel()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testNewsNetworkManger = nil
    }
    
    func testTopNewsViewModelMappingSuccess() throws {
        let expectation = self.expectation(description: "Waiting for data to load")
        var newsArray : [News]?
        testNewsNetworkManger?.testNewsNetworkMangerType = TestNewsNetworkMangerType.successResponse
        testNewsNetworkManger?.fetchTopNews({ result in
            switch result {
            case .success(let newsList):
                newsArray = newsList.news
                XCTAssertNotNil(newsArray)
                self.newsListViewModel?.setNewsArray(newsArray: newsArray)
                expectation.fulfill()
            case .failure(_):
                newsArray = []
                XCTFail("Failed to fetch response matching News Model")
            }
            
        })
        
        waitForExpectations(timeout: 3.0) { _ in
            // Test for Model
            XCTAssertEqual(newsArray?[0].title, "Coronavirus: US reports biggest jump in deaths in a week – as it happened")
            XCTAssertEqual(newsArray?[0].description, "Today's top news: Eurozone retail sales return to pre-Covid levels while services activity in Italy and Spain improves. Light-touch Sweden again an outlier as economy outpaces many peers. Honda reports biggest quarterly loss in a decade while Dutch-Belgian su…")
            XCTAssertNil(newsArray?[0].author)
            XCTAssertEqual(newsArray?[0].url, "https://www.ft.com/content/1f7d54f6-8d71-3de2-8e87-d0bb9efe9ab5")
            XCTAssertEqual(newsArray?[0].urlToImage, "https://www.ft.com/__origami/service/image/v2/images/raw/http%3A%2F%2Fblogs.ft.com%2Fthe-world%2Ffiles%2F2020%2F08%2F2020-07-30T212428Z_1799179075_RC2X3I9EE1YK_RTRMADP_3_HEALTH-CORONAVIRUS-USA-NEW-Y.jpeg?source=next-opengraph&fit=scale-down&width=900")
            XCTAssertEqual(newsArray?[0].publishedAt, "2020-08-06T08:07:28.8980276Z")
            XCTAssertEqual(newsArray?[0].content, "News you might have missed …\r\nUS stocks rose for a third day running, as investors continued to measure better-than-expected corporate earnings against dire forecasts because of the pandemic. The S&a… [+2939 chars]")
            
            // Test for view models
            
            XCTAssertEqual(self.newsListViewModel?.numberOfNewsArticles, 10)
            let newsArticle = self.newsListViewModel?.newsArticleAtIndex(index: 0)
            XCTAssertNotNil(newsArticle)
            XCTAssertEqual(newsArticle?.newsTitle, "Coronavirus: US reports biggest jump in deaths in a week – as it happened")
            XCTAssertEqual(newsArticle?.newsDescription, "Today's top news: Eurozone retail sales return to pre-Covid levels while services activity in Italy and Spain improves. Light-touch Sweden again an outlier as economy outpaces many peers. Honda reports biggest quarterly loss in a decade while Dutch-Belgian su…")
            
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
