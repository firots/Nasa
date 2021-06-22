//
//  RoverCamera.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import Foundation

enum RoverCamera: String {
    case fhaz
    case rhaz
    case mast
    case chemcam
    case mahli
    case mardi
    case navcam
    case pancam
    case minites
    
    var description: String {
        switch self {
        case .fhaz:
            return "Front Hazard Avoidance Camera"
        case .rhaz:
            return "Rear Hazard Avoidance Camera"
        case .mast:
            return "Mast Camera"
        case .chemcam:
            return "Chemistry and Camera Complex"
        case .mahli:
            return "Mars Hand Lens Imager"
        case .mardi:
            return "Mars Descent Imager"
        case .navcam:
            return "Navigation Camera"
        case .pancam:
            return "Panoramic Camera"
        case .minites:
            return "Miniature Thermal Emission Spectrometer"
        }
    }
}
