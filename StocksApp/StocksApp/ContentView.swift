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
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = UIColor(displayP3Red: 47 / 255, green: 54 / 255, blue: 64 / 255, alpha: 1.0)
            UINavigationBar.appearance().standardAppearance = navBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        } else {
            UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 47 / 255, green: 54 / 255, blue: 64 / 255, alpha: 1.0)
            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        
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
                    .offset(y: -310)
                
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
