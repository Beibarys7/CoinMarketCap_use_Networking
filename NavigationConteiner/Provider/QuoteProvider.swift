//
//  QuoteProvider.swift
//  NavigationConteiner
//
//  Created by Бейбарыс Шагай on 11/14/20.
//  Copyright © 2020 Бейбарыс Шагай. All rights reserved.
//

import Foundation

final class QuoteProvider {
    
    var timer: Timer?
    let names = ["Bitcoin", "Ripple", "Ethereum"]
    let symbols = ["BTC", "XRP", "ETH"]
    let imageNames = ["btc", "xrp", "eth"]

    func generateQuotes() -> [Quote] {
        return []
//            names.enumerated().map{ index, item in Quote (
//            from: <#Decoder#>, symbol: symbols[index],
//            name: item,
//            imageName: imageNames[index],
//            rank: 1, price: Double.random(in: 1 ... 10000),
//            supply: 17.9,
//            open: 10350.42,
//            high: 10389.89,
//            average: 10243.98,
//            close: 10168.70,
//            low: 10087.30,
//            change: 181.72,
//            marketCap: 182.496,
//            Circulating: 17.9,
//            volume: 15.755,
//            maxSupply: 21
//            )}
    }
    
}
