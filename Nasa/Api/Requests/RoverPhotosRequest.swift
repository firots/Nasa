//
//  RoverPhotosRequest.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import Foundation

struct RoverPhotosRequest: NasaRequest {
    typealias ResponseModel = RoverPhotosResponse
    
    let page: Int
    let roverUri: String
    let camera: String?
    let sol = 1000
    
    var path: String {
        "/mars-photos/api/v1/rovers/\(roverUri)/photos"
    }
    
    var queryItems: [URLQueryItem]? {
        var queryItems = [
            URLQueryItem(name: "sol", value: String(sol)),
            URLQueryItem(name: "page", value: String(page))
        ]
        
        if let camera = camera {
            queryItems.append(URLQueryItem(name: "camera", value: camera))
        }
        
        return queryItems
    }
    
    var decoder: JSONDecoder {
        let decoder = baseDecoder
        decoder.dateDecodingStrategy = .formatted(.YYYMMdd)
        return decoder
    }
}
