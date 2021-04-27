//
//  CardsViewController.swift
//  NASA Cards
//
//  Created by dtermined on 23.04.2021.
//

import SwiftUI

class CardsViewModel: ObservableObject {
    var api = CardsApi()
    
    @Published private var model = CardsModel() {
        didSet {
            let photosCut = model.photos.count >= 4 ? Array(model.photos[..<4]) : model.photos
            activePhotos = photosCut.indices.map { index in
                CardStateful(photo: photosCut[index], state: getCardStateByIndex(index: index))
            }
        }
    }
    
    var activePhotos: [CardStateful] = []
    
    var count: Int {
        model.photos.count
    }
    
    init() {
        
    }
    
    func getCards() {
        api.getCards {photos in
            self.model.updatePhotos(photos: photos)
        }
    }
    
    func rearrangeCards() {
        activePhotos.indices.forEach { index in
            activePhotos[index].state = shiftState(state: activePhotos[index].state)
        }
    }
    
    func removeFirstCard() {
        self.model.photos.removeFirst(1)
    }
    
    
    private func shiftState(state: CardState) -> CardState {
        switch state {
        case .upcoming:
            return CardState.last
        case .last:
            return CardState.middle
        case .middle:
            return CardState.first
        case .first:
            return CardState.removed
        case .removed:
            return CardState.upcoming
        }
    }
    
    private func getCardStateByIndex(index: Int) -> CardState {
        switch index {
        case 3:
            return CardState.upcoming
        case 2:
            return CardState.last
        case 1:
            return CardState.middle
        case 0:
            return CardState.first
        default:
            return CardState.upcoming
        }
    }
}
