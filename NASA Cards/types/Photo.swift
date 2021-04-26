//
//  Photo.swift
//  NASA Cards
//
//  Created by dtermined on 23.04.2021.
//

import Foundation

protocol CardProtocol: Identifiable {
    var id: Int? { get }
    var sol: Int? { get }
//    var camera: Camera? { get set }
    var img_src: String? { get }
    var earth_date: String? { get }
//    var rover: Rover? { get set }
}

struct Photo: CardProtocol, Codable {
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

struct CardStateful: CardProtocol {
//    var photo: Photo
    var state: CardState
    let id: Int?
    let sol: Int?
    let img_src: String?
    let earth_date: String?
    
    init (photo: Photo, state: CardState) {
        self.id = photo.id
        self.sol = photo.sol
        self.img_src = photo.img_src
        self.earth_date = photo.earth_date
        self.state = state
    }
}
