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
        self.jfl = JsonFileLoader(decoder: JSONDecoder())
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
    
    func test_NJFL_JSONDecoder_NotNil () {
        // given
        // when
        let result = self.jfl.decoder
        // then
        XCTAssertNotNil(result)
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
        let result = self.jfl.fetch(from: nil)
        // then
        XCTAssertNil(result)
    }
    
    func test_NJFL_fetchFromData_NotNil () {
        // given
        guard let url = self.jfl.getLocalURL(fromFile: "Accounts", withExtension: "json") else { return }
        let data = self.jfl.getData(from: url)
        // when
        let result = self.jfl.fetch(from: data)
        // then
        XCTAssertNotNil(result)
    }
    
    func test_JFLfetch_countEqual5 () {
        // given
        guard let url = self.jfl.getLocalURL(fromFile: "Accounts", withExtension: "json") else { return }
        let data = self.jfl.getData(from: url)
        // when
        let result = self.jfl.fetch(from: data)
        // then
        XCTAssertEqual(result?.count, 5)
    }
    
    func test_GetRemoteURL_isNil () {
        // given
        // when
        let result = self.jfl.getRemoteURL(scheme: "",host: "",path: "")
        // then
        XCTAssertNil(result)
    }
    
    func test_getRemoteURL_NotNil () {
        // given
        // when
        let result = self.jfl.getRemoteURL(scheme: "https", host: "my-json-server.typicode.com", path: "/szarleydwarf/secondCEP/master/db/accounts")
        // then
        XCTAssertNotNil(result)
    }
    
    func test_getRemoteURL_NotEqualsCorrectURL () {
        // given
        let url:URL = URL(string: "https://my-json-server.typicode.com/szarleydwarf/secondCEP/master/db/accounts")!
        // when
        let result = self.jfl.getRemoteURL(scheme: "https",host: "",path: "")
        // then
        XCTAssertNotEqual(result, url)
    }
    
    func test_getRemoteURL_EqualsCorrectURL () {
        // given
        let url:URL = URL(string: "https://my-json-server.typicode.com/szarleydwarf/secondCEP/master/db/accounts")!
        // when
        let result = self.jfl.getRemoteURL(scheme: "https", host: "my-json-server.typicode.com", path: "/szarleydwarf/secondCEP/master/db/accounts")
        // then
        XCTAssertEqual(result, url)
    }
    
    func test_getRestData_isNil () {
        // given
        var result: Result<Data>?
        // when
        
        self.jfl.getRestData (from: nil) { resultReturn in
            print("RESULT \(resultReturn)")
            result = $0
            
        }
        // then
    }
    
//    func test_getRestDataWithEmptyURL_isNil () {
//        // given
//        guard let url = URL(string: "") else { return }
//        let expectation = XCTestExpectation(description: "nil")
//        // when
//        self.jfl.getRestData (from: url) { completed, data in
//            XCTAssertNil(data)
//            expectation.fulfill()
//        }
//        // then
//        wait(for: [expectation], timeout: 5)
//    }
//
//    func test_getRestDataFromNilURL_isFalse () {
//         // given
//         let expectation = XCTestExpectation(description: "false")
//               // when
//
//         self.jfl.getRestData (from: nil) { completed, data in
//             XCTAssertFalse(completed)
//             expectation.fulfill()
//         }
//         // then
//         wait(for:[expectation], timeout: 5)
//     }
//
//    func test_getRestDataFromEmptyURL_isFalse () {
//         // given
//         let expectation = XCTestExpectation(description: "false")
//               // when
//         guard let url = URL(string: "") else { return }
//
//         self.jfl.getRestData (from: url) { completed, data in
//             XCTAssertFalse(completed)
//             expectation.fulfill()
//         }
//         // then
//         wait(for:[expectation], timeout: 5)
//
//     }
//
//    func test_getRestDataFromCorrectURL_isTrue () {
//         // given
//         let expectation = XCTestExpectation(description: "true")
//               // when
//         guard let url = URL(string: "https://my-json-server.typicode.com/szarleydwarf/secondCEP/master/db/accounts") else { return }
//
//         self.jfl.getRestData (from: url) { completed, data in
//             XCTAssertTrue(completed)
//             expectation.fulfill()
//         }
//         // then
//         wait(for:[expectation], timeout: 20)
//
//     }
//
//    func test_getRestDataFromInCorrectURL_DataNil () {
//        // given
//        let expectation = XCTestExpectation(description: "not nil")
//              // when
//        guard let url = URL(string: "https://my-json-server.typicode.com/") else { return }
//
//        self.jfl.getRestData (from: url) { completed, data in
//            XCTAssertNil(data)
//            expectation.fulfill()
//        }
//        // then
//        wait(for:[expectation], timeout: 5)
//
//    }
//
//    func test_getRestDataFromCorrectURL_DataNotNil () {
//        // given
//        let expectation = XCTestExpectation(description: "not nil")
//              // when
//        guard let url = URL(string: "https://my-json-server.typicode.com/szarleydwarf/secondCEP/master/db/accounts") else { return }
//
//        self.jfl.getRestData (from: url) { completed, data in
//            XCTAssertNotNil(data)
//            expectation.fulfill()
//        }
//        // then
//        wait(for:[expectation], timeout: 20)
//    }

}
