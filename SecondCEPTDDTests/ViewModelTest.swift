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
    
    func testNVM_AccountList_isNil () {
        // given
        // when
        let result = self.vm.accountsList
        // then
        XCTAssertNil(result)
    }
    
    func testNVM_AccountList_isEmpty () {
        // given
        // when
        // then
        
    }
}