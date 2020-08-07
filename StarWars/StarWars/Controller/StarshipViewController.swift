//
//  StarshipViewController.swift
//  StarWars
//
//  Created by Fábio França on 05/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import UIKit

class StarshipViewController: UIViewController,PersonProtocol {

    @IBOutlet weak var nameStarshipLabel: UILabel!
    @IBOutlet weak var modelStarshipLabel: UILabel!
    @IBOutlet weak var manufacturerStarshipLabel: UILabel!
    @IBOutlet weak var costStarshipLabel: UILabel!
    @IBOutlet weak var lenghtStarshipLabel: UILabel!
    @IBOutlet weak var speedStarshipLabel: UILabel!
    @IBOutlet weak var crewStarshipLabel: UILabel!
    @IBOutlet weak var passengersStarshipLabel: UILabel!
    @IBOutlet weak var previousBtn: FadeEnabledBtn!
    @IBOutlet weak var nextBtn: FadeEnabledBtn!
    
    let api = StarshipApi()
    var person: Person!
    var starships = [Starship]()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousBtn.isEnabled = false
        nextBtn.isEnabled = false
        getStarship(url: person.starshipUrls[index]) { (starship) in
            self.setupView(starship: starship)
            self.setIndex()
        }
    }
    
    func setupView(starship: Starship) {
        self.nameStarshipLabel.text = starship.name
        self.modelStarshipLabel.text = starship.model
        self.manufacturerStarshipLabel.text = starship.manufacturer
        self.costStarshipLabel.text = starship.cost
        self.lenghtStarshipLabel.text = starship.length
        self.speedStarshipLabel.text = starship.speed
        self.crewStarshipLabel.text = starship.crew
        self.passengersStarshipLabel.text = starship.passengers
    }
    
    func setIndex() {
        previousBtn.isEnabled = index == 0 ? false : true
        nextBtn.isEnabled = index == person.starshipUrls.count - 1 ? false : true
        
        if(index > starships.count - 1) {
            getStarship(url: person.starshipUrls[index]) { (starship) in
                self.setupView(starship: starship)
            }
        }else{
            setupView(starship: starships[index])
        }
    }
    
    func getStarship(url: String, completion: @escaping StarshipResponseCompletion){
        api.getStarship(url: person.starshipUrls[index]) { (starship) in
            self.starships.append(starship)
            completion(starship)
            print("Nova Request")
        }
    }
    
    @IBAction func previousBtnClicked(_ sender: Any) {
        index -= 1
        setIndex()
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        index += 1
        setIndex()
    }
    

}
