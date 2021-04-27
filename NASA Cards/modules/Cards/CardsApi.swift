//
//  CardsApi.swift
//  NASA Cards
//
//  Created by dtermined on 23.04.2021.
//

import Foundation

struct CardsApi {
    private var client = ApiClient()
    private var page = 0
    
    mutating func getCards(onComplete: @escaping (_: [Photo]) -> Void) {
        page += 1
        client.get(uri: "/rovers/curiosity/photos?sol=1000&page=\(page)", type: PhotosResponse.self) { data in
            if data != nil {
                onComplete(data!.photos)
            }
        }
    }
    
    
    struct PhotosResponse: Codable {
        var photos: [Photo]
        
        init?(from: Data?) {
            if let resp = try? JSONDecoder().decode(PhotosResponse.self, from: from!) {
                self = resp
            } else {
                return nil
            }
        }
    }
}
