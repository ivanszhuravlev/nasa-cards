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
        GeometryReader { window in
            ZStack {
                GeometryReader { geometry in
                    ForEach(controller.activePhotos) {photo in
                        return renderCard(photo: photo, size: geometry.size)
                    }
                }
            }
            .padding()
            .gesture(self.swipeGesture(winSize: window.size))
            .onAppear {
                controller.getCards()
            }
        }
    }
    
    private func renderCard(photo: Photo, size: CGSize) -> some View {
        let index = controller.activePhotos.firstIndex { item in
            item.id == photo.id
        }
        
        var offset: CGSize {
            index == 0 ? cardOffset : .zero
        }

        return Card(url: photo.img_src!, size: size, index: index!)
            .frame(width: size.width,  alignment: .center)
            .offset(offset)
    }
    
    @GestureState var swipeDistance: CGSize = .zero
    @State var steadySwipeDistance: CGSize = .zero
    
    var cardOffset: CGSize {
        CGSize(
            width: swipeDistance.width + steadySwipeDistance.width,
            height: swipeDistance.height + steadySwipeDistance.height
        )
    }
    
    private func swipeGesture(winSize: CGSize) -> some Gesture {
        return DragGesture()
            .updating($swipeDistance) { latestSwipeDistance, gestureDistance, transaction in
                var translation = latestSwipeDistance.translation
                translation.width *= 1.2
                gestureDistance = translation
            }
            .onEnded { finalDistance in
                steadySwipeDistance = finalDistance.translation
                let translation = finalDistance.translation.width,
                    isGonnaFireAction = abs(translation) > winSize.width / 5 * 2

                if isGonnaFireAction {
                    moveCard(isLiked: translation > 0, winWidth: winSize.width)
                } else {
                    resetCardOffset()
                }
            }
    }
    
    private func moveCard(isLiked: Bool, winWidth: CGFloat) {
        let x = isLiked ? winWidth : -winWidth
        
        withAnimation(Animation.linear(duration: animationDurationMove)) {
            steadySwipeDistance = CGSize(width: x, height: 0)
        }
    }
    
    private func resetCardOffset() {
        withAnimation(Animation.linear(duration: animationDurationMove)) {
            steadySwipeDistance = .zero
        }
    }
    
    private var animationDurationMove: Double = 0.12
}
