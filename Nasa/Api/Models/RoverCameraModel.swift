//
//  RoverCameraModel.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import Foundation

struct RoverCameraModel: Codable {
    let id: Int
    let name: String
    let roverId: Int
    let fullName: String
    
    private enum CodingKeys: CodingKey {
        case id, name, roverId, fullName
    }
}
