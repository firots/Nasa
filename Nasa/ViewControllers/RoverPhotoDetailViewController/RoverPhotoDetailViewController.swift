//
//  RoverPhotoDetailViewController.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import UIKit

class RoverPhotoDetailViewController: UIViewController {
    var viewModel: RoverPhotoDetailViewModel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guardViewModel()
        setupImageView()
        setupStackView()
    }
    
    func guardViewModel() {
        if viewModel == nil {
            fatalError("RoverPhotoDetailViewController viewDidLoad without viewModel.")
        }
    }
    
    func setupImageView() {
        NasaImageProvider.shared.getImage(imageURL: viewModel.imageURL, completion: { [weak self] image, error in
            self?.imageView.image = image
        })
    }
    
    func setupStackView() {
        let infoArray = [
            "Date: \(viewModel.earthDate.toYYYYMMdd())",
            "Rover: \(viewModel.roverName)",
            "Camera: \(viewModel.cameraName)",
            "Rover Status: \(viewModel.roverStatus)",
            "Launch Date: \(viewModel.launchDate.toYYYYMMdd())",
            "Landing Date: \(viewModel.landingDate.toYYYYMMdd())",
        ]
        
        for info in infoArray {
            let label = UILabel()
            label.text = info
            stackView.addArrangedSubview(label)
        }
    }
}
