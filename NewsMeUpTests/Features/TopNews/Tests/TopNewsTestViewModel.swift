//
//  TopNewsTestViewModel.swift
//  NewsMeUpTests
//
//  Created by Kevin Vishal Saldanha on 07/08/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import XCTest
@testable import NewsMeUp

class TopNewsViewModelTests: XCTestCase {
    
    private var networkManagerTests : NewsNetworkMangerTests?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        networkManagerTests = NewsNetworkMangerTests()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchNewsSuccess() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = self.expectation(description: "waiting to fetch data")
        var newsArray : [News]?
        networkManagerTests?.newsNetworkMangerTestsType = NewsNetworkMangerTestsType.successResponse
        networkManagerTests?.fetchTopNews { (result) in
            switch result {
            case .success(let newsList):
                newsArray = newsList.news
                expectation.fulfill()
            case .failure(let error):
                newsArray = []
                XCTFail("expected to fetch data but got error: \(error)")
            }
        }
        
        waitForExpectations(timeout: 3.0) { _ in
            XCTAssertEqual(newsArray?.count, 10)
        }
    }
    
    func testFetchNewsFailure() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = self.expectation(description: "waiting to fetch data")
        var newsArray : [News]?
        networkManagerTests?.newsNetworkMangerTestsType = NewsNetworkMangerTestsType.errorResponse
        networkManagerTests?.fetchTopNews { (result) in
            switch result {
            case .success(_):
                XCTFail("expected No response")
                expectation.fulfill()
            case .failure(_):
                newsArray = []
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 3.0) { _ in
            XCTAssertEqual(newsArray?.count, 0)
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

