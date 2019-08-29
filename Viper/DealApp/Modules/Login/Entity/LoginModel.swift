//
//  LoginModel.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import Foundation

class User {
    
    //Singleton instance
    static let sharedUser = User()
    
    var fullname: String?
    var isLogin: Bool = false
    
}
