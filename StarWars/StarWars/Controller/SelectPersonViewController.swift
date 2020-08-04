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
    
    var personRequest = PersonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func randomPersonClicked(_ sender: Any) {
        let idPerson = Int.random(in: 1...87)
        
        personRequest.getRandomPersonAlamo(id: idPerson) { (person) in
            self.personName.text = person?.name
            self.personHeight.text = person?.height
            self.personMass.text = person?.mass
            self.personHair.text = person?.hair
            self.personBirthYear.text = person?.birthYear
            self.personGender.text = person?.gender
        }
    }
    
}

