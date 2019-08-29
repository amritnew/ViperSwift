//
//  DealsViewController.swift
//  DealApp
//
//  Created by AmritPandey on 4/29/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import UIKit

class DealsViewController: UIViewController, DealPresenterToViewProtocol {

    @IBOutlet var dealTableView: UITableView!
    @IBOutlet var emptyLabel: UILabel!
    
    var array = [Deal]()
    var presenter: DealViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presenter?.setUpController()
    }
    
    func setCity(city: String) {
        self.navigationItem.title = city
    }
    
    func emptyList(isEmpty: Bool) {
        dealTableView.isHidden = isEmpty
        emptyLabel.isHidden = !isEmpty
    }
    
    func loadDeals(deal: [Deal]) {
        array = deal
        dealTableView.reloadData()
    }

}

extension DealsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dealTableView.dequeueReusableCell(withIdentifier: kDealCellIdentifier, for: indexPath) as! DealTableViewCell
        cell.fillCell(with: array[indexPath.row])
        return cell
    }
    
    
    
    
}
