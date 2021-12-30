//
//  ArticleViewModel.swift
//  NewsAppMVVM
//
//  Created by Jorge de Carvalho on 29/12/21.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSections(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        
        return ArticleViewModel(article)
    }
}

// Resposável por mostrar APENAS UM artigo.
struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }
    
    var url: String {
        return self.article.url
    }
}
