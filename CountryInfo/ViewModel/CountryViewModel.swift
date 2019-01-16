//
//  CountryViewModel.swift
//  CountryInfo
//
//  Created by Mohit Gorakhiya on 1/15/19.
//  Copyright © 2019 Mohit. All rights reserved.
//

import Foundation

struct CountryViewModel {
    
    var placeAPIService: PlaceAPIService
    
    init(_ placeAPIService: PlaceAPIService) {
        self.placeAPIService = placeAPIService
    }
    
    func fetchPlaceInfo(completionHandler: @escaping CompletionHandler) {
        self.placeAPIService.fetchPlaceInfo { (success, countryInfo, error) in
            return completionHandler(success, countryInfo, error)
        }
    }
}
