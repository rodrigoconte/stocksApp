//
//  SearchView.swift
//  StocksApp
//
//  Created by Rodrigo Oliveira on 7/26/21.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchTerm: String
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
            TextField("Search", text: self.$searchTerm)
                .foregroundColor(Color.primary)
                .padding(10)
            Spacer()
        }.foregroundColor(Color.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .padding(10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchTerm: .constant(""))
    }
}
