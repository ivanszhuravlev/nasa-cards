//
//  ApiClient.swift
//  NASA Cards
//
//  Created by dtermined on 22.04.2021.
//

import Foundation
import Alamofire
//import Combine

class ApiClient {
    let host = "https://api.nasa.gov/mars-photos/api/v1"
    let token = "XUTveK5IK3GiXTAUoqOous953sSRJcAvSvi0bVws"
    
    private func getUrl(uri: String) -> String {
        "\(host)\(uri)&api_key=\(token)"
    }
    
//    func get<T: Codable>(uri: String, type: T.Type) -> AnyPublisher<T, Error>{
////        AF.request(getUrl(uri: uri)).response { response in
////            debugPrint(response)
////        }
////
//        let url = URL(string: getUrl(uri: uri))!
//
//        return URLSession.shared.dataTaskPublisher(for:url)
//            .map { data, response in
//                print("MAP")
//                return data
//            }
//            .decode(type: T.self, decoder: JSONDecoder())
//            .map{
//                print("HEY")
//                return $0
//
//            }
//            .receive(on: RunLoop.main)
//            .eraseToAnyPublisher()
//    }
    func get<T: Codable>(uri: String, type: T.Type, _ onComplete: @escaping (_ data: T?) -> Void) {
        let a = AF.request(getUrl(uri: uri)).validate().responseDecodable(of: T.self) { response in
            if response.value == nil {
                onComplete(nil)
                return
            }
        
            onComplete(response.value!)
       }
    }
}
