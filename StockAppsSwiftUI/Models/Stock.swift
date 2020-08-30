//
//  Stock.swift
//  StockAppsSwiftUI
//
//  Created by Diego Jurfest Ceccon on 29/08/20.
//  Copyright © 2020 ___DIEGOJURFESTCECCON___. All rights reserved.
//

import Foundation

struct Stock: Decodable {
    
    let symbol: String
    let description: String
    let price: Double
    let change: String
    
//    init(symbol: String, description: String, price: Double, change: String) {
//        self.symbol = symbol
//        self.description = description
//        self.price = price
//        self.change = change
//    }
    
}
