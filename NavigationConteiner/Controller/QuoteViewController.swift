//
//  QuoteViewController.swift
//  NavigationConteiner
//
//  Created by Бейбарыс Шагай on 11/14/20.
//  Copyright © 2020 Бейбарыс Шагай. All rights reserved.
//

import ESPullToRefresh
import AnimatableReload
import UIKit
import SwipeCellKit

let globalNotificationName = NSNotification.Name("global")
let sendQuoteToConvertVC = NSNotification.Name("sendQuoteToConvertVC")

final class QuoteViewController: UITableViewController {

    var timer: Timer?

    private var quotes = [Quote]()
//    private var quote : Quote?
    private var quoteProvider: QuoteProvider?
    private var myRefreshControl: QuoteProvider?
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    var shouldOpenDetailVC = true
    
    var onSelectQuote: ((Quote) -> Void)?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = indexPath.row
        let quote = quotes[index]
        onSelectQuote?(quote) // ewkanday realyzasia jok

    }
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
 
//        quoteProvider = QuoteProvider()
//        quoteProvider?.post()
        
            // action to be performed (pull data from some source)
            
        setupRefleshControl()
        
        setupViews()
        
        getQuotes { quotes in
            DispatchQueue.main.async {
                self.activityIndicator.isHidden = true // здесь анимацию обновление делаем скрытый
                self.activityIndicator.startAnimating() // // здесь анимацию обновление делаем стоп
                self.quotes = quotes

                AnimatableReload.reload(tableView: self.tableView, animationDirection: "down")
            }
        }
    }
    
    private func setupRefleshControl() {
        self.tableView.es.addPullToRefresh {
            [unowned self] in
            /// Do anything you want...
            /// ...
            self.getQuotes { quotes in
                self.quotes = quotes
                DispatchQueue.main.async {
                    self.activityIndicator.isHidden = true
                    self.tableView.es.stopPullToRefresh()
                    self.tableView.setContentOffset(.zero, animated: false)
                    print("danny keldi!!!")
                }
            }
            /// Stop refresh when your job finished, it will reset refresh footer if completion is true
            
        }
    }
    
    private func setupViews() { // делаем для загрузки обновлении constraint
        tableView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo: tableView.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
    }
    
     func getQuotes(completion: @escaping ([Quote]) -> Void) {
        activityIndicator.isHidden = false // когда из API берем данные анимация будет виден
        activityIndicator.startAnimating()
        let urlString = "https://api.nomics.com/v1/currencies/ticker?key=3c8c0907276523d0ff0e94c50657de0c&format=json&interval=5m&convert=USD"
        let url = URL(string: urlString)!
        let dataTask = URLSession.shared.dataTask(with: url) {(data, response, error) in
            // data то что приходить из запроса
            // мы должны получить или выташить данные из этого data
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                  let quotes = try jsonDecoder.decode([Quote].self, from: data)
                    completion(quotes)
                } catch {
                    print(error.localizedDescription)
                }
            }

            if let error = error {
                print(error)
            }
        }
        dataTask.resume()
         
    }
    
    @IBAction func refleshQuotesButton(_ sender: UIBarButtonItem) { // update quotes
            getQuotes { quotes in
                DispatchQueue.main.async {
                    self.activityIndicator.isHidden = true // здесь анимацию обновление делаем скрытый
                    self.activityIndicator.startAnimating() // // здесь анимацию обновление делаем стоп
                    self.quotes = quotes
                    self.tableView.reloadData()
                    print("reflesh worked!")
                }
            }

        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      if let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell",
                                                   for: indexPath) as? QuoteCell{

            let index = indexPath.row
            let quote = quotes[index]
            cell.configure(with: quote)
            return cell
        }
            return QuoteCell()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if shouldOpenDetailVC {
            if segue.identifier == "quoteToDetail",
                let cell = sender as? QuoteCell,
                let indexPath = tableView.indexPath(for: cell),
                let detailVC = segue.destination as? QuoteDetailViewController {
                detailVC.quote = quotes[indexPath.row]
            }
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}
