//
//  UnsplashAPIManager.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/8/24.
//

import Foundation
import Alamofire

class UnsplashAPIManager {
    static let shared = UnsplashAPIManager()
    private init() {}
    
    func fetchToPhotos(completionHandler: @escaping ([ImageModel]) -> Void) {
        let url = "https://api.unsplash.com/photos"
        let parameter: Parameters = ["client_id": APIKey.unsplash, "per_page": "30"]
        let headers: HTTPHeaders = ["Accept-Version": "v1"]
        AF.request(url, method: .get, parameters: parameter, headers: headers).responseDecodable(of: [ImageModel].self) { response in
            switch response.result {
            case .success(let success):
                dump(success)
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
