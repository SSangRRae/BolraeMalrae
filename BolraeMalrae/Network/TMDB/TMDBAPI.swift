//
//  TMDBAPI.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/2/24.
//

import UIKit
import Alamofire

enum TMDBAPI {
    case trending
    case topRated
    case popular
    case cast(id: Int)
    case search(query: String)
    
    var baseURL: String {
        return "https://api.themoviedb.org/3/"
    }
    
    var endpoint: URL {
        switch self {
        case .trending: URL(string: baseURL + "trending/tv/week")!
        case .topRated: URL(string: baseURL + "tv/top_rated")!
        case .popular: URL(string: baseURL + "tv/popular")!
        case .cast(let id): URL(string: baseURL + "tv/\(id)/aggregate_credits")!
        case .search(let query): URL(string: baseURL + "search/tv?query=\(query)")!
        }
    }
    
    var header: HTTPHeaders {
        return ["Authorization": APIKey.TMDB]
    }
    
    var parameter: Parameters {
        return ["language": "ko-KR"]
    }
}
