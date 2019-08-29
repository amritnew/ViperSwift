//
//  DealPresenter.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import Foundation

class DealPresenter: DealViewToPresenterProtocol {

    var view: DealPresenterToViewProtocol?
    var interactor: DealPresenterToInteractorProtocol?
    var cityName: String!
    
    func setUpController() {
        view?.setCity(city: cityName)
        interactor?.fetchDeals()
    }
}

extension DealPresenter: DealInteractorToPresenterProtocol {
    
    func fetchedDealList(dealArray: [Deal]) {
        //filter array
        let filteredArray = filter(array: dealArray, with: cityName)
        
        if filteredArray.count == 0 {
            view?.emptyList(isEmpty: true)
        } else {
            view?.emptyList(isEmpty: false)
            view?.loadDeals(deal: filteredArray)
        }
    }
    
    func filter(array dealArray: [Deal], with city: String) -> [Deal] {
        return dealArray.filter({$0.merchantCity == city})
    }
    
}
