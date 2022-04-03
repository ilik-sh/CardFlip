//
//  MainScreenController.swift
//  CardFlip
//
//  Created by Ilya on 31.03.22.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    
    @IBAction func PlayButtonTouchesStarted(_ sender: UIView) {
        sender.pressedDown()
    }
    
    @IBAction func PlayButtonTouchesEnded(_ sender: UIView) {
        sender.pressedUp({ [weak self] _ in
            let vc = UIStoryboard(name: "GameScreenStoryboard", bundle: nil).instantiateViewController(withIdentifier: "GameScreen") as! GameScreenViewController
            self?.navigationController?.pushViewController(vc, animated: true)
        })
    }
    
        
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
}
