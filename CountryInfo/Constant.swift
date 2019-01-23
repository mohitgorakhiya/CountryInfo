//
//  Constant.swift
//  CountryInfo
//
//  Created by Mohit Gorakhiya on 1/15/19.
//  Copyright © 2019 Mohit. All rights reserved.
//

import Foundation

typealias CompletionHandlerAPI = (_ success:Bool, _ countryInfo: CountryInfo?, _ error: Error?) -> Void

struct Constant {
    
    static let appTitle = "Country Info"
    static let PLACEURL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    static let noInternetMessage = "No internet connection"
    static let errorMessage = "Oh error occurred!"
    static let alertTitle = "Alert"
    static let alertOk = "OK"
    
    static let rowsKey = "rows"
    static let titleKey = "title"
    static let detailKey = "description"
    static let imageKey = "imageHref"
}
