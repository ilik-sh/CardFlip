//
//  CardFlipGame.swift
//  CardFlip
//
//  Created by Ilya on 13.02.22.
//

import UIKit

class CardFlipGame {
    var cards: [Card] = [Card]()
//    var cardsShown: [Card] = [Card]()
    
    func startGame() {
        cards.shuffle()
    }
    
//    func finishGame() {
//        cards.removeAll()
//        cardsShown.removeAll()
//    }
    
    func cardAtIndex(_ index: Int) -> Card? {
        return cards[index]
    }
    
    func didSelectCard(card: Card) {
        
    }
}