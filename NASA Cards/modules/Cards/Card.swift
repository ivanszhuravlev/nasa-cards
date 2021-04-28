//
//  Card.swift
//  NASA Cards
//
//  Created by dtermined on 23.04.2021.
//

import SwiftUI

struct Card: View {
    var url: String
    var state: CardState
    var parentSize: CGSize
    
    var stateNum: Int {
        getStateNum()
    }
    
    var size: CGSize {
        CGSize(width: parentSize.width - CGFloat(stateNum * 24), height: parentSize.height)
    }
    var offset: CGFloat {
        CGFloat((3 - (stateNum <= 2 ? stateNum : 1)) * 15)
    }
    var zIndex: Double {
        Double(4 - stateNum)
    }
    var opacity: Double {
        1.0 - Double(stateNum) * 0.1
    }
    
    init(url: String, size: CGSize, state: CardState) {
        self.url = url
        self.parentSize = size
        self.state = state
    }
    
    var body: some View {
        Group {
            PhotoView(url: url)
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.width * 1.5, alignment: .center)
                .cornerRadius(10.0)
                .offset(x: 0.0, y: offset)
                .zIndex(zIndex)
                .shadow(color: Color.black.opacity(0.4), radius: 6, x: 0.0, y: 0.0)
                .opacity(opacity)
                .animation(Animation.linear(duration: 0.1))
            
        }        
    }
    
    private func getStateNum() -> Int {
        switch state {
        case CardState.removed:
            return 4
        case CardState.upcoming:
            return 3
        case CardState.last:
            return 2
        case CardState.middle:
            return 1
        case CardState.first:
            return 0
        }
    }
}
