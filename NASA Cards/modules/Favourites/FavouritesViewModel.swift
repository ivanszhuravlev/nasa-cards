//
//  FavouritesViewModel.swift
//  NASA Cards
//
//  Created by dtermined on 27.04.2021.
//

import Foundation

class FavouritesViewModel: ObservableObject {
    @Published private var model = FavouritesModel()
    
    var savedPhotos: [CardStateful] {
        model.savedPhotos
    }
    
    func savePhoto(photo: CardStateful) {
        model.savePhoto(photo: photo)
    }
}
