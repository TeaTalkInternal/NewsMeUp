//
//  NewsMeUpUITests.swift
//  NewsMeUpUITests
//
//  Created by Kevin Vishal Saldanha on 05/08/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import XCTest
@testable import NewsMeUp


enum LaunchModeType: String {
    case topNews = "TopNews"
}

struct UITestConstant {
    static let initialVC = "initialVC"
}

class NewsMeUpUITests: XCTestCase {
    
    
    var app : XCUIApplication!
    
    override func setUpWithError() throws {
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launchEnvironment = [UITestConstant.initialVC: LaunchModeType.topNews.rawValue]
        app.launch()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNewsNavBarUI() throws {
        let navBar = app.navigationBars["Top News"].staticTexts["Top News"]
        XCTAssert(navBar.exists)
    }
    
    
    func testNewsTableViewAndCell() {
        let newsTable = app.tables.matching(identifier: "NewsTableView")
        XCTAssertNotNil(newsTable)
        let firstCell = newsTable.cells.element(matching: .cell, identifier: "NewsTableViewCell_0_0")
        let existancePredicate = NSPredicate(format: "exists == 1")
        let expectationEval = expectation(for: existancePredicate, evaluatedWith: firstCell, handler: nil)
        let waiter = XCTWaiter.wait(for: [expectationEval], timeout: 10)
        XCTAssert(XCTWaiter.Result.completed == waiter, "Failed to find cell")
    }
    
    func testForCellSelection() {
        let newsTable = app.tables.matching(identifier: "NewsTableView")
        XCTAssertNotNil(newsTable)
        let firstCell = newsTable.cells.element(matching: .cell, identifier: "NewsTableViewCell_0_0")
        let existancePredicate = NSPredicate(format: "isHittable == 1")
        let expectationEval = expectation(for: existancePredicate, evaluatedWith: firstCell, handler: nil)
        let waiter = XCTWaiter.wait(for: [expectationEval], timeout: 10)
        XCTAssert(XCTWaiter.Result.completed == waiter, "Failed to find cell")
        firstCell.tap()
    }
    
    func testLablesInCell() {

        let newsTable = app.tables.matching(identifier: "NewsTableView")
        let firstCell = newsTable.cells.element(matching: .cell, identifier: "NewsTableViewCell_0_0")
        let existancePredicate = NSPredicate(format: "exists == 1")
        let expectationEval = expectation(for: existancePredicate, evaluatedWith: firstCell, handler: nil)
        let waiter = XCTWaiter.wait(for: [expectationEval], timeout: 10)
        XCTAssert(XCTWaiter.Result.completed == waiter, "Failed to find cell")
        
        let keyLabel = firstCell.staticTexts["titleLabel"] // YOUR_IDENTIFIER
        XCTAssertTrue(keyLabel.exists, "Key label not exist.")
        let valLabel = firstCell.staticTexts["descriptionLabel"] // YOUR_IDENTIFIER
        XCTAssertTrue(valLabel.exists, "Value label not exist.")
    }
    
    
    func testForImage() {
        let thumbnailImageView = app.otherElements.containing(.image, identifier: "thumbnailImageView").firstMatch
        XCTAssertTrue(thumbnailImageView.exists, "Image view not exist.")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
