//
//  UIButton+Spring.swift
//  CardFlip
//
//  Created by Ilya on 2.04.22.
//

import UIKit

extension UIView {
    
    func pressedDown() {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 3,
                       options: [.allowUserInteraction, .curveEaseIn],
                       animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: nil)
    }
    
    func pressedUp(_ work: @escaping (Bool) -> ()) {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 3,
                       options: [.allowUserInteraction, .curveEaseIn],
                       animations: {
            self.transform = CGAffineTransform.identity
        }, completion: work)
    }
}
