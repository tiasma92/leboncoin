//
//  ApiResult.swift
//  LeBonCoin
//
//  Created by Mattias on 09/03/2020.
//  Copyright © 2020 Mattias. All rights reserved.
//

import Foundation

struct Item: Decodable {
    var id: Int
    var category_id: Int
    var title: String
    var description: String
    var price: Double
    var images_url: Image
    var creation_date: String
    var is_urgent: Bool
}

struct Image: Decodable {
    var small: String?
    var thumb: String?
}

struct Category: Decodable {
    var id: Int
    var name: String
}
