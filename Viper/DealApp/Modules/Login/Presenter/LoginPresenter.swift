//
//  LoginPresenter.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import UIKit

class LoginPresenter: LoginViewToPresenterProtocol {
    
    var view: LoginPresenterToViewProtocol?
    var interactor: LoginPresenterToInteractorProtocol?
    var router: LoginPresenterToRouterProtocol?
    
    func login() {
        interactor?.googleLogin()
    }
    
}

extension LoginPresenter: LoginInteractorToPresenterProtocol {
    
    func errorInLogin() {
        view?.showAlert(message: kLoginError)
    }
    
    func loginSucessfull() {
        router?.pushSelectCityVC(viewController: view as! UIViewController)
    }
}
