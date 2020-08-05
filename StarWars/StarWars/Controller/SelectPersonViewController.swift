//
//  ViewController.swift
//  StarWars
//
//  Created by Fábio França on 03/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import UIKit

class SelectPersonViewController: UIViewController {
    
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personHeight: UILabel!
    @IBOutlet weak var personMass: UILabel!
    @IBOutlet weak var personHair: UILabel!
    @IBOutlet weak var personBirthYear: UILabel!
    @IBOutlet weak var personGender: UILabel!
    @IBOutlet weak var homeWorldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var starshipBtn: UIButton!
    @IBOutlet weak var moviesBtn: UIButton!
    
    var personRequest = PersonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func randomPersonClicked(_ sender: Any) {
        let idPerson = Int.random(in: 1...87)
        
        personRequest.getRandomPersonAlamo(id: idPerson) { (person) in
            self.setupView(person: person)
        }
    }
    
    func setupView(person: Person) {
        personName.text = person.name
        personHeight.text = person.height
        personMass.text = person.mass
        personHair.text = person.hair
        personBirthYear.text = person.birthYear
        personGender.text = person.gender
        
        homeWorldBtn.isEnabled = !person.homeworldUrl.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
        starshipBtn.isEnabled = !person.starshipUrls.isEmpty
        moviesBtn.isEnabled = !person.movieUrls.isEmpty
    }
    
    @IBAction func homeWorldBtnClicked(_ sender: Any) {
    }
    @IBAction func vehiclesBtnClicked(_ sender: Any) {
    }
    @IBAction func starshipBtnClicked(_ sender: Any) {
    }
    @IBAction func movieBtnClicked(_ sender: Any) {
    }
    
    
}

