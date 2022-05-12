//
//  UIControl+NoHighlight.swift
//  CardFlip
//
//  Created by Ilya on 7.04.22.
//

import UIKit

extension UIButton {
    override open var isHighlighted: Bool {
        didSet{
            backgroundColor = .blue
        }
    }
    
    override open var isSelected: Bool {
        didSet{
            backgroundColor = .blue
        }
    }
}
