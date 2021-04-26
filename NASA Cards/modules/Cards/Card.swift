//
//  Card.swift
//  NASA Cards
//
//  Created by dtermined on 23.04.2021.
//

import SwiftUI

struct Card: View {
    var url: String
    var size: CGSize
    var index: Int
    var offset: CGFloat
    var zIndex: Double
    var opacity: Double
    
    init(url: String, size: CGSize, index: Int) {
        self.url = url
        self.index = index
        self.size = Card.getCardSizeByIndex(index: index, size: size)
        self.offset = Card.getCardOffsetByIndex(index: index)
        self.zIndex = Card.getZIndexByIndex(index: index)
        self.opacity = Card.getOpacityByIndex(index: index)
    }
    
    var body: some View {
        Group {
            PhotoView(url: url)
                .frame(width: size.width, height: size.width * 1.5, alignment: .center)
                .cornerRadius(10.0)
                .offset(x: 0.0, y: offset)
                .zIndex(zIndex)
                .shadow(color: Color.black.opacity(0.4), radius: 6, x: 0.0, y: 0.0)
                .opacity(opacity)
        }        
    }
    
    static func getCardSizeByIndex(index: Int, size: CGSize) -> CGSize {
        CGSize(width: size.width - CGFloat(index * 24), height: size.height)
    }
    
    static func getCardOffsetByIndex(index: Int) -> CGFloat {
        CGFloat((3 - index) * 15)
    }
    
    static func getZIndexByIndex(index: Int) -> Double {
        Double(4 - index)
    }
    
    static func getOpacityByIndex(index: Int) -> Double {
        1.0 - Double(index) * 0.1
    }
}
