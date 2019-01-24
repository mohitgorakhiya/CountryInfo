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
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testCountry() {
        let expObj  = expectation(description: "Check is Country API responding")
        let countryViewModel = CountryViewModel(PlaceAPIService.init(), dataSource: CountryDataSource())
        countryViewModel.fetchPlaceInfo { (_, title, _) in
            XCTAssertNotNil(title, "Expected non-nil string")
            expObj.fulfill()
        }
        waitForExpectations(timeout: 3.0) { error in
            if let _ = error {
                XCTAssert(false, "Timeout while fetching Country Info")
            }
        }
    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        self.testCountry()
    }
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
