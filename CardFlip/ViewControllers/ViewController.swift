//
//  ViewController.swift
//  CardFlip
//
//  Created by Ilya on 5.02.22.
//

import UIKit

class ViewController: UIViewController {
    // -M
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var score = 0
//    var isFlipped: Bool = false {
//        didSet{
//            score += 1
//            scoreLabel.text = "Number of flips: \(score)"
//        }
//    }
    
    @IBAction func onClick(_ sender: UIButton) {
        if sender.currentTitle != nil && sender.currentTitle != ""{
            sender.setTitle("", for: .normal)
            UIView.transition(with: sender, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
        else {
            scoreLabel.text = "Love you, Katie!"
            sender.setTitle("❤️", for: .normal)
            UIView.transition(with: sender, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil)
    //        isFlipped = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

