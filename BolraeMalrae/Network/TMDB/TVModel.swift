//
//  TrendingModel.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/2/24.
//

import UIKit

struct TVModel: Decodable {
    let page: Int
    let results: [TV]
}

struct TV: Decodable {
    let id: Int
    let name: String
    let overview: String
    let originalName: String
    let backdrop: String?
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case overview
        case originalName = "original_name"
        case backdrop = "backdrop_path"
        case poster = "poster_path"
    }
}
