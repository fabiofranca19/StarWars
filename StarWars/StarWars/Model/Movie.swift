//
//  Movie.swift
//  StarWars
//
//  Created by Fábio França on 07/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let title: String
    let episode: Int
    let crawl: String
    let director: String
    let producer: String
    let release: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case episode = "episode_id"
        case crawl = "opening_crawl"
        case director
        case producer
        case release = "release_date"
    }
}
