//
//  Card.swift
//  CardFlip
//
//  Created by Ilya on 13.02.22.
//

import UIKit

enum BadResponce: Error{
    case invalidFormat
}

class Card {
    let id = NSUUID().uuidString
    var isFlipped = false
    var img: UIImage?
    
    
    init() {
//        self.img = img
    }
    
}


