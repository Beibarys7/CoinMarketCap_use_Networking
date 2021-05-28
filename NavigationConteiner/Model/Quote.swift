//
//  Quote.swift
//  NavigationConteiner
//
//  Created by Бейбарыс Шагай on 11/14/20.
//  Copyright © 2020 Бейбарыс Шагай. All rights reserved.
//

import Foundation
// Decodable для того что бы вытащить из сети данные
struct Quote: Decodable {
    
    let id : String?
    let currency : String?
    let symbol : String?
    let name : String?
    let logoUrl : String?
    let status : String
    let price : String
    let priceDate : String?
    let priceTimestamp : String?
    let circulatingSupply : String?
    let maxSupply : String?
    let marketCap : String?
    let numExchanges : String?
    let numPairs : String?
    let numPairsUnmapped : String?
    let firstCandle : String?
    let firstTrade : String?
    let firstOrderBook : String?
    let rank : String?
    let rankDelta : String?
    let high : String?
    let highTimestamp : String?

  
    
    enum CodingKeys: String, CodingKey {
        case id
        case currency
        case symbol
        case name
        case status
        case price
        case logoUrl = "logo_url"
        case priceDate = "price_date"
        case priceTimestamp = "price_timestamp"
        case circulatingSupply = "circulating_supply"
        case maxSupply = "max_supply"
        case marketCap = "market_cap"
        case numExchanges = "num_exchanges"
        case numPairs = "num_pairs"
        case numPairsUnmapped = "num_pairs_unmapped"
        case firstCandle = "first_candle"
        case firstTrade = "first_trade"
        case firstOrderBook = "first_order_book"
        case rank
        case rankDelta = "rank_delta"
        case high
        case highTimestamp = "high_timestamp"
        
    }
}
