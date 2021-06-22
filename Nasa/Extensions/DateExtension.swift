//
//  DateExtension.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import Foundation


extension Date {
    func toYYYYMMdd() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "YYYY-MM-dd"

        let date = dateFormatter.string(from: self)
        
        return date
    }
}
