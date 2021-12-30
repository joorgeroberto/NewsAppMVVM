//
//  NewsListTableViewController.swift
//  NewsAppMVVM
//
//  Created by Jorge de Carvalho on 29/12/21.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    private var isLoading: Bool = true
    private var articleListViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        
        self.tableView.register(UINib(nibName: "LoadingCell", bundle: nil), forCellReuseIdentifier: "LoadingCell")
        tableView.isScrollEnabled = false
        
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=80e36a149acb4600910b366092327767")!
        WebService().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.tableView.isScrollEnabled = true
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension NewsListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 1 : self.articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel == nil ? 1 : self.articleListViewModel.numberOfRowsInSections(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(isLoading) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingCell
            
            cell.setup(self.isLoading)
            
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell
        else { fatalError("ArticleTableViewCell not found") }
        
        let articleViewModel = self.articleListViewModel.articleAtIndex(indexPath.row)
        cell.setup(articleViewModel)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if(!isLoading) {
            let selectedArticle = self.articleListViewModel.articleAtIndex(indexPath.row)
            guard let url = URL(string: selectedArticle.url) else { return }
            UIApplication.shared.open(url)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(isLoading) {
            let screenSize = tableView.bounds.height
            var navigationBarHeight: CGFloat {
                return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                    (self.navigationController?.navigationBar.frame.height ?? 0.0)
            }
            return screenSize - navigationBarHeight
        }
        return UITableView.automaticDimension
    }
}
