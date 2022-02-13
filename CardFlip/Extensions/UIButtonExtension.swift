//
//  UIButtonExtension.swift
//  CardFlip
//
//  Created by Ilya on 13.02.22.
//

import UIKit

extension UIButton {
    
    func flipOver() {
        self.titleLabel?.layer.opacity = 1
        UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
    }
}
