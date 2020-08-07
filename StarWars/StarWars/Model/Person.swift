//
//  Person.swift
//  StarWars
//
//  Created by Fábio França on 04/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import Foundation

struct Person: Codable {
    var name: String
    var height: String
    var mass: String
    var hair: String
    var birthYear: String
    var gender: String
    var homeworldUrl: String
    var movieUrls: [String]
    var vehicleUrls: [String]
    var starshipUrls: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hair = "hair_color"
        case birthYear = "birth_year"
        case gender
        case homeworldUrl = "homeworld"
        case movieUrls = "films"
        case vehicleUrls = "vehicles"
        case starshipUrls = "starships"
    }
}
