//
//  PersonApi.swift
//  StarWars
//
//  Created by Fábio França on 04/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import Foundation

class PersonApi {
    
    func getRandomPersonUrlSession(id: Int,completion: @escaping PersonResponseCompletion) {
        
        guard let url = URL(string: "\(URL_PERSON)\(id)") else{return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
                 completion(nil)
                return
            }
            guard let data = data else{return}
            
            do{
                let jsonObj = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonObj as? [String: Any] else{ return }
                if let person = self.parsePersonManual(json: json){
                    DispatchQueue.main.async {
                        completion(person)
                    }
                }else{
                    completion(nil)
                }
            }catch{
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            print("Response = \(response!)")
        }
        task.resume()
    }
    
    private func parsePersonManual(json: [String: Any]) -> Person? {
        guard let name = json["name"] as? String else{print("name error");return nil}
        guard let height = json["height"] as? String else{print("height error");return nil}
        guard let mass = json["mass"] as? String else{print("mass error");return nil}
        guard let hair = json["hair_color"] as? String else{print("hair error");return nil}
        guard let birthYear = json["birth_year"] as? String else{print("birthYear error");return nil}
        guard let gender = json["gender"] as? String else{print("gender error");return nil}
        guard let homeworldUrl = json["homeworld"] as? String else{print("homeworldUrl error");return nil}
        guard let filmUrls = json["films"] as? [String] else{print("filmUrls error");return nil}
        guard let vehicleUrls = json["vehicles"] as? [String] else{print("vehicleUrls error");return nil}
        guard let starshipUrls = json["starships"] as? [String] else{print("starshipUrls error");return nil}
        
        
        return Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
    }
}
