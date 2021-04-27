//
//  CardsScreen.swift
//  NASA Cards
//
//  Created by dtermined on 22.04.2021.
//

import SwiftUI

struct CardsScreen: View {
    var body: some View {
            HeaderContainer {
                CardsView()
            }
                .navigationBarTitle("My Mars", displayMode: .inline)
                .navigationBarItems(leading:
                    HStack {
                        Button(action: {}) {
                            Text("Undo")
                                .foregroundColor(Color.red)
                                .font(Font.custom("IBMPlexSans-Regular", size: 14))
                        }
                    }, trailing:
                    HStack {
                        NavigationLink(destination: FavouriteScreen()) {
                                Image(systemName: "heart")
                                    .font(.system(size: 20.0))
                                    .foregroundColor(Color.red)
                        }
                    }
                )
    }
}

struct CardsScreen_Previews: PreviewProvider {
    static var previews: some View {
        CardsScreen()
    }
}
