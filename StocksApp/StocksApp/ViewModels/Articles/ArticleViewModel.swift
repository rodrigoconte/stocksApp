//
//  ArticleViewModel.swift
//  StocksApp
//
//  Created by Rodrigo Conte on 10/08/21.
//

import Foundation

struct ArticleViewModel {
    
    let article: Article
    
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
