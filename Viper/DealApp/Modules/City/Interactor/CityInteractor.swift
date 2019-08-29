//
//  CityInteractor.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import Foundation
import GoogleSignIn

class CityInteractor: CityPresenterToInteracterProtocol {
    
    var presenter: CityInteracterToPresenterProtocol?
    
    func getCityList() {
        if let filePath = Bundle.main.path(forResource: "Citylist", ofType: "json") {
            var data: NSData?
            do {
                data = try NSData(contentsOfFile: filePath, options: .mappedIfSafe) }
            catch {
                print("Error getting city list")
            }
            if let usableData = data as Data? {
                var jsonObject: Any?
                do {
                    jsonObject = try JSONSerialization.jsonObject(with: usableData, options: .mutableContainers)
                    if let jsonArray = jsonObject as? [[String : String]] {
                        var cityArray = [City]()
                        for cityDict in jsonArray {
                            cityArray.append(City(dict: cityDict))
                        }
                        presenter?.fetchedCityList(cities: cityArray)
                    }
                }
                catch {
                    print("Error getting city list")
                }
            }
            
        }
    }
    
    func logoutFromGoogle() {
        GIDSignIn.sharedInstance()?.signOut()
    }
    
}
