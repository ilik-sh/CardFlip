//
//  MainScreenController.swift
//  CardFlip
//
//  Created by Ilya on 31.03.22.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    // - Data
    let defaults = UserDefaults.standard
    
    // - UI
    @IBOutlet weak var highScore: UILabel!
    
    // - Action
    @IBAction func buttonTouchesStarted(_ sender: UIButton) {
        sender.pressedDown()
    }
    
    @IBAction func playButtonTouchesEnded(_ sender: UIButton) {
        sender.pressedUp({ [weak self] _ in
            let vc = UIStoryboard(name: "GameScreenStoryboard", bundle: nil).instantiateViewController(withIdentifier: "GameScreen") as! GameScreenViewController
            self?.navigationController?.pushViewController(vc, animated: true)
        })
    }
    
    @IBAction func shopButtonTouchesEnded(_ sender: UIButton) {
        sender.pressedUp({ [weak self] _ in
            let vc = UIStoryboard(name: "ThemeScreenStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ThemeScreen") as! ThemeScreenViewController
            self?.navigationController?.pushViewController(vc, animated: true)
        })
    }
    
    @IBAction func buttonTouchesEndedOutside(_ sender: UIButton) {
        sender.pressedUp({ _ in })
    }
    
    // - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        highScore.text = defaults.string(forKey: highestScore) ?? "0"
    }
}
