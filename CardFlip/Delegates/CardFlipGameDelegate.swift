//
//  CardFlipGameDelegate.swift
//  CardFlip
//
//  Created by Ilya on 9.03.22.
//

import Foundation

protocol CardFlipGameDelegate {
    func flipCards(_ cards: [Card])
    func setupGame()

}
