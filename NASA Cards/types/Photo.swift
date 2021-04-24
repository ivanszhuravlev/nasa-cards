//
//  Photo.swift
//  NASA Cards
//
//  Created by dtermined on 23.04.2021.
//

import Foundation

//protocol PhotoProtocol {
//    var id: Int? { get set }
//    var sol: Int? { get set }
//    var camera: Camera? { get set }
//    var img_src: String? { get set }
//    var earth_date: String? { get set }
//    var rover: Rover?
//}

struct Photo: Codable, Identifiable {
    let id: Int?
    let sol: Int?
//    let camera: Camera?
    let img_src: String?
    let earth_date: String?
//    let rover: Rover?
    
//    var json: Data? {
//        return try? JSONEncoder().encode(self)
//    }
    
    init?(from: Data?) {
        if let newPhoto = try? JSONDecoder().decode(Photo.self, from: from!) {
            self = newPhoto
        } else {
            return nil
        }
    }
    
    init() {
        self.id = nil
        self.sol = nil
        self.img_src = nil
        self.earth_date = nil
//        self.id = nil
//        self.id = nil
//        self.id = nil
    }
}

struct Camera: Codable, Identifiable {
    var id: Int?
    var name: String?
    var rover_id: Int?
    var full_name: String?
//
//    var json: Data? {
//        return try? JSONEncoder().encode(self)
//    }
//
    init?(from: Data?) {
        if let newCamera = try? JSONDecoder().decode(Camera.self, from: from!) {
            self = newCamera
        } else {
            return nil
        }
    }
    
//    init() { }
}

struct Rover: Codable, Identifiable {
    var id: Int?
    var name: String?
    var launch_date: String?
    var landing_date: String?
    var status: String?
    
//    var json: Data? {
//        return try? JSONEncoder().encode(self)
//    }
    
    init?(from: Data?) {
        if let newRover = try? JSONDecoder().decode(Rover.self, from: from!) {
            self = newRover
        } else {
            return nil
        }
    }
    
//    init() { }
}
