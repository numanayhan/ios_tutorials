//
//  UI_UnitTestUITests.swift
//  UI&UnitTestUITests
//
//  Created by TRA on 19.12.2019.
//  Copyright © 2019 panda. All rights reserved.
//

import XCTest

class UI_UnitTestUITests: XCTestCase {

    func testHello(){
        var hello:String?
        XCTAssert((hello != nil))
        
        hello = "hello"
        XCTAssertEqual(hello, "hello")
        
    }
    
    override func setUp() {
         
        continueAfterFailure = false
 
    }

    override func tearDown() {
    }

    func testExample() {
        let app = XCUIApplication()
        app.launch()
        
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
