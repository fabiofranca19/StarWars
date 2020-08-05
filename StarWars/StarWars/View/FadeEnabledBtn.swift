//
//  FadeEnabledBtn.swift
//  StarWars
//
//  Created by Fábio França on 05/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import UIKit

class FadeEnabledBtn: UIButton {

    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.5) {
                    self.alpha = 1.0
                }
            }else{
                UIView.animate(withDuration: 0.5) {
                    self.alpha = 0.5
                }
            }
        }
    }

}
