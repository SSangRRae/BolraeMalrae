//
//  TMDBSession.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/5/24.
//

import UIKit

final class TMDBSessionManager {
    static let shared = TMDBSessionManager()
    
    func fetchTrendingTVShows(api: TMDBAPI, completionHandler: @escaping (TVModel?, TMDBError?) -> Void) {
        var url = URLRequest(url: api.endpoint)
        url.httpMethod = "GET"
        url.addValue(APIKey.TMDB, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                // 네트워크 실패 error가 not nil
                guard error == nil else {
                    completionHandler(nil, .failedRequest)
                    return
                }
                
                guard let data else {
                    completionHandler(nil, .noData)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    completionHandler(nil, .invalidResponse)
                    return
                }
                
                guard response.statusCode == 200 else {
                    completionHandler(nil, .failedRequest)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(TVModel.self, from: data)
                    dump(result)
                    completionHandler(result, nil)
                } catch {
                    completionHandler(nil, .failedDecoding)
                }
            }
        }.resume()
    }
}
