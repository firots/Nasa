//
//  RoverPhotosViewController.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import UIKit

final class RoverPhotosViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var dataSource = RoverPhotosDataSource()
    lazy var viewModel = RoverPhotosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        setupDataSource()
        setupViewModel()
        setupCollectionView()
    
        viewModel.fetchPhotos()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = dataSource
        collectionView.delegate = self
    }
    
    func registerCells() {
        let photoCell = UINib(nibName: RoverPhotoCollectionViewCell.reuseId, bundle: nil)
        self.collectionView.register(photoCell, forCellWithReuseIdentifier: RoverPhotoCollectionViewCell.reuseId)
    }
    
    func setupViewModel() {
        viewModel.completion = { [weak self] photos in
            self?.dataSource.photos.append(contentsOf: photos)
        }
        
        viewModel.resetAction = { [weak self] in
            self?.dataSource.photos.removeAll()
        }
    }
    
    func setupDataSource() {
        dataSource.reloadAction = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    @objc func filterButtonTapAction() {
        presentFilterAlert()
    }
    
    func getCellSize(for maxWidth: CGFloat) -> CGSize {
        let w = maxWidth / 2 - 32
        let h = w
        return CGSize(width: w, height: h)
    }
    
    func presentFilterAlert() {
        let ac = UIAlertController(title: "Select a camera", message: nil, preferredStyle: .actionSheet)
        
        for camera in viewModel.rover.cameras {
            ac.addAction(UIAlertAction(title: camera.rawValue, style: .default, handler:{ [weak self] action in
                self?.viewModel.setCamera(to: camera)
            }))
        }
        
        ac.addAction(UIAlertAction(title: "Remove Filter", style: .destructive, handler:{ [weak self] action in
            self?.viewModel.setCamera(to: nil)
        }))
        
        present(ac, animated: true)
    }
}
