//
//  Card.swift
//  CardFlip
//
//  Created by Ilya on 13.02.22.
//

import UIKit

class Card {
    let id = NSUUID().uuidString
    var isFlipped = false
    var img: UIImage?
    
    init(with img: UIImage) {
        self.img = img
    }
}


