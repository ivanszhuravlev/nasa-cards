//
//  PhotosModel.swift
//  NASA Cards
//
//  Created by dtermined on 23.04.2021.
//

import Foundation
import Combine

struct CardsModel {
//    var api = CardsApi()
    var photos: [Photo] = [] {
        didSet {
            print("photos --> \(self.photos.count)")
        }
    }
    
    mutating func updatePhotos(photos: [Photo]) {
        self.photos.append(contentsOf: photos)
    }
    
//    mutating func getPhotos() {
////        api.getCards { photos in
//////            print("DONE", "YEEEEEHAH", photos)
//////            self.photos = photos
////            updatePhotos(photos: photos)
////        }
//        api.getCards(onComplete: self.updatePhotos)
//    }
    
    
}
