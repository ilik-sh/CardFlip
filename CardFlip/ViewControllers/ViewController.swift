//
//  ViewController.swift
//  CardFlip
//
//  Created by Ilya on 5.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    // - UI
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var anButtonCollection: [UIButton]!
    
    // - Data
    
    var score = 0
    var flipped: UIButton?
    let symbolCollection = ["💛", "❤️", "💚"]
    
    @IBAction func onClick(_ sender: UIButton) {
        if flipped == nil {
            sender.flipOver()
            flipped = sender
        }
        else if flipped != nil {
            sender.titleLabel?.layer.opacity = 1
            sender.flipOver()
            if sender.currentTitle == flipped?.currentTitle {
                flipped?.isEnabled = false
                sender.isEnabled = false
                score += 1
                scoreLabel.text = "Score: \(score)"
                flipped = nil
            }
            else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { [self] in
                    self.flipped?.flipOver()
                    self.flipped?.titleLabel?.layer.opacity = 0
                    sender.flipOver()
                    sender.titleLabel?.layer.opacity = 0
                    self.flipped = nil
                })
                
            }
        }
//        if sender.currentTitle != nil && sender.currentTitle != "" && isFlipped{
//            sender.setTitle("", for: .normal)
//            UIView.transition(with: sender, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil)
//        }
//        else {
//            scoreLabel.text = "Love you, Katie!"
//            sender.setTitle("❤️", for: .normal)
//            UIView.transition(with: sender, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil)
//            isFlipped = true
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initField()
    }

    func initField() {
        for button in anButtonCollection {
            button.setTitle(symbolCollection.randomElement(), for: .normal)
            button.titleLabel?.layer.opacity = 0
        }
    }

}


