//
//  Theme.swift
//  CardFlip
//
//  Created by Ilya on 10.05.22.
//

import UIKit

class Theme {
    static var current: ThemeProtocol {
        switch UserDefaults.standard.string(forKey: theme) {
        case "Dogs":
            return DogTheme()
        case "Logos":
            return LogoTheme()
        default:
            return CatTheme()
        }
    }
}
