//
//  Rover.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import Foundation

protocol Rover {
    var name: String { get }
    var uriName: String { get }
    var cameras: [RoverCamera] { get }
    var tabBarIconName: String { get }
}
