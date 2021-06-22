//
//  UIViewControllerExtension.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
