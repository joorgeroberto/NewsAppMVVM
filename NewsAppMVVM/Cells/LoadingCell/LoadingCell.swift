//
//  LoadingCell.swift
//  NewsAppMVVM
//
//  Created by Jorge de Carvalho on 29/12/21.
//

import UIKit

class LoadingCell: UITableViewCell {
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    func setup(_ isLoading: Bool) {
        if(!isLoading){
            self.activityIndicatorView.stopAnimating()
            
        }
    }
}
