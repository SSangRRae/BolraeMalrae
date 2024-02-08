//
//  TMDBAPIManager.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/2/24.
//

import UIKit
import Alamofire

final class TMDBAPIManager {
    static let shared = TMDBAPIManager()
    
    private init() { }
    
    func fetchTVShows(api: TMDBAPI, completionHandler: @escaping ([TV]) -> Void) {
        AF.request(api.endpoint,
                   parameters: api.parameter,
                   encoding: URLEncoding(destination: .queryString),
                   headers: api.header).responseDecodable(of: TVModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success.results)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func fetchTVShowCasts(api: TMDBAPI, completionHandler: @escaping ([Cast]) -> Void) {
        AF.request(api.endpoint,
                   parameters: api.parameter,
                   encoding: URLEncoding(destination: .queryString),
                   headers: api.header).responseDecodable(of: CastModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success.cast)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
