//
//  CardFlipGame.swift
//  CardFlip
//
//  Created by Ilya on 13.02.22.
//

import UIKit

class CardFlipGame{
    // - Data
    var cards = [Card]()
    weak var delegate: CardFlipGameDelegate?
    private var score = 0
    private var cardsShown = [Card]()
    
    // - Methods
    private func startGame() {
        cards.shuffle()
        delegate?.resetData()
    }
    
    private func didSelectUnpaired() -> Bool {
        return cardsShown.count % 2 == 0
    }
    
    func indexForCard(_ card: Card) -> Int? {
       for i in 0..<cards.count {
           if cards[i] === card{
               return i
           }
       }
       return nil
   }
    
    func cardAtIndex(_ index: Int) -> Card? {
        if !cards.isEmpty{
            return cards[index]
        }
        return nil
    }
    
    func didSelectCard(_ card: Card) {
        self.delegate?.flipCards([card])
        if didSelectUnpaired() {
            cardsShown.append(card)
        }
        else {
            if cardsShown.last!.equal(card) {
                cardsShown.append(card)
                score += 1
                self.delegate?.updateScore(score)
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.delegate?.flipCards([card, self.cardsShown.removeLast()])
                }
            }
        }
    }
}
