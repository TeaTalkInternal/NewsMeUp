//
//  NewsMeUpUITests.swift
//  NewsMeUpUITests
//
//  Created by Kevin Vishal Saldanha on 05/08/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import XCTest
@testable import NewsMeUp

class NewsMeUpUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        XCUIApplication().launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNewsList() {
        
        let app = XCUIApplication()
        app.navigationBars["Top News"].staticTexts["Top News"].tap()
        
        let tablesQuery = app.tables
//        tablesQuery.cells.containing(.staticText, identifier:"New York attorney general seeks to dissolve NRA in suit accusing gun rights group of wide-ranging fraud and self-dealing").children(matching: .staticText).matching(identifier: "New York attorney general seeks to dissolve NRA in suit accusing gun rights group of wide-ranging fraud and self-dealing").element(boundBy: 0).swipeUp()
        XCTAssertTrue(tablesQuery.count <= 10)
        
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
