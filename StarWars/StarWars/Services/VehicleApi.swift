//
//  VehicleApi.swift
//  StarWars
//
//  Created by Fábio França on 06/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import Foundation
import Alamofire

class VehicleApi {
    
    func getVehicle(url: String, completion: @escaping VehicleResponseCompletion) {
        guard let url = URL(string: url) else{return}
        
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error)
                return
            }
            
            guard let data = response.data else{return}
            let decoder = JSONDecoder()
            
            do{
                let vehicle = try decoder.decode(Vehicle.self, from: data)
                completion(vehicle)
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func getVehicles(urls: [String], completion: @escaping VehiclesResponseCompletion){
        var vehicles = [Vehicle]()
        let group = DispatchGroup()
        
        for url in urls {
            group.enter()
            self.getVehicle(url: url) { (vehicle) in
                vehicles.append(vehicle)
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            DispatchQueue.main.async {
                completion(vehicles)
            }
        }
    }
}
