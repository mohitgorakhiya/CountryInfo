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
    func fetchPlaceInfo(completionHandler: @escaping CompletionHandler) {
        Alamofire.request(Constant.PLACEURL, method: .get, parameters: nil)
            .responseJSON { response in
                
                if response.data != nil {
                    
                    let str = String(decoding: response.data!, as: UTF8.self)
                    let countryInfo = CountryInfo.init()
                    if let data = str.data(using: .utf8)
                    {
                        do {
                            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                            print(jsonResponse as! NSDictionary)
                            
                            let dict = jsonResponse as! Dictionary<String, Any>
                            
                            if dict["title"] != nil {
                                countryInfo.title = dict["title"] as? String ?? ""
                            }
                            
                            if dict["rows"] != nil {
                                let placesArray = dict["rows"] as! Array<Any>
                                for i in 0..<placesArray.count {
                                    let placeInfoDict = placesArray[i] as! Dictionary<String, Any>
                                    let placeInfo = CountryPlace.init(placeDict: placeInfoDict)
                                    countryInfo.placesArray.append(placeInfo)
                                }
                            }
                            completionHandler(true, countryInfo, nil)
                        }
                        catch let error {
                            completionHandler(false, countryInfo, error)
                        }
                        
                    }
                }
                else {
                    completionHandler(false, nil, nil)
                }
        }
    }
}
