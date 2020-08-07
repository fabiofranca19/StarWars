//
//  MovieApi.swift
//  StarWars
//
//  Created by Fábio França on 07/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import Foundation
import Alamofire

class MovieApi {
    
    func getMovie(url: String, completion: @escaping MovieResponseCompletion) {
        guard let url = URL(string: url) else { return }
        
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error)
                return
            }
            
            guard let data = response.data else{ return }
            let decoder = JSONDecoder()
            do{
                let movie = try decoder.decode(Movie.self, from: data)
                completion(movie)
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
    }
}
