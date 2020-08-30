//
//  NewsViewModel.swift
//  StockAppsSwiftUI
//
//  Created by Diego Jurfest Ceccon on 30/08/20.
//  Copyright © 2020 ___DIEGOJURFESTCECCON___. All rights reserved.
//

import Foundation
import SwiftUI

struct NewsViewModel {
    
    let article: News
    
    var imageURL: String {
        return self.article.imageURL
    }
    
    var title: String {
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
    
    
}
