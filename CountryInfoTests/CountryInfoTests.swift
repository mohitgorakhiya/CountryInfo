//
//  CountryInfoTests.swift
//  CountryInfoTests
//
//  Created by Mohit Gorakhiya on 1/15/19.
//  Copyright © 2019 Mohit. All rights reserved.
//

import XCTest
import Alamofire
@testable import CountryInfo

class CountryInfoTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("setUp")
        self.testCountry()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testCountry() {
        let expObj  = expectation(description: "Country")
        let country = Country()
        country.refreshCountry { string in
            XCTAssertNotNil(string, "Expected non-nil string")
            expObj.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
class Country {
    var property: String!
    func refreshCountry(completionHandler: ((String?) -> Void)?) {
        Alamofire.request(Constant.PLACEURL, method: .get, parameters: nil)
            .responseJSON { response in
                if response.data != nil {
                    let str = String(decoding: response.data!, as: UTF8.self)
                    completionHandler?(str)
                } else {
                    completionHandler?(nil)
                }
        }
    }
}
