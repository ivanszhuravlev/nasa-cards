//
//  FavouritesView.swift
//  NASA Cards
//
//  Created by dtermined on 27.04.2021.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var favouritesController: FavouritesViewModel
    
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 100), spacing: 12, alignment: .center),
        GridItem(.flexible(minimum: 100), spacing: 12, alignment: .center)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 12, pinnedViews: []) {
                ForEach(favouritesController.savedPhotos) { photo in
                    PhotoView(url: photo.img_src!)
                        .aspectRatio(0.9, contentMode: .fill)
                        .cornerRadius(12)
                }
            }

        }.padding()
    }
}
