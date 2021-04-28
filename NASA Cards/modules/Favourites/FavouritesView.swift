//
//  FavouritesView.swift
//  NASA Cards
//
//  Created by dtermined on 27.04.2021.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var favouritesController: FavouritesViewModel
    
//    var formattedPhotos: [(CardStateful, CardStateful)] {
//        
//    }
    
    var body: some View {
        List {
            ForEach(favouritesController.savedPhotos) { photo in
                Text("\(photo.id!)")
            }
        }
    }
}
