//
//  PhotosModel.swift
//  NASA Cards
//
//  Created by dtermined on 23.04.2021.
//

import Foundation
import Combine

struct CardsModel {
    var photos: [Photo] = []
    
    mutating func updatePhotos(photos: [Photo]) {
        self.photos.append(contentsOf: photos)
    }
    
}
