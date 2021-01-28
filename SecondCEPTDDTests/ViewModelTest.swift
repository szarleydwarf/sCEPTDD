//
//  ViewModelTest.swift
//  SecondCEPTDDTests
//
//  Created by The App Experts on 22/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import XCTest
@testable import SecondCEPTDD

class ViewModelTest: XCTestCase {
    var vm: ViewModel!
    
    override func setUp() {
        self.vm = ViewModel()
    }
    
    override func tearDown() {
        self.vm = nil
        // given
        // when
        // then
    }
    
    func testNewVM_isNotNil () {
        // given
        
        // when
        let result = self.vm
        // then
        XCTAssertNotNil(result)
    }
    
    func testNewVM_AccountList_NotNil () {
        // given
        // when
        let result = self.vm.accountsList
        // then
        XCTAssertNotNil(result)
    }
    
    func testNVM_AccountList_isEmpty () {
        // given
        // when
        let result = self.vm.accountsList.isEmpty
        // then
        XCTAssertTrue(result)
    }
    
    func testNVM_AccountList_countIsZero () {
        // given
        // when
        let result = self.vm.accountsList.count
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_SetAccountsList_countIsZero () {
        // given
        self.vm.setAccountsList(using: nil)
        // when
        let result = self.vm.accountsList.count
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_SetAccountsList_countIsFive () {
        // given
        let data = JsonFileLoader(decoder: JSONDecoder()).getData(from: JsonFileLoader(decoder: JSONDecoder()).getLocalURL(fromFile: "Accounts", withExtension: "json")!)
        self.vm.setAccountsList(using: data)
        // when
        let result = self.vm.accountsList.count
        // then
        XCTAssertEqual(result, 5)
    }
    
    func test_setAccountsList_firstElementKindIsCurrent () {
        // given
        let testCase = "current"
        let data = JsonFileLoader(decoder: JSONDecoder()).getData(from: JsonFileLoader(decoder: JSONDecoder()).getLocalURL(fromFile: "Accounts", withExtension: "json")!)
        self.vm.setAccountsList(using: data)
        // when
        let result = self.vm.accountsList
        // then
        XCTAssertEqual(result[0].kind, testCase)
    }
    
    func test_setAccountsList_firstElementBalanceIs1000 () {
        // given
        let testCase = 1000.0
        let data = JsonFileLoader(decoder: JSONDecoder()).getData(from: JsonFileLoader(decoder: JSONDecoder()).getLocalURL(fromFile: "Accounts", withExtension: "json")!)
        self.vm.setAccountsList(using: data)
        // when
        let result = self.vm.accountsList
        // then
        XCTAssertEqual(result[0].balance, testCase)

    }
    
    func test_setAccountsfromRESTAPI_withNilData_CountIsZero () {
        // given
        self.vm.callRestAPI(using: nil)
        // when
        let result = self.vm.accountsList.count
        // then
        XCTAssertEqual(result, 0)

    }
}
