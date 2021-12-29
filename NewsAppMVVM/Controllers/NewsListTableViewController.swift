//
//  NewsListTableViewController.swift
//  NewsAppMVVM
//
//  Created by Jorge de Carvalho on 29/12/21.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=80e36a149acb4600910b366092327767")!
        WebService().getArticles(url: url) {_ in 
            
        }
    }
}
