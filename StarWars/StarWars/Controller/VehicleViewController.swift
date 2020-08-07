//
//  VehicleViewController.swift
//  StarWars
//
//  Created by Fábio França on 05/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import UIKit

class VehicleViewController: UIViewController,PersonProtocol {

    @IBOutlet weak var nameVehicleLabel: UILabel!
    @IBOutlet weak var modelVehicleLabel: UILabel!
    @IBOutlet weak var manufacturerVehicleLabel: UILabel!
    @IBOutlet weak var costVehicleLabel: UILabel!
    @IBOutlet weak var lenghtVehicleLabel: UILabel!
    @IBOutlet weak var speedVehicleLabel: UILabel!
    @IBOutlet weak var crewVehicleLabel: UILabel!
    @IBOutlet weak var passengersVehicleLabel: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person: Person!
    var vehicles = [Vehicle]()
    var index = 0
    let api = VehicleApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.previousBtn.isEnabled = false
        api.getVehicles(urls: person.vehicleUrls) { (vehicles) in
            self.vehicles = vehicles
            self.setupIndex()
        }
    }
    
    func setupView(vehicle: Vehicle) {
        self.nameVehicleLabel.text = vehicle.name
        self.modelVehicleLabel.text = vehicle.model
        self.manufacturerVehicleLabel.text = vehicle.manufacturer
        self.costVehicleLabel.text = vehicle.cost
        self.lenghtVehicleLabel.text = vehicle.length
        self.speedVehicleLabel.text = vehicle.speed
        self.crewVehicleLabel.text = vehicle.crew
        self.passengersVehicleLabel.text = vehicle.passengers
    }
    
    func setupIndex() {
        self.nextBtn.isEnabled = index == vehicles.count-1 ? false : true
        self.previousBtn.isEnabled = index == 0 ? false : true
        
        setupView(vehicle: vehicles[index])
    }

    @IBAction func previousBtnClicked(_ sender: Any) {
        index -= 1
        setupIndex()
    }
    @IBAction func nextBtnClicked(_ sender: Any) {
        index += 1
        setupIndex()
    }
    
}
