//
//  PhotoView.swift
//  NASA Cards
//
//  Created by dtermined on 23.04.2021.
//

import SwiftUI

struct PhotoView: View {
    var url: String
    
    @EnvironmentObject var images: ImagesViewModel
    
    var body: some View {
        ZStack {
            if let image = images.images[url], image != nil {
                Image(uiImage: image).resizable()
            } else {
                Color(UIColor.lightGray)
            }
        }
        .onAppear {
            images.saveImage(url: url)
        }
    }
    
    static var defaultImage = UIImage(systemName: "photo")
}

//struct PhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoView()
//    }
//}
