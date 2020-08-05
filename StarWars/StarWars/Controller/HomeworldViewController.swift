//
//  HomeworldViewController.swift
//  StarWars
//
//  Created by Fábio França on 05/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import UIKit

class HomeworldViewController: UIViewController,PersonProtocol {
    
    @IBOutlet weak var nameHomeLabel: UILabel!
    @IBOutlet weak var climateHomeLabel: UILabel!
    @IBOutlet weak var terrainHomeLabel: UILabel!
    @IBOutlet weak var populationHomeLabel: UILabel!
    
    
    var person: Person!
    var homeRequest = HomeWorldApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeRequest.getHomeWorld(url: person.homeworldUrl) { (homeWorld) in
            self.setupView(home: homeWorld)
        }
    }
    
    func setupView(home: HomeWorld) {
        nameHomeLabel.text = home.name
        climateHomeLabel.text = home.climate
        terrainHomeLabel.text = home.terrain
        populationHomeLabel.text = home.population
    }


}
