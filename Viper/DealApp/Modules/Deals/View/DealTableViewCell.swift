//
//  DealTableViewCell.swift
//  DealApp
//
//  Created by AmritPandey on 5/4/19.
//  Copyright © 2019 Nagarro. All rights reserved.
//

import UIKit

class DealTableViewCell: UITableViewCell {

    @IBOutlet weak var merchantLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var bgView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         bgView.layer.cornerRadius = 5
    }

    func fillCell(with deal: Deal) {
        merchantLabel.text = deal.merchantName
        typeLabel.text = deal.merchantType
        ratingLabel.text = "\(deal.merchantRating)"
        addressLabel.text = deal.merchantAddress
        priceLabel.text = "\(deal.dealPrice)"
    }

}
