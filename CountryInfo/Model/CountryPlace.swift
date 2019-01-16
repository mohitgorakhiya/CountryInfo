//
//  CountryPlace.swift
//  CountryInfo
//
//  Created by Mohit Gorakhiya on 1/15/19.
//  Copyright © 2019 Mohit. All rights reserved.
//

import UIKit
import SwiftyJSON

class CountryPlace: NSObject {

    var placeTitle : String!
    var placeDetails : String!
    var placeImageStr : String!

    init(placeDict: Dictionary<String, Any>) {
        
        self.placeTitle = placeDict["title"] as? String ?? ""
        self.placeDetails = placeDict["description"] as? String ?? ""
        self.placeImageStr = placeDict["imageHref"] as? String ?? ""
    }
    
}
