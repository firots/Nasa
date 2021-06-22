//
//  RoverPhoto.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import Foundation

struct RoverPhotoModel: Codable {
    let id: Int
    let sol: Int
    let imgSrc: URL
    let camera: RoverCameraModel
    let earthDate: Date
    let rover: RoverModel
    
    private enum CodingKeys: CodingKey {
        case id, sol, imgSrc, camera, earthDate, rover
    }
}
