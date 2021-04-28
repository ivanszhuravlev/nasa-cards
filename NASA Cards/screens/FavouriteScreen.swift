//
//  FavouriteScreen.swift
//  NASA Cards
//
//  Created by dtermined on 27.04.2021.
//

import SwiftUI

struct FavouriteScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            HeaderContainer {
                FavouritesView()
            }
            .navigationBarTitle("Library", displayMode: .inline)
            .navigationBarItems(leading:
                HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 20.0))
                                .foregroundColor(Color.red)
                        }
                }
            )
    }
}
