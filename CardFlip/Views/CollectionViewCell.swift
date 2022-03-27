//
//  CollectionViewCell.swift
//  CardFlip
//
//  Created by Ilya on 14.02.22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    // - UI
    @IBOutlet weak var frontView: UIImageView!
    @IBOutlet weak var backView: UIImageView!
    
    // - Data
    var card: Card? {
        didSet {
            guard let card = card else { return }
            self.frontView.image = card.img
        }
    }
    
    var isFlipped = false
    
    // - Methods
    func flip() {
        if !frontView.isHidden {
            isFlipped = false
            UIView.transition(from: frontView,
                              to: backView,
                              duration: 0.3,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
        }
        else {
            isFlipped = true
            UIView.transition(from: backView,
                              to: frontView,
                              duration: 0.3,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
        }
    }
}
