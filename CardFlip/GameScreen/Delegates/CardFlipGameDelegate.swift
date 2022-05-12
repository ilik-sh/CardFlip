//
//  CardFlipGameDelegate.swift
//  CardFlip
//
//  Created by Ilya on 9.03.22.
//

protocol CardFlipGameDelegate: AnyObject {
    func flipCards(_ cards: [Card])
    func updateScore( _ score: Int)
    func resetData()
}
