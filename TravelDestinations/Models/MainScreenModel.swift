//
//  MainScreenModel.swift
//  TravelDestinations
//
//  Created by Ani's Mac on 14.12.23.
//

import SwiftUI


struct DestinationsResponse: Decodable {
    var destinations: [Destination]
}

struct Destination: Decodable {
    var id = UUID()
    let cityName: String?
    let mainImage: String?
    let countryName: String?
    let description: String?
    let generalImages: [String]?
    let transport: [Transport]?
    let mustSee: [MustSee]?
    let hotels: [Hotel]?
    let tips: [Tips]?
    
    enum CodingKeys: String, CodingKey {
        case cityName, mainImage, countryName, description, generalImages, transport, mustSee, hotels, tips
    }
}

enum GeneralImage: String, Decodable {
    case image1 = "image1"
    case image2 = "image2"
    case image3 = "image3"
}

struct Transport: Decodable {
    let image: String
    let name: String
    let description: String
    let price: String
}

struct MustSee: Decodable {
    let image: String
    let name: String
    let description: String
}

struct Hotel: Decodable {
    let image: String
    let name: String
    let description: String
    let price: String
}

struct Tips: Decodable {
    let tip: String
}

