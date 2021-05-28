//
//  Converter.swift
//  NavigationConteiner
//
//  Created by Бейбарыс Шагай on 11/14/20.
//  Copyright © 2020 Бейбарыс Шагай. All rights reserved.
//

import Foundation

final class Converter {
    
    func convert(baseQuote: Quote, convertQuote: Quote, count: Double ) -> Double {
       
        let basePrice = Double(convertQuote.price)!
        let convertPrice = Double(convertQuote.price)!
        let result = count * basePrice / convertPrice
        
        return result
    }
}
