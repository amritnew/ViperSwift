//
//  DealModel.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import Foundation

struct Deal {
    var merchantName: String = ""
    var merchantRating: Float = 0
    var dealPrice: Float = 0
    var merchantAddress: String = ""
    var merchantCity: String = ""
    var merchantType: String = ""
    
    init(dict: [String: AnyObject]) {
        merchantName = dict["name"] as? String ?? ""
        merchantRating = (dict["Ratings"] as? NSNumber ?? NSNumber(floatLiteral: 0)).floatValue
        dealPrice = (dict["Price"] as? NSNumber ?? NSNumber(floatLiteral: 0)).floatValue
        merchantAddress = dict["Address"] as? String ?? ""
        merchantCity = dict["city"] as? String ?? ""
        merchantType = dict["type"] as? String ?? ""
    }
}
