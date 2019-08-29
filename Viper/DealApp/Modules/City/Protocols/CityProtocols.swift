//
//  CityProtocols.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import Foundation
import UIKit

protocol CityViewToPresenterProtocol:class {
    
    var view: CityPresenterToViewProtocol? {get set}
    var interactor: CityPresenterToInteracterProtocol? {get set}
    var router: CityPresenterToRouterProtocol? {get set}
    
    func setUpController()
    func showDealPage(cityName: String)
    func logout()
}

protocol CityPresenterToViewProtocol:class {
    func setNavTitle(title: String)
    func createLogoutButton()
    func loadCityList(cities: [City])
}

protocol CityPresenterToRouterProtocol:class {
    func pushDealView(cityName: String, viewController: UIViewController)
    func popToLogin(from viewController: UIViewController)
}

protocol CityInteracterToPresenterProtocol:class {
    func fetchedCityList(cities: [City])
}

protocol CityPresenterToInteracterProtocol:class {
    
    var presenter: CityInteracterToPresenterProtocol? {get set}
    
    func getCityList()
    func logoutFromGoogle()
}
