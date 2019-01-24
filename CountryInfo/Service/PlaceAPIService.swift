//
//  PlaceAPIService.swift
//  CountryInfo
//
//  Created by Mohit Gorakhiya on 1/15/19.
//  Copyright © 2019 Mohit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PlaceAPIService {

    //Get Places List
    func fetchPlaceInfo(completionHandler: @escaping CompletionHandlerAPI) {
        Alamofire.request(Constant.PLACEURL, method: .get, parameters: nil)
            .responseJSON { response in

                if response.data != nil {
                    let str = String(decoding: response.data!, as: UTF8.self)
                    let countryInfo = CountryInfo.init()
                    if let data = str.data(using: .utf8) {
                        do {
                            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                            let dict = jsonResponse as? Dictionary<String, Any>
                            if dict?[Constant.titleKey] != nil {
                                countryInfo.title = dict?[Constant.titleKey] as? String ?? ""
                            }
                            if dict?[Constant.rowsKey] != nil {
                                if let placesArray = dict?[Constant.rowsKey] as? Array<Any> {
                                    for index in 0..<placesArray.count {
                                        let placeInfoDict = placesArray[index] as? Dictionary<String, Any>
                                        let placeInfo = CountryPlace.init(placeDict: placeInfoDict)
                                        if placeInfo.placeTitle.count > 0 &&
                                            placeInfo.placeTitle.count > 0 &&
                                            placeInfo.placeTitle.count > 0 {
                                            countryInfo.placesArray.append(placeInfo)
                                        }
                                    }
                                }
                            }
                            completionHandler(true, countryInfo, nil)
                        } catch let error {
                            completionHandler(false, countryInfo, error)
                        }
                    }
                } else {
                    completionHandler(false, nil, nil)
                }
        }
    }
}
