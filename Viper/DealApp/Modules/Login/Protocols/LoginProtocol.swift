//
//  LoginProtocol.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import Foundation
import UIKit

protocol LoginPresenterToViewProtocol:class {
    func showAlert(message: String)
}

protocol LoginViewToPresenterProtocol:class {
    
    var view: LoginPresenterToViewProtocol? {get set}
    var interactor: LoginPresenterToInteractorProtocol? {get set}
    var router: LoginPresenterToRouterProtocol? {get set}
    
    func login()
}

protocol LoginPresenterToRouterProtocol:class {
    func pushSelectCityVC(viewController: UIViewController)
}

protocol LoginPresenterToInteractorProtocol:class {
    
    var presenter: LoginInteractorToPresenterProtocol? {get set}
    
    func googleLogin()
}

protocol LoginInteractorToPresenterProtocol:class {
    func errorInLogin()
    func loginSucessfull()
}
