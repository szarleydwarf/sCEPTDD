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
    
    func test_NJFL_JSONDecoder_Nil () {
        // given
        // when
        let result = self.jfl.decoder
        // then
        XCTAssertNil(result)
    }
    
    func test_JFL_localURL_isNil () {
        // given
        // when
        let result = self.jfl.getLocalURL(fromFile: "", withExtension: "")
        // then
        XCTAssertNil(result)
    }
    
    func test_JFL_localURL_inNotNil () {
        // given
        // when
        let result = self.jfl.getLocalURL(fromFile: "Accounts", withExtension: "json")
        print("RESULT \(result)")
        // then
        XCTAssertNotNil(result)
    }
    
    func test_JFL_getDataFromEmptyURL_isNil () {
        // given
        guard let url = URL(string: "") else { return }
        // when
        let result = self.jfl.getData(from: url)
        // then
        XCTAssertNil(result)
    }
    
    func test_JFL_getDataFromWrongURL_isNil () {
        //given
        guard let url = URL(string: "Accounts.json") else {return}
        // when
        let result = self.jfl.getData(from: url)
        //then
        XCTAssertNil(result)
    }
    
    func test_JFL_getDataFromCorectURL_isNotNil () {
        //given
        guard let url = self.jfl.getLocalURL(fromFile: "Accounts", withExtension: "json") else { return }
        // when
        let result = self.jfl.getData(from: url)
        //then
        XCTAssertNotNil(result)
    }
    
    func test_fetchFromNilData_returnNil () {
        // given
        // when
        let result = self.jfl.fetch(from: nil, using: JSONDecoder())
        // then
        XCTAssertNil(result)
    }
    
    func test_NJFL_fetchFromData_NotNil () {
        // given
        guard let url = self.jfl.getLocalURL(fromFile: "Accounts", withExtension: "json") else { return }
        let data = self.jfl.getData(from: url)
        // when
        let result = self.jfl.fetch(from: data, using: JSONDecoder())
        // then
        XCTAssertNotNil(result)
    }
    
}
