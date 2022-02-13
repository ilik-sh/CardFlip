//
//  Card.swift
//  CardFlip
//
//  Created by Ilya on 13.02.22.
//

import UIKit

class Card {
    let id: Int?
    var isFlipped = false
    var img: UIImage?
    init(img: UIImage, id: Int) {
        self.img = img
        self.id = id
    }
}
