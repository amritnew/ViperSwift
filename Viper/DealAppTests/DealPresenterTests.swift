//
//  DealPresenterTests.swift
//  DealAppTests
//
//  Created by AmritPandey on 5/5/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import XCTest
@testable import DealApp

class DealPresenterTests: XCTestCase {
    
    var presenter: DealPresenter!
    var dealArray: [Deal]!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = DealPresenter()
        //create deal object
        let dealDict1 = ["name":"Merchant A","type":"Dining","Ratings": 4.3,"Price": 199,"Address":"123, Cyber hub","city":"Gurgaon"] as [String : AnyObject]
        let dealDict2 = ["name":"Merchant D","type":"Fitness","Ratings": 3.2,"Price": 199,"Address":"123, Cyber hub","city":"Bangalore"] as [String : AnyObject]
        let deal1 = Deal(dict: dealDict1)
        let deal2 = Deal(dict: dealDict2)
        dealArray = [deal1, deal2]
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFilter() {
        let filterArray1 = presenter.filter(array: dealArray, with: "Bangalore")
        XCTAssertEqual(filterArray1[0].merchantCity, "Bangalore")
        
        let filterArray2 = presenter.filter(array: dealArray, with: "Gurgaon")
        XCTAssertEqual(filterArray2[0].merchantCity, "Gurgaon")
    }

}
