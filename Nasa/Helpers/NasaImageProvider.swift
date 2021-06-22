//
//  ImageCache.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import UIKit

final class NasaImageProvider {
    public static var shared = NasaImageProvider()
    
    lazy var cache = NSCache<NSString, UIImage>()
    
    func getImage(imageURL: URL, completion: ((UIImage?, Error?) -> Void)?) {
        getImage(from: imageURL, completion: completion)
    }
    
    private func getImage(from url: URL, completion: ((UIImage?, Error?) -> Void)?) {
        if let cachedImage = cache.object(forKey: url.absoluteString as NSString) {
            completion?(cachedImage, nil)
            return
        }
        
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }

            let image = UIImage(data: data)
            
            if let image = image {
                self.cache.setObject(image, forKey: url.absoluteString as NSString)
            }
        
            completion?(image, error)
        }
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
