//
//  CityPresenter.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import UIKit

class CityPresenter: CityViewToPresenterProtocol {
    
    var view: CityPresenterToViewProtocol?
    var interactor: CityPresenterToInteracterProtocol?
    var router: CityPresenterToRouterProtocol?
    
    func setUpController() {
        view?.setNavTitle(title: kCityNavTitle)
        view?.createLogoutButton()
        interactor?.getCityList()
    }
    
    func showDealPage(cityName: String) {
        router?.pushDealView(cityName: cityName, viewController: view as! UIViewController)
    }
    
    func logout() {
        interactor?.logoutFromGoogle()
        router?.popToLogin(from: view as! CityViewController)
    }
}

extension CityPresenter: CityInteracterToPresenterProtocol {
    
    func fetchedCityList(cities: [City]) {
        view?.loadCityList(cities: cities)
    }
    
    
}
