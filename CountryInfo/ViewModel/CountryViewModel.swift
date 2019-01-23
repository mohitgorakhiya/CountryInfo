//
//  CountryViewModel.swift
//  CountryInfo
//
//  Created by Mohit Gorakhiya on 1/15/19.
//  Copyright © 2019 Mohit. All rights reserved.
//

import Foundation

struct CountryViewModel {
    
    weak var dataSource : GenericDataSource<CountryInfo>?
    var placeAPIService: PlaceAPIService
    
    init(_ placeAPIService: PlaceAPIService, dataSource : GenericDataSource<CountryInfo>?) {
        self.dataSource = dataSource
        self.placeAPIService = placeAPIService
    }
    func fetchPlaceInfo(completionHandler: @escaping CompletionHandlerAPI) {
        self.placeAPIService.fetchPlaceInfo { (success, countryInfo, error) in
            
            self.dataSource?.data.value = [countryInfo] as! [CountryInfo]
            return completionHandler(success, countryInfo, error)
        }
    }
}
