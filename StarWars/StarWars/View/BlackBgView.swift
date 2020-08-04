//
//  BlackBgView.swift
//  StarWars
//
//  Created by Fábio França on 03/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
    override func awakeFromNib() {
        self.layer.backgroundColor = BLACK_BG
        self.layer.cornerRadius = 10
    }
}

class BlackBgButton: UIButton {
    override func awakeFromNib() {
        self.layer.backgroundColor = BLACK_BG
        self.layer.cornerRadius = 10
    }
}
