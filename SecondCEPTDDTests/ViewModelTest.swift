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
    }

}
