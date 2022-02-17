//
//  Card.swift
//  CardFlip
//
//  Created by Ilya on 13.02.22.
//

import UIKit

class Card {
    let id = NSUUID().uuidString
    var isFlipped = false
    var img: UIImage?
    
    init() {
        let task = URLSession.shared.dataTask(with: URL(string: "https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_1280.jpg")!) { [weak self] data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.sync {
                    self?.img = UIImage(data: data)
                    self?.isFlipped = true
                }
            }
        task.resume()
    }
}
