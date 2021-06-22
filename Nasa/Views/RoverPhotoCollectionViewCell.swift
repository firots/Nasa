//
//  RoverPhotoCollectionViewCell.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import UIKit

final class RoverPhotoCollectionViewCell: UICollectionViewCell {

    static let reuseId = "RoverPhotoCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    var lastImageURL = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
