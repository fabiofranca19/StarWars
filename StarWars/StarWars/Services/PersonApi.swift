//
//  PersonApi.swift
//  StarWars
//
//  Created by Fábio França on 04/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonApi {
    
    func getRandomPersonAlamo(id: Int,completion: @escaping PersonResponseCompletion){
        
        guard let url = URL(string: "\(URL_PERSON)\(id)") else{return}
        
        AF.request(url).responseJSON { (data) in
            if let error = data.error {
                debugPrint(error)
                completion(nil)
                return
            }
            
//            guard let json = data.value as? [String:Any] else{
//                completion(nil)
//                return
//            }
            
//            let person = self.parsePersonManual(json: json)
//            DispatchQueue.main.async {
//                completion(person)
//            }
            
            guard let data = data.data else{
                completion(nil)
                return
            }
            
            do{
                let jsonSwift = try JSON(data: data)
                let person = self.parsePersonSwifty(json: jsonSwift)
                completion(person)
            }catch{
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
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
    
    private func parsePersonSwifty(json: JSON) -> Person? {
        let name = json["name"].stringValue
        let height = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hair = json["hair_color"].stringValue
        let birthYear = json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeworldUrl = json["homeworld"].stringValue
        let filmUrls = json["films"].arrayValue.map({$0.stringValue})
        let vehicleUrls = json["vehicles"].arrayValue.map({$0.stringValue})
        let starshipUrls = json["starships"].arrayValue.map({$0.stringValue})
        
        
        return Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
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
