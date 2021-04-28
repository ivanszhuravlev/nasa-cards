//
//  FavouritesView.swift
//  NASA Cards
//
//  Created by dtermined on 27.04.2021.
//

import SwiftUI

struct FavouritesView: View {
//    @StateObject var favouritesController = FavouritesViewModel()
    @EnvironmentObject var favouritesController: FavouritesViewModel
    
    var body: some View {
        List {
            ForEach(favouritesController.savedPhotos) { photo in
                Text("\(photo.id!)")
            }
        }
    }
}
