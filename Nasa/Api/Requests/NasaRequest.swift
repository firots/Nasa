//
//  NasaRequest.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import Foundation

protocol NasaRequest {
    associatedtype ResponseModel: Decodable
    typealias SuccessHandler = (_ responseModel: ResponseModel?) -> Void
    typealias ErrorHandler = (_ error: Error?) -> Void
    
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var url: URL { get }
    
    var baseDecoder: JSONDecoder { get }
    var decoder: JSONDecoder { get }
    
    func send(onError: ErrorHandler?, onSuccess: SuccessHandler?)
}

extension NasaRequest {
    func getQueryItems() -> [URLQueryItem] {
        var queryItemsBase = [ URLQueryItem(name: "api_key", value: ApiConstants.apiKey) ]
        
        if let queryItems = self.queryItems {
            queryItemsBase.append(contentsOf: queryItems)
        }
        
        return queryItemsBase
    }
    
    var url: URL {
        var urlComponents = URLComponents(url: ApiConstants.apiURL, resolvingAgainstBaseURL: false)!
        urlComponents.path = path
        urlComponents.queryItems = getQueryItems()

        return urlComponents.url!
    }
    
    var baseDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return decoder
    }
    
    func send(onError: ErrorHandler? = nil, onSuccess: SuccessHandler? = nil) {
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? decoder.decode(ResponseModel.self, from: data) {
                    onSuccess?(response)
                    return
                }
            }
            
            onError?(error)
        }.resume()
    }
}
