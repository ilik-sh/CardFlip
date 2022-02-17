//
//  ViewController.swift
//  CardFlip
//
//  Created by Ilya on 5.02.22.
//

import UIKit

class ViewController: UIViewController {
    // - UI
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // - Data
    let game = CardFlipGame()
    var cards = [Card]()
    
    // - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        for _ in 1...12 {
            let card = Card()
            self.cards.append(card)
        }
        game.cards = self.cards
        self.setupGame()
    }
    
    func setupGame() {
        game.startGame()
        collectionView.reloadData()
    }
}

    // - CollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseCell", for: indexPath) as! CollectionViewCell
        cell.card = game.cardAtIndex(indexPath.item)
        cell.frontView.layer.cornerRadius = 7
        cell.backView.layer.cornerRadius = 7
        return cell
    }
}

    // - CollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        cell.flip()
    }
}

