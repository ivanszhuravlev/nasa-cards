//
//  CardsView.swift
//  NASA Cards
//
//  Created by dtermined on 23.04.2021.
//

import SwiftUI

struct CardsView: View {
    @EnvironmentObject var controller: CardsViewModel
    @EnvironmentObject var favouritesController: FavouritesViewModel
    
    @State var cardsToRemoveCount: Int = 0
    
    @State var activeCards: [CardStateful] = []
    
    
    var body: some View {
        GeometryReader { window in
            VStack {
                ZStack {
                    GeometryReader { geometry in
                        ForEach(controller.activePhotos, id: \.self.id) {photo in
                            return renderCard(photo: photo, size: geometry.size)
                        }
                    }
                }
                .padding(.horizontal)
                .gesture(self.swipeGesture(winSize: window.size))
                .onAppear {
                    controller.getCards()
                }
                HStack {
                    RoundButton(color: Color.black, iconName: "hand.thumbsdown")
                        .animation(Animation.linear(duration: 0.1))
                        .scaleEffect(
                            getOnFireAction(
                                onLeft: 1.2,
                                onRight: 1.0,
                                offset: swipeDistance.width,
                                winSize: window.size,
                                onNone: 1.0
                            )!,
                            anchor: .top
                        )
                        .opacity(
                            getOnFireAction(
                                onLeft: 1,
                                onRight: 0.5,
                                offset: swipeDistance.width,
                                winSize: window.size,
                                onNone: 1
                            )!
                        )
                        .padding(.horizontal)
                    Text("\(controller.count) cards")
                        .font(Font.custom("IBMPlexSans-Regular", size: 12.0))
                        .foregroundColor(Color.gray)
                        .padding(.horizontal)
                    RoundButton(color: Color.red, iconName: "hand.thumbsup")
                        .animation(Animation.linear(duration: 0.1))
                        .scaleEffect(
                            getOnFireAction(
                                onLeft: 1.0,
                                onRight: 1.2,
                                offset: swipeDistance.width,
                                winSize: window.size,
                                onNone: 1.0
                            )!,
                            anchor: .top
                        )
                        .opacity(
                            getOnFireAction(
                                onLeft: 0.5,
                                onRight: 1,
                                offset: swipeDistance.width,
                                winSize: window.size,
                                onNone: 1
                            )!
                        )
                        .padding(.horizontal)
                }
                .zIndex(1000)
                .padding()
                .frame(alignment: .center)
                .offset(x: 0, y: -75)
            }
            .environmentObject(favouritesController)
        }
    }
    
    private func renderCard(photo: CardStateful, size: CGSize) -> some View {
        let index = controller.activePhotos.firstIndex { item in
            item.id == photo.id
        }
        
        var offset: CGSize {
            index == 0 ? cardOffset : .zero
        }
        
        let card = Group {
                Card(url: photo.img_src!, size: size, state: photo.state)
                .frame(width: size.width,  alignment: .center)
                .offset(offset)
            }

        return card
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
                gestureDistance = latestSwipeDistance.translation
            }
            .onEnded { finalDistance in
                steadySwipeDistance = finalDistance.translation
                let translation = finalDistance.translation.width,
                    isLiked = getOnFireAction(onLeft: false, onRight: true, offset: translation, winSize: winSize)

                if isLiked != nil {
                    moveCard(isLiked: isLiked!, winWidth: winSize.width)
                } else {
                    resetCardOffset()
                }
            }
    }
    
    private func getOnFireAction<T>(onLeft: T, onRight: T, offset: CGFloat, winSize: CGSize, onNone: T? = nil) -> T? {
        let isGonnaFireAction = getIsGonnaFireAction(offset: offset, winSize: winSize)
        
        if isGonnaFireAction {
            return offset > 0 ? onRight : onLeft
        } else {
            return onNone
        }
    }
    
    private func getIsGonnaFireAction(offset: CGFloat, winSize: CGSize) -> Bool {
        return abs(offset) > winSize.width / 5 * 2
    }
    
    private func moveCard(isLiked: Bool, winWidth: CGFloat) {
        let x = isLiked ? winWidth : -winWidth

        if (isLiked) {
            print("HOI", controller.activePhotos[0].img_src)
            favouritesController.savePhoto(photo: controller.activePhotos[0])
        }
        
        steadySwipeDistance = CGSize(width: x, height: 0)
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { timer in
            controller.rearrangeCards()
            controller.removeFirstCard()
            resetCardOffset()
        }
    }
    
    private func resetCardOffset() {
        steadySwipeDistance = .zero
    }
}
