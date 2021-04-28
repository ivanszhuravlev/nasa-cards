//
//  ContentView.swift
//  NASA Cards
//
//  Created by dtermined on 22.04.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cardsController = CardsViewModel()
    @ObservedObject var favouritesController = FavouritesViewModel()
    @ObservedObject var imagesController = ImagesViewModel()
    
    var body: some View {
        NavigationView {
            CardsScreen()
        }
        .environmentObject(cardsController)
        .environmentObject(favouritesController)
        .environmentObject(imagesController)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
