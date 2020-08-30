//
//  Webservice.swift
//  StockAppsSwiftUI
//
//  Created by Diego Jurfest Ceccon on 29/08/20.
//  Copyright © 2020 ___DIEGOJURFESTCECCON___. All rights reserved.
//

import Foundation

class Webservice {
    
    func getStocks(completion: @escaping (([Stock]?) -> Void )) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks)
            
        }.resume()
    }
    
    func getTopNews(completion: @escaping (([News]?) -> Void)) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
               
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
                
            }
            
            let news = try? JSONDecoder().decode([News].self, from: data)
            
            DispatchQueue.main.async {
                completion(news)
            }
            
            
        }.resume()
        
    }
    
}

// https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=MSFT&interval=1min&apikey=demo

// https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=GOOG&interval=1min&apikey=demo

// https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=FB&interval=1min&apikey=demo

// https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=AMAZON&interval=1min&apikey=demo
