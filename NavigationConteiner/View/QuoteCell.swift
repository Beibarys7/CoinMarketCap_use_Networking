//
//  QuoteCell.swift
//  NavigationConteiner
//
//  Created by Бейбарыс Шагай on 11/16/20.
//  Copyright © 2020 Бейбарыс Шагай. All rights reserved.
//

import UIKit
import SDWebImage

final class QuoteCell: UITableViewCell {

    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var symbolLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!
    @IBOutlet private var supplyLabel: UILabel!
    
    func configure(with quote: Quote) {
        if let url = URL(string: quote.logoUrl ?? "") {
            iconImageView.sd_setImage(with: url)
        } else {
            iconImageView.image = nil
        }
////        print("quote.logoUrl = \(quote.logoUrl)")
        nameLabel.text = quote.name
         symbolLabel.text = quote.symbol
         priceLabel.text = quote.price.description
        supplyLabel.text = quote.maxSupply

    }
}
