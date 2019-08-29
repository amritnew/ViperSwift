//
//  ViewController.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import UIKit
import GoogleSignIn


class LoginViewController: UIViewController, GIDSignInUIDelegate {
    
    var presenter: LoginViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance()?.uiDelegate = self
        
        LoginRouter.createLoginViewModule(loginRef: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

    @IBAction func googleButtonClick(_ sender: Any) {
        presenter?.login()
    }
    
    //MARK: Presenter to view protocol Methods
    
    
}

extension LoginViewController: LoginPresenterToViewProtocol {
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: kAlert, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: kOkay, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

