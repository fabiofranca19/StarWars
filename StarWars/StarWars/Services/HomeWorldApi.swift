//
//  HomeWorldApi.swift
//  StarWars
//
//  Created by Fábio França on 05/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import Foundation
import Alamofire

class HomeWorldApi {
    
    func getHomeWorld(url: String, completion: @escaping HomeWorldResponseCompletion) {
        
        guard let url = URL(string: url) else{return}
        
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error)
                return
            }
            
            guard let data = response.data else{ return }
            let decoder = JSONDecoder()
            
            do{
                let homeWorld = try decoder.decode(HomeWorld.self, from: data)
                DispatchQueue.main.async {
                    completion(homeWorld)
                }
            }catch{
                debugPrint(error.localizedDescription)
                return
            }
        }
    }
}
