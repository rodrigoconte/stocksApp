//
//  ContentView.swift
//  StocksApp
//
//  Created by Rodrigo Oliveira on 7/24/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListViewModel = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = .black
        UITableViewCell.appearance().backgroundColor = .black
        
        stockListViewModel.load()
    }
    
    var body: some View {
        
        let filteredStock = self.stockListViewModel.searchTerm.isEmpty ? self.stockListViewModel.stocks : self.stockListViewModel.stocks.filter {
            $0.symbol.starts(with: self.stockListViewModel.searchTerm.uppercased())
        }
        
        return NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                Text("July 25 2021")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    .offset(y: -320)
                
                SearchView(searchTerm: self.$stockListViewModel.searchTerm)
                    .offset(y: -260)
                
                StockListView(stocks: filteredStock)
                    .offset(y: 100)
                
            }.navigationBarTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                
            ContentView()
                .previewDevice("iPhone 12")
        }
    }
}
