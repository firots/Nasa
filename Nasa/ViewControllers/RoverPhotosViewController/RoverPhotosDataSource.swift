//
//  RoverPhotosDataSource.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import UIKit

final class RoverPhotosDataSource: NSObject, UICollectionViewDataSource {
    var reloadAction: (() -> Void)?
    
    lazy var photos = [RoverPhotoModel]() {
        didSet { reloadAction?() }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoverPhotoCollectionViewCell.reuseId, for: indexPath) as! RoverPhotoCollectionViewCell
        
        if cell.lastImageURL != photos[indexPath.row].imgSrc.absoluteString {
            cell.lastImageURL = photos[indexPath.row].imgSrc.absoluteString
            
            cell.imageView.image = UIImage(systemName: "questionmark.circle")
            
            NasaImageProvider.shared.getImage(imageURL: photos[indexPath.row].imgSrc, completion: { image, error in
                DispatchQueue.main.async {
                    if self.photos.count > indexPath.row {
                        if cell.lastImageURL == self.photos[indexPath.row].imgSrc.absoluteString {
                            cell.imageView.image = image
                        }
                    }
                }
            })
        }
        
        return cell
    }
}
