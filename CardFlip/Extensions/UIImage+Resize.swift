//
//  UIImageExtension.swift
//  CardFlip
//
//  Created by Ilya on 4.03.22.
//

import UIKit

extension UIImage {
    func resize( size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
