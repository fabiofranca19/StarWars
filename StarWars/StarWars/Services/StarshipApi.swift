//
//  StarshipApi.swift
//  StarWars
//
//  Created by Fábio França on 06/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import Foundation
import Alamofire

class StarshipApi {
    
    func getStarship(url: String, completion: @escaping StarshipResponseCompletion) {
        guard let url = URL(string: url) else{ return }
        
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error)
                return
            }
            
            guard let data = response.data else{ return }
            let decoder = JSONDecoder()
            do{
                let starship = try decoder.decode(Starship.self, from: data)
                completion(starship)
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
    }
}
