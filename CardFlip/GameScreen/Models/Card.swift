//
//  Card.swift
//  CardFlip
//
//  Created by Ilya on 13.02.22.
//

import UIKit

class Card {
    var id = NSUUID().uuidString
    var img: UIImage?
    
    init(_ img: UIImage?) {
        self.img = img
    }
    
    func copy() -> Card{
        guard let img = self.img else { return Card(nil)}
        let copy = Card(img)
        copy.id = self.id
        return copy
    }
    
    func equal(_ card: Card) -> Bool {
        return card.id == self.id
    }
}


