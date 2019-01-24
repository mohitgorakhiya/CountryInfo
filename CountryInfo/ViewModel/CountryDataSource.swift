//
//  File.swift
//  CountryInfo
//
//  Created by Mohit CCT on 23/01/19.
//  Copyright © 2019 Mohit. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class CountryDataSource: GenericDataSource<CountryInfo>, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.data.value.count > 0 {
            let countryPlace = self.data.value[section]
            return countryPlace.placesArray.count
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var placeCell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell") as? PlaceCell
        if placeCell == nil {
            placeCell = PlaceCell.init(style: .default, reuseIdentifier: "PlaceCell")
        }
        let countryPlace = self.data.value[0].placesArray[indexPath.row]
        placeCell?.setUpCellData(placeInfo: countryPlace)
        return placeCell!
    }
}
