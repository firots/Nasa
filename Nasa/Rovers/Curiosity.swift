//
//  Curiosity.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import Foundation

struct Curiosity: Rover {
    let name = "Curiosity"
    let uriName = "curiosity"
    let cameras = [RoverCamera.fhaz, .rhaz, .mast, .chemcam, .mahli, .mardi, .navcam ]
    let tabBarIconName = "c.circle"
}
