//
//  FavouritesModel.swift
//  NASA Cards
//
//  Created by dtermined on 27.04.2021.
//

import Foundation

struct FavouritesModel {
    var savedPhotos: [CardStateful] = []
    
    mutating func savePhoto(photo: CardStateful) {
        self.savedPhotos.append(photo)
    }
}
