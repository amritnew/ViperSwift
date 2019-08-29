//
//  LoginRouter.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import UIKit

class LoginRouter: LoginPresenterToRouterProtocol {
    
    func pushSelectCityVC(viewController: UIViewController) {
        let storyBoard = UIStoryboard(name: kMainStoryboard, bundle: Bundle.main)
        let cityVC = storyBoard.instantiateViewController(withIdentifier: kSelectCityIdentifier) as! CityViewController
        CityRouter.createCityModule(cityRef: cityVC)
        viewController.navigationController?.pushViewController(cityVC, animated: true)
    }
    
    class func createLoginViewModule(loginRef: LoginViewController) {
        let presenter: LoginViewToPresenterProtocol & LoginInteractorToPresenterProtocol = LoginPresenter()
        
        loginRef.presenter = presenter
        loginRef.presenter?.router = LoginRouter()
        loginRef.presenter?.view = loginRef
        loginRef.presenter?.interactor = LoginInteractor()
        loginRef.presenter?.interactor?.presenter = presenter
    }
    
}
