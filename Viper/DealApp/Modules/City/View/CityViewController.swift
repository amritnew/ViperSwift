//
//  CityViewController.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import UIKit

class CityViewController: UIViewController, CityPresenterToViewProtocol {

    @IBOutlet var cityTableView: UITableView!
    var presenter: CityViewToPresenterProtocol?
    var array = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter?.setUpController()
    }
    
    func setNavTitle(title: String) {
        self.navigationItem.title = title
    }
    
    func createLogoutButton() {
        let logoutBtn = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutPressed))
        self.navigationItem.leftBarButtonItem = logoutBtn
    }
    
    func loadCityList(cities: [City]) {
        array = cities
        cityTableView.reloadData()
    }
    
    @objc func logoutPressed() {
        presenter?.logout()
    }

}

extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cityTableView.dequeueReusableCell(withIdentifier: kCityCellIdentifier, for: indexPath)
        let city = array[indexPath.row]
        cell.textLabel?.text = city.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = array[indexPath.row]
        presenter?.showDealPage(cityName: city.name)
    }
    
}
