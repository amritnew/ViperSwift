//
//  LoginInteractor.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import Foundation
import GoogleSignIn

class LoginInteractor: LoginPresenterToInteractorProtocol {
    
    var presenter: LoginInteractorToPresenterProtocol?
    
    init() {
        let selector = #selector(LoginInteractor.getLoginInfo(notification:))
        NotificationCenter.default.addObserver(self, selector: selector, name: NSNotification.Name(rawValue: kSignInNotification), object: nil)
    }
    
    func googleLogin() {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    //MARK: Notification Method
    @objc func getLoginInfo (notification: Notification) {
        if let userDict = notification.userInfo {
            if let username = userDict["statusText"] as? String, username != "User has disconnected." {
                //User Logged in
                let user = User.sharedUser
                user.fullname = username
                user.isLogin = true
                presenter?.loginSucessfull()
            } else {
                //Error
                let user = User.sharedUser
                user.fullname = ""
                user.isLogin = false
                presenter?.errorInLogin()
            }
        } else {
            //Error
            presenter?.errorInLogin()
        }
    }
    
}
