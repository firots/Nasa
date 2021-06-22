//
//  Spirit.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import Foundation

struct Spirit: Rover {
    let name = "Spirit"
    let uriName = "spirit"
    let cameras = [RoverCamera.fhaz, .rhaz, .navcam, .pancam, .minites]
    let tabBarIconName = "s.circle"
}
