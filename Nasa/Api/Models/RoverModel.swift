//
//  Rover.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import Foundation

struct RoverModel: Codable {
    let id: Int
    let name: String
    let landingDate: Date
    let launchDate: Date
    let status: String
    
    private enum CodingKeys: CodingKey {
        case id, name, landingDate, launchDate, status
    }
}
