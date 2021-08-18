//
//  StockListViewModel.swift
//  StocksApp
//
//  Created by Rodrigo Oliveira on 7/24/21.
//

import Foundation
import SwiftUI

class StockListViewModel: ObservableObject {
    
    @Published var dragOffSet: CGSize = CGSize(width: 0, height: 680)
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var articles: [ArticleViewModel] = [ArticleViewModel]()
    
    func load() {
        fetchNews()
        fetchStocks()
    }
    
    private func fetchNews() {
        WebService().getTopNews { articles in
            if let articles = articles {
                DispatchQueue.main.async {
                    self.articles = articles.map(ArticleViewModel.init)
                }
            }
        }
    }
    
    private func fetchStocks() {
        WebService().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
    
}
