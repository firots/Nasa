//
//  RoverPhotosViewController+UICollectionViewDelegateFlowLayout.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import UIKit

extension RoverPhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        getCellSize(for: view.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard dataSource.photos.count > indexPath.row else { return }
        
        let photo = dataSource.photos[indexPath.row]
        
        let detailViewController = RoverPhotoDetailViewController.loadFromNib()
        
        detailViewController.viewModel = RoverPhotoDetailViewModel(earthDate: photo.earthDate, roverName: photo.rover.name, cameraName: photo.camera.name, roverStatus: photo.rover.status, launchDate: photo.rover.launchDate, landingDate: photo.rover.landingDate, imageURL: photo.imgSrc)
        
        navigationController?.present(detailViewController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (dataSource.photos.count - indexPath.row == 5 && !viewModel.finished && !viewModel.requesting) {
            viewModel.fetchNextPage()
        }
    }
}
