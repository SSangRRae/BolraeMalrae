//
//  ImageModel.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/8/24.
//

import Foundation

struct ImageModel: Decodable {
    let urls: Url
}

struct Url: Decodable {
    let regular: String
}
