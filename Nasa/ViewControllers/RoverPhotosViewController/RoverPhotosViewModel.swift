//
//  RoverPhotosViewModel.swift
//  Nasa
//
//  Created by Firot on 22.06.2021.
//

import Foundation

final class RoverPhotosViewModel {
    typealias FetchAction = (([RoverPhotoModel]) -> Void)
    
    private (set) var page = 1
    private (set) var finished = false
    private (set) var requesting = false
    private (set) var camera: RoverCamera?
    var rover: Rover!
    var completion: FetchAction?
    var resetAction: (() -> Void)?
    
    func fetchPhotos() {
        if requesting || finished { return }
        
        let request = RoverPhotosRequest(page: page, roverUri: rover.uriName, camera: camera?.rawValue)
        
        requesting = true
        
        request.send(onError: { error in
            self.requestDidEnd()
        }, onSuccess:  { response in
            
            guard let photos = response?.photos else {
                fatalError("Response for RoverPhotosRequest is invalid")
            }
            
            self.completion?(photos)
            
            if response?.photos.isEmpty == true {
                self.finish()
            }
            
            self.requestDidEnd()
        })
    }
    
    private func finish() {
        self.finished = true
    }
    
    private func requestDidEnd() {
        self.requesting = false
    }
    
    func fetchNextPage() {
        page += 1
        fetchPhotos()
    }
    
    private func reset() {
        resetAction?()
        
        page = 1
        finished = false
        
        URLSession.shared.invalidateAndCancel()
        
        requesting = false
    }
    
    func setCamera(to camera: RoverCamera?) {
        if camera == self.camera { return }
        
        self.camera = camera
        
        reset()
        
        fetchPhotos()
    }
}
