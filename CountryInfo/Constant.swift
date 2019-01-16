//
//  Constant.swift
//  CountryInfo
//
//  Created by Mohit Gorakhiya on 1/15/19.
//  Copyright © 2019 Mohit. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ success:Bool, _ countryInfo: CountryInfo?, _ error: Error?) -> Void

struct Constant {
    static let PLACEURL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
}
