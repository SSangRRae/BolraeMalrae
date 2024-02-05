//
//  TMDBError.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/5/24.
//

import Foundation

enum TMDBError: String, Error {
    case failedRequest
    case noData
    case invalidResponse
    case failedDecoding
}
