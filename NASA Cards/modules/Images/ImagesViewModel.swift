//
//  ImagesViewModel.swift
//  NASA Cards
//
//  Created by dtermined on 28.04.2021.
//

import SwiftUI

class ImagesViewModel: ObservableObject {
    var api = ImagesApi()
    @Published private var model = ImagesModel()
    
    
    var images: [String : UIImage] {
        model.images
    }
    
    func saveImage(url: String) {
        if images[url] == nil {
            api.getImage(url: url) { data, response, error in
                self.saveImageFromResponse(url: url, data: data, response: response, error: error)
            }
        }
    }
    
    func saveImageFromResponse(url: String, data: Data?, response: URLResponse?, error: Error?)
    {
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        guard let data = data else {
            print("No data found")
            return
        }
        
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }
            
            self.model.addImage(url: url, image: loadedImage)
        }
    }
}
