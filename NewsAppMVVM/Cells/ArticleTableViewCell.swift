//
//  ArticleTableViewCell.swift
//  NewsAppMVVM
//
//  Created by Jorge de Carvalho on 29/12/21.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(_ articleViewModel: ArticleViewModel) {
        titleLabel.text = articleViewModel.title
        descriptionLabel.text = articleViewModel.description
    }
}
