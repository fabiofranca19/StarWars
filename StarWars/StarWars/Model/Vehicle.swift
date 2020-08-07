//
//  Vehicle.swift
//  StarWars
//
//  Created by Fábio França on 06/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import Foundation

struct Vehicle: Codable {
    var name: String
    var model: String
    var manufacturer: String
    var cost: String
    var length: String
    var speed: String
    var crew: String
    var passengers: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case length
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
    }
}
