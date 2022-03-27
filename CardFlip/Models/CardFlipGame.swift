//
//  CardFlipGame.swift
//  CardFlip
//
//  Created by Ilya on 13.02.22.
//

import UIKit

class CardFlipGame {
    // - Data
    var cards: [Card] = [Card]()
    private var cardsShown: [Card] = [Card]()
    var delegate: CardFlipGameDelegate?
     
    // - Methods
    func startGame() {
        cards.shuffle()
        delegate?.setupGame()
    }
    
    func cardAtIndex(_ index: Int) -> Card? {
        return cards[index]
    }
    
    func indexForCard(_ card: Card) -> Int? {
        for i in 0..<cards.count {
            if cards[i] === card{
                return i
            }
        }
        return nil
    }
    
    // TODO: make flips after the end
    func didSelectCard(_ card: Card) {
        self.delegate?.flipCards([card])
        if didSelectUnpaired() {
            cardsShown.append(card)
        }
        else {
            if cardsShown.last!.equal(card) {
                cardsShown.append(card)
                self.delegate?.updateScore()
                if cards.count == cardsShown.count {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.delegate?.flipCards(self.cardsShown)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        self.cardsShown.removeAll()
                        self.startGame()
                    }
                }
            }
            else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.delegate?.flipCards([card, self.cardsShown.removeLast()])
                }
            }
        }
    }
    
    func didSelectUnpaired() -> Bool {
        return cardsShown.count % 2 == 0
    }
    
}
