//
//  JsonFileLoaderTest.swift
//  SecondCEPTDDTests
//
//  Created by The App Experts on 25/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import XCTest
@testable import SecondCEPTDD

class JsonFileLoaderTest: XCTestCase {
    var jfl:JsonFileLoader!
    override func setUp() {
        self.jfl = JsonFileLoader()
        // given
        // when
        // then
    }

    override func tearDown() {
        self.jfl = nil
    }
    
    func test_NewJsonFileLoader_NotNil () {
        // given
        // when
        let result = self.jfl
        // then
        XCTAssertNotNil(result)
    }
    
    func test_NJFL_JSONDEcoder_Nil () {
        // given
        // when
        let result = self.jfl.decoder
        // then
        XCTAssertNil(result)
    }
}
