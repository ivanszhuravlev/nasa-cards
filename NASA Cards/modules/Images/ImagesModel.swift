//
//  ImagesModel.swift
//  NASA Cards
//
//  Created by dtermined on 28.04.2021.
//

import SwiftUI

struct ImagesModel {
    var images: [String : UIImage] = [:]
    
    mutating func addImage(url: String, image: UIImage) {
        images[url] = image
    }
}
