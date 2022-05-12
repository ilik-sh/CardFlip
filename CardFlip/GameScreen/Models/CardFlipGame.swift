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
    var cardShown: Card? = nil
    weak var delegate: CardFlipGameDelegate?
    private let defaults = UserDefaults.standard
    private var winGame = false
    private var score = 0 {
        didSet {
            let oldHighestScore = defaults.integer(forKey: highestScore)
            if score > oldHighestScore {
                defaults.set(score, forKey: highestScore)
            }
        }
    }
    
    // - Methods
    func startNewGame() {
        self.delegate?.flipCards(cards)
        cards.forEach({ $0.isFlipped = !$0.isFlipped})
        cards.shuffle()
        self.delegate?.resetData()

    }
    
    func didSelectCard(_ card: Card) {
        if card.isFlipped == true { return }
        delegate?.flipCards([card])
        card.isFlipped = true
        
        if cardShown == nil {
            cardShown = card
        }
        
        else {
            if card.equals(cardShown!) {
                updateScore()
                cardShown = nil
                if allCardsAreFlipped() {
                    startNewGame()
                }
            }
            else {
                flip([card, cardShown!])
                cardShown = nil
            }
        }
        
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
        if index < cards.count{
            return cards[index]
        }
        return nil
    }
    
    private func flip(_ cards: [Card]) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.delegate?.flipCards(cards)
            cards.forEach({ $0.isFlipped = !$0.isFlipped})
        })
    }
    
    private func allCardsAreFlipped() -> Bool {
        return cards.allSatisfy({ $0.isFlipped })
    }
    
    private func updateScore() {
        score += 1
        delegate?.updateScore(score)
    }
    
}
