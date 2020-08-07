//
//  Constants.swift
//  StarWars
//
//  Created by Fábio França on 04/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.dev/api/"
let URL_PERSON = URL_BASE + "people/"
//let URL_PLANET = URL_BASE + "planets/"

typealias PersonResponseCompletion = (Person) -> Void
typealias HomeWorldResponseCompletion = (HomeWorld) -> Void
typealias VehicleResponseCompletion = (Vehicle)-> Void
typealias VehiclesResponseCompletion = ([Vehicle])-> Void
typealias StarshipResponseCompletion = (Starship)-> Void
typealias MovieResponseCompletion = (Movie)-> Void
