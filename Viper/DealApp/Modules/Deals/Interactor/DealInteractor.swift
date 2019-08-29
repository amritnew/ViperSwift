//
//  DealInteractor.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import Foundation

class DealInteractor: DealPresenterToInteractorProtocol  {
    
    var presenter: DealInteractorToPresenterProtocol?
    
    func fetchDeals() {
        if let filePath = Bundle.main.path(forResource: "Deallist", ofType: "json") {
            var data: NSData?
            do {
                data = try NSData(contentsOfFile: filePath, options: .mappedIfSafe) }
            catch {
                print("Error getting deal list")
            }
            if let usableData = data as Data? {
                var jsonObject: Any?
                do {
                    jsonObject = try JSONSerialization.jsonObject(with: usableData, options: .mutableContainers)
                    if let jsonArray = jsonObject as? [[String : AnyObject]] {
                        var dealArray = [Deal]()
                        for dealDict in jsonArray {
                            dealArray.append(Deal(dict: dealDict))
                        }
                        presenter?.fetchedDealList(dealArray: dealArray)
                    }
                }
                catch {
                    print("Error getting deal list")
                }
            }
        }
    }
    
    
}
