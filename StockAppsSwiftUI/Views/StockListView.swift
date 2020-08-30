//
//  StockListView.swift
//  StockAppsSwiftUI
//
//  Created by Diego Jurfest Ceccon on 29/08/20.
//  Copyright © 2020 ___DIEGOJURFESTCECCON___. All rights reserved.
//

import SwiftUI

struct StockListView: View {
    
    let stocks: [StockViewModel]
    
    var body: some View {
        
        List(self.stocks, id: \.symbol) { stock in
            StockCellView(stock: stock)
        }
        
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let stocks = Stock(symbol: "MGLU3", description: "Varejo", price: 94.97, change: "+2.99")
        
        return StockListView(stocks: [StockViewModel(stock: stocks)])
        
    }
}


struct StockCellView: View {
    
    let stock: StockViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Text(stock.symbol)
                    .font(.custom("Arial", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
                Text(stock.description)
                    .font(.custom("Arial", size: 18))
                    .foregroundColor(.gray)
                
            }
            
            Spacer()
            
            VStack {
                
                Text(stock.price)
                    .font(.custom("Arial", size: 22))
                    .foregroundColor(.white)
                
                Button(stock.change) {
                    
                }
                .frame(width: 75)
                .padding(5)
                .background(Color.red)
                .foregroundColor(Color.white)
                .cornerRadius(6)
                
                
            }
            
        }
    }
}
