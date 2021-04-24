//
//  ScreenContainer.swift
//  NASA Cards
//
//  Created by dtermined on 22.04.2021.
//

import SwiftUI

struct ScreenContainer<Content: View>: View {
    var content: Content
    
    var body: some View {
        Group {
            content
        }
//        .navigationBar
    }
}
