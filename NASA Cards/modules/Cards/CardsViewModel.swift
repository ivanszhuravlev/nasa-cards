//
//  CardsViewController.swift
//  NASA Cards
//
//  Created by dtermined on 23.04.2021.
//

import SwiftUI

class CardsViewModel: ObservableObject {
    var api = CardsApi()
    @Published private var model = CardsModel()
    
//    @Published var photos: [Photo] {
//        model.photos
//    }
//    var photos: [Photo] {
//        print("CHANGED")
//        return model.photos
//    }
    
    var activePhotos: [Photo] {
        model.photos.count >= 3 ? Array(model.photos[..<3]) : model.photos
    }
    
    init() {
        
    }
    
    func getCards() {
//        model.getPhotos()
        api.getCards {photos in
            self.model.updatePhotos(photos: photos)
        }
    }

}
