//
//  File.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import Foundation

protocol DealViewToPresenterProtocol {
    
    var view: DealPresenterToViewProtocol? {get set}
    var interactor: DealPresenterToInteractorProtocol? {get set}
    
    func setUpController()
}

protocol DealPresenterToViewProtocol {
    func loadDeals(deal: [Deal])
    func emptyList(isEmpty: Bool)
    func setCity(city: String)
}

protocol DealPresenterToInteractorProtocol {
    
    var presenter: DealInteractorToPresenterProtocol? {get set}
    func fetchDeals()
}

protocol DealInteractorToPresenterProtocol {
    
    func fetchedDealList(dealArray: [Deal])
}
