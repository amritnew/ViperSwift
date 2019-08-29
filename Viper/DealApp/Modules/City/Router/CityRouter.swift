//
//  CityRouter.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import UIKit

class CityRouter: CityPresenterToRouterProtocol {
    
    func pushDealView(cityName: String, viewController: UIViewController) {
        let storyBoard = UIStoryboard(name: kMainStoryboard, bundle: Bundle.main)
        let dealVC = storyBoard.instantiateViewController(withIdentifier: kDealViewIdentifier) as! DealsViewController
        DealRouter.createModule(dealVCref: dealVC, cityName: cityName)
        viewController.navigationController?.pushViewController(dealVC, animated: true)
    }
    
    class func createCityModule(cityRef: CityViewController) {
        let presenter: CityViewToPresenterProtocol & CityInteracterToPresenterProtocol = CityPresenter()
        cityRef.presenter = presenter
        cityRef.presenter?.view = cityRef
        cityRef.presenter?.router = CityRouter()
        cityRef.presenter?.interactor = CityInteractor()
        cityRef.presenter?.interactor?.presenter = presenter
    }
    
    func popToLogin(from viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}
