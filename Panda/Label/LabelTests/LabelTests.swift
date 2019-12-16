//
//  LabelTests.swift
//  LabelTests
//
//  Created by TRA on 26.11.2019.
//  Copyright © 2019 panda.io. All rights reserved.
//

import XCTest
@testable import Label

class LabelTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
        var text:String?
        
        XCTAssertNil(text)
        text = "test"
        XCTAssertEqual(text, "test")
        
    }
 
    func loginValidate(){
        
    }
    func helperTest(){
        
        XCTAssertEqual(Helper.sumOf([1,2]), 3)
    }

}
