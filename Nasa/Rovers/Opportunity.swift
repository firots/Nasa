//
//  Opportunity.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import Foundation

struct Opportunity: Rover {
    let name = "Opportunity"
    let uriName = "opportunity"
    let cameras = [RoverCamera.fhaz, .rhaz, .navcam, .pancam, .minites]
    let tabBarIconName = "o.circle"
}
