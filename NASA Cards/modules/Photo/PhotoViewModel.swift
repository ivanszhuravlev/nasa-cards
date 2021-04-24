//
//  PhotoViewModel.swift
//  NASA Cards
//
//  Created by dtermined on 23.04.2021.
//

import SwiftUI
import Alamofire

class PhotoViewModel: ObservableObject {
    @Published var image: UIImage?
    var url: String
    
    init(url: String) {
        self.url = url
        loadImage()
    }
    
//    private func loadImage() {
//        AF.request(URL(string: self.url)!).response { response in
//            print("DATA", self.url)
//            if response.data != nil {
////                print("LOADED", )
//                self.image = UIImage(data: response.data!)
//            }
//        }
//    }
    
    func loadImage() {
        let url = URL(string: self.url.replacingOccurrences(of: "http:", with: "https:"))!
        let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
        
        task.resume()
    }


    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?)
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
            self.image = loadedImage
        }
    }
}
