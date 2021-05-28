//
//  MainViewController.swift
//  NavigationConteiner
//
//  Created by Бейбарыс Шагай on 11/17/20.
//  Copyright © 2020 Бейбарыс Шагай. All rights reserved.
//

import UIKit

final class ConverterViewController: UIViewController {
    
    @IBOutlet private var cyryptoCurrencyLabel1: UILabel!
    @IBOutlet private var cyryptoCurrencyLabel2: UILabel!
    
    var firstCryptoCurrency: Quote?
    var secondtCryptoCurrency: Quote?
    
    
    @IBOutlet private var sumTextField: UITextField!
        
    @IBOutlet private var textFieldFirst: UITextField!
    
    @IBOutlet private var textFieldSecond: UITextField!
    
    private var quotes = [Quote]()
    private var quote : Quote?
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    
    
    @IBAction func FirstCryptoCurrency(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "QuoteViewController") as! QuoteViewController
        vc.shouldOpenDetailVC = false
        vc.onSelectQuote = { quote in // 
            self.cyryptoCurrencyLabel1.text = quote.name
            self.firstCryptoCurrency = quote // object save
            self.textFieldFirst.text = quote.price
        }
        present(vc, animated: true, completion: nil)
    }
        
    @IBAction func SecondCryptoCurrency(_ sender: UIButton) {
        var firstPrice = 0
        var secondPrice = 0
        var sum = 0
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "QuoteViewController") as! QuoteViewController
        vc.shouldOpenDetailVC = false
        vc.onSelectQuote = { quote in
            self.cyryptoCurrencyLabel2.text = quote.name
            self.secondtCryptoCurrency = quote
            firstPrice = Int(Double(self.textFieldFirst.text ?? "") ?? 0)
            self.textFieldSecond.text = quote.price
            secondPrice = Int(Double(self.textFieldSecond.text ?? "") ?? 0)
            sum = firstPrice * secondPrice
            self.textFieldSecond.text = "\(sum)"
        }
        present(vc, animated: true, completion: nil)
    }
}

