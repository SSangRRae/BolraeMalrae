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
    
    var baseURL: String {
        return "https://api.themoviedb.org/3/"
    }
    
    var endpoint: URL {
        switch self {
        case .trending: URL(string: baseURL + "trending/tv/week")!
        }
    }
    
    var header: HTTPHeaders {
        return ["Authorization": APIKey.TMDB]
    }
    
    var parameter: Parameters {
        switch self {
        case .trending: ["language": "ko-KR"]
        }
    }
}
