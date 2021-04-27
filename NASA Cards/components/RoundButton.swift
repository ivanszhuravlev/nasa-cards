//
//  RoundButton.swift
//  NASA Cards
//
//  Created by dtermined on 27.04.2021.
//

import SwiftUI

struct RoundButton: View {
    var color: Color
    var iconName: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
            Image(systemName: iconName)
                .font(.system(size: 20.0))
                .foregroundColor(Color.white)
        }
            .frame(width: 50, height: 50, alignment: .center)
            .offset(x: 0, y: -25)
//        .animation(Animation.linear(duration: 0.1))
    }
}

