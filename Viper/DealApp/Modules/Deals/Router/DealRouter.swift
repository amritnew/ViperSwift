//
//  DealRouter.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import Foundation

class DealRouter {
    
    class func createModule(dealVCref: DealsViewController, cityName: String) {
        let presenter = DealPresenter()
        dealVCref.presenter = presenter
        dealVCref.presenter?.view = dealVCref
        dealVCref.presenter?.interactor = DealInteractor()
        dealVCref.presenter?.interactor?.presenter = presenter
        
        presenter.cityName = cityName
        
    }
}
