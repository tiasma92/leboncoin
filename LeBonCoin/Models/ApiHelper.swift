//
//  ApiHelper.swift
//  LeBonCoin
//
//  Created by Mattias on 09/03/2020.
//  Copyright © 2020 Mattias. All rights reserved.
//

import Foundation

typealias ApiCompletion = (_ items: [Item]?, _ errorString: String?) -> Void
typealias ApiCompletionC = (_ category: [Category]?, _ errorString: String?) -> Void

class APIHelper {
    
    private let _baseUrl = "https://raw.githubusercontent.com/leboncoin/paperclip/master/"
    
    var _urlItem: String {
        return _baseUrl + "listing.json"
    }
    
    var _urlCategory: String {
        return _baseUrl + "categories.json"
    }
    
    func getItem(_ string: String, completion: ApiCompletion?) {
        if let url = URL(string: string){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    completion?(nil, error!.localizedDescription)
                }
                if data != nil {
                    do {
                        let reponseJson = try JSONDecoder().decode([Item].self, from: data!)
                        completion?(reponseJson, nil)
                    } catch{
                        completion?(nil, error.localizedDescription)
                    }
                } else {
                    completion?(nil, "Aucune data dispo")
                }
            }.resume()
        } else {
            completion?(nil, "Url invalide")
        }
    }
    
    func getCategory(_ string: String, completion: ApiCompletionC?) {
        if let url = URL(string: string){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    completion?(nil, error!.localizedDescription)
                }
                if data != nil {
                    do {
                        let reponseJson = try JSONDecoder().decode([Category].self, from: data!)
                        completion?(reponseJson, nil)
                        print(reponseJson)
                    } catch{
                        completion?(nil, error.localizedDescription)
                    }
                } else {
                    completion?(nil, "Aucune data dispo")
                }
            }.resume()
        } else {
            completion?(nil, "Url invalide")
        }
    }
}
