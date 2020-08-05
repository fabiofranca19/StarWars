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

typealias PersonResponseCompletion = (Person) -> Void
