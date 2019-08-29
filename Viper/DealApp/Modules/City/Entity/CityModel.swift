//
//  CityModel.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import Foundation

struct City {
    var name: String!
    
    init(dict: [String: String]) {
        name = dict["city"]
    }
}
