//
//  PhotoView.swift
//  NASA Cards
//
//  Created by dtermined on 23.04.2021.
//

import SwiftUI

struct PhotoView: View {
    @ObservedObject var model: PhotoViewModel
    
    init(url: String) {
        self.model = PhotoViewModel(url: url)
    }
    
    var body: some View {
        if model.image != nil {
            Image(uiImage: model.image!)
        } else {
            Color(UIColor.red)
        }
    }
    
    static var defaultImage = UIImage(systemName: "photo")
}

//struct PhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoView()
//    }
//}
