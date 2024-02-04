//
//  CastModel.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/4/24.
//

import Foundation

struct CastModel: Decodable {
    let id: Int
    let cast: [Cast]
}

struct Cast: Decodable {
    let id: Int
    let name: String
    let profile: String?
    let roles: [Role]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profile = "profile_path"
        case roles
    }
}

struct Role: Decodable {
    let character: String
}
