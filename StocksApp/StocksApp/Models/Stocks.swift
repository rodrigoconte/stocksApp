//
//  Stocks.swift
//  StocksApp
//
//  Created by Rodrigo Oliveira on 7/24/21.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
