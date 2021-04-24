//
//  CardsView.swift
//  NASA Cards
//
//  Created by dtermined on 23.04.2021.
//

import SwiftUI

struct CardsView: View {
    @ObservedObject var controller = CardsViewModel()
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
//            List {
                ForEach(controller.activePhotos) {photo in
//                    let index = controller.activePhotos.firstIndex { item in
//                        item.id == photo.id
//                    }
////                    PhotoView(url: card.img_src!).clipped()
//                    return Card(url: photo.img_src!, size: getCardSizeByIndex(index: index, size: geometry.size))
                    return renderCard(photo: photo, size: geometry.size)
                }
//            }
            }.clipped()
        }
        .padding()
        .onAppear {
            controller.getCards()
        }
    }
    
    private func renderCard(photo: Photo, size: CGSize) -> some View {
        let index = controller.activePhotos.firstIndex { item in
            item.id == photo.id
        }

        return Group {
            Card(url: photo.img_src!, size: size, index: index!)
        }
        .frame(width: size.width,  alignment: .center)
//        .over
    }
}
