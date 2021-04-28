//
//  ImagesApi.swift
//  NASA Cards
//
//  Created by dtermined on 28.04.2021.
//

import Foundation

struct ImagesApi {    
    func getImage(url: String, onComplete: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let formattedUrl = URL(string: url.replacingOccurrences(of: "http:", with: "https:"))!
        let task = URLSession.shared.dataTask(with: formattedUrl) { data, response, error in
            onComplete(data, response, error)
        }
 
        task.resume()
    }
}
