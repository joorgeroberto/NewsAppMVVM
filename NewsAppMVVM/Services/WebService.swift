//
//  WebService.swift
//  NewsAppMVVM
//
//  Created by Jorge de Carvalho on 29/12/21.
//

import Foundation

class WebService {
    func getArticles(url: URL, completion: @escaping ([Any]?) -> () ) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                print(data)
            }
        }.resume()
    }
}
