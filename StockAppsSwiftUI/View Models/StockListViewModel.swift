//
//  StockListViewModel.swift
//  StockAppsSwiftUI
//
//  Created by Diego Jurfest Ceccon on 29/08/20.
//  Copyright © 2020 ___DIEGOJURFESTCECCON___. All rights reserved.
//

import Foundation
import SwiftUI

class StockListViewModel: ObservableObject {
       
    @Published var dragOffset: CGSize = CGSize(width: 0, height: 530)
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var articles: [NewsViewModel] = [NewsViewModel]()
    
    func load() {
        self.fetchNews()
        self.fetchStocks()
    }
    
    private func fetchStocks() {
        Webservice().getStocks { stocks in
            
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
            
        }
    }
    
    private func fetchNews() {
        Webservice().getTopNews { articles in
            
            if let articles = articles {
                DispatchQueue.main.async {
                    self.articles = articles.map(NewsViewModel.init)
                }
            }
            
        }
    }
    
    
}
