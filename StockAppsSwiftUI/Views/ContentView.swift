//
//  ContentView.swift
//  StockAppsSwiftUI
//
//  Created by Diego Jurfest Ceccon on 29/08/20.
//  Copyright © 2020 ___DIEGOJURFESTCECCON___. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
        stockListVM.load()
    }
    
    var body: some View {
        
        let filteredStocks = self.stockListVM.searchTerm.isEmpty ? self.stockListVM.stocks : self.stockListVM.stocks.filter {
            $0.symbol.starts(with: self.stockListVM.searchTerm) || $0.description.starts(with: self.stockListVM.searchTerm) || $0.price.starts(with: self.stockListVM.searchTerm)
        }
        
        
        return NavigationView {
            
            ZStack(alignment: .leading) {
                Color.black
                Text("January 5 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -250)
                
                
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -200)
                
                StockListView(stocks: filteredStocks)
                    .offset(y: 180)
                
                NewsArticleView(articles: self.stockListVM.articles, onDragBegin: { value in
                    self.stockListVM.dragOffset = value.translation
                }, onDragEnd: { value in
                    if value.translation.height < 0 {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 50)
                    } else {
                        self.stockListVM.dragOffset = CGSize(width:0, height: 530)
                    }
                })
                    .animation(.spring())
                    .offset(y: self.stockListVM.dragOffset.height)
                
            }
            
            .navigationBarTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set([.bottom, .top]))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
