//
//  TabBarController.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createRoverPhotosViewController(rover: Curiosity()),
            createRoverPhotosViewController(rover: Opportunity()),
            createRoverPhotosViewController(rover: Spirit())
        ]
    }
    
    private func createRoverPhotosViewController(rover: Rover) -> UIViewController {
        let roverPhotosViewController = RoverPhotosViewController.loadFromNib()
        roverPhotosViewController.viewModel.rover = rover
        
        let navigationController = UINavigationController()
        navigationController.viewControllers = [roverPhotosViewController]
        navigationController.tabBarItem.image = UIImage(systemName: rover.tabBarIconName)
        
        roverPhotosViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: roverPhotosViewController, action: #selector(roverPhotosViewController.filterButtonTapAction))
        
        return navigationController
    }
}
