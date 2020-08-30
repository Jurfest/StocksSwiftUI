//
//  NewsArticleView.swift
//  StockAppsSwiftUI
//
//  Created by Diego Jurfest Ceccon on 30/08/20.
//  Copyright © 2020 ___DIEGOJURFESTCECCON___. All rights reserved.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    
    let articles: [NewsViewModel]
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void
    
    var body: some View {
        
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading) {
            
            HStack {
                VStack(alignment: .leading) {
                    
                    Text("Top News")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .padding(2)
                        .foregroundColor(Color.white)
                    
                    
                    Text("From 􀣺News")
                        .foregroundColor(Color.gray)
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(2)
                    
                }
                Spacer()
            }
            .padding()
            .contentShape(Rectangle())
            .gesture(DragGesture()
            .onChanged(self.onDragBegin)
            .onEnded(self.onDragEnd))
            
            ScrollView {
                VStack {
                    ForEach(articles, id: \.title) {
                        article in
                        
                        HStack {
                            VStack(alignment: .leading) {
                                
                                Text(article.publication)
                                    .foregroundColor(.white)
                                    .font(.custom("Arial", size: 22))
                                    .fontWeight(.bold)
                                
                                Text(article.title)
                                    .foregroundColor(.white)
                                    .font(.custom("Arial", size: 22))
                                
                                
                            }
                            
                            Spacer()
                            
                            URLImage(URL(string: article.imageURL)!, content: {
                                $0.image.resizable()
                            })
                                .frame(width: 100, height: 100)
                            
                        }
                        
                    }
                }.frame(maxWidth: .infinity)
            }
            
            
            
        }
        .frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(25)
        
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        let article = News(title: "Extra, Extra!", publication: "Nature", imageURL: "parangaricutirimirruaro.png")
        return NewsArticleView(articles: [NewsViewModel(article: article)], onDragBegin: { _ in }, onDragEnd: { _ in } )
    }
    
}
